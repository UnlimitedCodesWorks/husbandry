<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ServiceAdmin</title>
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
    <link rel="stylesheet" type="text/css" href="../../../resources/css/zoomify.min.css">
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
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-files-o"></i>
                            <span>商户管理</span>
                            <span class="pull-right-container">
                                <span class="label label-primary pull-right">${unPassStoreNum}</span>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="/admin/waitStore.html"><i class="fa fa-circle-o"></i>商户认证</a></li>
                            <li><a href="/admin/useStore.html"><i class="fa fa-circle-o"></i>商户操作</a></li>
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
                    <li class="treeview active">
                        <a href="#">
                            <i class="fa fa-laptop"></i>
                            <span>服务系统</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="active"><a href="/admin/serviceAdmin.html"><i class="fa fa-circle-o"></i>服务管理</a></li>
                        </ul>
                    </li>
                </ul>
            </section>
        </aside>
        <div class="content-wrapper">
            <section class="content-header">
              <h1>
                HusBanDry
                <small>Service Admin</small>
              </h1>
              <ol class="breadcrumb">
                <li><a><i class="fa fa-dashboard"></i> Husbandry</a></li>
                <li><a>admin</a></li>
                <li>serviceAdmin</li>
              </ol>
            </section>
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-info">
                            <div class="box-header">
                                <h3 class="box-title col-md-7 col-sm-5 col-xs-12" style="min-height: 34.4px;line-height: 34.4px;">服务管理</h3>
                                <form class="form-inline col-md-5 col-sm-7 col-xs-12">
                                    <div class="form-group" style="margin-bottom: 0;">
                                        <input type="text" class="form-control" placeholder="请输入商户名" autocomplete="off">
                                    </div>
                                    <button type="button" class="btn btn-primary search">搜索</button>
                                </form>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <!-- 表格 -->
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>商户名称</th>
                                                <th>服务名称</th>
                                                <th>服务类型</th>
                                                <th>服务详细信息</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="select">华峰国际有限公司</td>
                                                <td class="select">华峰服务</td>
                                                <td class="select">大保健</td>
                                                <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#check">查看</button></td>
                                            </tr>
                                            <tr>
                                                <td class="select">华峰国际有限公司非洲分公司</td>
                                                <td class="select">华峰非洲服务</td>
                                                <td class="select">奆保健</td>
                                                <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#check">查看</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div style="display: inline-block;">
                                    <button type="button" class="btn btn-primary">同意</button>
                                    <button type="button" class="btn btn-danger">拒绝</button>
                                </div>
                                <div id="serviceAdmin-page" style="float: right"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 模态框 -->
                <div class="modal fade" id="check" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="checkLabel" style="font-weight: bold;">服务详情</h4>
                            </div>
                            <div class="modal-body">
                                <h4>服务LOGO图</h4>
                                <hr>
                                <div>
                                    <img src="../../../resources/images/backloginimg.jpg" style="width: 100%;">
                                </div>
                                <h4>服务基本信息</h4>
                                <hr>
                                <form class="form-horizontal">
                                    <div class="form-group">
                                        <label for="service-name" class="col-sm-3 control-label">服务名</label>
                                        <div class="col-sm-8 col-xs-12 input-group">
                                            <input class="form-control" id="service-name" value="华峰服务" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="price-name" class="col-sm-3 control-label">服务价格</label>
                                        <div class="col-sm-8 input-group">
                                            <input class="form-control" id="price-name" value="2000" readonly>
                                            <span class="input-group-addon">/小时</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="tel" class="col-sm-3 control-label">负责人联系方式</label>
                                        <div class="col-sm-8 col-xs-12 input-group">
                                            <input class="form-control" id="tel" value="88888888" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="detail" class="col-sm-3 control-label">服务详细信息</label>
                                        <div class="col-sm-8 col-xs-12 input-group">
                                            <textarea class="form-control" id="detail" rows="8" readonly style="resize: none;">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel, quidem odio excepturi commodi accusantium a minima unde cum eos, sapiente laudantium minus illum ab culpa nisi ducimus doloremque harum ipsa. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit voluptatem iste id illum quaerat aliquid tempore accusantium, libero error, cum, cumque deleniti, dolor ex? Blanditiis illo, accusamus necessitatibus sapiente eveniet! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam omnis nemo, assumenda, architecto molestias tempore sapiente ea blanditiis at dolore reiciendis, cum nisi? Nesciunt dolore, repudiandae magnam illo officia iusto.</textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">服务范围</label>
                                        <div class="col-sm-8 col-xs-12 input-group">
                                            <input class="form-control" class="range" value="浙江省杭州市" readonly>
                                            <input class="form-control" class="range" value="浙江省温州市" readonly>
                                            <input class="form-control" class="range" value="浙江省台州市" readonly>
                                            <input class="form-control" class="range" value="浙江省金华市" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="notice" class="col-sm-3 control-label">注意事项</label>
                                        <div class="col-sm-8 col-xs-12 input-group">
                                            <textarea class="form-control" id="notice" rows="8" readonly style="resize: none;">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel, quidem odio excepturi commodi accusantium a minima unde cum eos, sapiente laudantium minus illum ab culpa nisi ducimus doloremque harum ipsa. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit voluptatem iste id illum quaerat aliquid tempore accusantium, libero error, cum, cumque deleniti, dolor ex? Blanditiis illo, accusamus necessitatibus sapiente eveniet! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam omnis nemo, assumenda, architecto molestias tempore sapiente ea blanditiis at dolore reiciendis, cum nisi? Nesciunt dolore, repudiandae magnam illo officia iusto.</textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-12 control-label" style="text-align: center;">服务特色</label>
                                        <div class="col-sm-12 col-xs-12" style="margin-bottom: 5px;">
                                            <img src="../../../resources//images/鸣哥.jpg" style="width: 100%;">
                                        </div>
                                        <div class="col-sm-12 col-xs-12" style="margin-bottom: 5px;">
                                            <img src="../../../resources/images/鸣哥.jpg" style="width: 100%;">
                                        </div>
                                    </div>
                                </form>
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
    <script src="../../../resources/js/zoomify.min.js"></script>
    <script src="../../../resources/layui.js"></script>
    <script type="text/javascript">
        $(function(){
            $('#check img').zoomify({
                easing: "ease"
            });

            layui.use('laypage', function(){
                var laypage = layui.laypage;

                //执行一个laypage实例
                laypage.render({
                    elem: 'serviceAdmin-page'
                    ,count: 50 //数据总数，从服务端得到
                    ,limit: 10
                    ,theme: '#3c8dbc'
                });
            });

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
        });
    </script>
</body>
</html>