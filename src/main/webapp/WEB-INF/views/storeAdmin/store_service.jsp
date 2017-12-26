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

        .btn-info {
            margin: 0;
        }

        .area p {
            display: inline-block;
            height: 20.8px;
            line-height: 20.8px;
            padding-left: 5px;
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
        }

        canvas {
            width: 60%;
            display: block;
            margin: 0 auto;
        }

        .delete-characteristic {
            width: 60%;
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
                            <li class="active">我的服务</li>
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
                                    当前评分 <span class="badge pull-right"><c:if test="${grade!=0}">${grade}分</c:if><c:if test="${grade==0}">未评分</c:if></span>
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
                                            <button type="button" class="btn btn-default" onclick="location.href='<%=portPath%>store/information/${storeInfo.storeid}'" ><i class="fa fa-user"></i> 商户中心</button>
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
                                            <li><a href="<%=portPath%>storeAdmin/message.html">系统消息<span class="badge" style="margin-left: 145px;">${unReadNewsNum}</span></a>
                                            </li>
                                            <li><a href="<%=portPath%>storeAdmin/complain.html">用户投诉<span class="badge" style="margin-left: 145px;">${unReadComplainNum}</span></a>
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
                                            <li class="active"><a href="<%=portPath%>storeAdmin/service.html">我的服务</a>
                                            </li>
                                            <li><a href="<%=portPath%>storeAdmin/serviceAdd.html">添加服务</a>
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
                    <div class="col-md-12 col-sm-12 col-xs-12 table-responsive" style="margin-bottom: 50px;">
                        <table class="table table-hover" id="waitOrder">
                            <thead>
                                <tr>
                                    <th>服务名称</th>
                                    <th>创建时间</th>
                                    <th>最后修改时间</th>
                                    <th>审核状态</th>
                                    <th>服务详情</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="select">华峰国际保姆服务</td>
                                    <td class="select">2017-12-24</td>
                                    <td class="select">2017-12-24</td>
                                    <td class="select">审核中/已通过/未通过</td>
                                    <td><button class="btn btn-info" data-toggle="modal" data-target="#service-modal">查看</button></td>
                                </tr>
                            </tbody>
                        </table>
                        <span>
                            <button class="btn btn-danger" id="delete">删除服务</button>
                        </span>
                        <div id="page" class="pull-right"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 模态框 -->
    <div class="modal fade" id="service-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">服务详情</h4>
                </div>
                <form class="form-horizontal">
                    <div class="modal-body">
                        <div>
                            <h4>服务LOGO图</h4>
                            <hr>
                            <div class="row">
                                <div class="col-md-6 col-sm-6 col-xs-6" style="height: 150px;">
                                    <img id="logo" src="http://t.cn/RCzsdCq" style="height: 100%;float: right;">
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <button type="button" class="btn btn-primary" id="select-logo">
                                        <i class="icon fa fa-cloud-upload"></i> 更换
                                    </button>
                                </div>
                            </div>
                            <hr>
                            <h4>服务基本信息</h4>
                            <hr>
                            <!-- 服务名 -->
                            <div class="form-group">
                                <label class="col-sm-3 control-label">服务名</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" placeholder="服务名">
                                    <span class="help-block" style="color: red;display: none;">警告信息</span>
                                </div>
                            </div>
                            <!-- 服务价格 -->
                            <div class="form-group">
                                <label class="col-sm-3 control-label">服务价格</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" placeholder="服务价格">
                                    <span class="help-block" style="color: red;display: none;">警告信息</span>
                                </div>
                            </div>
                            <!-- 负责人联系方式 -->
                            <div class="form-group">
                                <label class="col-sm-3 control-label">负责人联系方式</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" placeholder="负责人联系方式">
                                    <span class="help-block" style="color: red;display: none;">警告信息</span>
                                </div>
                            </div>
                            <!-- 服务详细介绍 -->
                            <div class="form-group">
                                <label class="col-sm-3 control-label">服务详细介绍</label>
                                <div class="col-sm-9">
                                    <textarea rows="6" class="form-control" placeholder="服务详细介绍" style="resize: none;"></textarea>
                                    <span class="help-block">剩余xxx字</span>
                                </div>
                            </div>
                            <!-- 注意事项 -->
                            <div class="form-group">
                                <label class="col-sm-3 control-label">注意事项</label>
                                <div class="col-sm-9">
                                    <textarea rows="6" class="form-control" placeholder="注意事项" style="resize: none;"></textarea>
                                    <span class="help-block">剩余xxx字</span>
                                </div>
                            </div>
                            <!-- 服务范围 -->
                            <div class="form-group">
                                <label class="col-sm-3 control-label">服务范围</label>
                                <div class="col-sm-3">
                                    <select name="provinceId" id="province" class="form-control">
                                        <option>省</option>
                                        <option value="浙江省">浙江省</option>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <select name="cityId" id="city" class="form-control" >
                                        <option>市</option>
                                        <option value="杭州市">杭州市</option>
                                        <option value="温州市">温州市</option>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <button type="button" class="btn btn-info" id="add-area" style="width: 100%;">添加</button>
                                </div>
                            </div>
                            <!-- 服务范围项 -->
                            <div class="form-group">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-9">
                                    <div class="row area">
                                        <div class="col-sm-11">
                                            <p>浙江省杭州市</p>
                                            <button type="button" class="close delete-area"><span>&times;</span></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 服务特色 -->
                            <div class="form-group">
                                <label class="col-sm-3 control-label">服务特色</label>
                                <div class="col-sm-9">
                                    <button class="btn btn-primary upload2">
                                        <input type="file"><i class="icon fa fa-cloud-upload"></i> 选择
                                    </button>
                                </div>
                            </div>
                            <!-- 服务特色项 -->
                            <div class="form-group characteristic">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-info" id="save">修改</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- 模态框-删除 -->
    <div class="modal fade bs-example-modal-sm" id="prompt1" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body">
                    <p>删除选中的服务？</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-info" id="delete-btn">确定</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 模态框-未勾选提示 -->
    <div class="modal fade bs-example-modal-sm" id="prompt2" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body">
                    <p>请先勾选</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 模态框-确认修改 -->
    <div class="modal fade bs-example-modal-sm" id="prompt3" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <div class="modal-body">
                    <p>修改将重新审核该服务，确定要修改吗？</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-info" id="save-btn">确定</button>
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
                    <h4 class="modal-title">修改服务LOGO</h4>
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
    <script type="text/javascript">
        $(function(){
            var cropper;
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
                //表格分页
                laypage.render({
                    elem: 'page'
                    ,count: 20 //数据总数，从服务端得到
                    ,limit: 2
                    ,theme: '#19B5FE'
                    ,groups: 4
                    ,jump: function(obj, first){
                        if(!first){
                        }
                    }
                });
            });

            function initTableCheckbox() {
                var $thr = $('.app-container table thead tr');
                var $checkAllTh = $('<th><input type="checkbox" id="checkAll" name="checkAll" /></th>');
                /*将全选/反选复选框添加到表头最前，即增加一列*/
                $thr.prepend($checkAllTh);
                /*“全选/反选”复选框*/
                var $checkAll = $thr.find('input');
                $checkAll.click(function(event){
                    /*将所有行的选中状态设成全选框的选中状态*/
                    $tbr.find('input').prop('checked',$(this).prop('checked'));
                    /*并调整所有选中行的CSS样式*/
                    if ($(this).prop('checked')) {
                        $tbr.find('input').parent().parent().addClass('info');
                    } else{
                        $tbr.find('input').parent().parent().removeClass('info');
                    }
                    /*阻止向上冒泡，以防再次触发点击操作*/
                    event.stopPropagation();
                });
                /*点击全选框所在单元格时也触发全选框的点击操作*/
                $checkAllTh.click(function(){
                    $(this).find('input').click();
                });
                var $tbr = $('.app-container table tbody tr');
                var $tbr2 = $('.app-container table tbody tr .select');
                var $checkItemTd = $('<td><input type="checkbox" name="checkItem" class="select" /></td>');
                /*每一行都在最前面插入一个选中复选框的单元格*/
                $tbr.prepend($checkItemTd);
                /*点击每一行的选中复选框时*/
                $tbr.find('input').click(function(event){
                    /*调整选中行的CSS样式*/
                    $(this).parent().parent().toggleClass('info');
                    /*如果已经被选中行的行数等于表格的数据行数，将全选框设为选中状态，否则设为未选中状态*/
                    $checkAll.prop('checked',$tbr.find('input:checked').length == $tbr.length ? true : false);
                    /*阻止向上冒泡，以防再次触发点击操作*/
                    event.stopPropagation();
                });
                /*点击每一行时也触发该行的选中操作*/
                $tbr2.click(function(){
                    $(this).parent().find('input').click();
                });
            }
            initTableCheckbox();

            $("#delete").click(function (event) {
                var $checked = $("tbody input:checked");
                if($checked.length==0) {
                    $("#prompt2").modal("show");
                }
                else if($checked.length>=1) {
                    $("#prompt1").modal('show');
                }
            });

            $(document).on('click','#select-logo',function() {
                $('#service-modal').modal('hide');
                $('#logo-modal').modal('show');
            })
            $("#logo-modal").on('hidden.bs.modal', function(event) {
                $("#service-modal").modal('show');
            });

            $("#save").click(function(event) {
                $("#service-modal").modal('hide');
                $("#prompt3").modal('show');
            });
            $("#prompt3").on('hidden.bs.modal', function(event) {
                $("#service-modal").modal('show');
            });

            //添加服务范围项
            $("#add-area").click(function(event) {
                let $area = $("#service-modal .area");
                $area.append('<div class="col-sm-11">'+
                            '<p>'+$("#province").val()+$("#city").val()+'</p>'+
                            '<button type="button" class="close delete-area"><span>&times;</span></button>'+
                            '</div>')
            });
            $("#add-area-add").click(function(event) {
                let $area = $("#add-modal .area");
                $area.append('<div class="col-sm-11">'+
                            '<p>'+$("#province-add").val()+$("#city-add").val()+'</p>'+
                            '<button type="button" class="close delete-area"><span>&times;</span></button>'+
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
                    url = URL.createObjectURL(blob);
                    $("#logo").attr('src', url);
                });
                $("#logo-modal").modal('hide');
            });

            //特色
            $(document).on('change','.upload2 input',function() {
                let $file = $(this);
                let $canvases = $(this).parent().parent().parent().next();
                let windowURL = window.URL || window.webkitURL;
                let files = $file[0].files[0];
                if(files) {
                    let img = document.createElement("img");
                    img.src = windowURL.createObjectURL(files);
                    let canvas = document.createElement("canvas");
                    img.onload = function() {
                        canvas.width = img.width;
                        canvas.height = img.height;
                        canvas.getContext("2d").drawImage(img, 0, 0);
                    }
                    $canvases.append(canvas,'<div class="delete-characteristic"><p class="fa fa-trash-o"></p></div>');
                }
            });
            //删除特色项
            $(document).on('click', '.delete-characteristic', function(event) {
                $(this).prev().remove();
                $(this).remove();
            });
        });
    </script>
</body>
</html>