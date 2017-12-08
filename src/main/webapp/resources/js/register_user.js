var list1 = ["浙江省", "江苏省"];
var list2 = [
    [
        ['杭州市'],
        ['湖州市']
    ],
    [
        ['南京市'],
        ['徐州市']
    ]
];
var ddlProvince = document.getElementById("province");
var ddlCity = document.getElementById("city");
for (var i = 0; i < list1.length; i++) {
    var option = document.createElement("option");
    option.appendChild(document.createTextNode(list1[i]));
    option.value = list1[i];
    ddlProvince.appendChild(option);
}
for (var i = 0; i < list2[0].length; i++) {
    var node = document.createElement("option");
    //创建文本节点
    var text = document.createTextNode(list2[0][i]);
    node.appendChild(text);
    ddlCity.appendChild(node);
}
ddlProvince.onchange = function() {
    var selectNum = this.selectedIndex;
    ddlCity.length = 0;
    for (var i = 0; i < list2[selectNum].length; i++) {
        //创建元素节点
        var node = document.createElement("option");
        //创建文本节点
        var text = document.createTextNode(list2[selectNum][i]);
        node.appendChild(text);
        ddlCity.appendChild(node);
    }
}






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