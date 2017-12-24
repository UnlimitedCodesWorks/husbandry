<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String portPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
    String waitPath=portPath+"storeAdmin/waitSearch.do";
    String dispatchPath=portPath+"storeAdmin/waitDispatch.do";
%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <style type="text/css">
        body {
            font-size: 13px;
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

        body .layui-laydate .layui-this {
            background-color: #22A7F0!important;
        }

        body .laydate-set-ym span:hover {
            color: #22A7F0;
        }

        body .layui-laydate-header .laydate-icon:hover {
            color: #22A7F0;
        }

        body .laydate-footer-btns span:hover {
            color: #22A7F0;
        }

        input::-webkit-input-placeholder { /* WebKit browsers */
            color:#a0a0a0;
        }

        .btn-info {
            margin: 0;
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
                            <li>订单管理</li>
                            <li class="active">待处理订单</li>
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
                                    <img src="${storeInfo.headImg}" class="profile-img">
                                </li>
                                <li>
                                    <div class="profile-info">
                                        <h4 class="username">${storeInfo.storeName}</h4>
                                        <p>${storeInfo.email}</p>
                                        <div class="btn-group margin-bottom-2x" role="group">
                                            <button type="button" class="btn btn-default" onclick="javascript:window.location.href='<%=portPath%>store/information/${storeId}'"><i class="fa fa-user"></i> 商户中心</button>
                                            <button type="button" class="btn btn-default" onclick="javascript:window.location.href='<%=portPath%>login/exit'"><i class="fa fa-sign-out"></i> 登出</button>
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
                                            <li class="active"><a href="<%=portPath%>storeAdmin/storeWait.html">待处理订单<span class="badge" style="margin-left: 127px;">${waitHandleNum}</span></a>
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
                                            <li><a href="<%=portPath%>storeAdmin/message.html">系统消息<span class="badge" style="margin-left: 145px;">${unReadNewsNum}</span></a>
                                            </li>
                                            <li><a href="<%=portPath%>storeAdmin/complain.html">用户投诉<span class="badge" style="margin-left: 145px;">0</span></a>
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
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <form class="form-inline pull-right" action="<%=waitPath%>" method="post">
                            <input type="text" name="input" class="form-control" placeholder="查找订单">
                            <select class="form-control" name="orderType">
                                <option>按订单号搜索</option>
                                <option>按发起人搜索</option>
                            </select>
                            <button type="submit" class="btn btn-info">搜索</button>
                        </form>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12 table-responsive" style="margin-bottom: 50px;">
                        <table class="table table-hover" id="waitOrder">
                            <thead>
                                <tr>
                                    <th>订单号</th>
                                    <th>服务名称</th>
                                    <th>创建时间</th>
                                    <th>订单发起人</th>
                                    <th>订单需求</th>
                                    <th>订单状态</th>
                                    <th>派遣</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${empty waitOrderList}">
                                    <tr>
                                        <td colspan="7" align="center"><b>您没有待处理订单</b></td>
                                    </tr>
                                </c:if>
                                <c:if test="${waitOrderList!=null}">
                                    <c:forEach items="${waitOrderList}" var="waitOrder">
                                        <tr>
                                            <td hidden="hidden"><c:out value="${waitOrder.orderid}"/></td>
                                            <td><c:out value="${waitOrder.orderNumber}"/></td>
                                            <td><c:out value="${waitOrder.offerService.serviceName}"/></td>
                                            <td><fmt:formatDate value="${waitOrder.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                            <td><c:out value="${waitOrder.user.userName}"/></td>
                                            <td><button class="btn btn-info" data-toggle="modal" data-target="#demand-modal">查看</button></td>
                                            <td>已支付</td>
                                            <td><button class="dispatch btn btn-info" data-toggle="modal" data-target="#staff-modal">派遣</button></td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>
                        <div id="page" class="pull-right"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 模态框-需求 -->
    <div class="modal fade" id="demand-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">用户需求</h4>
                </div>
                <form class="form-horizontal">
                    <div class="modal-body">
                        <div>
                            <!-- 需求 -->
                            <div class="row">
                                <div class="col-md-12" style="font-size: 18px;margin-bottom: 10px;">需求1</div>
                                <div class="col-md-12">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam doloremque commodi ut perferendis dolore rem non atque quibusdam placeat repudiandae sint, aut reiciendis cum, inventore aspernatur quae vero fugit iusto.</p>
                                </div>
                            </div>
                            <!-- 需求 -->
                            <div class="row">
                                <div class="col-md-12" style="font-size: 18px;margin-bottom: 10px;">需求2</div>
                                <div class="col-md-12">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam doloremque commodi ut perferendis dolore rem non atque quibusdam placeat repudiandae sint, aut reiciendis cum, inventore aspernatur quae vero fugit iusto.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- 模态框-派遣 -->
    <div class="modal fade" id="staff-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn btn-primary pull-right" id="staff-template">选择服务人员模板</button>
                    <h4 class="modal-title" style="height: 44px;font-size: 18px;line-height: 44px;">派遣人员</h4>
                </div>
                <f:form class="form-horizontal" action="<%=dispatchPath%>" method="post" modelAttribute="servicePeopleTemp" enctype="multipart/form-data">
                    <div class="modal-body" id="body">
                        <div>
                            <h4>员工头像</h4>
                            <hr>
                            <div class="row">
                                <div class="col-md-6 col-sm-6 col-xs-6" style="height: 150px;">
                                    <img id="head" src="http://t.cn/RCzsdCq" style="height: 100%;float: right;">
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <button class="btn btn-primary upload">
                                        <input type="file" name="sphead"><i class="icon fa fa-cloud-upload"></i> 选择
                                    </button>
                                </div>
                            </div>
                            <hr>
                            <h4>员工信息</h4>
                            <hr>
                            <!-- 姓名 -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="姓名" required="required" name="spName">
                                    <span class="help-block" style="color: red;display: none;">警告信息</span>
                                </div>
                            </div>
                            <!-- 性别 -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">性别</label>
                                <div class="col-sm-10" style="position: relative;top: 5px;">
                                    <div class="radio3 radio-check radio-inline">
                                        <input type="radio" name="spSex" id="sex-radio1" value="男" checked>
                                        <label for="sex-radio1">男</label>
                                    </div>
                                    <div class="radio3 radio-check radio-inline">
                                        <input type="radio" name="spSex" id="sex-radio2" value="女">
                                        <label for="sex-radio2">女</label>
                                    </div>
                                </div>
                            </div>
                            <!-- 出生日期 -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">出生日期</label>
                                <div class="col-sm-10">
                                    <input type="text" name="spBirth" class="layui-input" id="date" placeholder="出生日期" style="border: 1px solid #ccc;height: 34px;color: #555;font-size: 14px;" required="required"/>
                                </div>
                            </div>
                            <!-- 身高 -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">身高</label>
                                <div class="col-sm-10">
                                    <input type="text" name="spHeight" class="form-control" placeholder="身高" required>
                                    <span class="help-block" style="color: red;display: none;">警告信息</span>
                                </div>
                            </div>
                            <!-- 体重 -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">体重</label>
                                <div class="col-sm-10">
                                    <input type="text" name="spWeight" class="form-control" placeholder="体重" required>
                                    <span class="help-block" style="color: red;display: none;">警告信息</span>
                                </div>
                            </div>
                            <!-- 民族 -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">民族</label>
                                <div class="col-sm-10">
                                    <input type="text" name="spNation" class="form-control" placeholder="民族" required>
                                    <span class="help-block" style="color: red;display: none;">警告信息</span>
                                </div>
                            </div>
                            <!-- 联系电话 -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">联系电话</label>
                                <div class="col-sm-10">
                                    <input type="text" name="spPhone" class="form-control" placeholder="联系电话" required>
                                    <span class="help-block" style="color: red;display: none;">警告信息</span>
                                </div>
                            </div>
                            <!-- 其它说明 -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">其它说明</label>
                                <div class="col-sm-10">
                                    <textarea rows="6" name="spOtherinfo" class="form-control" placeholder="其它说明" style="resize: none;" required></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-info" id="staff-btn">派遣</button>
                    </div>
                </f:form>
            </div>
        </div>
    </div>
    <!-- 模态框-模板 -->
    <div class="modal fade" id="template-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">服务人员模板</h4>
                </div>
                <form class="form-horizontal">
                    <div class="modal-body">
                        <div>
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
                                        <tbody>
                                            <tr>
                                                <td><a href="#" title="何华峰">何华峰</a></td>
                                                <td>保姆</td>
                                                <td><button type="button" class="btn btn-info select">选择</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <!-- 分页-->
                                    <div id="template-page" class="pull-right"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" id="template-dismiss">关闭</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var input='${input}';
        var type='${type}';
        var pages=${pages};
        var portPath = "<%=portPath%>";
        var currentPage = 1;
        var storeId=${storeId};
        $(function(){
            layui.use('laypage', function(){
                var laypage = layui.laypage;
                //表格分页
                laypage.render({
                    elem: 'page'
                    ,count: 2*pages //数据总数，从服务端得到
                    ,limit: 2
                    ,theme: '#19B5FE'
                    ,groups: 4
                    ,jump: function(obj, first){
                        if(!first){
                            currentPage = obj.curr;
                            var href=portPath+"storeAdmin/storeWait.do?";
                            if(input=='none'&&type=='none'){
                                href+='currentPage='+currentPage;
                                href +='&storeId='+storeId;
                                changePage(href);
                            }
                            else{
                                href+='input='+input;
                                href +='&type='+type;
                                href+='&currentPage='+currentPage;
                                href +='&storeId='+storeId;
                                changePage(href);
                            }
                        }
                    }
                });

                function changePage(href) {
                    $.ajax({
                        url :href,
                        type : "get",
                        dataType : "json",
                        async:true,
                        success: function(data){
                            pages=data.pages;
                            createStoreWaitOrder(data);
                        },
                        error: function(jqXHR){
                            alert("发生错误：" + jqXHR.status);
                            currentPage = 1;
                        }
                    });
                }

                function createStoreWaitOrder(data){
                    var table=$('#waitOrder');
                    table.find('thead').remove();
                    table.find('tbody').remove();
                    var theadNode='<thead>\n' +
                        '<tr>\n' +
                        '<th>订单号</th>\n' +
                        '<th>服务名称</th>\n' +
                        '<th>创建时间</th>\n' +
                        '<th>订单发起人</th>\n' +
                        '<th>订单需求</th>\n' +
                        '<th>订单状态</th>\n' +
                        '<th>派遣</th>\n' +
                        '</tr>\n' +
                        '</thead>\n' +
                        '<tbody>';
                    table.append(theadNode);
                    for(var i=0;i<data.list.length;i++){
                        var orderId=data.list[i].orderid;
                        var orderNumber=data.list[i].orderNumber;
                        var serviceName=data.list[i].offerService.serviceName;
                        var startTime=data.list[i].startTime;
                        var userName=data.list[i].user.userName;
                        var node='<tr>\n' +
                            '<td hidden="hidden">'+orderId+'</td>\n' +
                            '<td>'+orderNumber+'</td>\n' +
                            '<td>'+serviceName+'</td>\n' +
                            '<td>'+startTime+'</td>\n' +
                            '<td>'+userName+'</td>\n' +
                            '<td><button class="btn btn-info" data-toggle="modal" data-target="#demand-modal">查看</button></td>\n' +
                            '<td>已支付</td>\n' +
                            '<td><button class="dispatch btn btn-info" data-toggle="modal" data-target="#staff-modal" class="dispatch">派遣</button></td>\n' +
                            '</tr>';
                        table.append(node);
                        table.append('</tbody>');
                    }
                    dispatchTemp();
                }

                function dispatchTemp() {
                    $('.dispatch').click(function () {
                        $('#hiddenOrder').remove();
                        var orderId=$("tbody tr td:hidden").html();
                        var node='<input id="hiddenOrder" hidden="hidden" type="text" value="'+orderId+'" name="orderId"/>';
                        $('#body').append(node);
                    });
                }
                dispatchTemp();

                //模板分页
                laypage.render({
                    elem: 'template-page'
                    ,count: 20 //数据总数，从服务端得到
                    ,limit: 8
                    ,theme: '#19B5FE'
                    ,groups: 4
                    ,jump: function(obj, first){
                        if(!first){
                            }
                        }
                });
            });

            layui.use('laydate', function(){
                var laydate = layui.laydate;
                laydate.render({
                    elem: '#date' //指定元素
                });
            });

            $("#staff-template").click(function(event) {
                $("#staff-modal").modal('hide');
                $("#template-modal").modal('show');
            });
            $("#template-dismiss").click(function(event) {
                $("#template-modal").modal('hide');
            });
            $("#template-modal").on('hidden.bs.modal', function(event) {
                $("#staff-modal").modal('show');
            });
            //选择模板
            $(".select").click(function(event) {
                $("#template-modal").modal('hide');
                //传数据
                
            });

            $(".upload input").change(function(event) {
                var $file = $(this);
                var fileObj = $file[0];
                var windowURL = window.URL || window.webkitURL;
                var $img = $("#head");
                if(fileObj && fileObj.files && fileObj.files[0]){
                    dataURL = windowURL.createObjectURL(fileObj.files[0]);
                    $img.attr('src',dataURL);
                }
                else{
                    dataURL = $file.val();
                    var imgObj = document.getElementById("#head-img");
                    imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                    imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
                }
            });
        });
    </script>
</body>
</html>