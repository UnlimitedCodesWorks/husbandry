jQuery(document).ready(function($) {
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

	layui.use('form', function(){
		//实例化form
  		var form = layui.form;
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
    		elem: 'all-page1', //注意，这里的 test1 是 ID，不用加 # 号
    		count: 100, //数据总数，从服务端得到
    		limit: 4,
    		jump: function(obj, first){
    			//obj包含了当前分页的所有参数，比如：
    			console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
    			console.log(obj.limit); //得到每页显示的条数
    			//首次不执行
    			if(!first){
      				//do something
    			}
  			}
  		});
  		//待派遣
  		laypage.render({
    		elem: 'all-page2', //注意，这里的 test1 是 ID，不用加 # 号
    		count: 100, //数据总数，从服务端得到
    		limit: 4,
    		jump: function(obj, first){
    			//obj包含了当前分页的所有参数，比如：
    			console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
    			console.log(obj.limit); //得到每页显示的条数
    			//首次不执行
    			if(!first){
      				//do something
    			}
  			}
  		});
  		//待确认
  		laypage.render({
    		elem: 'all-page3', //注意，这里的 test1 是 ID，不用加 # 号
    		count: 100, //数据总数，从服务端得到
    		limit: 4,
    		jump: function(obj, first){
    			//obj包含了当前分页的所有参数，比如：
    			console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
    			console.log(obj.limit); //得到每页显示的条数
    			//首次不执行
    			if(!first){
      				//do something
    			}
  			}
  		});
  		//待评价
  		laypage.render({
    		elem: 'all-page4', //注意，这里的 test1 是 ID，不用加 # 号
    		count: 100, //数据总数，从服务端得到
    		limit: 4,
    		jump: function(obj, first){
    			//obj包含了当前分页的所有参数，比如：
    			console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
    			console.log(obj.limit); //得到每页显示的条数
    			//首次不执行
    			if(!first){
      				//do something
    			}
  			}
  		});
	});

	var nav = new Vue({
		el: 'nav',
		data: {
			isLogin: false
		}
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