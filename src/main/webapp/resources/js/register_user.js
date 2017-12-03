

//头像上传有关
function imgPreview(fileDom) {
    if (window.FileReader) {
        var reader = new FileReader();
    } else {
        alert("您的设备不支持图片预览功能，如需该功能请升级您的设备！");
    }
    var file = fileDom.files[0];
    var imageType = /^image\//;
    if (!imageType.test(file.type)) {
        alert("请选择图片！");
        return;
    }
    reader.onload = function(e) {

        $(".register_user_headingimg").attr('src', e.target.result);
    };
    reader.readAsDataURL(file);
}

//各个输入框的判断
// $(function() {
    //用户名判断
    // $(".register_user_registernum_text2").focus(function() {
    //     $(".register_user_registernum_reminder").text("");
    //     $(".register_user_registernum_reminder").css("color", "red");
    // });
    // $(".register_user_registernum_text2").blur(function() {
    //     if ($(".register_user_registernum_text2").val() == "") {
    //         $(".register_user_registernum_reminder").text("请输入用户名！");
    //     } else if (!(/^[a-zA-Z0-9_-]{8,16}$/.test($(".register_user_registernum_text2").val()))) {
    //         $(".register_user_registernum_reminder").text("您输入的用户名不符合格式");
    //     } else if ($(".register_user_registernum_text2").val().length < 8) {
    //         $(".register_user_registernum_reminder").text("用户名至少需要8位！");
    //     } else if ($(".register_user_registernum_text2").val().length > 16) {
    //         $(".register_user_registernum_reminder").text("用户名长度不可超过16位！");
    //     } else {
    //         $(".register_user_registernum_reminder").css("color", "#0BD60B");
    //         $(".register_user_registernum_reminder").text("恭喜您，该用户名可用！");
    //     }
    // });
    //密码判断
    // $(".register_user_password_text2").focus(function() {
    //     $(".register_user_password_reminder").text("");
    // });
    // $(".register_user_password_text2").blur(function() {
    //     if ($(".register_user_password_text2").val() == "") {
    //         $(".register_user_password_reminder").text("请输入密码！");
    //     } else if (!(/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/.test($(".register_user_password_text2").val()))) {
    //         $(".register_user_password_reminder").text("您输入的密码格式错误！");
    //     }
    // });
    //手机号判断
    // $(".register_user_phone_text2").focus(function() {
    //     $(".register_user_phone_reminder").text("");
    //     $(".register_user_phone_reminder").css("color", "red");
    // });
    // $(".register_user_phone_text2").blur(function() {
    //     if ($(".register_user_phone_text2").val() == "") {
    //         $(".register_user_phone_reminder").text("请输入手机号！");
    //     } else if (!(/^1[34578]\d{9}$/.test($(".register_user_phone_text2").val()))) {
    //         $(".register_user_phone_reminder").text("请按正确格式输入手机号！");
    //     } else {
    //         $(".register_user_phone_reminder").css("color", "#0BD60B");
    //         $(".register_user_phone_reminder").text("恭喜您，该手机号输入正确！");
    //     }
    // });
    //邮箱判断
//     $(".register_user_email_text2").focus(function() {
//         $(".register_user_email_reminder").text("");
//         $(".register_user_email_reminder").css("color", "red");
//     });
//     $(".register_user_email_text2").blur(function() {
//         if ($(".register_user_email_text2").val() == "") {
//             $(".register_user_email_reminder").text("请输入邮箱号！");
//         } else if (!(/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test($(".register_user_email_text2").val()))) {
//             $(".register_user_email_reminder").text("请输入格式正确的邮箱！");
//         } else {
//             $(".register_user_email_reminder").css("color", "#0BD60B");
//             $(".register_user_email_reminder").text("恭喜您，该邮箱输入正确！");
//         }
//     });
// });