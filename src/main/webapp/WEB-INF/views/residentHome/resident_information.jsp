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
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p>您好，何华峰无耻老贼</p></div>
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p class="address">住址：浙江省&nbsp杭州市&nbsp浙江科技学院东和公寓5幢</p></div>
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12"><p class="autograph">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste numquam labore, est voluptates impedit architecto eos eius corporis, id beatae tempore in, iusto. Animi totam blanditiis a, doloremque commodi placeat!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam culpa enim omnis repellat architecto natus.</p></div>
					</div>
				</div>
				<div class="layui-col-md2 layui-col-sm4 layui-col-xs4">
					<span class="head-wrap">
						<img src="http://t.cn/RCzsdCq">
						<span class="head-mask"><a href="javascrapt:">修改头像</a></span>
					</span>
				</div>
			</div>
		</div>
		<div class="layui-tab layui-tab-brief">
  			<ul class="layui-tab-title">
    			<li class="layui-this"><i class="iconfont">&#xe64d;</i> 我的信息</li>
    			<a href="<%=portPath%>userResident/security.html"><li><i class="iconfont">&#xe643;</i> 账号安全</li></a>
    			<a href="<%=portPath%>userResident/order.html"><li><i class="iconfont">&#xe6c1;</i> 我的订单</li></a>
    			<a href="<%=portPath%>userResident/focus.html"><li><i class="iconfont">&#xe611;</i> 我关注的</li></a>
    			<a href="<%=portPath%>userResident/refund.html"><li><i class="iconfont">&#xe614;</i> 退款详情</li></a>
  			</ul>
  			<div class="layui-tab-content">
  				<!-- 我的信息 -->
    			<div class="layui-tab-item layui-show tab1">
    				<h3><i class="iconfont title">&#xe60d;</i> 个人资料</h3>
    				<hr class="layui-bg-green">
    				<div class="layui-container">
    					<form class="layui-form" action="">
    						<!-- 昵称 -->
    						<div class="layui-form-item">
    							<div class="layui-col-md6 layui-col-sm6 layui-col-xs12">
	    							<label class="layui-form-label">昵称：</label>
	    							<div class="layui-input-block">
	      								<input type="text" name="" required  lay-verify="required" placeholder="请输入昵称" autocomplete="off" class="layui-input">
	    							</div>
	    						</div>
	    						<div class="layui-col-md6 layui-col-sm6 layui-col-xs12">
	    							<div class="layui-input-block">
	      								<p class="name-log">注：昵称要遵循XXXX格式</p>
	    							</div>
	    						</div>
    						</div>
    						<!-- 登记号 -->
    						<div class="layui-form-item">
    							<div class="layui-col-md6 layui-col-sm6 layui-col-xs12">
	    							<label class="layui-form-label">登记号：</label>
	    							<div class="layui-input-block">
	      								<input type="text" name="" required  lay-verify="required" value="1234233-3435" autocomplete="off" class="layui-input" disabled>
	    							</div>
	    						</div>
    						</div>
    						<!-- 我的签名 -->
    						<div class="layui-form-item layui-form-text">
    							<div class="layui-col-md8 layui-col-sm8 layui-col-xs12">
	    							<label class="layui-form-label">我的签名：</label>
	    							<div class="layui-input-block">
	      								<textarea placeholder="请输入内容" class="layui-textarea" required lay-verify="required" style="resize:none;"></textarea>
	    							</div>
	    						</div>
  							</div>
  							<!-- 性别 -->
  							<div class="layui-form-item">
    							<label class="layui-form-label">性别：</label>
    							<div class="layui-input-block">
      								<input type="radio" name="sex" value="男" title="男">
      								<input type="radio" name="sex" value="女" title="女">
      								<input type="radio" name="sex" value="保密" title="保密" checked>
    							</div>
  							</div>
  							<!-- 出生日期 -->
							<div class="layui-form-item">
								<div class="layui-col-md6 layui-col-sm6 layui-col-xs12">
									<label class="layui-form-label">出生日期：</label>
									<div class="layui-input-block">
										<input type="text" class="layui-input" id="date" required lay-verify="required" placeholder="请选择出生日期
										" autocomplete="off">
									</div>
								</div>
							</div>
							<!-- 所处社区 -->
							<div class="layui-form-item">
    							<div class="layui-col-md6 layui-col-sm6 layui-col-xs12">
	    							<label class="layui-form-label">所处社区：</label>
	    							<div class="layui-input-block">
	      								<input type="text" name="" required  lay-verify="required" placeholder="请输入您的社区" autocomplete="off" class="layui-input">
	    							</div>
	    						</div>
    						</div>
    						<!-- 所在地 -->
    						<div class="layui-form-item">
    							<div class="layui-col-md3 layui-col-sm6 layui-col-xs12">
    								<label class="layui-form-label">所在地：</label>
    								<div class="layui-input-block">
    									<select name="" required lay-verify="required" id="province">
											<option value="">省</option>
											<option value="1">浙江</option>
										</select>
									</div>
									<div class="layui-input-block">
										<select name="" required lay-verify="required" id="city">
											<option value="">市</option>
											<option value="1">杭州</option>
											<option value="2">温州</option>
											<option value="3">台州</option>
										</select>
    								</div>
    							</div>
    						</div>
    						<!-- 提交 -->
    						<div class="layui-form-item">
    							<div class="layui-input-block">
     								<button class="layui-btn" lay-submit lay-filter="">
     									<i class="iconfont">&#xe62b;</i> 保存
     								</button>
    							</div>
  							</div>
    					</form>
    				</div>
    			</div>
    			<!-- 账号安全 -->
    			<div class="layui-tab-item tab2">
    			</div>
    			<!-- 我的订单 -->
    			<div class="layui-tab-item tab3">
    			</div>
    			<!-- 我关注的 -->
    			<div class="layui-tab-item tab4">
    			</div>
    			<!-- 退款详情 -->
    			<div class="layui-tab-item tab5">
    			</div>
  			</div>
		</div>
	</div>
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
</body>
</html>