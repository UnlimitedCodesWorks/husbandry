<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String portPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
    String registerPath =
            request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/user/registerUser.do";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../../resources/css/layui.css">
    <link rel="stylesheet" href="../../resources/css/register_user.css">
    <title>智慧社区-用户注册</title>
</head>

<body>
    <ul class="layui-nav layui-row layui-col-md12 layui-col-sm12 layui-col-xs12 register_user_top">
        <li class="layui-nav-item layui-col-md1 layui-col-sm1 layui-col-xs3 register_user_webname" onclick="location.href='<%=portPath%>index.html'" >Husbandry</li>
        <li class="layui-nav-item layui-col-md1 layui-col-sm2 layui-col-xs3 layui-col-xs-offset6 layui-col-sm-offset9 layui-col-md-offset10 register_user_top1" onclick="location.href='<%=portPath%>index.html'" >返回首页<span class="layui-icon">&#xe602;</span></li>
    </ul>
    <div class="register_user_l"></div>
    <div class="register_user_bgimg"></div>

    <div class="layui-row layui-col-md8 layui-col-sm10 layui-col-xs10 layui-col-xs-offset1 layui-col-sm-offset1 layui-col-md-offset2 register_user_main">
        <div class="layui-col-md10 layui-col-sm10 layui-col-xs10 layui-col-xs-offset1 layui-col-sm-offset1 layui-col-md-offset1 register_user_title"><span class="layui-icon">&#xe612;</span> 用户注册</div>
        <div class="layui-col-md10 layui-col-md-offset1 layui-col-sm10 layui-col-xs10 layui-col-xs-offset1 layui-col-sm-offset1">
            <f:form class="layui-form" method="post" action="<%=registerPath%>" enctype="multipart/form-data">
                <div class="layui-col-md6 layui-col-sm6 layui-col-xs12">
                    <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item register_user_registernum">
                        <span class="layui-col-md3 layui-col-sm4 layui-col-xs4 register_user_registernum_text">用户名：</span>
                        <span class="layui-col-md7 layui-col-sm7 layui-col-xs7">
                            <f:input type="text" path="registNum" required="required" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input register_user_registernum_text1" />
                        </span>
                    </div>
                    <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item register_user_registerpwd">
                        <span class="layui-col-md3 layui-col-sm4 layui-col-xs4 register_user_registerpwd_text">密码：</span>
                        <span class="layui-col-md7 layui-col-sm7 layui-col-xs7">
                            <f:input type="password" path="password" required="required" lay-verify="required" placeholder="8~16位组合" autocomplete="off" class="layui-input register_user_registerpwd_text1"/>
                        </span>
                    </div>
                    <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item register_user_phone">
                        <span class="layui-col-md3 layui-col-sm4 layui-col-xs4 register_user_phone_text">手机号：</span>
                        <span class="layui-col-md7 layui-col-sm7 layui-col-xs7 ">
                            <f:input type="text" path="phone" required="required" lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input register_user_phone_text1"/>
                        </span>
                    </div>
                    <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item register_user_email">
                        <span class="layui-col-md3 layui-col-sm4 layui-col-xs4 register_user_email_text">邮箱：</span>
                        <span class="layui-col-md7 layui-col-sm7 layui-col-xs7">
                            <f:input type="text" path="email" required="required" lay-verify="required" placeholder="请输入邮箱" autocomplete="off" class="layui-input register_user_email_text1"/>
                        </span>
                    </div>
                </div>
                <div class="layui-col-md6 layui-col-sm6 layui-col-xs12">
                    <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item register_user_headimg ">
                        <span class="layui-col-md3 layui-col-sm4 layui-col-xs4 register_user_headimg_text">头像：</span>
                        <span class="layui-col-md4 layui-col-sm4 layui-col-xs5">
                        <img src="../../resources/images/house.jpg" class="register_user_headingimg" >
                        </span>
                        <span class="layui-col-sm4 layui-col-xs3">
                            <input name="headImg" type="file" class="register_user_upload" lay-verify="required" autocomplete="off" onchange="imgPreview(this)"/>
                        </span>
                    </div>
                    <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item register_user_username">
                        <span class="layui-col-md3 layui-col-sm4 layui-col-xs4 register_user_username_text">昵称：</span>
                        <span class="layui-col-md7 layui-col-sm8 layui-col-xs7">
                            <f:input type="text" path="userName" required="required" lay-verify="required" placeholder="请输入昵称" autocomplete="off" class="layui-input register_user_username_text1" />
                        </span>
                    </div>
                    <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-item register_user_address">
                        <span class="layui-col-md3 layui-col-sm4 layui-col-xs4 register_user_address_text">地址：</span>
                        <span class="layui-col-md4 layui-col-sm4 layui-col-xs4">
                                <select runat="server" lay-ignore class="layui-col-md12 layui-col-sm12 layui-col-xs12" id="province">

                                </select>
                        </span>
                        <span class="layui-col-md3 layui-col-sm4 layui-col-xs3">
                            <select runat="server" lay-ignore class="layui-col-md12 layui-col-sm12 layui-col-xs12" id="city">
                                </select>
                        </span>
                        <span class="layui-col-md7 layui-col-sm8 layui-col-xs7 layui-col-xs-offset4 layui-col-md-offset3 layui-col-sm-offset4">
                            <input type="text" required="required" lay-verify="required" placeholder="请输入您所在的社区" autocomplete="off" class="layui-input register_user_address_text1" >
                        </span>
                    </div>
                </div>

                <div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
                    <button type="submit" class="layui-col-md4 layui-col-sm4  layui-col-xs12 layui-col-sm-offset4 layui-col-md-offset4 layui-btn layui-btn-primary register_user_success">完成注册</button>
                </div>
            </f:form>
        </div>
    </div>
    <script type="text/javascript" src="../../resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../../resources/layui.all.js"></script>
    <script type="text/javascript" src="../../resources/js/register_user.js"></script>
</body>

</html>