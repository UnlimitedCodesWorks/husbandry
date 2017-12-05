<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <title>智慧社区-商户注册</title>
</head>

<body>
    <ul class="layui-nav layui-row layui-col-md12 layui-col-sm12 layui-col-xs12 register_store_top">
        <li class="layui-nav-item layui-col-md1 layui-col-sm1 layui-col-xs3 register_store_webname">Husbandry</li>
        <li class="layui-nav-item layui-col-md1 layui-col-sm2 layui-col-xs3 layui-col-md-offset10 layui-col-xs-offset6 layui-col-sm-offset9 register_store_top1">返回首页<span class="layui-icon">&#xe602;</span></li>
    </ul>
    <div class="register_store_l"></div>
    <div class="register_store_bgimg"></div>
    <div class="layui-row">
        <div class="layui-col-md10 layui-col-md-offset1 layui-col-sm10 layui-col-xs10 layui-col-xs-offset1 layui-col-sm-offset1 register_store_main">
            <div class="layui-col-md10 layui-col-md-offset1 layui-col-sm10 layui-col-xs10 layui-col-xs-offset1 layui-col-sm-offset1 register_store_title">商户注册</div>
            <div class="layui-col-md10 layui-col-md-offset1 layui-col-sm10 layui-col-xs10 layui-col-xs-offset1 layui-col-sm-offset1">
                <f:form cssClass="layui-form"   action="<%=registerPath%>" modelAttribute="registerStore"  enctype="multipart/form-data" method="post"  >
                    <div class="layui-col-md4 layui-col-sm6 layui-col-xs12">
                        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item register_store_username">
                            <span class="layui-col-md4 layui-col-sm4 layui-col-xs4 register_store_username_text">账户名：</span>
                            <span class="layui-col-md7 layui-col-sm7 layui-col-xs7">
                                <f:input name="username" path="registNum"  required="required" lay-verify="required" placeholder="请输入用户名" autocomplete="off" cssClass="layui-input register_store_username_text1" />
                            </span>
                        </div>
                        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item register_store_password">
                            <span class="layui-col-md4 layui-col-sm4 layui-col-xs4 register_store_password_text">密码：</span>
                            <span class="layui-col-md7 layui-col-sm7 layui-col-xs7">
                                <f:password  name="password" path="password" required="required" lay-verify="required" placeholder="8~16位组合" autocomplete="off" cssClass="layui-input register_store_password_text1" />
                            </span>
                        </div>
                        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item register_store_phone">
                            <span class="layui-col-md4 layui-col-sm4 layui-col-xs4 register_store_phone_text">手机号：</span>
                            <span class="layui-col-md7 layui-col-sm7 layui-col-xs7">
                                <f:input  name="storephone" path="phone" required="required" lay-verify="required" placeholder="请输入手机号" autocomplete="off" cssClass="layui-input register_store_phone_text1" />
                            </span>
                        </div>
                        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item register_store_email">
                            <span class="layui-col-md4 layui-col-sm4 layui-col-xs4 register_store_email_text">邮箱：</span>
                            <span class="layui-col-md7 layui-col-sm7 layui-col-xs7">
                                <f:input  name="storeemail" path="email" required="required" lay-verify="required" placeholder="请输入邮箱号" autocomplete="off" cssClass="layui-input register_store_eamil_text1" />
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
                                <input type="file" name="headImg"  class="register_store_upload" required lay-verify="required" autocomplete="off" onchange="imgPreview(this)">
                            </span>
                        </div>
                        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item">
                            <span class="layui-col-md4 layui-col-sm4 layui-col-xs4 register_store_logo_text">LOGO：</span>
                            <span class="layui-col-md4 layui-col-sm4 layui-col-xs4">
                            <img src="../../resources/images/house.jpg" class="register_store_logoimg" >
                            </span>
                            <span class="layui-col-sm4 layui-col-xs4">
                                <input type="file" name="logoImg" class="register_store_logoupload" required lay-verify="required" autocomplete="off" onchange="imgPreview1(this)">
                            </span>
                        </div>
                        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item register_store_storename">
                            <span class="layui-col-md4 layui-col-sm4 layui-col-xs4 register_store_email_text">商户名：</span>
                            <span class="layui-col-md7 layui-col-sm7 layui-col-xs7">
                                <f:input   path="storeName" required="required" lay-verify="required" placeholder="请输入商户的名字" autocomplete="off" class="layui-input register_store_eamil_text1" />
                            </span>
                        </div>
                    </div>
                    <div class="layui-col-md4 layui-col-sm12 layui-col-xs12">
                        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item register_store_address">
                            <span class="layui-col-md4 layui-col-sm2 layui-col-xs4 register_store_address_text">地址：</span>
                            <span class="layui-col-md8 layui-col-sm10 layui-col-xs7">
                                <f:select path="provinceId" runat="server" lay-ignore="lay-ignore" class="layui-col-md12 layui-col-sm12 layui-col-xs12" id="province">
                                    <f:option value="NONE" label="请选择省份" />
                                    <f:options items="${provinces}" />
                                </f:select>
                            </span>
                            <span class="layui-col-md4 layui-col-md-offset4 layui-col-sm5 layui-col-sm-offset2 layui-col-xs4 layui-col-xs-offset4">
                                <f:select path="cityId" runat="server" lay-ignore="lay-ignore" class="layui-col-md12 layui-col-sm12 layui-col-xs12" id="city">
                                </f:select>
                            </span>
                            <span class="layui-col-md4 layui-col-sm5 layui-col-xs3">
                                    <f:select path="areaId" runat="server" lay-ignore="lay-ignore" class="layui-col-md12 layui-col-sm12 layui-col-xs12" id="area">
                                    </f:select>
                            </span>
                        </div>
                        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item register_store_property">
                            <span class="layui-col-md4 layui-col-sm2 layui-col-xs4 register_store_porperty_text">资产证明</span>
                            <span class="layui-col-md8 layui-col-sm10 layui-col-xs4">
                                <input type="file" name="aptitudeImgs" id="porperty_input" multiple class="register_store_porperty_input" onchange="imgPreview2(this)">
                            </span>
                            <div id="register_store_porperty_show" class=" layui-col-md12 layui-col-sm12 layui-col-xs12 register_store_porperty_show">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
                        <button type="submit" class="layui-col-md4 layui-col-md-offset4 layui-col-sm6 layui-col-sm-offset3 layui-col-xs8 layui-col-xs-offset2 layui-btn layui-btn-primary register_store_success">完成注册</button>
                    </div>
                </f:form>
            </div>
        </div>

    </div>

    <script type="text/javascript" src="../../resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../../resources/layui.all.js"></script>
    <script type="text/javascript" src="../../resources/js/register_store.js"></script>
</body>

</html>