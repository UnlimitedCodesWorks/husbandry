<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String portPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <title>智慧社区-商户后台管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSS Libs -->
    <link rel="stylesheet" type="text/css" href="../../../resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/font/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/css/animate.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/css/dataTables.bootstrap.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="../../../resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/css/flat-blue.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/css/layui.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/css/cropper.css">


        <!-- Javascript Libs -->
    <script type="text/javascript" src="../../../resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../../../resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../../resources/js/bootstrap-switch.min.js"></script>
    <script type="text/javascript" src="../../../resources/js/jquery.matchHeight-min.js"></script>
    <script type="text/javascript" src="../../../resources/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../../../resources/js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="../../../resources/js/ace/ace.js"></script>
    <script type="text/javascript" src="../../../resources/js/ace/mode-html.js"></script>
    <script type="text/javascript" src="../../../resources/js/ace/theme-github.js"></script>
    <!-- Javascript -->
    <script type="text/javascript" src="../../../resources/js/app.js"></script>
    <script type="text/javascript" src="../../../resources/layui.js"></script>
    <script type="text/javascript" src="../../../resources/js/cropper.js"></script>
    <style type="text/css">
        body {
            font-size: 13px;
        }

        .upload,.upload2 {
            position: relative;
            cursor: default;
            overflow: hidden;
            float: left;
        }

        .upload input,.upload2 input {
            opacity: 0;
            position: absolute;
            top: -100px;
            left: -100px;
            width: 200px;
            height: 200px;
            display: inline-block;
            cursor: pointer;
        }

        .area p {
            display: inline-block;
            height: 20.8px;
            line-height: 20.8px;
            padding-left: 5px;
            margin: 0;
        }

        .area button {
            margin-right: 5px;
        }

        .area .col-sm-11 {
            padding: 0;
            margin: 14px;
            margin-bottom: 5px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background: #fff;
        }

        canvas {
            width: 100%;
            display: block;
            margin: 0 auto;
        }

        .delete-characteristic {
            width: 100%;
            height: 30px;
            margin: 0 auto;
            background: #000;
            opacity: 0.7;
            position: relative;
            top: -30px;
            transition: opacity 0.4s;
            cursor: pointer;
        }

        .delete-characteristic p {
            font-size: 22px;
            display: inline-block;
            width: 100%;
            color: #fff;
            text-align: center;
            height: inherit;
            line-height: 30px;
        }
    </style>
</head>

<body class="flat-blue">
    <div class="app-container">
        <div class="row content-container">
            <nav class="navbar navbar-default navbar-fixed-top navbar-top">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-expand-toggle">
                            <i class="fa fa-bars icon"></i>
                        </button>
                        <ol class="breadcrumb navbar-breadcrumb">
                            <li>服务管理</li>
                            <li class="active">添加服务</li>
                        </ol>
                        <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                            <i class="fa fa-th icon"></i>
                        </button>
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                            <i class="fa fa-times icon"></i>
                        </button>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-comments-o"></i></a>
                            <ul class="dropdown-menu animated fadeInDown" style="box-shadow: 0 6px 12px rgba(0,0,0,.175);">
                                <li class="title">
                                    新消息 <span class="badge pull-right">${unReadNewsNum}</span>
                                </li>
                                <li class="message">
                                    您有${unReadNewsNum}条新消息
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown danger">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-star"></i> <c:if test="${grade!=0}">${grade}分</c:if><c:if test="${grade==0}">未评分</c:if></a>
                            <ul class="dropdown-menu danger  animated fadeInDown" style="box-shadow: 0 6px 12px rgba(0,0,0,.175);">
                                <li class="title">
                                    当前评分 <span class="badge pull-right"><c:if test="${grade!=0}">${grade}分</c:if><c:if test="${grade==0}">未评分</c:if> </span>
                                </li>
                                <!-- <li>
                                    <ul class="list-group notifications">
                                        <a href="#">
                                            <li class="list-group-item">
                                                <span class="badge">1</span> <i class="fa fa-exclamation-circle icon"></i> new registration
                                            </li>
                                        </a>
                                        <a href="#">
                                            <li class="list-group-item">
                                                <span class="badge success">1</span> <i class="fa fa-check icon"></i> new orders
                                            </li>
                                        </a>
                                        <a href="#">
                                            <li class="list-group-item">
                                                <span class="badge danger">2</span> <i class="fa fa-comments icon"></i> customers messages
                                            </li>
                                        </a>
                                        <a href="#">
                                            <li class="list-group-item message">
                                                view all
                                            </li>
                                        </a>
                                    </ul>
                                </li> -->
                            </ul>
                        </li>
                        <li class="dropdown profile">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${storeInfo.storeName} <span class="caret"></span></a>
                            <ul class="dropdown-menu animated fadeInDown" style="box-shadow: 0 6px 12px rgba(0,0,0,.175);">
                                <li class="profile-img">
                                    <img src="${storeInfo.headImg}" class="profile-img" onerror="this.src='http://t.cn/RCzsdCq'" >
                                </li>
                                <li>
                                    <div class="profile-info">
                                        <h4 class="username">${storeInfo.storeName}</h4>
                                        <p>${storeInfo.email}</p>
                                        <div class="btn-group margin-bottom-2x" role="group">
                                            <button type="button" class="btn btn-default" onclick="location.href='<%=portPath%>store/information/${storeInfo.storeid}'"><i class="fa fa-user"></i> 商户中心</button>
                                            <button type="button" class="btn btn-default" onclick="location.href='<%=portPath%>login/exit'"><i class="fa fa-sign-out"></i> 登出</button>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="side-menu sidebar-inverse">
                <nav class="navbar navbar-default" role="navigation">
                    <div class="side-menu-container">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="#">
                                <div class="icon fa fa-cogs"></div>
                                <div class="title">商户后台管理</div>
                            </a>
                            <button type="button" class="navbar-expand-toggle pull-right visible-xs">
                                <i class="fa fa-times icon"></i>
                            </button>
                        </div>
                        <ul class="nav navbar-nav">
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-element">
                                    <span class="icon fa fa-address-card-o"></span><span class="title">基本资料</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-element" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="<%=portPath%>storeAdmin/information.html">修改商户资料</a>
                                            </li>
                                            <li><a href="<%=portPath%>storeAdmin/storeScore.html">评分管理</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-table">
                                    <span class="icon fa fa-file-text-o"></span><span class="title">订单管理</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-table" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="<%=portPath%>storeAdmin/storeFinish.html">已完成订单</a>
                                            </li>
                                            <li><a href="<%=portPath%>storeAdmin/storeSure.html">待确认订单<span class="badge" style="margin-left: 130px;">${waitSureNum}</span></a>
                                            </li>
                                            <li><a href="<%=portPath%>storeAdmin/storeWait.html">待处理订单<span class="badge" style="margin-left: 130px;">${waitHandleNum}</span></a>
                                            </li>
                                            <li><a href="<%=portPath%>storeAdmin/storeCancel.html">待退款订单<span class="badge" style="margin-left: 130px;">${waitCancelNum}</span></a>
                                            </li>
                                            <li><a href="<%=portPath%>storeAdmin/storePeople.html">服务人员模板</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-form">
                                    <span class="icon fa fa-envelope-o"></span><span class="title">消息管理</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-form" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="<%=portPath%>storeAdmin/message.html">系统消息<span class="badge" style="margin-left: 130px;">${unReadNewsNum}</span></a>
                                            </li>
                                            <li><a href="<%=portPath%>storeAdmin/complain.html">用户投诉<span class="badge" style="margin-left: 130px;">${unReadComplainNum}</span></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <!-- Dropdown-->
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#component-example">
                                    <span class="icon fa fa-cubes"></span><span class="title">服务管理</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="component-example" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="<%=portPath%>storeAdmin/service.html">我的服务</a>
                                            </li>
                                            <li class="active"><a href="<%=portPath%>storeAdmin/serviceAdd.html">添加服务</a>
                                            </li>
                                            <li><a href="<%=portPath%>storeAdmin/serviceScore.html">服务评分</a>
                                            </li>
                                            <li><a href="<%=portPath%>storeAdmin/serviceTemplate.html">服务模板</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </nav>
            </div>
            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body padding-top">
                    <div class="container">
                        <h4 style="display: inline-block;">服务LOGO</h4>
                        <button type="button" class="btn btn-primary pull-right" id="service-template" data-toggle="modal" data-target="#template-modal">选择服务模板</button>
                        <hr>
                        <!-- 修改logo -->
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-6" style="height: 150px;">
                                <img id="logo" src="http://t.cn/RCzsdCq" style="height: 100%;float: right;">
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <button type="button" class="btn btn-primary" id="select-logo" data-toggle="modal" data-target="#logo-modal">
                                    <i class="icon fa fa-cloud-upload"></i> 更换
                                </button>
                            </div>
                        </div>
                        <hr>
                        <h4>服务基本信息</h4>
                        <hr>
                        <form id="add-service" method="post" enctype="multipart/form-data" class="form-horizontal">
                            <%--厂商id--%>
                            <input name="storeId" type="hidden" value="${storeInfo.storeid}" />
                            <!-- 服务名 -->
                            <div class="row">
                                <div class="col-md-6 col-md-offset-1">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">服务名</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="serviceName" class="form-control" placeholder="服务名" required>
                                            <span class="help-block">注：名称不能出现标点符号</span>
                                            <span class="help-block" style="color: red;display: none;">错误信息</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 服务类型 -->
                            <div class="row">
                                <div class="col-md-6 col-md-offset-1">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">服务类型</label>
                                        <div class="col-sm-9" style="position: relative;top: 5px;">
                                            <div class="radio3 radio-check radio-inline">
                                                <input type="radio" name="kind" value="1" checked id="sex-radio1">
                                                <label for="sex-radio1">保姆</label>
                                            </div>
                                            <div class="radio3 radio-check radio-inline">
                                                <input type="radio" name="kind" value="2" id="sex-radio2">
                                                <label for="sex-radio2">月嫂</label>
                                            </div>
                                            <div class="radio3 radio-check radio-inline">
                                                <input type="radio" name="kind" value="3" id="sex-radio3">
                                                <label for="sex-radio3">涉外家政</label>
                                            </div>
                                            <div class="radio3 radio-check radio-inline">
                                                <input type="radio" name="kind" value="4" id="sex-radio4">
                                                <label for="sex-radio4">钟点工</label>
                                            </div>
                                            <div class="radio3 radio-check radio-inline">
                                                <input type="radio" name="kind" value="5" id="sex-radio5">
                                                <label for="sex-radio5">老人陪护</label>
                                            </div>
                                            <div class="radio3 radio-check radio-inline">
                                                <input type="radio" name="kind" value="6" id="sex-radio6">
                                                <label for="sex-radio6">病人陪护</label>
                                            </div>
                                            <div class="radio3 radio-check radio-inline">
                                                <input type="radio" name="kind" value="7" id="sex-radio7">
                                                <label for="sex-radio7">育婴师</label>
                                            </div>
                                            <div class="radio3 radio-check radio-inline">
                                                <input type="radio" name="kind" value="8" id="sex-radio8">
                                                <label for="sex-radio8">催乳师</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 服务价格 -->
                            <div class="row">
                                <div class="col-md-6 col-md-offset-1">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">服务价格</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="price" class="form-control" placeholder="服务价格" required>
                                            <span class="help-block" style="color: red;display: none;">错误信息</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 负责人联系方式 -->
                            <div class="row">
                                <div class="col-md-6 col-md-offset-1">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">负责人联系方式</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="peoplePhone" class="form-control" placeholder="负责人联系方式" required>
                                            <span class="help-block" style="color: red;display: none;">错误信息</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 服务详细信息 -->
                            <div class="row">
                                <div class="col-md-6 col-md-offset-1">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">服务详细信息</label>
                                        <div class="col-sm-9">
                                            <textarea class="form-control" name="introduce" rows="6" style="resize: none;" placeholder="服务详细信息" required></textarea>
                                            <span class="help-block">剩余300字</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 注意事项 -->
                            <div class="row">
                                <div class="col-md-6 col-md-offset-1">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">注意事项</label>
                                        <div class="col-sm-9">
                                            <textarea class="form-control" name="notice" rows="6" style="resize: none;" placeholder="注意事项" required></textarea>
                                            <span class="help-block">剩余300字</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 服务范围 -->
                            <div class="row">
                                <div class="col-md-6 col-md-offset-1">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">服务范围</label>
                                        <div class="col-sm-3">
                                            <select name="provinceId" id="province" class="form-control">
                                                <c:forEach var="province" items="${provinces}" >
                                                    <option value="${province.key}" > ${province.value}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-sm-3">
                                            <select name="cityId" id="city" class="form-control" >
                                                <c:forEach var="city" items="${cities}">
                                                    <option value="${city.cityId}">${city.city}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-sm-3">
                                            <button type="button" class="btn btn-info" id="add-area" style="width: 100%;margin: 0;">添加</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 服务范围项 -->
                            <div class="row">
                                <div class="col-md-6 col-md-offset-1">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"></label>
                                        <div class="col-sm-9">
                                            <div class="row area">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 服务特色 -->
                            <div class="row">
                                <div class="col-md-6 col-md-offset-1">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">服务特色</label>
                                        <div class="col-sm-9">
                                            <button class="btn btn-primary upload2">
                                                <input type="file"><i class="icon fa fa-cloud-upload"></i> 选择
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 服务特色项 -->
                            <div class="row">
                                <div class="col-md-6 col-md-offset-1">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"></label>
                                        <div class="col-sm-9 characteristic" id="serviceSpecial-container">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                            <!-- 添加 -->
                            <div class="row">
                                <div class="col-md-6 col-md-offset-1">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"></label>
                                        <div class="col-sm-9">
                                            <button class="btn btn-info" id="add-btn" style="width: 100%;">添加</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 修改LOGO -->
    <div class="modal fade" id="logo-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">选择服务LOGO</h4>
                </div>
                <div class="modal-body">
                    <div id="logo-wrap" style="height: 500px;">
                        <img src="">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary upload" id="upload">
                        <input type="file"><i class="icon fa fa-cloud-upload"></i> 选择图片
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="logo-btn">修改</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 模态框-服务模板 -->
    <div class="modal fade bs-example-modal-sm" id="template-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">服务模板</h4>
                </div>
                <div class="modal-body">
                     <!-- 模板 -->
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>模板名称</th>
                                        <th>备注</th>
                                        <th>选择</th>
                                    </tr>
                                </thead>
                                <tbody id="template-container">
                                        <c:if test="${!empty serviceTemplates}">
                                        <c:forEach var="template" items="${serviceTemplates}">
                                    <tr>
                                        <td><a href="#" title="${template.templateName}">${template.templateName}</a></td>
                                        <td>${template.templateDetail}</td>
                                        <td><button type="button" class="btn btn-info select-template" service-id="${template.offerserviceId}" >选择</button></td>
                                    </tr>
                                        </c:forEach>
                                        </c:if>
                                </tbody>
                            </table>
                            <!-- 分页-->
                            <div id="template-page" class="pull-right"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function(){
            var cropper;
            var province = $("#province");
            var city = $("#city");
            var portPath = "<%=portPath%>";
            var logoBlob;
            var logoMIME = "";
            var serviceTemplatePages = ${serviceTemplatePages};
            var pageSize = ${pageSize};
            province.change(function (e) {
                city.html("");
                city.append('<option value="NONE" label="市" />');
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
                            var node = '<option value="'+data[i].cityId+ '" >'+data[i].city+'</option>';
                            city.append(node);
                        }
                    },
                    error: function(jqXHR){
                        alert("发生错误：" + jqXHR.status);
                    }
                });
            });
            var serviceSpecialBlob = [];
            var serviceSpecialFileName = [];
            $("#add-btn").click(function () {
                var formData = new FormData(document.querySelector("#add-service"));
                var logoSuffix = logoMIME.split("/")[1];
                var logoFileName = "blobImage."+logoSuffix;
                formData.append("serviceImg",logoBlob,logoFileName);
                for(var i=0;i<serviceSpecialBlob.length;i++){
                    formData.append("serviceSpecial",serviceSpecialBlob[i],serviceSpecialFileName[i]);
                }
                layui.use('layer', function() {
                    var layer = layui.layer;
                    $.ajax({
                        type: "post",
                        url: "<%=portPath%>storeAdmin/addService.do",
                        cache: false,
                        processData: false,
                        contentType: false,
                        data: formData,
                        success: function (data) {
                            if (data!=0) {
                                layer.msg("添加服务成功！",{
                                    time: 1000
                                });
                                setTimeout("location.replace(location.href)",1000);
                            } else {
                                alert("添加服务失败！");
                            }

                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown, data) {
                            alert(errorThrown);
                        }
                    });
                });
            });

            $('#logo-modal').on('shown.bs.modal', function () {
                if(cropper == undefined) {
                    cropper = $('#logo-wrap img').cropper({
                        aspectRatio: 16 / 9,
                        // minContainerWidth: 500,
                        crop: function(data) {
                            // Output the result data for cropping image.
                        }
                    });
                }
                cropper.cropper('reset').cropper('replace','http://t.cn/RCzsdCq');
            });

            layui.use('laypage', function(){
                var laypage = layui.laypage;
                //模板分页
                laypage.render({
                    elem: 'template-page'
                    ,count: serviceTemplatePages*pageSize //数据总数，从服务端得到
                    ,limit: pageSize
                    ,theme: '#19B5FE'
                    ,groups: 4
                    ,jump: function(obj, first){
                        if(!first){
                            $.ajax({
                                type: "POST",
                                url: portPath+"storeAdmin/getServiceTemplate.do",
                                data: {
                                    currentPage:obj.curr
                                },
                                dataType: "json",
                                success: function(data){
                                    createTemplate(data);
                                },
                                error: function(jqXHR){
                                    alert("发生错误：" + jqXHR.status);
                                }
                            });
                        }
                    }
                });
            });

            //选择模板
            $(".select-template").click(function(event) {
                $("#template-modal").modal('hide');
                var serviceId = $(this).attr("service-id");
                //传模板数据
                $.ajax({
                    type: "POST",
                    url: portPath+"storeAdmin/getTOfferServiceDetailByServiceId.do",
                    data: {
                        serviceId:serviceId
                    },
                    dataType: "json",
                    success: function(data){
                        serviceSpecialBlob = [];
                        serviceSpecialFileName = [];
                        $("input[name = 'serviceName']:eq(0)").val(data.serviceName);
                        $("input[name = 'price']:eq(0)").val(data.price);
                        $("input[name = 'peoplePhone']:eq(0)").val(data.peoplePhone);
                        $("textarea[name = 'introduce']:eq(0)").val(data.introduce);
                        $("textarea[name = 'notice']:eq(0)").val(data.notice);
                        let $area = $(".area");
                        $area.html("");
                        for(var i = 0; i<data.cities.length;i++){
                            $area.append('<div class="col-sm-11 ">'+
                                '<p>'+data.cities[i].provinces.province+data.cities[i].city+'</p>'+
                                '<button type="button" class="close delete-area"><span>&times;</span></button>'+
                                '<input type="hidden" name="cityIds" value="'+data.cities[i].cityId+'"  />'+
                                '</div>');
                        }
                        var kind = data.serid;
                        $("input[name = 'kind']").each(function () {
                            var value = $(this).val();
                            if(kind == value){
                                $(this).attr("checked",'checked');
                            }
                        });
                        var serviceImg = data.serviceImg;
                        $("#logo").attr("src",serviceImg);
                        //cropper
                        $('#logo-modal').on('shown.bs.modal', function () {
                            if(cropper == undefined) {
                                cropper = $('#logo-wrap img').cropper({
                                    aspectRatio: 16 / 9,
                                    // minContainerWidth: 500,
                                    crop: function(data) {
                                        // Output the result data for cropping image.
                                    }
                                });
                            }
                            cropper.cropper('reset').cropper('replace',serviceImg);
                        });
                        var xhr = new XMLHttpRequest();
                        xhr.open("get",serviceImg, true);
                        xhr.responseType = "blob";
                        xhr.onload = function() {
                            if (this.status == 200) {
                                logoBlob = this.response;
                                logoMIME = logoBlob.type;
                            }
                        };
                        xhr.send();
                        var serviceSpecialContainer = $("#serviceSpecial-container");
                        serviceSpecialContainer.html("");
                        for(var i =0;i<data.serviceSpecial.length;i++){
                            var serviceSpecialImg = data.serviceSpecial[i].specialImg;
                            var xhr = new XMLHttpRequest();
                            xhr.open("get",serviceSpecialImg, true);
                            xhr.responseType = "blob";
                            xhr.onload = function() {
                                if (this.status == 200) {
                                    var blob = this.response;
                                    serviceSpecialBlob.push(blob);
                                    var suffix = blob.type.split("/")[1];
                                    var fileName = "serviceBlobImage"+i+"."+suffix;
                                    serviceSpecialFileName.push(fileName);
                                }
                            };
                            xhr.send();
                            let img = document.createElement("img");
                            img.setAttribute('crossOrigin', 'anonymous');
                            img.src = serviceSpecialImg;
                            let canvas = document.createElement("canvas");
                            canvas.setAttribute("class","serviceSpecial");
                            img.onload = function() {
                                canvas.width = img.width;
                                canvas.height = img.height;
                                canvas.getContext("2d").drawImage(img, 0, 0);
                                serviceSpecialContainer.append(canvas,'<div class="delete-characteristic"><p class="fa fa-trash-o"></p></div>');
                            };
                        }
                    },
                    error: function(jqXHR){
                        alert("发生错误：" + jqXHR.status);
                    }
                });
            });

            //添加服务范围项
            $("#add-area").click(function(event) {
                let $area = $(".area");
                $area.append('<div class="col-sm-11 ">'+
                            '<p>'+$("#province").find("option:selected").text()+$("#city").find("option:selected").text()+'</p>'+
                            '<button type="button" class="close delete-area"><span>&times;</span></button>'+
                            '<input type="hidden" name="cityIds" value="'+$("#city").val()+'"  />'+
                            '</div>')
            });

            //删除服务范围项
            $(document).on("click",".delete-area",function(){
                $(this).parent().remove();
            });

            //logo
            $(".upload input").change(function(event) {
                let $file = $(this);
                let fileObj = $file[0];
                let windowURL = window.URL || window.webkitURL;
                let dataURL;
                let $img = $("#logo-wrap img");
                if(fileObj && fileObj.files && fileObj.files[0]){
                    dataURL = windowURL.createObjectURL(fileObj.files[0]);
                    $img.attr('src',dataURL);
                    //cropper
                    $.fn.cropper;
                    cropper.cropper('reset').cropper('replace',dataURL);
                }
                else{
                    dataURL = $file.val();
                    let imgObj = $("#head-wrap img");
                    imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                    imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
                }
            });

            //点击修改logo
            $(document).on('click', '#logo-btn', function(event) {
                let canvas = cropper.cropper('getCroppedCanvas');
                canvas.toBlob(function(blob) {
                    logoBlob = blob;
                    logoMIME = blob.type;
                    url = URL.createObjectURL(blob);
                    $("#logo").attr('src', url);
                });
                $("#logo-modal").modal('hide');
            });

            //特色
            $(document).on('change','.upload2 input',function() {
                let $file = $(this);
                let $canvases = $(this).parent().parent().parent().parent().parent().next().children().children().find('.characteristic');
                let windowURL = window.URL || window.webkitURL;
                let files = $file[0].files[0];
                if(files) {
                    let img = document.createElement("img");
                    img.src = windowURL.createObjectURL(files);
                    let canvas = document.createElement("canvas");
                    canvas.setAttribute("class","serviceSpecial");
                    img.onload = function() {
                        canvas.width = img.width;
                        canvas.height = img.height;
                        canvas.getContext("2d").drawImage(img, 0, 0);
                        $canvases.append(canvas,'<div class="delete-characteristic"><p class="fa fa-trash-o"></p></div>');
                        serviceSpecialBlob = [];
                        serviceSpecialFileName = [];
                        $(".serviceSpecial").each(function(index,element){
                            element.toBlob(function (blob) {
                                serviceSpecialBlob.push(blob);
                                var suffix = blob.type.split("/")[1];
                                var fileName = "serviceBlobImage"+index+"."+suffix;
                                serviceSpecialFileName.push(fileName);
                            });
                        });
                    };
                }
            });
            //删除特色项
            $(document).on('click', '.delete-characteristic', function(event) {
                $(this).prev().remove();
                $(this).remove();
                serviceSpecialBlob = [];
                serviceSpecialFileName = [];
                $(".serviceSpecial").each(function(index,element){
                    element.toBlob(function (blob) {
                        serviceSpecialBlob.push(blob);
                        var suffix = blob.type.split("/")[1];
                        var fileName = "serviceBlobImage"+index+"."+suffix;
                        serviceSpecialFileName.push(fileName);
                    });
                });
            });

            function createTemplate(data) {
                var container = $("#template-container");
                container.html("");
                for(var i=0;i<data.length;i++){
                    var node = ' <tr>' +
                        '<td><a href="#" title="'+data[i].templateName+'">'+data[i].templateName+'</a></td>' +
                        '<td>'+data[i].templateDetail+'</td>' +
                        '<td><button type="button" class="btn btn-info select-template" service-id="'+data[i].offerserviceId+'" >选择</button></td>' +
                        '</tr>';
                    container.append(node);
                }
            }
        });
    </script>
</body>
</html>