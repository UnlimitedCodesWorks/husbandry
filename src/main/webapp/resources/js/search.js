$(function() {
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

    $(".search_input").bind('input propertychange', function() {
        var msg = $(".search_input").val();
        $(".search_button1").text("搜索 “" + msg + "” 相关服务和商家");
        $(".search_button1").show();
        if (msg == "") {
            $(".search_button1").hide();
        }
    });


});

$(".price_high").mouseover(function () {
   $(".price_high1").css("opacity","1");
});
$(".price_high").mouseleave(function () {
    $(".price_high1").css("opacity","0");
});
$(".price_low").mouseover(function () {
        $(".price_low1").css("opacity","1");
    });
$(".price_low").mouseleave(function () {
        $(".price_low1").css("opacity","0");
    });

$(function() {
    $(".search_classify_choose span").click(function() {
        $(".search_classify_choose span").css("color", "black")
        $(this).css("color", "#009688");
    });
    $(".search_rank_choose span").click(function() {
        $(".search_rank_choose span").css("color", "black")
        $(this).css("color", "#009688");
    });

});
$(function() {
    var nav = new Vue({
        el: 'nav',
        data: {
            isLogin: false
        }
    });
});

$(window).resize(function() {
    if ($(window).width() < 992) {
        $(".search_main").css("height", "1400px");

    } else {
        $(".search_main").css("height", "700px");

    }
});



function indexof(obj, value) {
    var k = 0;
    for (; k < obj.length; k++) {
        if (obj[k] == value)
            return k;
    }
    return k;
}
