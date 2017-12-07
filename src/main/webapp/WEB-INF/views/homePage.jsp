<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String portPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
	String searchPath = portPath + "search/view.html";
%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script src="../../resources/js/jquery-3.2.1.min.js"></script>
	<script src="../../resources/layui.js"></script>
	<script src="../../resources/js/vue.js"></script>
	<script src="../../resources/js/homePage.js"></script>
	<script src="../../resources/js/wow.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../../resources/css/layui.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/animate.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/homePage.css">
	<title>智慧社区-首页</title>
</head>
<body>
	<header>
		<!-- 导航栏 -->
		<nav>
			<ul class="layui-nav">
				<li class="layui-nav-item ">
					<a href="" title="Husbandry" >Husbandry</a>
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
    				<a href="javascript:;"><img src="http://t.cn/RCzsdCq" class="layui-nav-img">何华峰无耻老贼</a>
    				<dl class="layui-nav-child">
      					<dd><a href="javascript:;">个人中心<span class="layui-badge-dot"></span></a></dd>
      					<dd><a href="javascript:;">登出</a></dd>
    				</dl>
 	 			</li>
			</ul>
		</nav>
	</header>
	<div class="layui-home-bg">
		<img src="../../resources/images/201291810101174356.jpg">
		<div class="mask"></div>
		<div class="reWow-wrap" v-show="isFocus">
			<p class="bounceInLeft" v-bind:class="{reWow1: reWow1}">您可以搜索以下内容：</p>
			<p class="bounceInRight" v-bind:class="{reWow1: reWow1}">服务名&nbsp&nbsp&nbsp&nbsp服务商名</p>
		</div>
		<!-- 搜索框 -->
		<div class="layui-form-group">
			<form class="layui-anim layui-anim-scaleSpring" action="<%=searchPath%>">
				<input type="hidden" name="kind" value="0" />
				<input type="text" name="content" autocomplete="off" placeholder="请输入您要搜索的服务" required>
				<button type="submit"><i class="layui-icon">&#xe615;</i></button>
			</form>
		</div>
	</div>
	<div class="layui-service-wrap">
		<!-- 标题 -->
		<div class="layui-title wow bounceInLeft">
			<p class="title-cn">您也可以从以下服务类中<span>直接</span>查找</p>
			<hr>
			<p class="title-en">CHOOSE SERVICE YOU NEED TO FIND</p>
		</div>
		<!-- 服务 -->
		<div class="layui-container">
			<div class="layui-row layui-col-space10">
				<a href="<%=portPath%>search/view.html?kind=1" class="layui-col-md3 layui-col-sm3 layui-col-xs6 wow bounceInLeft">
					<div class="layui-row row-in">
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p><i class="iconfont">&#xe601;</i></p></div>
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p class="servive-title-cn">保姆</p></div>
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p class="servive-title-en">Nanny</p></div>
					</div>
				</a>
				<a href="<%=portPath%>search/view.html?kind=2" class="layui-col-md3 layui-col-sm3 layui-col-xs6 wow flipInX">
					<div class="layui-row row-in">
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p><i class="iconfont">&#xe639;</i></p></div>
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p class="servive-title-cn">月嫂</p></div>
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p class="servive-title-en">Maternity Matron</p></div>
					</div>
				</a>
				<a href="<%=portPath%>search/view.html?kind=3" class="layui-col-md3 layui-col-sm3 layui-col-xs6 wow flipInX">
					<div class="layui-row row-in">
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p><i class="iconfont">&#xe692;</i></p></div>
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p class="servive-title-cn">涉外家政</p></div>
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p class="servive-title-en">Foreign Domestic</p></div>
					</div>
				</a>
				<a href="<%=portPath%>search/view.html?kind=4" class="layui-col-md3 layui-col-sm3 layui-col-xs6 wow bounceInRight">
					<div class="layui-row row-in">
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p><i class="iconfont">&#xe6a6;</i></p></div>
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p class="servive-title-cn">钟点工</p></div>
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p class="servive-title-en">Hourly worker</p></div>
					</div>
				</a>
			</div>
			<div class="layui-row layui-col-space10">
				<a href="<%=portPath%>search/view.html?kind=5" class="layui-col-md3 layui-col-sm3 layui-col-xs6 wow bounceInLeft">
					<div class="layui-row row-in">
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p><i class="iconfont">&#xe61e;</i></p></div>
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p class="servive-title-cn">老人陪护</p></div>
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p class="servive-title-en">Aged Care</p></div>
					</div>
				</a>
				<a href="<%=portPath%>search/view.html?kind=6" class="layui-col-md3 layui-col-sm3 layui-col-xs6 wow flipInX">
					<div class="layui-row row-in">
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p><i class="iconfont">&#xe767;</i></p></div>
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p class="servive-title-cn">病人陪护</p></div>
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p class="servive-title-en">Patient Accompany</p></div>
					</div>
				</a>
				<a href="<%=portPath%>search/view.html?kind=7" class="layui-col-md3 layui-col-sm3 layui-col-xs6 wow flipInX">
					<div class="layui-row row-in">
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p><i class="iconfont">&#xe600;</i></p></div>
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p class="servive-title-cn">育婴师</p></div>
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p class="servive-title-en">Nursery Teacher</p></div>
					</div>
				</a>
				<a href="<%=portPath%>search/view.html?kind=8" class="layui-col-md3 layui-col-sm3 layui-col-xs6 wow bounceInRight">
					<div class="layui-row row-in">
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p><i class="iconfont">&#xe6a2;</i></p></div>
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p class="servive-title-cn">催乳师</p></div>
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p class="servive-title-en">Prolactin Division</p></div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<div class="layui-store-wrap">
		<!-- 标题 -->
		<div class="layui-title wow bounceInLeft">
			<p class="title-cn">热门<span>服务商</span></p>
			<hr>
			<p class="title-en">HOT SERVICE PROVIDER</p>
		</div>
		<!-- select -->
		<div class="layui-selector wow flipInX">
			<form name ="" class="layui-form" action="">
				<div class="layui-form-item">
		      		<select  lay-verify="required" lay-filter="test">
		        		<option value="0">综合排序</option>
		        		<option value="1">按评分排序</option>
		       			<option value="2">按人气排序</option>
		      		</select>
				</div>
			</form>
		</div>
		<!-- 服务商 -->
		<div class="layui-container wow bounceInUp reWow2" id="hotStore">
			<c:if test="${!empty storeIndexList}">
			<c:forEach var="i" begin="0" end="11" step="4">
			<div class="layui-row layui-col-space10">
			<c:forEach var="storeIndex" items="${storeIndexList}" begin="${i}" end="${i+3}">
					<div class="layui-col-md3 layui-col-sm6 layui-col-xs12">
				<div class="layui-row row-in" title="${storeIndex.storeName}">
					<div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
						<img src="${storeIndex.headImg}" onerror="this.src='../../resources/images/201291810101174356.jpg'" />
					</div>
					<div class="layui-row row-in2">
						<div class="layui-col-md8 layui-col-sm8 layui-col-xs8"><a href="#" class="store-title">${storeIndex.storeName}</a></div>
						<div class="layui-col-md4 layui-col-sm4 layui-col-xs4">评分：<c:if test="${storeIndex.grade==0}" >未评分</c:if><c:if test="${storeIndex.grade!=0}" >${storeIndex.grade}分</c:if></div>
					</div>
					<div class="layui-row row-in3">
						<div class="layui-col-md6 layui-col-sm6 layui-col-xs6">${storeIndex.fans}关注</div>
						<div class="layui-col-md6 layui-col-sm6 layui-col-xs6">${storeIndex.markNum}笔交易</div>
					</div>
				</div>
			</div>
			</c:forEach>
			</div>
			</c:forEach>
			</c:if>
		</div>
	</div>
	<footer>
		<p>Husbandry-&copy2017</p>
	</footer>
</body>
</html>
