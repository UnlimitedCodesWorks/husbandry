//省市区
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
var list3 = [
    [
        [
            ['柯城区'],
            ['开化县']
        ],
        [
            ['金华市'],
            ['孝顺镇']
        ]
    ],
    [
        [
            ['地球村'],
            ['地球镇']
        ],
        [
            ['火星村'],
            ['火星镇']
        ]
    ]

];
var ddlProvince = document.getElementById("province");
var ddlCity = document.getElementById("city");
var ddlArea = document.getElementById("area");

// for (var i = 0; i < list1.length; i++) {
//     var option = document.createElement("option");
//     option.appendChild(document.createTextNode(list1[i]));
//     option.value = list1[i];
//     ddlProvince.appendChild(option);
// }
// for (var i = 0; i < list2[0].length; i++) {
//     var node = document.createElement("option");
//     //创建文本节点
//     var text = document.createTextNode(list2[0][i]);
//     node.appendChild(text);
//     ddlCity.appendChild(node);
// }
// for (var i = 0; i < list3[0].length; i++) {
//     var node = document.createElement("option");
//     //创建文本节点
//     var text = document.createTextNode(list3[0][0][i]);
//     node.appendChild(text);
//     ddlArea.appendChild(node);
// }
//
// ddlProvince.onchange = function() {
//     var selectNum = this.selectedIndex;
//     var selectCityNum = ddlArea.selectedIndex;
//     ddlCity.length = 0;
//     ddlArea.length = 0;
//     for (var i = 0; i < list2[selectNum].length; i++) {
//         //创建元素节点
//         var node = document.createElement("option");
//         //创建文本节点
//         var text = document.createTextNode(list2[selectNum][i]);
//         node.appendChild(text);
//         ddlCity.appendChild(node);
//     }
//
//     for (var i = 0; i < list3[selectNum][selectCityNum].length; i++) {
//         var node = document.createElement("option");
//         var text = document.createTextNode(list3[selectNum][selectCityNum][i]);
//         node.appendChild(text);
//         ddlArea.appendChild(node);
//     }
//
//
// }
// ddlCity.onchange = function() {
//     ddlArea.length = 0;
//     var selectAreaNum = this.selectedIndex;
//     var selectCityNum = ddlProvince.selectedIndex;
//     for (var i = 0; i < list3[selectCityNum][selectAreaNum].length; i++) {
//         var node = document.createElement("option");
//         var text = document.createTextNode(list3[selectCityNum][selectAreaNum][i]);
//         node.appendChild(text);
//         ddlArea.appendChild(node);
//     }
// }
//


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