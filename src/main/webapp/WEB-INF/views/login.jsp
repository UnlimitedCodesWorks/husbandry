<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String portPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
    String loginPath= request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/login/userLogin.do";
    String storeLoginPath = portPath+"login/storeLogin.do";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../../resources/css/layui.css">
    <link rel="stylesheet" href="../../resources/css/login.css">
    <title>智慧社区-登陆</title>
</head>

<body>
    <ul class="layui-nav layui-row layui-col-md12 layui-col-sm12 layui-col-xs12 login_top">
        <li class="layui-nav-item layui-col-md1 layui-col-sm1 layui-col-xs3 login_webname" onclick="location.href='<%=portPath%>index.html'">Husbandry</li>
        <li class="layui-nav-item layui-col-md1 layui-col-sm2 layui-col-xs3 layui-col-xs-offset6 layui-col-sm-offset9 layui-col-md-offset10 login_top1" onclick="location.href='<%=portPath%>index.html'">返回首页<span class="layui-icon">&#xe602;</span></li>
    </ul>
    <div class="login_l"></div>
    <div class="login_bgimg"></div>
    <!-- 登陆框 -->
    <div class="layui-row">
        <div class="layui-row layui-col-md4 layui-col-sm8 layui-col-xs10 layui-col-sm-offset2 layui-col-xs-offset1 layui-col-md-offset4 login_main">
            <div class="layui-col-md10 layui-col-sm10 layui-col-xs12 layui-col-sm-offset1 layui-col-md-offset1 login_main1">
                <div class="layui-row login_title">
                    <div class="layui-col-md5 layui-col-sm5 layui-col-xs5 layui-col-sm-offset1 layui-col-xs-offset1 layui-col-md-offset1 login_user_title">用户登录</div>
                    <div class=" layui-col-md5 layui-col-sm5 layui-col-xs5 login_store_title">商家登录</div>
                </div>
                <!-- 用户登录 -->
                <form class="layui-form" action="<%=loginPath%>" method="post">
                    <div class="layui-form-item layui-row layui-col-md12 layui-col-sm12 layui-col-xs12 login_user_username">
                        <span class="layui-col-md3 layui-col-sm3 layui-col-xs3 login_user_username_text1">用户名：</span>
                        <span class="layui-col-md7 layui-col-sm7 layui-col-xs7">
                            <input type="text" name="username" required lay-verify="required" placeholder="用户输入用户名" autocomplete="off" class="layui-input login_user_username_text2">
                        </span>

                    </div>
                    <div class="layui-form-item layui-row layui-col-md12 layui-col-sm12 layui-col-xs12 login_user_password">
                        <span class="layui-col-md3 layui-col-sm3 layui-col-xs3 login_user_username_text1">密码：</span>
                        <span class="layui-col-md7 layui-col-sm7 layui-col-xs7">
                            <input type="password" name="password" required lay-verify="required" placeholder="用户输入密码" autocomplete="off" class="layui-input login_user_password_text2">
                        </span>
                    </div>
                    <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 login_user_button">
                        <button type="submit" class="layui-btn layui-col-md8 layui-col-sm8 layui-col-xs8 layui-col-xs-offset2 layui-col-sm-offset2 layui-col-md-offset2 login_user_button1">登&nbsp;&nbsp;&nbsp;录</button>
                    </div>
                </form>
                <!-- 企业登录 -->
                <form class="layui-form" action="<%=storeLoginPath%>" method="post">
                    <div class="layui-form-item layui-row layui-col-md12 layui-col-sm12 layui-col-xs12 login_store_username">
                        <span class="layui-col-md3 layui-col-sm3 layui-col-xs3 login_store_username_text1">用户名：</span>
                        <span class="layui-col-md7 layui-col-sm7 layui-col-xs7">
                                    <input type="text" name="loginName" required lay-verify="required" placeholder="企业输入用户名" autocomplete="off" class="layui-input login_store_username_text2">
                                </span>

                    </div>
                    <div class="layui-form-item layui-row layui-col-md12 layui-col-sm12 layui-col-xs12 login_store_password">
                        <span class="layui-col-md3 layui-col-sm3 layui-col-xs3 login_store_username_text1">密码：</span>
                        <span class="layui-col-md7 layui-col-sm7 layui-col-xs7">
                                    <input type="password" name="password" required lay-verify="required" placeholder="企业输入密码" autocomplete="off" class="layui-input login_store_password_text2">
                                </span>
                    </div>
                    <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 login_store_button">
                        <button type="submit" class="layui-btn layui-col-md8 layui-col-sm8 layui-col-xs8 layui-col-xs-offset2 layui-col-sm-offset2 layui-col-md-offset2 login_store_button1">登&nbsp;&nbsp;&nbsp;录</button>
                    </div>
                </form>
                <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 login_tz" ><a href="<%=portPath%>register.html">注册新账号</a></div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="../../resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../../resources/layui.all.js"></script>
    <script type="text/javascript" src="../../resources/js/login.js"></script>
</body>

</html>