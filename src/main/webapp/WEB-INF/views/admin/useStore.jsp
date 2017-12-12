<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String portPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>UseStore</title>
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
                                <span class="hidden-xs">Super Admin</span>
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
                        <p>Super Admin</p>
                        <a><i class="fa fa-circle text-success"></i> Online</a>
                    </div>
                </div>
                <form action="#" method="get" class="sidebar-form">
                    <div class="input-group">
                    <input type="text" name="q" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
                        <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                        </button>
                    </span>
                    </div>
                </form>
                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header">MAIN NAVIGATION</li>
                    <li>
                        <a href="/admin/OperationOverview.html">
                            <i class="fa fa-th"></i><span>运营总揽</span>
                            <span class="pull-right-container">
                                <small class="label pull-right bg-red">new</small>
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="/admin/priceControll.html">
                            <i class="fa fa-signal"></i><span>价格调控</span>
                            <span class="pull-right-container">
                                <small class="label pull-right bg-green">new</small>
                            </span>
                        </a>
                    </li>
                    <li class="treeview active">
                        <a href="#">
                            <i class="fa fa-files-o"></i>
                            <span>商户管理</span>
                            <span class="pull-right-container">
                                <span class="label label-primary pull-right">${unPassStoreNum}</span>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="/admin/waitStore.html"><i class="fa fa-circle-o"></i>商户认证</a></li>
                            <li class="active"><a href="/admin/useStore.html"><i class="fa fa-circle-o"></i>商户操作</a></li>
                        </ul>
                    </li>
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-pie-chart"></i>
                            <span>评分系统</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="/admin/scoreAdmin.html"><i class="fa fa-circle-o"></i>评分管理</a></li>
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
                            <li><a href="/admin/serviceAdmin.html"><i class="fa fa-circle-o"></i>服务管理</a></li>
                        </ul>
                    </li>
                </ul>
            </section>
        </aside>
        <div class="content-wrapper">
            <section class="content-header">
              <h1>
                HusBanDry
                <small>Use store</small>
              </h1>
              <ol class="breadcrumb">
                <li><a><i class="fa fa-dashboard"></i> Husbandry</a></li>
                <li><a>admin</a></li>
                <li>useStore</li>
              </ol>
            </section>
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-info">
                            <div class="box-header">
                                <h3 class="box-title col-md-7 col-sm-5 col-xs-12" style="min-height: 34.4px;line-height: 34.4px;">商户操作</h3>
                                <form class="form-inline col-md-5 col-sm-7 col-xs-12" action="/admin/storeSearch.do" method="post">
                                    <div class="form-group" style="margin-bottom: 0;">
                                        <input name="input" type="text" class="form-control" placeholder="请输入商户名" autocomplete="off">
                                    </div>
                                    <button type="submit" class="btn btn-primary search">搜索</button>
                                </form>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <!-- 表格 -->
                                    <table class="table table-hover" id="useTable">
                                        <thead>
                                            <tr>
                                                <th style="width: 15%;">商户名称</th>
                                                <th style="width: 10%;">商户电话</th>
                                                <th style="width: 10%;">商户邮箱</th>
                                                <th style="width: 55%;">厂商详细信息</th>
                                                <th style="width: 10%;">注册时间</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${empty useStoreList}">
                                                <tr>
                                                    <td colspan="5" align="center"><b>没有该类型厂商</b></td>
                                                </tr>
                                            </c:if>
                                            <c:if test="${useStoreList!=null}">
                                                <c:forEach items="${useStoreList}" var="useStore">
                                                    <tr>
                                                        <td hidden="hidden"><c:out value="${useStore.storeId}"/></td>
                                                        <td><c:out value="${useStore.storeName}"/></td>
                                                        <td><c:out value="${useStore.phone}"/></td>
                                                        <td><c:out value="${useStore.email}"/></td>
                                                        <td><c:out value="${useStore.detailInfo}"/></td>
                                                        <td><c:out value="${useStore.registTime}"/></td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                        </tbody>
                                    </table>
                                </div>
                                <div style="display: inline-block;">
                                    <button type="button" class="btn btn-danger" id="cancel">撤销厂商资格</button>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" id="handleNews">发送消息</button>
                                </div>
                                <div id="useStore-page" style="float: right"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 模态框-发送消息 -->
                <div class="modal fade" id="message" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="checkLabel" style="font-weight: bold;">发送消息</h4>
                            </div>
                            <form>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="type">类别</label>
                                        <select class="form-control" id="type">
                                            <option>公告通知</option>
                                            <option>活动消息</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="index">内容</label>
                                        <textarea class="form-control" rows="8" id="index" placeholder="请输入您要发送的消息" style="resize: none;"></textarea>
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
                <!-- 模态框->1 -->
                <div class="modal fade bs-example-modal-sm" id="1-notice" tabindex="-1" role="dialog">
                    <div class="modal-dialog modal-sm" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">提示</h4>
                            </div>
                            <div class="modal-body">
                                <p>只能选择一个商店进行消息发送</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
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
                    elem: 'useStore-page'
                    ,count: 2*pages //数据总数，从服务端得到
                    ,limit: 2
                    ,theme: '#3c8dbc'
                    ,groups: 4
                    ,jump: function(obj, first){
                        if(!first){
                            currentPage = obj.curr;
                            var href=portPath+"admin/useStore.do?";
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
                        createUseStores(data);
                    },
                    error: function(jqXHR){
                        alert("发生错误：" + jqXHR.status);
                        currentPage = 1;
                    }
                });
            }
            
            function createUseStores(data) {
                var table=$('#useTable');
                table.find('thead').remove();
                table.find('tbody').remove();
                var theadNode='<thead>' +
                                  '<tr>' +
                                    '<th style="width: 15%;">商户名称</th>' +
                                    '<th style="width: 10%;">商户电话</th>' +
                                    '<th style="width: 10%;">商户邮箱</th>' +
                                    '<th style="width: 55%;">厂商详细信息</th>' +
                                    '<th style="width: 10%;">注册时间</th>' +
                                  '</tr>' +
                               '</thead><tbody>';
                table.append(theadNode);
                for(var i=0;i<data.list.length;i++){
                    var storeName=data.list[i].storeName;
                    var phone=data.list[i].phone;
                    var email=data.list[i].email;
                    var detailInfo=data.list[i].detailInfo;
                    var registerTime=data.list[i].registTime;
                    var storeId=data.list[i].storeId;
                    var node='<tr><td hidden="hidden">'+storeId+
                        '</td><td>'+storeName+
                        '</td><td>'+phone+
                        '</td><td>'+email+
                        '</td><td>'+detailInfo+
                        '</td><td>'+registerTime+'</td></tr>';
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
                $tbr.click(function(){
                    $(this).find('input').click();
                });
            }
            initTableCheckbox();

            $('#cancel').click(function () {
                var checked=$("tbody input:checked");
                var cancel=[];
                checked.each(function () {
                    cancel.push($(this).parent().parent().children("td").eq(1).html());
                })
                $.ajax({
                    url :portPath +'admin/cancelStore.do',
                    type : "get",
                    traditional: true,
                    data:{cancelStoreId:cancel},
                    async: false,
                    error: function(jqXHR){
                        alert("发生错误：" + jqXHR.status);
                    }
                });
                window.location.href="/admin/useStore.html";
            });

            $('#handleNews').click(function () {
                var checked=$("tbody input:checked");
                if(checked.length==0){
                    $("#0-notice").modal("show");
                }
                else if(checked.length>1){
                    $("#1-notice").modal("show");
                }
                else{
                    $("#message").modal("show");
                }
            });
        });
    </script>
</body>
</html>