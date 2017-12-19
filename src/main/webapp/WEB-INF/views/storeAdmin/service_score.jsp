<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String portPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
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
    <link rel="stylesheet" type="text/css" href="../../../resources/css/select2.min.css">
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
    <script type="text/javascript" src="../../../resources/js/select2.full.min.js"></script>
    <script type="text/javascript" src="../../../resources/js/ace/ace.js"></script>
    <script type="text/javascript" src="../../../resources/js/ace/mode-html.js"></script>
    <script type="text/javascript" src="../../../resources/js/ace/theme-github.js"></script>
    <!-- Javascript -->
    <script type="text/javascript" src="../../../resources/js/app.js"></script>
    <script type="text/javascript" src="../../../resources/layui.js"></script>
    <script type="text/javascript" src="../../../resources/js/Chart.min.js"></script>
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
                            <li class="active">服务评分</li>
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
                                    新消息 <span class="badge pull-right">${unReadNews}</span>
                                </li>
                                <li class="message" onclick="javascript:window.location.href=''" style="cursor: pointer;">
                                    您有${unReadNews}条新消息
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown danger">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-star"></i> ${score.grade}</a>
                            <ul class="dropdown-menu danger  animated fadeInDown" style="box-shadow: 0 6px 12px rgba(0,0,0,.175);">
                                <li class="title">
                                    当前评分 <span class="badge pull-right">${score.grade}分</span>
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
                                            <button type="button" class="btn btn-default"><i class="fa fa-user" onclick="javascript:window.location.href='<%=portPath%>store/information/${storeId}'"></i> 商户中心</button>
                                            <button type="button" class="btn btn-default"><i class="fa fa-sign-out" onclick="javascript:window.location.href='<%=portPath%>login/exit'"></i> 登出</button>
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
                                            <li><a href="store_information.html">修改商户资料</a>
                                            </li>
                                            <li><a href="<%=portPath%>storeAdmin/storeScore/${storeId}">评分管理</a>
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
                                            <li><a href="order_finish.html">已完成订单</a>
                                            </li>
                                            <li><a href="order_wait_confirm.html">待确认订单<span class="badge" style="margin-left: 130px;">0</span></a>
                                            </li>
                                            <li><a href="order_wait_handle.html">待处理订单<span class="badge" style="margin-left: 130px;">0</span></a>
                                            </li>
                                            <li><a href="order_wait_refund.html">待退款订单<span class="badge" style="margin-left: 130px;">0</span></a>
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
                                            <li><a href="system_message.html">系统消息<span class="badge" style="margin-left: 130px;">${unReadNews}</span></a>
                                            </li>
                                            <li><a href="user_complaint.html">用户投诉<span class="badge" style="margin-left: 130px;">0</span></a>
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
                                            <li class="active"><a href="javascript:">服务评分</a>
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
                    <div class="alert alert-warning alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert"
                                aria-hidden="true">
                            &times;
                        </button>
                        警告！如果该服务一年内低于6.0评分，系统将给予警告，严重者经过核实将撤销该服务，系统每月将会进行重新统计。
                        <p style="color: #ff0505;">点击服务该月生成服务评分图表</p>
                    </div>
                    <div class="col-md-12 table-responsive" style="margin-bottom: 50px;">
                    	<table class="table table-hover" id="serviceScoreTable">
                    		<thead>
                    			<tr>
                    				<th>服务名称</th>
                    				<th>创建时间</th>
                    				<th>服务评分</th>
                    				<th>服务评分状态</th>
                    			</tr>
                    		</thead>
                    		<tbody>
                                <c:if test="${empty serviceList}">
                                    <tr>
                                        <td colspan="4" align="center"><b>该厂商还未创建服务</b></td>
                                    </tr>
                                </c:if>
                                <c:if test="${serviceList!=null}">
                                    <c:forEach items="${serviceList}" var="service">
                                        <tr style="cursor: pointer;">
                                            <td hidden="hidden"><c:out value="${service.offerServiceId}"/></td>
                                            <td><c:out value="${service.serviceName}"/></td>
                                            <td><fmt:formatDate value="${service.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                            <td><c:out value="${service.grade}"/></td>
                                            <td><c:out value="${service.status}"/></td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                    		</tbody>
						</table>
						<div id="page" class="pull-right"></div>
                    </div>
                    <div class="col-md-12" id="lineChart">
                    </div>
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
    		$('tr').css('cursor', 'pointer');

	    	layui.use('laypage', function(){
	    		var laypage = layui.laypage;
	    		//执行一个laypage实例
	    		laypage.render({
                    elem: 'page'
                    ,count: pages*2 //数据总数，从服务端得到
                    ,limit: 2
                    ,theme: '#19B5FE'
                    ,groups: 4
                    ,jump: function(obj, first){
                        if(!first){
                            currentPage = obj.curr;
                            var href=portPath+"storeAdmin/serviceScore/page.do?";
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
                        createServiceScore(data);
                    },
                    error: function(jqXHR){
                        alert("发生错误：" + jqXHR.status);
                        currentPage = 1;
                    }
                });
            }

            function createServiceScore(data){
                var table=$('#serviceScoreTable');
                table.find('thead').remove();
                table.find('tbody').remove();
                var theadNode='<thead><tr><th>服务名称</th><th>创建时间</th><th>服务评分</th><th>服务评分状态</th></tr></thead><tbody>';
                table.append(theadNode);
                for(var i=0;i<data.list.length;i++){
                    var serviceId=data.list[i].offerServiceId;
                    var serviceName=data.list[i].serviceName;
                    var publishTime=data.list[i].publishTime;
                    var grade=data.list[i].grade;
                    var status=data.list[i].status;
                    var node='<tr style="cursor: pointer;"><td hidden="hidden">'+serviceId+'</td><td>'+serviceName+'</td>' +
                        '<td>'+publishTime+'</td><td>'+grade+'</td><td>'+status+'</td>' +
                        '</tr>';
                    table.append(node);
                }
                table.append('</tbody>');
                clickTr();
            }

            function clickTr() {
                $('tr').click(function(event) {
                    $('tr').removeClass('info');
                    $(this).addClass('info');
                    var serviceId=$(this).children(":first").html();
                    $.ajax({
                        url :portPath +'storeAdmin/serviceScore/line.do',
                        type: "get",
                        async: true,
                        data:{offserviceId:serviceId},
                        success: function(data){
                            $('#lineChart div').remove();
                            var daynum=[];
                            var grade=[];
                            var node;
                            for(var i=0;i<data.days.length;i++){
                                daynum.push(data.days[i].dayNum);
                                grade.push(data.days[i].grade);
                            }
                            if(data.grade>0 && data.grade<3){
                                node='<div class="alert alert-danger">';
                            }
                            else if(data.grade>3 && data.grade<6){
                                node='<div class="alert alert-warning">';
                            }
                            else if(data.grade>6 && data.grade<8){
                                node='<div class="alert alert-info">';
                            }
                            var node1='服务名称：'+data.serviceName+
                                '&nbsp;&nbsp;&nbsp;&nbsp;该月平均分：'+data.grade+'分' +
                                '&nbsp;&nbsp;&nbsp;&nbsp;时间：'+data.date+
                                '&nbsp;&nbsp;&nbsp;&nbsp;状态：'+data.status+'</div>\n' +
                                '<div class="card">\n' +
                                '<div class="card-header">\n' +
                                '<div class="card-title">\n' +
                                '<div class="title">服务评分</div>\n' +
                                '</div>\n' +
                                '</div>\n' +
                                '<div class="card-body no-padding">\n' +
                                '<canvas id="line-chart" class="chart"></canvas>\n' +
                                '</div>\n' +
                                '</div>';
                            var nodeFull=node+node1;
                            $('#lineChart').append(nodeFull);

                            var ctx, data, myLineChart, options;
                            Chart.defaults.global.responsive = true;
                            ctx = $('#line-chart').get(0).getContext('2d');
                            options = {
                                scaleShowGridLines: true,
                                scaleGridLineColor: "rgba(0,0,0,.05)",
                                scaleGridLineWidth: 1,
                                scaleShowHorizontalLines: true,
                                scaleShowVerticalLines: true,
                                bezierCurve: false,
                                bezierCurveTension: 0.4,
                                pointDot: true,
                                pointDotRadius: 4,
                                pointDotStrokeWidth: 1,
                                pointHitDetectionRadius: 20,
                                datasetStroke: true,
                                datasetStrokeWidth: 2,
                                datasetFill: true
                            };
                            data = {
                                labels: daynum,
                                datasets: [
                                    {
                                        label: "My First dataset",
                                        fillColor: "rgba(26, 188, 156,0.2)",
                                        strokeColor: "#1ABC9C",
                                        pointColor: "#1ABC9C",
                                        pointStrokeColor: "#fff",
                                        pointHighlightFill: "#fff",
                                        pointHighlightStroke: "#1ABC9C",
                                        data: grade
                                    }
                                ]
                            };
                            myLineChart = new Chart(ctx).Line(data, options);
                        },
                        error: function(jqXHR){
                            alert("发生错误：" + jqXHR.status);
                        }
                    });
                });
            }
            clickTr();
	    });
    </script>
</body>
</html>