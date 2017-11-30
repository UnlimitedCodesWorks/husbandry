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
  		form.on('select(test)', function(data){
  			let wow = new WOW({
    			boxClass: 'reWow2',
    			animateClass: 'animated',
    			offset: 0,
    			mobile: true,
    			live: true
			});
			wow.init();
            if(data.value == 0){
                $.ajax({
                    url : 'rankSale.do',
                    type : "post",
                    dataType : "json",
                    success: function(data){

                    },
                    error: function(jqXHR){
                        alert("发生错误：" + jqXHR.status);
                    }
                });
            }else if(data.value == 1){
                $.ajax({
                    url : location.href + '/rankGrade.do',
                    type : "post",
                    dataType : "json",
                    success: function(data){
                        rankGrade(data);
                    },
                    error: function(jqXHR){
                        alert("发生错误：" + jqXHR.status);
                    }
                });
            }else if(data.value == 2){
                $.ajax({
                    url : 'rankHit.do',
                    type : "post",
                    dataType : "json",
                    success: function(data){

                    },
                    error: function(jqXHR){
                        alert("发生错误：" + jqXHR.status);
                    }
                });
            }
		});
	});

	var nav = new Vue({
		el: 'nav',
		data: {
			isLogin: false
		}
	});

	var reWow1 = new Vue({
		el: '.reWow-wrap',
		data: {
			isFocus: false,
			reWow1: true
		}
	});

	$(".mask").css("height", $(".layui-home-bg").css("height"));
	$(".mask").css("opacity", "0.5");
	$(".layui-form-group input").focus(function(event) {
		$(".layui-form-group").animate({
			"top": "70%",
			"width": "50%",
			"height": "70px"
		});
		$(".layui-icon").animate({
			"font-size": "46px"
		});
		$(".layui-form-group input").animate({
			"height": "56px",
			"font-size": "32px"
		});
	});

	$(".layui-service-wrap .row-in").hover(function() {
		$(this).css({
			background: '#5FB878'
		});
		$(this).find("p").css({
			color: '#fff'
		});
	}, function() {
		$(this).css({
			background: '#f3f3f3'
		});
		$(this).find("p").css({
			color: '#5f5f5f'
		});
	});

	$(".layui-home-bg input").focus(function(event) {
		reWow1.isFocus=true;
		reWow1.reWow1=false;
		let wow = new WOW({
    		boxClass: 'reWow1',
    		animateClass: 'animated',
    		offset: 0,
    		mobile: true,
    		live: true
		});
		wow.init();
	});

	var wow = new WOW({
    	boxClass: 'wow',
    	animateClass: 'animated',
    	offset: 100,
    	mobile: true,
    	live: true
	});
	wow.init();

    function rankGrade(data) {
        var fNode = $("#hotStore");
        console.log(data);
    }
});