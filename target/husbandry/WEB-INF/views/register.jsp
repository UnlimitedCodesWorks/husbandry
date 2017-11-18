<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/11/14
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<html>
<head>
    <title>注册页面</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div style="margin: 50px 100px">
        <h1>简易资产设备管理系统</h1>
        <f:form method="post" action="/user/register.do">
            <table class="table">
                <tr>
                    <td>用户名     <f:input path="loginName" /></td>
                </tr>
                <tr>
                    <td>密码      <f:password path="password" /></td>
                </tr>
                <tr>
                    <td>密码确认 <input type="password" name="repeatPassword" /></td>
                </tr>
                <tr>
                    <td>真实姓名 <f:input path="realName" /></td>
                </tr>
                <tr>
                    <td>联系电话 <f:input path="tel" /></td>
                </tr>
                <tr>
                    <td>电子邮箱 <f:input path="email" /></td>
                </tr>
            </table>
            <br />
                <input type="submit" value="注册" style="margin-left: 120px" />
        </f:form>
    </div>
</body>
</html>
