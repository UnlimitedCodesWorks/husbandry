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
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script src="../../../resources/js/jquery-3.2.1.min.js"></script>
	<script src="../../../resources/layui.js"></script>
	<script src="../../../resources/js/vue.js"></script>
	<script src="../../../resources/js/residentHome.js"></script>
	<script src="../../../resources/js/particles.min.js"></script>
	<script src="../../../resources/js/cropper.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../resources/css/layui.css">
	<link rel="stylesheet" type="text/css" href="../../../resources/css/residentHome.css">
	<link rel="stylesheet" type="text/css" href="../../../resources/css/cropper.css">
	<title>智慧社区-居民个人中心</title>
</head>
<body>
	<header>
		<!-- 导航栏 -->
		<nav>
			<ul class="layui-nav">
				<li class="layui-nav-item ">
					<a href="<%=portPath%>index.html" title="Husbandry" >Husbandry</a>
				</li>
				<template v-if="isLogin">
					<li class="layui-nav-item">
						<a href="<%=portPath%>register.html" title="注册">注册</a>
					</li>
					<li class="layui-nav-item">
						<a href="<%=portPath%>login/user.html" title="登录">登录</a>
					</li>
				</template>
				<li class="layui-nav-item" v-else>
					<a href="<%=portPath%>userResident/information.html"><img src="${user.headImg}" onerror="this.src='http://t.cn/RCzsdCq'" class="layui-nav-img">${user.userName}</a>
					<dl class="layui-nav-child">
						<dd><a href="<%=portPath%>userResident/information.html">个人中心<span class="layui-badge-dot"></span></a></dd>
						<dd><a href="<%=portPath%>login/exit.do">登出</a></dd>
					</dl>
				</li>
			</ul>
		</nav>
	</header>
	<div class="layui-container" id="wrap">
		<div class="resident-index">
			<div class="layui-row">
				<div class="layui-col-md10 layui-col-sm8 layui-col-xs8">
					<div class="layui-row row-in">
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><h2>个人中心</h2></div>
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p>您好，${user.userName}</p></div>
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p class="address">住址：${user.cities.provinces.province}&nbsp${user.cities.city}&nbsp${user.community}</p></div>
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p class="autograph">${user.introduce}</p></div>
					</div>
				</div>
				<div class="layui-col-md2 layui-col-sm4 layui-col-xs4">
					<span class="head-wrap">
						<img src="${user.headImg}" onerror="this.src='http://t.cn/RCzsdCq'">
						<span class="head-mask"><a href="javascrapt:">修改头像</a></span>
					</span>
				</div>
			</div>
		</div>
		<div class="layui-tab layui-tab-brief">
  			<ul class="layui-tab-title">
    			<a href="<%=portPath%>userResident/information.html"><li><i class="iconfont">&#xe64d;</i> 我的信息</li></a>
    			<a href="<%=portPath%>userResident/security.html"><li><i class="iconfont">&#xe643;</i> 账号安全</li></a>
    			<a href="<%=portPath%>userResident/order.html"><li><i class="iconfont">&#xe6c1;</i> 我的订单</li></a>
    			<li class="layui-this"><i class="iconfont">&#xe611;</i> 我关注的</li>
    			<a href="<%=portPath%>userResident/refund.html"><li><i class="iconfont">&#xe614;</i> 退款详情</li></a>
  			</ul>
  			<div class="layui-tab-content">
  				<!-- 我的信息 -->
    			<div class="layui-tab-item tab1">
    			</div>
    			<!-- 账号安全 -->
    			<div class="layui-tab-item tab2">
    			</div>
    			<!-- 我的订单 -->
    			<div class="layui-tab-item tab3">
    			</div>
    			<!-- 我关注的 -->
    			<div class="layui-tab-item layui-show tab4">
    				<h3><i class="iconfont title">&#xe602;</i> 关注的服务</h3>
    				<hr class="layui-bg-green">
    				<!-- 关注的服务 -->
    				<div class="layui-container">
    					<div class="layui-row layui-col-space10">
    						<div class="layui-col-md3 layui-col-sm6 layui-col-xs12">
    							<div class="layui-row row-in" title="马杀鸡服务">
    								<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><img src="../../../resources/images/201291810101174356.jpg"></div>
    								<div class="layui-row row-in2">
										<div class="layui-col-md8 layui-col-sm8 layui-col-xs8"><a href="#" class="service-title">马杀鸡服务</a></div>
										<div class="layui-col-md4 layui-col-sm4 layui-col-xs4">评分：8.5分</div>
									</div>
									<div class="layui-row row-in3">
										<div class="layui-col-md6 layui-col-sm6 layui-col-xs6">2234关注</div>
										<div class="layui-col-md6 layui-col-sm6 layui-col-xs6">3454笔交易</div>
									</div>
    							</div>
    						</div>
    						<div class="layui-col-md3 layui-col-sm6 layui-col-xs12">
    							<div class="layui-row row-in" title="华峰服务">
    								<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><img src="../../../resources/images/家居9.jpg"></div>
    								<div class="layui-row row-in2">
										<div class="layui-col-md8 layui-col-sm8 layui-col-xs8"><a href="#" class="service-title">华峰服务</a></div>
										<div class="layui-col-md4 layui-col-sm4 layui-col-xs4">评分：9.5分</div>
									</div>
									<div class="layui-row row-in3">
										<div class="layui-col-md6 layui-col-sm6 layui-col-xs6">2234关注</div>
										<div class="layui-col-md6 layui-col-sm6 layui-col-xs6">3454笔交易</div>
									</div>
    							</div>
    						</div>
    					</div>
    					<div class="layui-row layui-col-space10">
    					</div>
    					<div class="layui-row">
    						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
    							<div id="service-page"></div>
    						</div>
    					</div>
    				</div>
    				<h3><i class="iconfont title">&#xe638;</i> 关注的服务商</h3>
    				<hr class="layui-bg-green">
    				<!-- 关注的服务商 -->
    				<div class="layui-container">
    					<div class="layui-row layui-col-space10">
    						<div class="layui-col-md3 layui-col-sm6 layui-col-xs12">
    							<div class="layui-row row-in" title="华峰国际有限公司">
    								<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><img src="../../../resources/images/201291810101174356.jpg"></div>
    								<div class="layui-row row-in2">
										<div class="layui-col-md8 layui-col-sm8 layui-col-xs8"><a href="#" class="store-title">华峰国际有限公司</a></div>
										<div class="layui-col-md4 layui-col-sm4 layui-col-xs4">评分：8.5分</div>
									</div>
									<div class="layui-row row-in3">
										<div class="layui-col-md6 layui-col-sm6 layui-col-xs6">2234关注</div>
										<div class="layui-col-md6 layui-col-sm6 layui-col-xs6">3454笔交易</div>
									</div>
    							</div>
    						</div>
    						<div class="layui-col-md3 layui-col-sm6 layui-col-xs12">
    							<div class="layui-row row-in" title="华峰国际有限公司非洲分公司">
    								<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><img src="../../../resources/images/家居9.jpg"></div>
    								<div class="layui-row row-in2">
										<div class="layui-col-md8 layui-col-sm8 layui-col-xs8"><a href="#" class="store-title">华峰国际有限公司非洲分公司</a></div>
										<div class="layui-col-md4 layui-col-sm4 layui-col-xs4">评分：9.5分</div>
									</div>
									<div class="layui-row row-in3">
										<div class="layui-col-md6 layui-col-sm6 layui-col-xs6">2234关注</div>
										<div class="layui-col-md6 layui-col-sm6 layui-col-xs6">3454笔交易</div>
									</div>
    							</div>
    						</div>
    					</div>
    					<div class="layui-row layui-col-space10">
    					</div>
    					<div class="layui-row">
    						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
    							<div id="store-page"></div>
    						</div>
    					</div>
    				</div>
    			</div>
    			<!-- 退款详情 -->
    			<div class="layui-tab-item tab5">
    			</div>
  			</div>
		</div>
	</div>
	<form id="uploadForm" enctype="multipart/form-data">

	</form>
	<footer>
		<p>Husbandry-&copy2017</p>
	</footer>
	<div class="particles-wrap">
		<div id="particles-js"></div>
	</div>
	<!-- 头像 -->
	<div id="head">
		<div class="layui-fuild">
			<div class="layui-row">
				<div class="layui-col-md6 layui-col-sm6 layui-col-xs6">
					<a href="javascript:" class="a-upload">
						<input type="file" name="" id="btn-upload"><i class="layui-icon">&#xe67c;</i> 选择图片
					</a>
				</div>
				<div class="layui-col-md6 layui-col-sm6 layui-col-xs6">
					<button class="layui-btn">
						<i class="iconfont">&#xe62b;</i> 修改
					</button>
				</div>
				<div class="layui-col-md12 layui-col-sm12 layui-col-xs12" id="head-img-wrap">
					<p>请选择一张图片</p>
					<img id="head-img">
				</div>
		</div>
	</div>
	</div>
</body>
<script>
    var registNum = "${user.registNum}";
    var headImg = "${user.headImg}";
</script>
</html>