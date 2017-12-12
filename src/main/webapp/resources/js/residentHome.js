jQuery(document).ready(function($) {
	$("#wrap").css({
		minHeight: ($(window).height()-110)+'px'
	});

	var layerWidth;
	if($(window).width()>=768) {
		layerWidth = '50%';
	}
	else {
		layerWidth = '80%';
	}

	layui.use('element', function(){
		//实例化element
  		var element = layui.element;
  		//初始化动态元素
  		element.init();
  		//tab切换监听
        element.on('tab(demo)',function (data) {
        	console.log(data);
        });
	});

	layui.use('laydate', function(){
  		var laydate = layui.laydate;
  		//执行一个laydate实例
  		laydate.render({
    		elem: '#date' //指定元素
  		});
	});

	var cropper;
	layui.use('layer', function(){
  		var layer = layui.layer;
  		$(".check-progress").click(function(event) {
  			var value = $(this).attr("data-orderId");
            $.ajax({
                type: "POST",
                url: portPath+"userResident/getOrderServicePeople.do",
                data: {
                    orderId:value
                },
                dataType: "json",
                success: function(data){
                    createServicePeople(data);
                    layer.open({
                        type: 1,
                        title: ''+data[0].serviceName+'服务进展状态',
                        area: layerWidth,
                        anim: 2,
                        content: $('#service-progress')
                    });
                },
                error: function(jqXHR){
                    alert("发生错误：" + jqXHR.status);
                }
            });
  		});

  		$(".refund").click(function(event) {
            $("#cancelButton").attr("data-orderId",$(this).attr("data-orderId"));
  			layer.open({
  				type: 1,
  				title: '撤销订单',
  				area: layerWidth,
  				anim: 2,
  				content: $('#refund')
			});
  		});

  		$(".head-mask a").click(function(event) {
  			layer.open({
  				type: 1,
  				title: '修改头像',
  				area: layerWidth,
  				anim: 2,
  				content: $('#head')
			});
            if(cropper == undefined) {
                cropper = $('#head-img-wrap img').cropper({
                    aspectRatio: 1 / 1,
                    // minContainerWidth: 500,
                    crop: function(data) {
                        // Output the result data for cropping image.
                    }
                });
            }
            cropper.cropper('reset').cropper('replace',headImg);
  		});

  		$(".refund-reason").click(function(event) {
  			var value = $(this).attr("data-refundId");
            $.ajax({
                type: "POST",
                url: portPath+"userResident/getCancelReason.do",
                data: {
                    cancelId:value
                },
                dataType: "json",
                success: function(data){
                    layer.open({
                        type: 0,
                        title: '退款理由',
                        anim: 2,
                        content: data
                    });
                },
                error: function(jqXHR){
                    alert("发生错误：" + jqXHR.status);
                }
            });
  		});

        $(".delete").click(function(event) {
            var value = $(this).attr("data-orderId");
            layer.confirm('您确定要删除该订单吗？', {
                btn: ['确定','关闭'] //按钮d
            }, function(){
                $.ajax({
                    type: "POST",
                    url: portPath+"userResident/deleteOrder.do",
                    data: {
                        orderId:value
                    },
                    dataType: "json",
                    success: function(data){
                        if(data){
                            layer.msg("已删除",{
                                time: 1000
                            });
                            setTimeout("location.replace(location.href)",1000);
                        }
                    },
                    error: function(jqXHR){
                        alert("发生错误：" + jqXHR.status);
                    }
                });
            }, function(){
                //dosomething
            });

        });

        $(".orderConfirm").click(function(event) {
            var value = $(this).attr("data-orderId");
            layer.confirm('确认订单？', {
                btn: ['确定','关闭'] //按钮d
            }, function(){
                $.ajax({
                    type: "POST",
                    url: portPath+"userResident/confirmOrder.do",
                    data: {
                        orderId:value
                    },
                    dataType: "json",
                    success: function(data){
                        if(data){
                            layer.msg("已确认",{
                                time: 1000
                            });
                            setTimeout("location.replace(location.href)",1000);
                        }
                    },
                    error: function(jqXHR){
                        alert("发生错误：" + jqXHR.status);
                    }
                });
            }, function(){
                //dosomething
            });

        });
	});

	var nav = new Vue({
		el: 'nav',
		data: {
			isLogin: false
		}
	});

	layui.use('form', function(){
		//实例化form
  		var form = layui.form;
        form.on('select(province)', function(data){
            var value = data.value;
            $.ajax({
                url :portPath +'user/getCitys.do',
                type : "post",
                data:{
                    provinceId : value
                },
                dataType : "json",
                success: function(data){
                    city.html("");
                    city.append('<option value="">市</option>');
                    var selected = '<option value="'+data[0].cityId+ '" selected>'+data[0].city+'</option>';
                    city.append(selected);
                    for(var i=1;i<data.length-1;i++){
                        var node = '<option value="'+data[i].cityId+ '">'+data[i].city+'</option>';
                        city.append(node);
                    }
                    form.render('select');
                },
                error: function(jqXHR){
                    alert("发生错误：" + jqXHR.status);
                }
            });
        });
	});

	$(".head-mask").hover(function() {
		$(this).css({
			opacity: '0.6'
		});
	}, function() {
		$(this).css({
			opacity: '0'
		});
	});

	//选择图片
	$("#btn-upload").change(function(event) {
		var $file = $(this);
		var fileObj = $file[0];
		var windowURL = window.URL || window.webkitURL;
		var dataURL;
		var $img = $("#head-img");
		if(fileObj && fileObj.files && fileObj.files[0]){
			dataURL = windowURL.createObjectURL(fileObj.files[0]);
			$img.attr('src',dataURL);
			//cropper
            $.fn.cropper;
            cropper.cropper('reset').cropper('replace',dataURL);
		}
		else{
			dataURL = $file.val();
			var imgObj = $("#head-img");
			imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
			imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
		}
	});

    $("#icon-submit").click(function (e) {
        var formData = new FormData($("#uploadForm"));
        $('#head-img-wrap').find('> img').cropper('getCroppedCanvas').toBlob(function (blob) {
            var mime = blob.type;
            var suffix = mime.split("/")[1];
            var fileName = "blobImage."+suffix;
            formData.append("headImg",blob,fileName);
            formData.append("registNum",registNum);
            formData.append("headLink",headImg);
            $.ajax({
                type:"post",
                url:updatePath,
                cache: false,
                processData: false,
                contentType: false,
                data:formData,
                success:function(data){
                    if(data){
                        location.replace(location.href);
                    }else{
                        alert("服务器错误!");
                    }

                },
                error:function(XMLHttpRequest, textStatus, errorThrown, data){
                    alert(errorThrown);
                }
            });
        });

    });

	//particles
	particlesJS("particles-js", {
		"particles": {
		    "number": {
		    	"value": 50,//点的个数
		      	"density": {
		        	"enable": true,
		        	"value_area": 500
		      	}
		    },
		    "color": {
		     	"value": "#5FB878"//点的颜色
		    },
		    "shape": {
		      	"type": "circle",
		      	"stroke": {
		        	"width": 0,
		        	"color": "#000000"
		      	},
		      	"polygon": {
		        	"nb_sides": 5
		      	},
		      	"image": {
		        	"src": "img/github.svg",
		        	"width": 100,
		        	"height": 100
		      	}
		    },
		    "opacity": {
		      	"value": 0.08,//点的透明度
		      	"random": false,
		      	"anim": {
		        	"enable": false,
		       		"speed": 1,
		        	"opacity_min": 0.1,
		        	"sync": false
		      	}
		    },
		    "size": {
		      	"value": 24,//点的大小
		      	"random": true,//点的大小是否随机
		      	"anim": {
		        	"enable": false,
		        	"speed": 40,
		        	"size_min": 0.1,
		        	"sync": false
		      	}
		    },
		    "line_linked": {
		      	"enable": true,//是否有线
		      	"distance": 300,//线的密度
		      	"color": "#5FB878",//线的颜色
		      	"opacity": 0.1,//线的透明度
		      	"width": 1
		    },
		    "move": {
		      	"enable": true,
		      	"speed": 3,//点的移动速度
		      	"direction": "none",
		      	"random": false,
		      	"straight": false,
		      	"out_mode": "out",
		      	"bounce": false,
		      	"attract": {
		        	"enable": false,
		        	"rotateX": 600,
		        	"rotateY": 1200
		      	}
		    }
		},
		"interactivity": {
		    "detect_on": "canvas",
		    "events": {
		      	"onhover": {
		        	"enable": true,
		        	"mode": "grab"
		      	},
		      	"onclick": {
		        	"enable": false,
		        	"mode": "push"
		      	},
		      	"resize": true
		    },
		    "modes": {
		      	"grab": {
		        	"distance": 140,
		        	"line_linked": {
		          		"opacity": 1
		        	}
		      	},
		      	"bubble": {
		        	"distance": 400,
		        	"size": 40,
		        	"duration": 2,
		        	"opacity": 8,
		        	"speed": 3
		      	},
		      	"repulse": {
		        	"distance": 200,
		        	"duration": 0.4
		      	},
		      	"push": {
		        	"particles_nb": 4
		      	},
		      	"remove": {
		        	"particles_nb": 2
		      	}
		    }
		},
		"retina_detect": true
	});

});