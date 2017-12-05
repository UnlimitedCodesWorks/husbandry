//商户头像
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
        $(".register_store_headingimg").attr('src', e.target.result);
    };
    reader.readAsDataURL(file);
}
//商户LOGO
function imgPreview1(fileDom) {
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
        $(".register_store_logoimg").attr('src', e.target.result);
    };
    reader.readAsDataURL(file);
}
//多图
function imgPreview2(fileDom) {
    var ddd = document.getElementById("porperty_input");
    document.getElementById("register_store_porperty_show").innerHTML = "";
    var fileList = ddd.files;
    for (var i = 0; i < fileList.length; i++) {
        document.getElementById("register_store_porperty_show").innerHTML += '<img class="layui-col-md4 layui-col-sm4 layui-col-xs4 register_store_porperty_img" src="' + window.URL.createObjectURL(ddd.files[i]) + '" />';
    }

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
        //123
    };
    reader.readAsDataURL(file);
}