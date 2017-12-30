<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String portPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
    String scoreSearchPath=portPath+"admin/scoreSearch.do";
    String scoreNewsPath=portPath+"admin/scoreNews.do";
    String pageSearchPath=portPath+"admin/pageRedirect.do";
%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>智慧社区-评分管理</title>
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../../resources/font/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="../../../resources/font/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../../resources/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
           folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../../../resources/css/_all-skins.min.css">
    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <link rel="stylesheet" type="text/css" href="../../../resources/css/layui.css">
    <style type="text/css">
        @media screen and (max-width: 768px) {
            .search {
                width: 100%;
            }
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">

    <div class="wrapper">
        <header class="main-header">
            <a class="logo">
               <span class="logo-mini"><b>H</b>US</span>
               <span class="logo-lg"><b>Hus</b>bandry</span>
            </a>
            <nav class="navbar navbar-static-top">
               <a class="sidebar-toggle" data-toggle="push-menu" role="button">
                  <span class="sr-only">Toggle navigation</span>
               </a>
               <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <li class="user user-menu">
                            <a>
                                <img src="../../../resources/images/admin.jpg" class="user-image" alt="User Image">
                                <span class="hidden-xs">超级管理员</span>
                            </a>
                        </li>
                        <li>
                            <a><i class="fa fa-gears"></i></a>
                        </li>
                    </ul>
               </div>
            </nav>
        </header>
        <aside class="main-sidebar">
            <section class="sidebar">
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="../../../resources/images/admin.jpg" class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <p>超级管理员</p>
                        <a><i class="fa fa-circle text-success"></i> Online</a>
                    </div>
                </div>
                <form action="<%=pageSearchPath%>" method="post" class="sidebar-form">
                    <div class="input-group">
                    <input type="text" name="q" class="form-control" placeholder="Search..." required="required">
                    <span class="input-group-btn">
                        <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                        </button>
                    </span>
                    </div>
                </form>
                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header">MAIN NAVIGATION</li>
                    <li>
                        <a href="<%=portPath%>admin/OperationOverview.html">
                            <i class="fa fa-th"></i><span>运营总揽</span>
                            <span class="pull-right-container">
                                <small class="label pull-right bg-red">new</small>
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=portPath%>admin/priceControll.html">
                            <i class="fa fa-signal"></i><span>价格调控</span>
                            <span class="pull-right-container">
                                <small class="label pull-right bg-green">new</small>
                            </span>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-files-o"></i>
                            <span>商户管理</span>
                            <span class="pull-right-container">
                                <span class="label label-primary pull-right">${unPassStoreNum}</span>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="<%=portPath%>admin/waitStore.html"><i class="fa fa-circle-o"></i>商户认证</a></li>
                            <li><a href="<%=portPath%>admin/useStore.html"><i class="fa fa-circle-o"></i>商户操作</a></li>
                        </ul>
                    </li>
                    <li class="treeview active">
                        <a href="#">
                            <i class="fa fa-pie-chart"></i>
                            <span>评分系统</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="active"><a href="<%=portPath%>admin/scoreAdmin.html"><i class="fa fa-circle-o"></i>评分管理</a></li>
                        </ul>
                    </li>
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-laptop"></i>
                            <span>服务系统</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="<%=portPath%>admin/serviceAdmin.html"><i class="fa fa-circle-o"></i>服务管理</a></li>
                        </ul>
                    </li>
                </ul>
            </section>
        </aside>
        <div class="content-wrapper">
            <section class="content-header">
              <h1>
                Husbandry
                <small>Score Admin</small>
              </h1>
              <ol class="breadcrumb">
                <li><a><i class="fa fa-dashboard"></i> Husbandry</a></li>
                <li><a>admin</a></li>
                <li>scoreAdmin</li>
              </ol>
            </section>
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-info">
                            <div class="box-header">
                                <h3 class="box-title col-md-7 col-sm-5 col-xs-12" style="min-height: 34.4px;line-height: 34.4px;">评分管理</h3>
                                <form class="form-inline col-md-5 col-sm-7 col-xs-12" action="<%=scoreSearchPath%>" method="post">
                                    <div class="form-group" style="margin-bottom: 0;">
                                        <input required="required" type="text" name="input" class="form-control" autocomplete="off" placeholder="请输入您要筛选的分数">
                                    </div>
                                    <button type="submit" class="btn btn-primary search" data-toggle="tooltip" data-placement="right" title="将筛选出该分数以下的所有商户">筛选</button>
                                </form>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <!-- 表格 -->
                                    <table class="table table-hover" id="scoreTable">
                                        <thead>
                                            <tr>
                                                <th>商户名称</th>
                                                <th>商户电话</th>
                                                <th>商户邮箱</th>
                                                <th>商户评分</th>
                                                <th>服务评分详情</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${empty scoreStoreList}">
                                                <tr>
                                                    <td colspan="5" align="center"><b>没有该类型厂商</b></td>
                                                </tr>
                                            </c:if>
                                            <c:if test="${scoreStoreList!=null}">
                                                <c:forEach var="scoreStore" items="${scoreStoreList}">
                                                    <tr>
                                                        <td hidden="hidden"><c:out value="${scoreStore.storeId}"/></td>
                                                        <td class="select"><c:out value="${scoreStore.storeName}"/></td>
                                                        <td class="select"><c:out value="${scoreStore.phone}"/></td>
                                                        <td class="select"><c:out value="${scoreStore.email}"/></td>
                                                        <td class="select"><c:if test="${scoreStore.grade==0}">未评分</c:if><c:if test="${scoreStore.grade!=0}">${scoreStore.grade}</c:if></td>
                                                        <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#check">查看</button></td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                        </tbody>
                                    </table>
                                </div>
                                <div style="display: inline-block;">
                                    <c:if test="${empty scoreStoreList}">
                                        <form style="display: inline-block;">
                                            <button type="button" class="btn btn-warning" disabled>黄色警告</button>
                                        </form>
                                        <form style="display: inline-block;">
                                            <button type="button" class="btn btn-danger" disabled>红色警告</button>
                                        </form>
                                        <button type="button" class="btn btn-primary" disabled>发送消息</button>
                                    </c:if>
                                    <c:if test="${!empty scoreStoreList}">
                                        <form style="display: inline-block;">
                                            <button type="button" class="btn btn-warning" id="yellow" data-toggle="modal" data-target="#yellowAction">黄色警告</button>
                                        </form>
                                        <form style="display: inline-block;">
                                            <button type="button" class="btn btn-danger" id="red" data-toggle="modal" data-target="#redAction">红色警告</button>
                                        </form>
                                        <button type="button" class="btn btn-primary" data-toggle="modal" id="handleNews">发送消息</button>
                                    </c:if>
                                </div>
                                <div id="scoreAdmin-page" style="float: right"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 模态框 -->
                <div class="modal fade" id="message" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="checkLabel" style="font-weight: bold;">发送消息</h4>
                            </div>
                            <form action="<%=scoreNewsPath%>" method="post">
                                <div class="modal-body" id="newsBody">
                                    <div class="form-group">
                                        <label for="type">类别</label>
                                        <select class="form-control" id="type" name="type">
                                            <option>公告通知</option>
                                            <option>活动消息</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="index">内容</label>
                                        <textarea name="content" class="form-control" rows="8" id="index" placeholder="请输入您要发送的消息" style="resize: none;"></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">发送</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- 模态框-0提示 -->
                <div class="modal fade bs-example-modal-sm" id="0-notice" tabindex="-1" role="dialog">
                    <div class="modal-dialog modal-sm" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">提示</h4>
                            </div>
                            <div class="modal-body">
                                <p>请至少选择一个商户</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 黄色模态框提示 -->
                <div class="modal fade bs-example-modal-sm" id="yellowAction" tabindex="-1" role="dialog">
                    <div class="modal-dialog modal-sm" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">提示</h4>
                            </div>
                            <div class="modal-body">
                                <p>确定将该商户置为黄色预警？</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-info" id="yellow-btn">确定</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 红色模态框提示 -->
                <div class="modal fade bs-example-modal-sm" id="redAction" tabindex="-1" role="dialog">
                    <div class="modal-dialog modal-sm" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">提示</h4>
                            </div>
                            <div class="modal-body">
                                <p>确定将该商户置为红色预警？</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-info" id="red-btn">确定</button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>

    <!-- jQuery 3 -->
    <script src="../../../resources/js/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="../../../resources/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../../../resources/js/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="../../../resources/js/adminlte.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="../../../resources/js/demo.js"></script>
    <!-- page script -->
    <script src="../../../resources/layui.js"></script>
    <script type="text/javascript">
        var input='${input}';
        var pages=${pages};
        var portPath = "<%=portPath%>";
        var currentPage = 1;
        $(function(){
            layui.use('laypage', function(){
                var laypage = layui.laypage;

                //执行一个laypage实例
                laypage.render({
                    elem: 'scoreAdmin-page'
                    ,count: pages*2 //数据总数，从服务端得到
                    ,limit: 2
                    ,theme: '#3c8dbc'
                    ,groups: 4
                    ,jump: function(obj, first){
                        if(!first){
                            currentPage = obj.curr;
                            var href=portPath+"admin/scoreAdmin.do?";
                            if(input=='none'){
                                href+='currentPage='+currentPage;
                                changePage(href);
                            }
                            else{
                                href+='input='+input;
                                href +='&currentPage='+currentPage;
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
                        createScoreStores(data);
                    },
                    error: function(jqXHR){
                        alert("发生错误：" + jqXHR.status);
                        currentPage = 1;
                    }
                });
            }

            function createScoreStores(data) {
                var table=$('#scoreTable');
                table.find('thead').remove();
                table.find('tbody').remove();
                var theadNode='<thead><tr><th>商户名称</th><th>商户电话</th><th>商户邮箱</th><th>商户评分</th><th>服务评分详情</th></tr></thead><tbody>';
                table.append(theadNode);
                for(var i=0;i<data.list.length;i++){
                    var storeId=data.list[i].storeId;
                    var storeName=data.list[i].storeName;
                    var phone=data.list[i].phone;
                    var email=data.list[i].email;
                    var grade=data.list[i].grade;
                    var node1='<tr><td hidden="hidden">'+storeId+'</td><td class="select">'+storeName+'</td>' +
                        '<td class="select">'+phone+'</td><td class="select">'+email+'</td><td class="select">';
                    var node2;
                    if(grade==0){
                        node2="未评分";
                    }
                    else{
                        node2=grade;
                    }
                    var node3='</td>' +
                        '<td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#check">查看</button></td></tr>';
                    var node=node1+node2+node3;
                    table.append(node);
                }
                table.append('</tbody>');
                initTableCheckbox();
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

            $('#yellow-btn').click(function () {
                var checked=$("tbody input:checked");
                var yellow=[];
                checked.each(function () {
                    yellow.push($(this).parent().parent().children("td").eq(1).html());
                });
                $.ajax({
                    url :portPath + 'admin/storeYellow.do',
                    type : "get",
                    traditional: true,
                    data:{yellowStoreId:yellow},
                    async: false,
                    error: function(jqXHR){
                        alert("发生错误：" + jqXHR.status);
                    }
                });
                window.location.href=portPath+"admin/scoreAdmin.html";
            });

            $('#red-btn').click(function () {
                var checked=$("tbody input:checked");
                var red=[];
                checked.each(function () {
                    red.push($(this).parent().parent().children("td").eq(1).html());
                });
                $.ajax({
                    url :portPath + 'admin/storeRed.do',
                    type : "get",
                    traditional: true,
                    data:{redStoreId:red},
                    async: false,
                    error: function(jqXHR){
                        alert("发生错误：" + jqXHR.status);
                    }
                });
                window.location.href=portPath+"admin/scoreAdmin.html";
            });

            $('#handleNews').click(function () {
                var checked=$("tbody input:checked");
                if(checked.length==0){
                    $("#0-notice").modal("show");
                }
                else{
                    $("#message").modal("show");
                }
                checked.each(function () {
                    var id=$(this).parent().parent().children("td").eq(1).html();
                    var node='<input type="text" name="scoreIds" hidden="hidden" value="'+id+'"/>';
                    $('#newsBody').append(node);
                });
            });
        });
    </script>
</body>
</html>