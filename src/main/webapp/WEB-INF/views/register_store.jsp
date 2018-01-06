<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String portPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
String registerPath =
        request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/store/register.do";
%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../../resources/css/layui.css">
    <link rel="stylesheet" href="../../resources/css/register_store.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/cropper.css">
    <title>智慧社区-商户注册</title>
</head>

<body>
    <ul class="layui-nav layui-row layui-col-md12 layui-col-sm12 layui-col-xs12 register_store_top">
        <li class="layui-nav-item layui-col-md1 layui-col-sm1 layui-col-xs3 register_store_webname" onclick="location.href='<%=portPath%>index.html'" >Husbandry</li>
        <li class="layui-nav-item layui-col-md1 layui-col-sm2 layui-col-xs3 layui-col-md-offset10 layui-col-xs-offset6 layui-col-sm-offset9 register_store_top1" onclick="location.href='<%=portPath%>index.html'" >返回首页<span class="layui-icon">&#xe602;</span></li>
    </ul>
    <div class="register_store_l"></div>
    <div class="register_store_bgimg"></div>
    <f:form  class="layui-form"   modelAttribute="registerStore"  enctype="multipart/form-data" method="post"  >
    <div class="layui-row">
        <div class="layui-col-md10 layui-col-md-offset1 layui-col-sm10 layui-col-xs10 layui-col-xs-offset1 layui-col-sm-offset1 register_store_main">
            <div class="layui-col-md10 layui-col-md-offset1 layui-col-sm10 layui-col-xs10 layui-col-xs-offset1 layui-col-sm-offset1 register_store_title"><img src="../../resources/images/register_store.png"> 商户注册</div>
            <div class="layui-col-md10 layui-col-md-offset1 layui-col-sm10 layui-col-xs10 layui-col-xs-offset1 layui-col-sm-offset1">

                    <div class="layui-col-md4 layui-col-sm6 layui-col-xs12">
                        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item register_store_username">
                            <span class="layui-col-md4 layui-col-sm4 layui-col-xs4 register_store_username_text">账户名：</span>
                            <span class="layui-col-md7 layui-col-sm7 layui-col-xs7">
                                <input name="registNum"  required="required" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input register_store_username_text1" />
                            </span>
                        </div>
                        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item register_store_password">
                            <span class="layui-col-md4 layui-col-sm4 layui-col-xs4 register_store_password_text">密码：</span>
                            <span class="layui-col-md7 layui-col-sm7 layui-col-xs7">
                                <input type="password" name="password"  required="required" lay-verify="required" placeholder="8~16位组合" autocomplete="off" class="layui-input register_store_password_text1" />
                            </span>
                        </div>
                        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item register_store_phone">
                            <span class="layui-col-md4 layui-col-sm4 layui-col-xs4 register_store_phone_text">手机号：</span>
                            <span class="layui-col-md7 layui-col-sm7 layui-col-xs7">
                                <input name="phone" required="required" lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input register_store_phone_text1"  />
                            </span>
                        </div>
                        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item register_store_email">
                            <span class="layui-col-md4 layui-col-sm4 layui-col-xs4 register_store_email_text">邮箱：</span>
                            <span class="layui-col-md7 layui-col-sm7 layui-col-xs7">
                                <input  name="email" required="required" lay-verify="required" placeholder="请输入邮箱号" autocomplete="off" class="layui-input register_store_eamil_text1" />
                            </span>
                        </div>

                    </div>
                    <div class="layui-col-md4 layui-col-sm6 layui-col-xs12">
                        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item">
                            <span class="layui-col-md4 layui-col-sm4 layui-col-xs4 register_store_headimg_text">头像：</span>
                            <span class="layui-col-md4 layui-col-sm4 layui-col-xs4">
                            <img src="../../resources/images/house.jpg" class="register_store_headingimg" >
                            </span>
                            <span class="layui-col-sm4 layui-col-xs4">
                               <button type="button" class="layui-btn layui-btn-primary register_store_upload">选择头像</button>
                            </span>
                        </div>
                        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item">
                            <span class="layui-col-md4 layui-col-sm4 layui-col-xs4 register_store_logo_text">LOGO：</span>
                            <span class="layui-col-md4 layui-col-sm4 layui-col-xs4">
                            <img src="../../resources/images/house.jpg" class="register_store_logoimg" >
                            </span>
                            <span class="layui-col-sm4 layui-col-xs4">
                                <button type="button" class="layui-btn layui-btn-primary register_store_logoupload">选择图片</button>
                            </span>
                        </div>
                        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item register_store_storename">
                            <span class="layui-col-md4 layui-col-sm4 layui-col-xs4 register_store_email_text">商户名：</span>
                            <span class="layui-col-md7 layui-col-sm7 layui-col-xs7">
                                <input  name="storeName" required="required" lay-verify="required" placeholder="请输入商户的名字" autocomplete="off" class="layui-input register_store_eamil_text1" />
                            </span>
                        </div>
                    </div>
                    <div class="layui-col-md4 layui-col-sm12 layui-col-xs12">
                        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item register_store_address">
                            <span class="layui-col-md4 layui-col-sm2 layui-col-xs4 register_store_address_text">地址：</span>
                            <span class="layui-col-md8 layui-col-sm10 layui-col-xs7">
                                <f:select path="provinceId" runat="server" lay-ignore="lay-ignore" class="layui-col-md12 layui-col-sm12 layui-col-xs12" id="province">
                                    <f:option value="NONE" label="省" />
                                    <f:options items="${provinces}" />
                                </f:select>
                            </span>
                            <span class="layui-col-md4 layui-col-md-offset4 layui-col-sm5 layui-col-sm-offset2 layui-col-xs4 layui-col-xs-offset4">
                                <f:select path="cityId" runat="server" lay-ignore="lay-ignore" class="layui-col-md12 layui-col-sm12 layui-col-xs12" id="city">
                                    <f:option value="NONE" label="市" />
                                </f:select>
                            </span>
                            <span class="layui-col-md4 layui-col-sm5 layui-col-xs3">
                                    <f:select path="areaId" runat="server" lay-ignore="lay-ignore" class="layui-col-md12 layui-col-sm12 layui-col-xs12" id="area">
                                        <f:option value="NONE" label="区" />
                                    </f:select>
                            </span>
                        </div>
                        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item register_store_property">
                            <span class="layui-col-md4 layui-col-sm2 layui-col-xs4 register_store_porperty_text">资质证明</span>
                            <span class="layui-col-md8 layui-col-sm10 layui-col-xs4">
                                <button class="layui-btn layui-btn-primary upload">
                                    <input type="file" name="aptitudeImgs" id="porperty_input" multiple class="register_store_porperty_input" onchange="imgPreview2(this)"> 选择文件
                                </button>
                            </span>
                            <div id="register_store_porperty_show" class="layui-col-md12 layui-col-sm12 layui-col-xs12 register_store_porperty_show">
                            </div>
                        </div>
                    </div>
                </f:form>
                    <div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
                        <button type="button" class="layui-col-md4 layui-col-md-offset4 layui-col-sm6 layui-col-sm-offset3 layui-col-xs8 layui-col-xs-offset2 layui-btn layui-btn-primary register_store_success" id="register-store">完成注册</button>
                    </div>
            </div>
        </div>
    </div>
        //商家头像
        <div id="head">
            <div class="layui-fuild">
                <div class="layui-row">
                    <div class="layui-col-md6 layui-col-sm6 layui-col-xs6">
                        <a href="javascript:" class="a-upload">
                            <input type="file" name="" id="btn-upload"><i class="layui-icon">&#xe67c;</i> 选择图片
                        </a>
                    </div>
                    <div class="layui-col-md6 layui-col-sm6 layui-col-xs6">
                        <button class="layui-btn head_qd" type="button">
                            <i class="iconfont">&#xe62b;</i> 确定
                        </button>
                    </div>
                    <div class="layui-col-md12 layui-col-sm12 layui-col-xs12" id="head-img-wrap">
                        <img id="head-img">
                    </div>
                </div>
            </div>
        </div>
        //商家LOGO
        <div id="head1">
            <div class="layui-fuild">
                <div class="layui-row">
                    <div class="layui-col-md6 layui-col-sm6 layui-col-xs6">
                        <a href="javascript:" class="a-upload">
                            <input type="file" name="" id="btn-upload1"><i class="layui-icon">&#xe67c;</i> 选择图片
                        </a>
                    </div>
                    <div class="layui-col-md6 layui-col-sm6 layui-col-xs6">
                        <button class="layui-btn head_qd1" type="button">
                            <i class="iconfont">&#xe62b;</i> 确定
                        </button>
                    </div>
                    <div class="layui-col-md12 layui-col-sm12 layui-col-xs12" id="head-img-wrap1">
                        <img id="head-img1">
                    </div>
                </div>
            </div>
        </div>
</body>
<script type="text/javascript" src="../../resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../../resources/layui.js"></script>
<script type="text/javascript" src="../../resources/js/register_store.js"></script>
<script src="../../resources/js/cropper.js"></script>
<script type="text/javascript">
    var province = $("#province");
    var city = $("#city");
    var area = $("#area");
    var portPath = "<%=portPath%>";
    var loginPath = portPath+"login/user.html";
    var storeHeadBlob;
    var storeHeadMIME="";
    var storeLogoBlob;
    var storeLogoMIME="";
    province.change(function (e) {
        city.html("");
        area.html("");
        city.append('<option value="NONE" label="市" />');
        area.append('<option value="NONE" label="区" />');
        var value = province.val();
        $.ajax({
            url :portPath + 'store/getCitys.do',
            type : "post",
            data:{
                provinceId : value
            },
            dataType : "json",
            success: function(data){
                for(var i=0;i<data.length;i++){
                    var node = '<option value="'+data[i].cityId+ '" label="'+data[i].city+'" />';
                    city.append(node);
                }
            },
            error: function(jqXHR){
                alert("发生错误：" + jqXHR.status);
            }
        });
    });
    city.change(function (e) {
        area.html("");
        var value = city.val();
        area.append('<option value="NONE" label="区" />');
        $.ajax({
            url :portPath + 'store/getAreas.do',
            type : "post",
            data:{
                cityId : value
            },
            dataType : "json",
            success: function(data){
                for(var i=0;i<data.length;i++){
                    var node = '<option value="'+data[i].areaId+ '" label="'+data[i].area+'" />';
                    area.append(node);
                }
            },
            error: function(jqXHR){
                alert("发生错误：" + jqXHR.status);
            }
        });
    });

    $("#register-store").click(function () {
        var formData = new FormData(document.querySelector("form"));
        var headSuffix = storeHeadMIME.split("/")[1];
        var headFileName = "blobImage."+headSuffix;
        var logoSuffix = storeLogoMIME.split("/")[1];
        var logoFileName = "blobImage."+ logoSuffix;
        formData.append("headImg",storeHeadBlob,headFileName);
        formData.append("logoImg",storeLogoBlob,logoFileName);
        layui.use('layer', function() {
            var layer = layui.layer;
            $.ajax({
                type: "post",
                url: "<%=registerPath%>",
                cache: false,
                processData: false,
                contentType: false,
                data: formData,
                success: function (data) {
                    if (data!=0) {
                        layer.msg("注册商户成功！审核结果会发邮件到您的邮箱",{
                            time: 2000
                        });
                        setTimeout("location.replace(loginPath)",2000);
                    } else {
                        alert("注册商户失败!请检查有没有未填的项");
                    }

                },
                error: function (XMLHttpRequest, textStatus, errorThrown, data) {
                    alert(errorThrown);
                }
            });
        });
    });
</script>
</html>