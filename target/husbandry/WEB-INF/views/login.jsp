<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/11/14
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div style="margin: 50px 100px">
        <h1>简易设备资产管理系统</h1>
        <form action="/user/login.do" method="post">
            <table class="table">
                <tr>
                    <td>用户名 <input type="text" name="loginName"></td>
                </tr>
                <tr>
                    <td>密码 <input type="password" name="password"></td>
                </tr>
            </table>
            <p>管理员账号：123 管理员密码：123</p>
            <p>普通用户账号：456 普通用户密码：456</p>
            <br />
            <input type="submit" value="登录" style="margin-left: 80px">
            <a href="/user/register.html">注册</a>

        </form>
    </div>
</body>
</html>
