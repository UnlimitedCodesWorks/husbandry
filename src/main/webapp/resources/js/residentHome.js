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

	layui.use('laypage', function(){
  		var laypage = layui.laypage;
  		//执行一个laypage实例
  		//全部订单
  		laypage.render({
    		elem: 'all-page1', //注意，这里是ID，不用加 # 号
    		count: 100, //数据总数，从服务端得到
    		limit: 4,
    		jump: function(obj, first){
    			//obj包含了当前分页的所有参数，比如：
    			//首次不执行
    			if(!first){
      				//do something
    			}
  			}
  		});
  		//待派遣
  		laypage.render({
    		elem: 'all-page2', //注意，这里是ID，不用加 # 号
    		count: 100, //数据总数，从服务端得到
    		limit: 4,
    		jump: function(obj, first){
    			//obj包含了当前分页的所有参数，比如：
    			//首次不执行
    			if(!first){
      				//do something
    			}
  			}
  		});
  		//待确认
  		laypage.render({
    		elem: 'all-page3', //注意，这里是ID，不用加 # 号
    		count: 100, //数据总数，从服务端得到
    		limit: 4,
    		jump: function(obj, first){
    			//obj包含了当前分页的所有参数，比如：
    			//首次不执行
    			if(!first){
      				//do something
    			}
  			}
  		});
  		//待评价
  		laypage.render({
    		elem: 'all-page4', //注意，这里是ID，不用加 # 号
    		count: 100, //数据总数，从服务端得到
    		limit: 4,
    		jump: function(obj, first){
    			//obj包含了当前分页的所有参数，比如：
    			//首次不执行
    			if(!first){
      				//do something
    			}
  			}
  		});
  		//关注的服务
  		laypage.render({
    		elem: 'service-page', //这里是ID，不用加 # 号
    		count: 100, //数据总数，从服务端得到
    		limit: 4,
    		jump: function(obj, first){
    			//obj包含了当前分页的所有参数，比如：
    			//首次不执行
    			if(!first){
      				//do something
    			}
  			}
  		});
  		//关注的服务商
  		laypage.render({
    		elem: 'store-page', //这里是ID，不用加 # 号
    		count: 100, //数据总数，从服务端得到
    		limit: 4,
    		jump: function(obj, first){
    			//obj包含了当前分页的所有参数，比如：
    			//首次不执行
    			if(!first){
      				//do something
    			}
  			}
  		});
  		//退款详情
  		laypage.render({
    		elem: 'refund-page', //这里是ID，不用加 # 号
    		count: 100, //数据总数，从服务端得到
    		limit: 4,
    		jump: function(obj, first){
    			//obj包含了当前分页的所有参数，比如：
    			//首次不执行
    			if(!first){
      				//do something
    			}
  			}
  		});
	});

	layui.use('layer', function(){
  		var layer = layui.layer;
  		$(".check-progress").click(function(event) {
  			layer.open({
  				type: 1,
  				title: 'XXXX服务进展状态',
  				area: layerWidth,
  				anim: 2,
  				content: $('#service-progress')
			});
  		});

  		$(".refund").click(function(event) {
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
  		});

  		$(".refund-reason").click(function(event) {
  			layer.open({
  				type: 0,
  				title: '退款理由',
  				anim: 2,
  				content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error dolorum voluptate, at obcaecati, aspernatur tempore esse suscipit sint asperiores dignissimos saepe quas excepturi ullam quasi quisquam aliquid! Minus, laboriosam quia!'
			});
  		});

  		$(".delete").click(function(event) {
  			layer.confirm('您确定要删除该订单吗？', {
  				btn: ['确定','关闭'] //按钮
			}, function(){
  				layer.msg("已删除",{
  					time: 1000
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
			console.log(data.value);
            city.html("");
            city.append('<option value="" label="市" />');
            var value = data.value;
            $.ajax({
                url :portPath +'user/getCitys.do',
                type : "post",
                data:{
                    provinceId : value
                },
                dataType : "json",
                success: function(data){
                    for(var i=0;i<data.length;i++){
                        var node = '<option value="'+data[i].cityId+ '" label="'+data[i].city+'" />';
                        city.append(node);
                    }
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
		console.log(fileObj.files)
		if(fileObj && fileObj.files && fileObj.files[0]){
			dataURL = windowURL.createObjectURL(fileObj.files[0]);
			$img.attr('src',dataURL);
			//cropper
			$('#head-img-wrap img').cropper({
  				aspectRatio: 1 / 1,
  					crop: function(data) {
    				// Output the result data for cropping image.
  				}
			});
			$('#head-img-wrap img').cropper('replace', dataURL);
		}
		else{
			dataURL = $file.val();
			var imgObj = document.getElementById("#head-img");
			imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
			imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
		}
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