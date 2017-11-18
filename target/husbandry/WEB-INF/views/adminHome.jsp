<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/11/14
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<html>
<head>
    <title>管理员之家</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div style="margin: 50px 100px">
    <h1>简易设备资产管理系统</h1>
    <p>欢迎【${user.realName}】【系统管理员】使用设备资产管理系统 <a href="/user/exit.do">退出</a></p>
    <br>
    <div style="width: 700px;border:1px solid black;padding:30px;">
        <f:form method="post" action="/user/addEquipment.do">
            <f:label path="name">名称 </f:label><f:input path="name" />
            <f:label path="code">编码 </f:label><f:input path="code" />
            <f:label path="price">价格 </f:label><f:input path="price" />
            <br />
            <div style="margin-top:20px">
                <f:label path="description" cssStyle="vertical-align: top;">描述</f:label>
                <f:textarea path="description" cssStyle="width: 500px;height: 200px;vertical-align: top;" />
            </div>
            <br />
            <f:label path="userId">领用人 </f:label>
            <f:select path="userId">
                <f:options items="${allUsers}" />
            </f:select>
            <input type="submit" value="添加设备">
        </f:form>
    </div>
    <br />
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
        <c:forEach var="equipment" items="${equipments}" varStatus="status" >
            <tr>
                <td>${status.index + 1}</td>
                <td><c:out value="${equipment.code}" /></td>
                <td><c:out value="${equipment.name}" /></td>
                <td><c:out value="${equipment.price}" /></td>
                <td><c:out value="${equipment.description}" /></td>
                <td><c:out value="${equipment.user.realName}"/></td>
                <td><c:out value="${equipment.addTime}" /></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
