<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../../../resources/css/layui.css">
    <link rel="stylesheet" href="../../../resources/css/bgmanagement_login.css">
    <title>Bgmanagement_login</title>
</head>

<body>
    <ul class="layui-nav layui-row layui-col-md12 layui-col-sm12 layui-col-xs12">
        <li class="layui-nav-item layui-col-md1 layui-col-sm1 layui-col-xs3 bgmanagement_login_webname">Husbandry</li>
        <li class="layui-nav-item layui-col-md1 layui-col-sm2 layui-col-xs3 layui-col-xs-offset6 layui-col-sm-offset9 layui-col-md-offset10 bgmanagement_login_top">返回首页<span class="layui-icon">&#xe602;</span></li>
    </ul>
    <div class="bgmanagement_login_l"></div>
    <div class="bgmanagement_login_bgimg"></div>
    <div class="layui-row">
        <div class="layui-row layui-col-md4 layui-col-sm6 layui-col-xs10 layui-col-xs-offset1 layui-col-sm-offset3 layui-col-md-offset4 bgmanagement_login_main">
            <div class="layui-col-md10 layui-col-md-offset1 layui-col-sm10 layui-col-sm-offset1 layui-col-xs12 bgmanagement_login_main1">
                <div class="layui-row bgmanagement_login_title">
                    <div class="layui-col-md6 layui-col-sm6 layui-col-xs6 bgmanagement_login_admin_title">管理员登录</div>
                </div>
                <!-- 管理员登录 -->
                <form class="layui-form" action="/admin/login.do" method="post">
                    <div class="layui-form-item layui-row layui-col-md12 layui-col-sm12 layui-col-xs12 bgmanagement_login_admin_adminname">
                        <span class="bgmanagement_login_admin_adminname_text1">账号：</span>
                        <span class="layui-col-md7 layui-col-sm7 layui-col-xs7">
                            <input type="text" name="adminname" required lay-verify="required" placeholder="管理员用户名" autocomplete="off" class="layui-input bgmanagement_login_admin_adminname_text2">
                        </span>
                    </div>
                    <div class="layui-form-item layui-row layui-col-md12 layui-col-sm12 layui-col-xs12 bgmanagement_login_admin_password">
                        <span class="bgmanagement_login_admin_password_text1">密码：</span>
                        <span class="layui-col-md7 layui-col-sm7 layui-col-xs7">
                            <input type="password" name="password" required lay-verify="required" placeholder="管理员密码" autocomplete="off" class="layui-input bgmanagement_login_admin_password_text2">
                        </span>
                    </div>
                    <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 bgmanagement_login_admin_button">
                        <button type="submit" class="layui-btn layui-col-md8 layui-col-sm8 layui-col-xs8 layui-col-xs-offset2 layui-col-sm-offset2 layui-col-md-offset2 bgmanagement_login_admin_button1">登&nbsp;&nbsp;&nbsp;录</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="../../../resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../../../resources/layui.all.js"></script>
</body>

</html>