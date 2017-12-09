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

    layui.use('form', function() {
        //实例化form
        var form = layui.form;
    });
    var nav = new Vue({
        el: 'nav',
        data: {
            isLogin: false
        }
    });
});
$(window).resize(function() {
    if ($(window).width() < 768) {
        $(".layui-form-checkbox").css("width", "100%");
        $(".layui-form-radio").css("width", "100%");
    } else {
        $(".layui-form-checkbox").css("width", "45%");
        $(".layui-form-radio").css("width", "45%");
    }
});