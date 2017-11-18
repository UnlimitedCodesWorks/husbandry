<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/11/14
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>用户管理</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div style="margin: 50px 100px">
        <h1>简易设备资产管理系统</h1>
        <p>欢迎【${user.realName}】【普通用户】使用设备资产管理系统 <a href="/user/exit.do">退出</a></p>
        <br>
        <table class="table table-bordered">
            <tr>
                <td>序号</td>
                <td>资产编码</td>
                <td>名称</td>
                <td>价格</td>
                <td>存放地点</td>
                <td>领用人</td>
                <td>领用时间</td>
            </tr>
            <c:forEach var="equipment" items="${user.equipments}" varStatus="status" >
                <tr>
                    <td>${status.index + 1}</td>
                    <td><c:out value="${equipment.code}" /></td>
                    <td><c:out value="${equipment.name}" /></td>
                    <td><c:out value="${equipment.price}" /></td>
                    <td><c:out value="${equipment.description}" /></td>
                    <td>${user.realName}</td>
                    <td><c:out value="${equipment.addTime}" /></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
