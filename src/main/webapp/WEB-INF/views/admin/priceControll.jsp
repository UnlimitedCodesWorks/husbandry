<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String portPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
    String pageSearchPath=portPath+"admin/pageSearch.do";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>智慧社区-价格调控</title>
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
                    <li class="active">
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
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-pie-chart"></i>
                            <span>评分系统</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="<%=portPath%>admin/scoreAdmin.html"><i class="fa fa-circle-o"></i>评分管理</a></li>
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
                <small>Price controll</small>
              </h1>
              <ol class="breadcrumb">
                <li><a><i class="fa fa-dashboard"></i> Husbandry</a></li>
                <li><a>admin</a></li>
                <li>price</li>
              </ol>
            </section>
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-info">
                            <div class="box-header with-border">
                                <i class="fa fa-bar-chart-o"></i>
                                <h3 class="box-title">家政系统实时市场价</h3>
                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                    </button>
                                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                </div>
                                <div class="box-body">
                                  <div id="bar-chart" style="height: 500px;"></div>
                                </div>
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
    <!-- FLOT CHARTS -->
    <script src="../../../resources/js/jquery.flot.js"></script>
    <!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
    <script src="../../../resources/js/jquery.flot.resize.js"></script>
    <!-- FLOT PIE PLUGIN - also used to draw donut charts -->
    <script src="../../../resources/js/jquery.flot.pie.js"></script>
    <!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
    <script src="../../../resources/js/jquery.flot.categories.js"></script>
    <!-- Page script -->
    <script>
        var priceList=${priceList};
        var bar_data = {
          data : [['保姆', priceList[0]], ['月嫂', priceList[1]], ['涉外家政', priceList[2]], ['钟点工', priceList[3]], ['老人陪护', priceList[4]], ['病人陪护', priceList[5]],['育婴师', priceList[6]],['催乳师', priceList[7]]],
          color: '#3c8dbc'
        }
        $.plot('#bar-chart', [bar_data], {
          grid  : {
            borderWidth: 1,
            borderColor: '#f3f3f3',
            tickColor  : '#f3f3f3'
          },
          series: {
            bars: {
              show    : true,
              barWidth: 0.5,
              align   : 'center'
            }
          },
          xaxis : {
            mode      : 'categories',
            tickLength: 0
          }
        })
    </script>
</body>
</html>