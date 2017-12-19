
var layerWidth;
if($(window).width()>=768) {
    layerWidth = '50%';
}
else {
    layerWidth = '80%';
}

var cropper;
layui.use('layer', function() {
    var layer = layui.layer;
    var headimg;
    $(".register_user_upload").click(function (event) {
        headimg = layer.open({
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
            $(".register_user_headingimg").onload = function() {
                // no longer need to read the blob so it's revoked
                URL.revokeObjectURL(url);
            };
            $(".register_user_headingimg").attr("src",url);
        });
        layer.close(headimg)
    })
});


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