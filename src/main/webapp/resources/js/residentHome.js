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
            var serviceName = $(this).attr("data-serviceName");
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
                        title: ''+serviceName+'服务进展状态',
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

        //查看服务周期
        $(document).on('click', '.tab3-1 .service-cycle', function (event) {
            var value = $(this).attr("data-orderId");
            var now;
            var startTime;
            var endTime;
            var days;
            var months;
            var dateDeltaNow;
            var dateDeltaEnd;
            var percentage;
            var smallTime;
            $.ajax({
                type: "POST",
                url: "getOrderTime.do",
                data: {
                    orderId:value
                },
                success: function(data){
                    console.log(data);
                    $("#service-cycle .progressbar-title span").html("");
                    now = getNowDate();
                    startTime = new Date(data.startTime).Format("yyyy-MM-dd");
                    days = data.orderBigTime.day;
                    months = data.orderBigTime.month;
                    endTime = new Date(startTime).DateAdd("d", days).DateAdd("m", months).Format("yyyy-MM-dd");
                    dateDeltaNow = new Date(startTime).DateDiff("d", new Date(now));
                    dateDeltaEnd = new Date(startTime).DateDiff("d", new Date(endTime));
                    percentage = (dateDeltaNow/dateDeltaEnd)*100;
                    smallTime = data.orderBigTime.orderSmallTimeList;
					for(var i=0; i<smallTime.length; i++) {
						$("#service-cycle .progressbar-title span").append(" "+smallTime[i].startHour+":00~"+smallTime[i].endHour+":00");
					}
                    if(percentage>=100) {
                        $("#service-cycle .progress-value").html("已完成");
                        $("#service-cycle .layui-progress-bar").css('width', '100%');
					}
					else {
                        $("#service-cycle .progress-value").html(now);
                        $("#service-cycle .layui-progress-bar").css('width', percentage+'%');
					}
                    $("#start-time").html(startTime);
                    $("#end-time").html(endTime);
                    layer.open({
                        type: 1,
                        title: '服务周期',
                        area: layerWidth,
                        anim: 2,
                        content: $('#service-cycle')
                    });
                },
                error: function(jqXHR){
                    alert("发生错误：" + jqXHR.status);
                }
            });
        });
	});

    Date.prototype.Format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "H+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    };

    Date.prototype.DateAdd = function(strInterval, Number) {
        var dtTmp = this;
        switch (strInterval) {
            case 's' :return new Date(Date.parse(dtTmp) + (1000 * Number));
            case 'n' :return new Date(Date.parse(dtTmp) + (60000 * Number));
            case 'h' :return new Date(Date.parse(dtTmp) + (3600000 * Number));
            case 'd' :return new Date(Date.parse(dtTmp) + (86400000 * Number));
            case 'w' :return new Date(Date.parse(dtTmp) + ((86400000 * 7) * Number));
            case 'q' :return new Date(dtTmp.getFullYear(), (dtTmp.getMonth()) + Number*3, dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds());
            case 'm' :return new Date(dtTmp.getFullYear(), (dtTmp.getMonth()) + Number, dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds());
            case 'y' :return new Date((dtTmp.getFullYear() + Number), dtTmp.getMonth(), dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds());
        }
    };

    Date.prototype.DateDiff = function(strInterval, dtEnd) {
        var dtStart = this;
        if (typeof dtEnd == 'string' )//如果是字符串转换为日期型
        {
            dtEnd = StringToDate(dtEnd);
        }
        switch (strInterval) {
            case 's' :return parseInt((dtEnd - dtStart) / 1000);
            case 'n' :return parseInt((dtEnd - dtStart) / 60000);
            case 'h' :return parseInt((dtEnd - dtStart) / 3600000);
            case 'd' :return parseInt((dtEnd - dtStart) / 86400000);
            case 'w' :return parseInt((dtEnd - dtStart) / (86400000 * 7));
            case 'm' :return (dtEnd.getMonth()+1)+((dtEnd.getFullYear()-dtStart.getFullYear())*12) - (dtStart.getMonth()+1);
            case 'y' :return dtEnd.getFullYear() - dtStart.getFullYear();
        }
    };

    function getNowDate() {
		var date = new Date().Format("yyyy-MM-dd");
		return date;
    }

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