$(function() {
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