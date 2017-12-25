<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String portPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
    String createPeoplePath=portPath+"storeAdmin/createPeople.do";
    String updatePeoplePath=portPath+"storeAdmin/updatePeople.do";
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
                            <li class="active">服务人员模板</li>
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
                                            <li><a href="<%=portPath%>storeAdmin/storeWait.html">待处理订单<span class="badge" style="margin-left: 130px;">${waitHandleNum}</span></a>
                                            </li>
                                            <li><a href="<%=portPath%>storeAdmin/storeCancel.html">待退款订单<span class="badge" style="margin-left: 130px;">${waitCancelNum}</span></a>
                                            </li>
                                            <li class="active"><a href="<%=portPath%>storeAdmin/storePeople.html">服务人员模板</a>
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
                                            <li><a href="<%=portPath%>storeAdmin/message.html">系统消息<span class="badge" style="margin-left: 145px;">0</span></a>
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
                    <div class="col-md-12 col-sm-12 col-xs-12 table-responsive" style="margin-bottom: 50px;">
                        <table class="table table-hover" id="peopleTable">
                            <thead>
                                <tr>
                                    <th>模板名称</th>
                                    <th>模板备注</th>
                                    <th>最后更改时间</th>
                                    <th>模板详情</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${empty servicePeopleList}">
                                    <tr>
                                        <td colspan="5" align="center"><b>您没有服务人员模板</b></td>
                                    </tr>
                                </c:if>
                                <c:if test="${servicePeopleList!=null}">
                                    <c:forEach items="${servicePeopleList}" var="servicePeople">
                                        <tr>
                                            <td hidden="hidden"><c:out value="${servicePeople.servicepeopleid}"/></td>
                                            <td class="select"><c:out value="${servicePeople.spTemplatename}"/></td>
                                            <td class="select"><c:out value="${servicePeople.spRemark}"/></td>
                                            <td class="select"><fmt:formatDate value="${servicePeople.upTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                            <td><button class="btn btn-info look" data-toggle="modal" data-target="#template-modal">查看</button></td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>
                        <span>
                            <c:if test="${empty servicePeopleList}">
                                <button class="btn btn-danger" disabled="disabled">删除</button>
                                <button class="btn btn-info" disabled="disabled">添加模板</button>
                            </c:if>
                            <c:if test="${!empty servicePeopleList}">
                                <button class="btn btn-danger" id="delete">删除</button>
                                <button class="btn btn-info" data-toggle="modal" data-target="#add-modal">添加模板</button>
                            </c:if>
                        </span>
                        <div id="page" class="pull-right"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 模态框-模板 -->
    <div class="modal fade" id="template-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document" id="servicePeopleInfo">
        </div>
    </div>
    <!-- 模态框-添加模板 -->
    <div class="modal fade" id="add-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">添加服务人员模板</h4>
                </div>
                <f:form class="form-horizontal" action="<%=createPeoplePath%>" method="post" enctype="multipart/form-data" modelAttribute="servicePeopleAdd">
                    <div class="modal-body">
                        <div>
                            <h4>员工头像</h4>
                            <hr>
                            <div class="row">
                                <div class="col-md-6 col-sm-6 col-xs-6" style="height: 150px;">
                                    <img src="http://t.cn/RCzsdCq" style="height: 100%;float: right;">
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <button class="btn btn-primary upload">
                                        <input name="sphead" type="file"><i class="icon fa fa-cloud-upload"></i> 选择
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
                                    <input type="text" name="spName" class="form-control" placeholder="姓名" required>
                                    <span class="help-block" style="color: red;display: none;">警告信息</span>
                                </div>
                            </div>
                            <!-- 性别 -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">性别</label>
                                <div class="col-sm-10" style="position: relative;top: 5px;">
                                    <div class="radio3 radio-check radio-inline">
                                        <input type="radio" name="spSex" value="男" checked id="sex-radio3">
                                        <label for="sex-radio3">男</label>
                                    </div>
                                    <div class="radio3 radio-check radio-inline">
                                        <input type="radio" name="spSex" value="女" id="sex-radio4">
                                        <label for="sex-radio4">女</label>
                                    </div>
                                </div>
                            </div>
                            <!-- 出生日期 -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">出生日期</label>
                                <div class="col-sm-10">
                                    <input type="text" name="spBirth" class="layui-input" id="date2" placeholder="出生日期" style="border: 1px solid #ccc;height: 34px;color: #555;font-size: 14px;" required>
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
                            <!-- 模板名 -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">模板名</label>
                                <div class="col-sm-10">
                                    <input type="text" name="spTemplatename" class="form-control" placeholder="模板名" required>
                                    <span class="help-block" style="color: red;display: none;">警告信息</span>
                                </div>
                            </div>
                            <!-- 备注 -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">服务类别</label>
                                <div class="col-sm-10">
                                    <select class="form-control" name="spRemark">
                                        <option>保姆</option>
                                        <option>月嫂</option>
                                        <option>涉外家政</option>
                                        <option>钟点工</option>
                                        <option>老人陪护</option>
                                        <option>病人陪护</option>
                                        <option>育婴师</option>
                                        <option>催乳师</option>
                                    </select>
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
                        <button type="submit" class="btn btn-info" id="add-btn">添加</button>
                    </div>
                </f:form>
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
                    <p>删除该模板？</p>
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
    <script type="text/javascript">
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
                            var href=portPath+"storeAdmin/storePeople.do?";
                            href+='currentPage='+currentPage;
                            href +='&storeId='+storeId;
                            changePage(href);
                        }
                    }
                });
            });

            function changePage(href) {
                $.ajax({
                    url :href,
                    type : "get",
                    dataType : "json",
                    async:true,
                    success: function(data){
                        pages=data.pages;
                        createStorePeople(data);
                    },
                    error: function(jqXHR){
                        alert("发生错误：" + jqXHR.status);
                        currentPage = 1;
                    }
                });
            }

            function createStorePeople(data){
                var table=$('#peopleTable');
                table.find('thead').remove();
                table.find('tbody').remove();
                var theadNode='<thead>\n' +
                    '<tr>\n' +
                    '<th>模板名称</th>\n' +
                    '<th>模板备注</th>\n' +
                    '<th>最后更改时间</th>\n' +
                    '<th>模板详情</th>\n' +
                    '</tr>\n' +
                    '</thead>\n' +
                    '<tbody>';
                table.append(theadNode);
                for(var i=0;i<data.list.length;i++){
                    var servicePeopleId=data.list[i].servicepeopleid;
                    var spTemplateName=data.list[i].spTemplatename;
                    var spRemark=data.list[i].spRemark;
                    var upTime=data.list[i].upTime;
                    var node='<tr>\n' +
                        '<td hidden="hidden">'+servicePeopleId+'</td>\n' +
                        '<td class="select">'+spTemplateName+'</td>\n' +
                        '<td class="select">'+spRemark+'</td>\n' +
                        '<td class="select">'+upTime+'</td>\n' +
                        '<td><button class="btn btn-info look" data-toggle="modal" data-target="#template-modal">查看</button></td>\n' +
                        '</tr>';
                    table.append(node);
                }
                table.append('</tbody>');
                initTableCheckbox();
                getServicePeopleLook();
            }

            function initTableCheckbox() {
                var $thr = $('table thead tr');
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
                var $tbr = $('table tbody tr');
                var $tbr2 = $('table tbody tr .select')
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

            function getServicePeopleLook() {
                var servicePeopleInfo=$('#servicePeopleInfo');
                $('.look').click(function () {
                    var servicePeopleId=$(this).parent().parent().children("td").eq(1).html();
                    $.ajax({
                        url :portPath + 'storeAdmin/lookServicePeople.do',
                        type : "post",
                        data:{servicePeopleId:servicePeopleId},
                        async: true,
                        success: function(data){
                            var birth = new Date(data.spBirth).format("yyyy-MM-dd");
                            $('#people-content').remove();
                            var node1='<div class="modal-content" id="people-content">\n' +
                                '<div class="modal-header">\n' +
                                '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>\n' +
                                '<h4 class="modal-title">服务人员模板</h4>\n' +
                                '</div>\n' +
                                '<f:form class="form-horizontal" enctype="multipart/form-data" modelAttribute="servicePeopleUpdate" method="post" action="<%=updatePeoplePath%>">\n' +
                                '<input type="text" hidden="hidden" name="servicepeopleid" value="'+data.servicepeopleid+'"/>\n' +
                                '<div class="modal-body">\n' +
                                '<div>\n' +
                                '<h4>员工头像</h4>\n' +
                                '<hr>\n' +
                                '<div class="row">\n' +
                                '<div class="col-md-6 col-sm-6 col-xs-6" style="height: 150px;">\n' +
                                '<img src="'+data.spHead+'" onerror="this.src=\'http://t.cn/RCzsdCq\'" style="height: 100%;float: right;">\n' +
                                '</div>\n' +
                                '<div class="col-md-6 col-sm-6 col-xs-6">\n' +
                                '<button class="btn btn-primary upload">\n' +
                                '<input name="sphead" type="file"><i class="icon fa fa-cloud-upload"></i> 选择\n' +
                                '</button>\n' +
                                '</div>\n' +
                                '</div>\n' +
                                '<hr>\n' +
                                '<h4>员工信息</h4>\n' +
                                '<hr>\n' +
                                '<div class="form-group">\n' +
                                '<label class="col-sm-2 control-label">姓名</label>\n' +
                                '<div class="col-sm-10">\n' +
                                '<input name="spName" value="'+data.spName+'" type="text" class="form-control" placeholder="姓名">\n' +
                                '<span class="help-block" style="color: red;display: none;">警告信息</span>\n' +
                                '</div>\n' +
                                '</div>\n' +
                                '<div class="form-group">\n' +
                                '<label class="col-sm-2 control-label">性别</label>\n' +
                                '<div class="col-sm-10" style="position: relative;top: 5px;">\n' +
                                '<div class="radio3 radio-check radio-inline">\n';
                            var node2="";
                            if(data.spSex=="男"){
                                node2=node2+'<input type="radio" checked="checked" name="spSex" value="男" id="sex-radio1">\n' +
                                    '<label for="sex-radio1">男</label>\n' +
                                    '</div>\n' +
                                    '<div class="radio3 radio-check radio-inline">\n' +
                                    '<input type="radio" name="spSex" value="女" id="sex-radio2">\n';
                            }
                            else{
                                node2=node2+'<input type="radio" name="spSex" value="男" id="sex-radio1">\n' +
                                    '<label for="sex-radio1">男</label>\n' +
                                    '</div>\n' +
                                    '<div class="radio3 radio-check radio-inline">\n' +
                                    '<input type="radio" checked="checked" name="spSex" value="女" id="sex-radio2">\n';
                            }
                            var node3='<label for="sex-radio2">女</label>\n' +
                                '</div>\n' +
                                '</div>\n' +
                                '</div>\n' +
                                '<div class="form-group">\n' +
                                '<label class="col-sm-2 control-label">出生日期</label>\n' +
                                '<div class="col-sm-10">\n' +
                                '<input type="text" name="spBirth" value="'+birth+'" class="layui-input" id="date1" placeholder="出生日期" style="border: 1px solid #ccc;height: 34px;color: #555;font-size: 14px;">\n' +
                                '</div>\n' +
                                '</div>\n' +
                                '<div class="form-group">\n' +
                                '<label class="col-sm-2 control-label">身高</label>\n' +
                                '<div class="col-sm-10">\n' +
                                '<input type="text" name="spHeight" value="'+data.spHeight+'" class="form-control" placeholder="身高">\n' +
                                '<span class="help-block" style="color: red;display: none;">警告信息</span>\n' +
                                '</div>\n' +
                                '</div>\n' +
                                '<div class="form-group">\n' +
                                '<label class="col-sm-2 control-label">体重</label>\n' +
                                '<div class="col-sm-10">\n' +
                                '<input type="text" name="spWeight" value="'+data.spWeight+'" class="form-control" placeholder="体重">\n' +
                                '<span class="help-block" style="color: red;display: none;">警告信息</span>\n' +
                                '</div>\n' +
                                '</div>\n' +
                                '<div class="form-group">\n' +
                                '<label class="col-sm-2 control-label">民族</label>\n' +
                                '<div class="col-sm-10">\n' +
                                '<input type="text" name="spNation" value="'+data.spNation+'" class="form-control" placeholder="民族">\n' +
                                '<span class="help-block" style="color: red;display: none;">警告信息</span>\n' +
                                '</div>\n' +
                                '</div>\n' +
                                '<div class="form-group">\n' +
                                '<label class="col-sm-2 control-label">联系电话</label>\n' +
                                '<div class="col-sm-10">\n' +
                                '<input type="text" name="spPhone" value="'+data.spPhone+'" class="form-control" placeholder="联系电话">\n' +
                                '<span class="help-block" style="color: red;display: none;">警告信息</span>\n' +
                                '</div>\n' +
                                '</div>\n' +
                                '<div class="form-group">\n' +
                                '<label class="col-sm-2 control-label">模板名</label>\n' +
                                '<div class="col-sm-10">\n' +
                                '<input type="text" name="spTemplatename" value="'+data.spTemplatename+'" class="form-control" placeholder="模板名" required>\n' +
                                '<span class="help-block" style="color: red;display: none;">警告信息</span>\n' +
                                '</div>\n' +
                                '</div>\n' +
                                '<div class="form-group">\n' +
                                '<label class="col-sm-2 control-label">服务类别</label>\n' +
                                '<div class="col-sm-10">\n' +
                                '<select class="form-control" name="spRemark">\n';
                            var node4='';
                            if(data.spRemark=="保姆"){
                                node4=node4+'<option selected="selected">保姆</option>\n' +
                                    '<option>月嫂</option>\n' +
                                    '<option>涉外家政</option>\n' +
                                    '<option>钟点工</option>\n' +
                                    '<option>老人陪护</option>\n' +
                                    '<option>病人陪护</option>\n' +
                                    '<option>育婴师</option>\n' +
                                    '<option>催乳师</option>\n';
                            }
                            else if(data.spRemark=="月嫂"){
                                node4=node4+'<option>保姆</option>\n' +
                                    '<option selected="selected">月嫂</option>\n' +
                                    '<option>涉外家政</option>\n' +
                                    '<option>钟点工</option>\n' +
                                    '<option>老人陪护</option>\n' +
                                    '<option>病人陪护</option>\n' +
                                    '<option>育婴师</option>\n' +
                                    '<option>催乳师</option>\n';
                            }
                            else if(data.spRemark=="涉外家政"){
                                node4=node4+'<option>保姆</option>\n' +
                                    '<option>月嫂</option>\n' +
                                    '<option selected="selected">涉外家政</option>\n' +
                                    '<option>钟点工</option>\n' +
                                    '<option>老人陪护</option>\n' +
                                    '<option>病人陪护</option>\n' +
                                    '<option>育婴师</option>\n' +
                                    '<option>催乳师</option>\n';
                            }
                            else if(data.spRemark=="钟点工"){
                                node4=node4+'<option>保姆</option>\n' +
                                    '<option>月嫂</option>\n' +
                                    '<option>涉外家政</option>\n' +
                                    '<option selected="selected">钟点工</option>\n' +
                                    '<option>老人陪护</option>\n' +
                                    '<option>病人陪护</option>\n' +
                                    '<option>育婴师</option>\n' +
                                    '<option>催乳师</option>\n';
                            }
                            else if(data.spRemark=="老人陪护"){
                                node4=node4+'<option>保姆</option>\n' +
                                    '<option>月嫂</option>\n' +
                                    '<option>涉外家政</option>\n' +
                                    '<option>钟点工</option>\n' +
                                    '<option selected="selected">老人陪护</option>\n' +
                                    '<option>病人陪护</option>\n' +
                                    '<option>育婴师</option>\n' +
                                    '<option>催乳师</option>\n';
                            }
                            else if(data.spRemark=="病人陪护"){
                                node4=node4+'<option>保姆</option>\n' +
                                    '<option>月嫂</option>\n' +
                                    '<option>涉外家政</option>\n' +
                                    '<option>钟点工</option>\n' +
                                    '<option>老人陪护</option>\n' +
                                    '<option selected="selected">病人陪护</option>\n' +
                                    '<option>育婴师</option>\n' +
                                    '<option>催乳师</option>\n';
                            }
                            else if(data.spRemark=="育婴师"){
                                node4=node4+'<option>保姆</option>\n' +
                                    '<option>月嫂</option>\n' +
                                    '<option>涉外家政</option>\n' +
                                    '<option>钟点工</option>\n' +
                                    '<option>老人陪护</option>\n' +
                                    '<option>病人陪护</option>\n' +
                                    '<option selected="selected">育婴师</option>\n' +
                                    '<option>催乳师</option>\n';
                            }
                            else if(data.spRemark=="催乳师"){
                                node4=node4+'<option>保姆</option>\n' +
                                    '<option>月嫂</option>\n' +
                                    '<option>涉外家政</option>\n' +
                                    '<option>钟点工</option>\n' +
                                    '<option>老人陪护</option>\n' +
                                    '<option>病人陪护</option>\n' +
                                    '<option>育婴师</option>\n' +
                                    '<option selected="selected">催乳师</option>\n';
                            }
                            else{
                                node4=node4+'<option>保姆</option>\n' +
                                    '<option>月嫂</option>\n' +
                                    '<option>涉外家政</option>\n' +
                                    '<option>钟点工</option>\n' +
                                    '<option>老人陪护</option>\n' +
                                    '<option>病人陪护</option>\n' +
                                    '<option>育婴师</option>\n' +
                                    '<option>催乳师</option>\n';
                            }
                            var node5='</select>\n' +
                                '<span class="help-block" style="color: red;display: none;">警告信息</span>\n' +
                                '</div>\n' +
                                '</div>\n' +
                                '<div class="form-group">\n' +
                                '<label class="col-sm-2 control-label">其它说明</label>\n' +
                                '<div class="col-sm-10">\n' +
                                '<textarea name="spOtherinfo" rows="6" class="form-control" placeholder="其它说明" style="resize: none;">'+data.spOtherinfo+'</textarea>\n' +
                                '</div>\n' +
                                '</div>\n' +
                                '</div>\n' +
                                '</div>\n' +
                                '<div class="modal-footer">\n' +
                                '<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>\n' +
                                '<button type="submit" class="btn btn-info" id="staff-btn">保存</button>\n' +
                                '</div>\n' +
                                '</f:form>\n' +
                                '</div>';
                            var node=node1+node2+node3+node4+node5;
                            servicePeopleInfo.append(node);
                            layui.use('laydate', function(){
                                var laydate = layui.laydate;
                                laydate.render({
                                    elem: '#date1' //指定元素
                                });
                            });
                            getImg();
                        },
                        error: function(jqXHR){
                            alert("发生错误：" + jqXHR.status);
                        }
                    });
                });
            }
            getServicePeopleLook();

            $("#delete").click(function(event) {
                var $checked = $("tbody input:checked");
                if($checked.length==0) {
                    $("#prompt2").modal("show");
                }
                else if($checked.length>=1) {
                    $("#prompt1").modal('show');
                }
            });

            $('#delete-btn').click(function () {
                var checked=$("tbody input:checked");
                var cancel=[];
                checked.each(function () {
                    cancel.push($(this).parent().parent().children("td").eq(1).html());
                });
                $.ajax({
                    url :portPath + 'storeAdmin/delete.do',
                    type : "get",
                    traditional: true,
                    data:{servicePeopleId:cancel},
                    async: false,
                    error: function(jqXHR){
                        alert("发生错误：" + jqXHR.status);
                    }
                });
                window.location.href=portPath+"storeAdmin/storePeople.html";
            });

            Date.prototype.format = function(fmt) {
                var o = {
                    "M+" : this.getMonth()+1,                 //月份
                    "d+" : this.getDate(),                    //日
                    "h+" : this.getHours(),                   //小时
                    "m+" : this.getMinutes(),                 //分
                    "s+" : this.getSeconds(),                 //秒
                    "q+" : Math.floor((this.getMonth()+3)/3), //季度
                    "S"  : this.getMilliseconds()             //毫秒
                };
                if(/(y+)/.test(fmt)) {
                    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
                }
                for(var k in o) {
                    if(new RegExp("("+ k +")").test(fmt)){
                        fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
                    }
                }
                return fmt;
            };

            layui.use('laydate', function(){
                var laydate = layui.laydate;
                laydate.render({
                    elem: '#date2' //指定元素
                });
            });

            function getImg() {
                $(".upload input").change(function(event) {
                    var $file = $(this);
                    var fileObj = $file[0];
                    var windowURL = window.URL || window.webkitURL;
                    var $img = $(this).parent().parent().prev().children('img');
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
            }
            getImg();

        });
    </script>
</body>
</html>