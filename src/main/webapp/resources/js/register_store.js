
var layerWidth;
if($(window).width()>=768) {
    layerWidth = '50%';
}
else {
    layerWidth = '80%';
}

var cropper;
var cropper1;
layui.use('layer', function() {
    var layer = layui.layer;
    var headimg;
    var logoimg;
    //头像
    $(".register_store_upload").click(function (event) {
            headimg =  layer.open({
            type: 1,
            title: '选择头像',
            area: layerWidth,
            anim: 2,
            content: $('#head')
        });
        if (cropper == undefined) {
            cropper = $('#head-img-wrap img').cropper({
                aspectRatio: 1 / 1,
                // minContainerWidth: 500,
                crop: function (data) {
                    // Output the result data for cropping image.
                }
            });
        }
    });
    $(".head_qd").click(function(){
        cropper.cropper("getCroppedCanvas").toBlob(function (blob) {
            var url = URL.createObjectURL(blob);
            $(".register_store_headingimg").onload = function() {
                // no longer need to read the blob so it's revoked
                URL.revokeObjectURL(url);
            };
            $(".register_store_headingimg").attr("src",url);
        });
        layer.close(headimg);
    });
    //LOGO
    $(".register_store_logoupload").click(function (event) {
        logoimg =  layer.open({
            type: 1,
            title: '选择头像',
            area: layerWidth,
            anim: 2,
            content: $('#head1')
        });
        if (cropper1 == undefined) {
            cropper1 = $('#head-img-wrap1 img').cropper({
                aspectRatio: 16 / 9,
                // minContainerWidth: 500,
                crop: function (data) {
                    // Output the result data for cropping image.
                }
            });
        }
    });
    $(".head_qd1").click(function(){
        cropper1.cropper("getCroppedCanvas").toBlob(function (blob) {
            var url = URL.createObjectURL(blob);
            $(".register_store_logoimg").onload = function() {
                // no longer need to read the blob so it's revoked
                URL.revokeObjectURL(url);
            };
            $(".register_store_logoimg").attr("src",url);
        });
        layer.close(logoimg);
    });
});

//头像图片选择
$("#btn-upload").change(function(event) {
    var $file = $(this);
    var fileObj = $file[0];
    var windowURL = window.URL || window.webkitURL;
    var dataURL;
    var $img = $("#head-img");
    if(fileObj && fileObj.files && fileObj.files[0]){
        dataURL = windowURL.createObjectURL(fileObj.files[0]);
        $img.attr('src',dataURL);
        //cropper
        $.fn.cropper;
        cropper.cropper('reset').cropper('replace',dataURL);
    }
    else{
        dataURL = $file.val();
        var imgObj = $("#head-img");
        imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
        imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
    }
});

//logo图片选择
$("#btn-upload1").change(function(event) {
    var $file = $(this);
    var fileObj = $file[0];
    var windowURL = window.URL || window.webkitURL;
    var dataURL;
    var $img = $("#head-img1");
    if(fileObj && fileObj.files && fileObj.files[0]){
        dataURL = windowURL.createObjectURL(fileObj.files[0]);
        $img.attr('src',dataURL);
        //cropper
        $.fn.cropper1;
        cropper1.cropper('reset').cropper('replace',dataURL);
    }
    else{
        dataURL = $file.val();
        var imgObj = $("#head-img1");
        imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
        imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
    }
});






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