$(function() {
    $(".login_user_title").click(function() {
        $(".login_user_title").css("color", "white");
        $(".login_user_title").css("background-color", "rgb(95, 184, 119)");
        $(".login_store_title").css("color", "rgb(95, 184, 119)");
        $(".login_store_title").css("background-color", "rgba(255,255,255,0)");
        $(".login_store_username").hide();
        $(".login_store_password").hide();
        $(".login_store_button").hide();

        $(".login_user_username").show();
        $(".login_user_password").show();
        $(".login_user_button").show();

    });
    $(".login_store_title").click(function() {
        $(".login_store_title").css("color", "white");
        $(".login_store_title").css("background-color", "rgb(95, 184, 119)");
        $(".login_user_title").css("color", "rgb(95, 184, 119)");
        $(".login_user_title").css("background-color", "rgba(255,255,255,0)");
        $(".login_user_username").hide();
        $(".login_user_password").hide();
        $(".login_user_button").hide();

        $(".login_store_username").show();
        $(".login_store_password").show();
        $(".login_store_button").show();
    });

});

$(window).resize(function() {
    if ($(window).width() < 768) {
        $(".login_user_username").css("margin-top", "5px");
        $(".login_store_username").css("margin-top", "5px");

    } else {
        $(".login_user_username").css("margin-top", "40px");
        $(".login_store_username").css("margin-top", "40px");
    }
});