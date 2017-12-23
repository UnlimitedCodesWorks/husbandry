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
    <link rel="stylesheet" type="text/css" href="../../resources/css/layui.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="../../../resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/css/flat-blue.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/css/cropper.css">

        <!-- Javascript Libs -->
    <script type="text/javascript" src="../../../resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../../../resources/js/bootstrap.min.js"></script>
<!--             <script type="text/javascript" src="../../../resources/js/Chart.js"></script> -->
    <script type="text/javascript" src="../../../resources/js/bootstrap-switch.min.js"></script>
    <script type="text/javascript" src="../../../resources/js/jquery.matchHeight-min.js"></script>
    <script type="text/javascript" src="../../../resources/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../../../resources/js/dataTables.bootstrap.min.js"></script>
    <%--<script type="text/javascript" src="../../../resources/js/select2.full.min.js"></script>--%>
    <script type="text/javascript" src="../../../resources/js/ace/ace.js"></script>
    <script type="text/javascript" src="../../../resources/js/ace/mode-html.js"></script>
    <script type="text/javascript" src="../../../resources/js/ace/theme-github.js"></script>
    <!-- Javascript -->
    <script type="text/javascript" src="../../../resources/js/app.js"></script>
    <script type="text/javascript" src="../../../resources/js/cropper.js"></script>
    <script src="../../resources/layui.js"></script>
    <script src="../../../resources/js/md5.js"></script>
    <!-- <script type="text/javascript" src="../../../resources/js/index.js"></script> -->
    <style type="text/css">
        .head-wrap {
            width: 100px;
            height: 100px;
            border-radius: 50px;
            position: relative;
            overflow: hidden;
        }

        .head-wrap div {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: #000;
            opacity: 0;
            transition: opacity 0.4s;
        }

        .head-wrap div:hover {
            opacity: 0.6;
        }

        .head-wrap div a {
            height: 100%;
            line-height: 100px;
            display: inline-block;
            width: 100%;
            text-align: center;
            color: #fff;
            text-decoration: none;
        }

        .head-wrap div a:hover {
            color: #fff;
        }

        .head-wrap img {
            width: 100%;
            height: 100%;
        }

        .upload {
            position: relative;
            cursor: default;
            overflow: hidden;
            float: left;
        }

        .upload input {
            opacity: 0;
            position: absolute;
            top: -100px;
            left: -100px;
            width: 200px;
            height: 200px;
            display: inline-block;
            cursor: pointer;
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
                            <li>基本信息</li>
                            <li class="active">修改商户资料</li>
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
                                    <img src="${storeInfo.headImg}" class="profile-img" onerror="this.src='http://t.cn/RCzsdCq'">
                                </li>
                                <li>
                                    <div class="profile-info">
                                        <h4 class="username">${storeInfo.storeName} </h4>
                                        <p>${storeInfo.email} </p>
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
                            <a class="navbar-brand" href="">
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
                                            <li class="active"><a href="<%=portPath%>storeAdmin/information.html">修改商户资料</a>
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
                                            <li><a href="service_staff.html">服务人员模板</a>
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
                                            <li><a href="<%=portPath%>storeAdmin/complain.html">用户投诉<span class="badge" style="margin-left: 130px;">0</span></a>
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
                                            <li><a href="store_service.html">我的服务</a>
                                            </li>
                                            <li><a href="add_service.html">添加服务</a>
                                            </li>
                                            <li><a href="<%=portPath%>storeAdmin/serviceScore.html">服务评分</a>
                                            </li>
                                            <li><a href="service_template.html">服务模板</a>
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
                    <f:form modelAttribute="updateStore" enctype="multipart/form-data" class="form-horizontal">
                        <!-- 商户名称 -->
                        <div class="row">
                            <div class="col-md-6 col-md-offset-1">
                                <div class="form-group">
                                    <label for="store-name" class="col-sm-3 control-label">商户名称</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="storeName" class="form-control" id="store-name" placeholder="商户名称" value="${storeDetail.storeName}">
                                        <span class="help-block">注：名称不能出现标点符号</span>
                                        <span class="help-block" style="color: red;display: none;">错误信息</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 商户账号 -->
                        <div class="row">
                            <div class="col-md-6 col-md-offset-1">
                                <div class="form-group">
                                    <label for="store-account" class="col-sm-3 control-label">商户账号</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="registNum" class="form-control" id="store-account" placeholder="商户账号" value="${storeDetail.registNum}" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 联系电话 -->
                        <div class="row">
                            <div class="col-md-6 col-md-offset-1">
                                <div class="form-group">
                                    <label for="store-tel" class="col-sm-3 control-label">联系电话</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="phone" class="form-control" id="store-tel" placeholder="联系电话" value="${storeDetail.phone}">
                                        <span class="help-block" style="color: red;display: none;">错误信息</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 邮箱地址 -->
                        <div class="row">
                            <div class="col-md-6 col-md-offset-1">
                                <div class="form-group">
                                    <label for="store-email" class="col-sm-3 control-label">邮箱地址</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="email" class="form-control" id="store-email" placeholder="邮箱地址" value="${storeDetail.email}">
                                        <span class="help-block" style="color: red;display: none;">错误信息</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 商户所在地 -->
                        <div class="row">
                            <div class="col-md-6 col-md-offset-1">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">商户所在地</label>
                                    <div class="col-sm-3">
                                        <select name="provinceId" id="province" class="form-control">
                                            <c:set var="provinceId" value="${storeDetail.areas.city.provinces.provinceId}" />
                                            <c:forEach var="province" items="${provinces}" >
                                                <option value="${province.key}"  <c:if test="${province.key == provinceId}">selected</c:if> > ${province.value}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-sm-3">
                                        <select name="cityId" id="city" class="form-control" >
                                            <c:set var="cityId" value="${storeDetail.areas.city.cityId}" />
                                            <c:forEach var="city" items="${cities}">
                                                <option value="${city.cityId}"  <c:if test="${city.cityId == cityId}">selected</c:if> >${city.city}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-sm-3">
                                        <select name="areaId" id="area" class="form-control">
                                            <c:set var="areaId" value="${storeDetail.areas.areaId}" />
                                            <c:forEach var="area" items="${areas}">
                                                <option value="${area.areaId}"  <c:if test="${area.areaId == areaId}">selected</c:if> >${area.area}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 商户详细信息 -->
                        <div class="row">
                            <div class="col-md-6 col-md-offset-1">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">商户详细信息</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" name="detailInfo" rows="6" style="resize: none;" placeholder="商户详细信息" >${storeDetail.detailInfo}</textarea>
                                        <span class="help-block">剩余300字</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 修改头像 -->
                        <div class="row">
                            <div class="col-md-6 col-md-offset-1">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">修改头像</label>
                                    <div class="col-sm-3">
                                        <div class="head-wrap">
                                            <div>
                                                <a href="" data-toggle="modal" data-target="#head-modal">修改头像</a>
                                            </div>
                                            <img src="${storeDetail.headImg}" onerror="this.src='http://t.cn/RCzsdCq'">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <span class="help-block">注：头像要求1:1格式</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 修改LOGO -->
                        <div class="row">
                            <div class="col-md-6 col-md-offset-1">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">修改LOGO</label>
                                    <div class="col-sm-3">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#logo-modal"><i class="icon fa fa-pencil-square-o"></i> 点击修改</button>
                                    </div>
                                    <div class="col-sm-3">
                                        <span class="help-block">注：LOGO要求16:9格式</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 修改密码 -->
                        <div class="row">
                            <div class="col-md-6 col-md-offset-1">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">修改密码</label>
                                    <div class="col-sm-3">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#password-modal"><i class="icon fa fa-pencil-square-o"></i> 点击修改</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 保存 -->
                        <div class="row">
                            <div class="col-md-6 col-md-offset-1">
                                <div class="form-group">
                                    <div class="col-sm-offset-3 col-sm-3">
                                        <button type="button" class="btn btn-primary" style="width: 100%;" id="update-btn">保存</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </f:form>
                </div>
            </div>
        </div>
    </div>
    <!-- 修改头像 -->
    <div class="modal fade" id="head-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改头像</h4>
                </div>
                <div class="modal-body">
                    <div id="head-wrap" style="height: 500px;">
                        <img src="">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary upload" id="upload">
                        <input type="file"><i class="icon fa fa-cloud-upload"></i> 选择图片
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="head-btn">修改</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 修改logo -->
    <div class="modal fade" id="logo-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改LOGO</h4>
                </div>
                <div class="modal-body">
                    <div id="logo-wrap" style="height: 500px;">
                        <img src="">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary upload" id="upload2">
                        <input type="file"><i class="icon fa fa-cloud-upload"></i> 选择图片
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="logo-btn">修改</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 修改密码 -->
    <div class="modal fade" id="password-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改密码</h4>
                </div>
                <form id="password-form" class="form-horizontal">
                    <div class="modal-body">
                        <div>
                            <input type="hidden" name="registNum" value="${storeDetail.registNum}">
                            <!-- 原密码 -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">原密码</label>
                                <div class="col-sm-10">
                                    <input type="password" id="oldPassword" class="form-control" placeholder="原密码">
                                    <span class="help-block" style="color: red;display: none;">原密码不正确</span>
                                </div>
                            </div>
                            <!-- 新密码 -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">新密码</label>
                                <div class="col-sm-10">
                                    <input type="password" id="password" class="form-control" placeholder="新密码">
                                    <span class="help-block" style="color: red;display: none;">错误信息</span>
                                </div>
                            </div>
                            <!-- 确认密码 -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">确认密码</label>
                                <div class="col-sm-10">
                                    <input type="password" id="rePassword" name="password" class="form-control" placeholder="确认密码">
                                    <span class="help-block" style="color: red;display: none;">重新输入的密码不正确</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="password-btn">修改</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function(){
            var headBlob;
            var logoBlob;
            var headMIME = "";
            var logoMIME = "";
            var province = $("#province");
            var city = $("#city");
            var area = $("#area");
            var portPath = "<%=portPath%>";
            var headLink = "${storeDetail.headImg}";
            var logoLink = "${storeDetail.logoImg}";
            var userPassword = "${storeDetail.password}";
            var oldPassword = $("#oldPassword");
            var password = $("#password");
            var rePassword = $("#rePassword");
            var cropper;
            var cropper2;
            $('#head-modal').on('shown.bs.modal', function () {
                if(cropper == undefined) {
                    cropper = $('#head-wrap img').cropper({
                        aspectRatio: 1 / 1,
                        // minContainerWidth: 500,
                        crop: function(data) {
                            // Output the result data for cropping image.
                        }
                    });
                }
                cropper.cropper('reset').cropper('replace',headLink);
            });

            $('#logo-modal').on('shown.bs.modal', function () {
                if(cropper2 == undefined) {
                    cropper2 = $('#logo-wrap img').cropper({
                        aspectRatio: 16 / 9,
                        // minContainerWidth: 500,
                        crop: function(data) {
                            // Output the result data for cropping image.
                        }
                    });
                }
                cropper2.cropper('reset').cropper('replace',logoLink);
            });

            //选择头像
            $("#upload input").change(function(event) {
                let $file = $(this);
                let fileObj = $file[0];
                let windowURL = window.URL || window.webkitURL;
                let dataURL;
                let $img = $("#head-wrap img");
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

            //选择LOGO
            $("#upload2 input").change(function(event) {
                let $file = $(this);
                let fileObj = $file[0];
                let windowURL = window.URL || window.webkitURL;
                let dataURL;
                let $img = $("#logo-wrap img");
                if(fileObj && fileObj.files && fileObj.files[0]){
                    dataURL = windowURL.createObjectURL(fileObj.files[0]);
                    $img.attr('src',dataURL);
                    //cropper
                    $.fn.cropper2;
                    cropper2.cropper('reset').cropper('replace',dataURL);
                }
                else{
                    dataURL = $file.val();
                    let imgObj = $("#logo-wrap img");
                    imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                    imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
                }
            });

            //点击头像模态框的修改
            $("#head-btn").click(function(event) {
                let canvas;
                canvas = cropper.cropper('getCroppedCanvas');
                canvas.toBlob(function(blob) {
                    headBlob = blob;
                    headMIME = blob.type;
                    url = URL.createObjectURL(blob);
                    $(".head-wrap img").attr('src', url);
                });
                $("#head-modal").modal('hide');
            });

            //点击LOGO模态框的修改
            $("#logo-btn").click(function(event) {
                let canvas;
                canvas = cropper2.cropper('getCroppedCanvas');
                canvas.toBlob(function (blob) {
                   logoBlob = blob;
                   logoMIME = blob.type;
                });
                $("#logo-modal").modal('hide');
            });
            province.change(function (e) {
                city.html("");
                area.html("");
                city.append('<option value="NONE" label="市" />');
                area.append('<option value="NONE" label="区" />');
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
                            var node = '<option value="'+data[i].cityId+ '" label="'+data[i].city+'" />';
                            city.append(node);
                        }
                    },
                    error: function(jqXHR){
                        alert("发生错误：" + jqXHR.status);
                    }
                });
            });
            city.change(function (e) {
                area.html("");
                var value = city.val();
                area.append('<option value="NONE" label="区" />');
                $.ajax({
                    url :portPath + 'store/getAreas.do',
                    type : "post",
                    data:{
                        cityId : value
                    },
                    dataType : "json",
                    success: function(data){
                        for(var i=0;i<data.length;i++){
                            var node = '<option value="'+data[i].areaId+ '" label="'+data[i].area+'" />';
                            area.append(node);
                        }
                    },
                    error: function(jqXHR){
                        alert("发生错误：" + jqXHR.status);
                    }
                });
            });
            $("#update-btn").click(function () {
                var formData = new FormData(document.querySelector("#updateStore"));
                var headSuffix = headMIME.split("/")[1];
                var headFileName = "blobImage."+headSuffix;
                var logoSuffix = logoMIME.split("/")[1];
                var logoFileName = "blobImage."+ logoSuffix;
                if(typeof (headBlob) != "undefined"){
                    formData.append("headImg",headBlob,headFileName);
                    formData.append("headLink",headLink);
                }
                if(typeof (logoBlob) != "undefined"){
                    formData.append("logoImg",logoBlob,logoFileName);
                    formData.append("logoLink",logoLink);
                }
                for(var pair of formData.entries()) {
                    if(pair[1].length==0){
                        formData.delete(pair[0]);
                    }
                }
                layui.use('layer', function() {
                    var layer = layui.layer;
                    $.ajax({
                        type: "post",
                        url: "<%=portPath%>storeAdmin/updateInfo.do",
                        cache: false,
                        processData: false,
                        contentType: false,
                        data: formData,
                        success: function (data) {
                            if (data!=0) {
                                layer.msg("修改成功！",{
                                    time: 1000
                                });
                                setTimeout("location.replace(location.href)",1000);
                            } else {
                                alert("修改失败！");
                            }

                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown, data) {
                            alert(errorThrown);
                        }
                    });
                });
            });
            oldPassword.blur(function (e) {
                var value = hex_md5($(this).val()).substring(0,10);
                if(value != userPassword){
                    $(".help-block:eq(0)").show();
                }else {
                    $(".help-block:eq(0)").hide();
                }
            });
            rePassword.blur(function (e) {
                var passwordVal = password.val();
                var rePasswordVal = rePassword.val();
                if(passwordVal != rePasswordVal){
                    $(".help-block:eq(2)").show();
                }else {
                    $(".help-block:eq(2)").hide();
                }

            });

            $("#password-btn").click(function () {
                var formdata = new FormData(document.querySelector("#password-form"));
                    layui.use('layer', function() {
                        var layer = layui.layer;
                        $.ajax({
                            type: "post",
                            url: "<%=portPath%>storeAdmin/updateInfo.do",
                            cache: false,
                            processData: false,
                            contentType: false,
                            data: formdata,
                            success: function (data) {
                                if (data!=0) {
                                    layer.msg("修改成功！",{
                                        time: 1000
                                    });
                                    setTimeout("location.replace(location.href)",1000);
                                } else {
                                    alert("修改失败！");
                                }

                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown, data) {
                                alert(errorThrown);
                            }
                        });
                    });
            });
        });
    </script>
</body>
</html>