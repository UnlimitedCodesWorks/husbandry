<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String portPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
    String finishPath=portPath+"storeAdmin/finishSearch.do";
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
                            <li class="active">已完成订单</li>
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
                                            <li class="active"><a href="<%=portPath%>storeAdmin/storeFinish.html">已完成订单</a>
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
                                            <li><a href="<%=portPath%>storeAdmin/service.html">我的服务</a>
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
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <form class="form-inline pull-right" method="post" action="<%=finishPath%>">
                            <input type="text" name="input" class="form-control" placeholder="查找订单">
                            <select class="form-control" name="orderType">
                                <option>按订单号搜索</option>
                                <option>按发起人搜索</option>
                            </select>
                            <button type="submit" class="btn btn-info">搜索</button>
                        </form>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12 table-responsive" style="margin-bottom: 50px;">
                        <table class="table table-hover" id="finishOrder">
                            <thead>
                                <tr>
                                    <th>订单号</th>
                                    <th>服务名称</th>
                                    <th>创建时间</th>
                                    <th>完成时间</th>
                                    <th>订单发起人</th>
                                    <th>订单金额</th>
                                    <th>完成状态</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${empty finishOrderList}">
                                    <tr>
                                        <td colspan="6" align="center"><b>您没有退款订单</b></td>
                                    </tr>
                                </c:if>
                                <c:if test="${finishOrderList!=null}">
                                    <c:forEach items="${finishOrderList}" var="finishOrder">
                                        <tr>
                                            <td><c:out value="${finishOrder.orderNumber}"/></td>
                                            <td><c:out value="${finishOrder.offerService.serviceName}"/></td>
                                            <td><fmt:formatDate value="${finishOrder.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                            <td><fmt:formatDate value="${finishOrder.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                            <td><c:out value="${finishOrder.user.userName}"/></td>
                                            <td><c:out value="${finishOrder.orderBigTime.sum}"/></td>
                                            <c:if test="${finishOrder.status==2}">
                                                <td>交易成功</td>
                                            </c:if>
                                            <c:if test="${finishOrder.status==4}">
                                                <td>退款成功</td>
                                            </c:if>
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
                //执行一个laypage实例
                laypage.render({
                    elem: 'page'
                    ,count: 2*pages //数据总数，从服务端得到
                    ,limit: 2
                    ,theme: '#19B5FE'
                    ,groups: 4
                    ,jump: function(obj, first){
                        if(!first){
                            currentPage = obj.curr;
                            var href=portPath+"storeAdmin/storeFinish.do?";
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
            });

            function changePage(href) {
                $.ajax({
                    url :href,
                    type : "get",
                    dataType : "json",
                    async:true,
                    success: function(data){
                        pages=data.pages;
                        createStoreFinishOrder(data);
                    },
                    error: function(jqXHR){
                        alert("发生错误：" + jqXHR.status);
                        currentPage = 1;
                    }
                });
            }

            function createStoreFinishOrder(data){
                var table=$('#finishOrder');
                table.find('thead').remove();
                table.find('tbody').remove();
                var theadNode='<thead>' +
                    '<tr>' +
                    '<th>订单号</th>' +
                    '<th>服务名称</th>' +
                    '<th>创建时间</th>' +
                    '<th>完成时间</th>' +
                    '<th>订单发起人</th>' +
                    '<th>订单金额</th>'+
                    '<th>完成状态</th>'+
                    '</tr>' +
                    '</thead><tbody>';
                table.append(theadNode);
                for(var i=0;i<data.list.length;i++){
                    var orderNumber=data.list[i].orderNumber;
                    var serviceName=data.list[i].offerService.serviceName;
                    var startTime=data.list[i].startTime;
                    var endTime=data.list[i].endTime;
                    var userName=data.list[i].user.userName;
                    var money=data.list[i].orderBigTime.sum;
                    var finishStatus=(data.list[i].status==2)?"交易成功":"退款成功";
                    var node='<tr>\n' +
                        '<td>'+orderNumber+'</td>\n' +
                        '<td>'+serviceName+'</td>\n' +
                        '<td>'+startTime+'</td>\n' +
                        '<td>'+endTime+'</td>\n' +
                        '<td>'+userName+'</td>\n' +
                        '<td>'+money+'</td>'+
                        '<td>'+finishStatus+'</td>\n' +
                        '</tr>';
                    table.append(node);
                }
                table.append('</tbody>');
            }
        });
    </script>
</body>
</html>