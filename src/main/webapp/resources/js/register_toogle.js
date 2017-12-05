$(function() {
    // var WindowWidth, WindowHeight;
    // WindowWidth = $(window).width();
    // WindowHeight = $(window).height();
    // $(".register_toogle_bgimg").css("width", WindowWidth);
    // $(".register_toogle_bgimg").css("height", WindowHeight);
});

$(function() {
    $(".register_toogle_user").click(function() {
        window.location.href = "register_user.html";
    });
    $(".register_toogle_store").click(function() {
        window.location.href = "register_store.html";
    });
});