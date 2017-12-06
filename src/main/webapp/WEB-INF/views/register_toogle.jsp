<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String portPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../../resources/css/layui.css">
    <link rel="stylesheet" href="../../resources/css/register_toogle.css">
    <title>智慧社区-注册</title>
</head>

<body>
    <ul class="layui-nav layui-row layui-col-md12 layui-col-sm12 layui-col-xs12 register_user_top">
        <li class="layui-nav-item layui-col-md1 layui-col-sm1 layui-col-xs3 register_user_webname" onclick="location.href='<%=portPath%>index.html'">Husbandry</li>
        <li class="layui-nav-item layui-col-md1 layui-col-sm2 layui-col-xs3 layui-col-xs-offset6 layui-col-sm-offset9 layui-col-md-offset10 register_user_top1" onclick="location.href='<%=portPath%>index.html'">返回首页<span class="layui-icon">&#xe602;</span></li>
    </ul>
    <div class="register_user_l"></div>
    <div class="register_user_bgimg"></div>
    <div class="register_toogle_user">
        <div class="register_toogle_user_img"><img src="../../resources/images/user.png"></div>
        <div class="register_toogle_user_text">用户注册</div>
    </div>

    <div class="register_toogle_store">
        <div class="register_toogle_store_img"><img src="../../resources/images/store1.png"></div>
        <div class="register_toogle_store_text">商户注册</div>
    </div>
    <script type="text/javascript" src="../../resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../../resources/layui.all.js"></script>
    <script type="text/javascript" src="../../resources/js/register_toogle.js"></script>
</body>
<script type="text/javascript">
    $(".register_toogle_user").click(function() {
        window.location.href = "<%=portPath%>user/registerUser.html";
    });
    $(".register_toogle_store").click(function() {
        window.location.href = "<%=portPath%>store/register.html";
    });
</script>
</html>