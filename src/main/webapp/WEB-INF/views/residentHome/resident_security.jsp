<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String portPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
	String updatePath = portPath+"userResident/updateHeadImg.do";
	String formPath = portPath+"userResident/updateSecurity.do";
	String passwordPath = portPath+"userResident/updatePassword.do";
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
	<script src="../../../resources/js/md5.js"></script>
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
					<a href="<%=portPath%>userResident/information/${user.userid}"><img src="${user.headImg}" onerror="this.src='http://t.cn/RCzsdCq'" class="layui-nav-img">${user.userName}</a>
					<dl class="layui-nav-child">
						<dd><a href="<%=portPath%>userResident/information/${user.userid}">个人中心</a></dd>
						<dd><a href="<%=portPath%>userResident/message.html">消息中心<span class="layui-badge">${feedbackNum}</span></a></dd>
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
    			<a href="<%=portPath%>userResident/information/${user.userid}"><li><i class="iconfont">&#xe64d;</i> 我的信息</li></a>
    			<li class="layui-this"><i class="iconfont">&#xe643;</i> 账号安全</li>
    			<a href="<%=portPath%>userResident/order.html"><li><i class="iconfont">&#xe6c1;</i> 我的订单</li></a>
    			<a href="<%=portPath%>userResident/focus/${user.userid}"><li><i class="iconfont">&#xe611;</i> 我关注的</li></a>
    			<a href="<%=portPath%>userResident/refund.html"><li><i class="iconfont">&#xe614;</i> 退款详情</li></a>
				<a href="<%=portPath%>userResident/message.html"><li><i class="iconfont">&#xe694;</i> 消息中心</li></a>
  			</ul>
  			<div class="layui-tab-content">
  				<!-- 我的信息 -->
    			<div class="layui-tab-item tab1">
    			</div>
    			<!-- 账号安全 -->
    			<div class="layui-tab-item layui-show tab2">
    				<h3><i class="iconfont title">&#xe669;</i> 绑定邮箱</h3>
    				<hr class="layui-bg-green">
    				<!-- 绑定邮箱 -->
    				<div class="layui-container email">
    					<form  class="layui-form" action="<%=formPath%>" method="post">
	    					<div class="layui-form-item">
	    						<div class="layui-col-md6 layui-col-sm6 layui-col-xs12">
		    						<label class="layui-form-label">邮箱：</label>
		    						<div class="layui-input-block">
		      							<input type="text" name="email" required  lay-verify="required" placeholder="请输入邮箱" autocomplete="off" class="layui-input" value="${user.email}">
		    						</div>
		    					</div>
		    					<div class="layui-col-md6 layui-col-sm6 layui-col-xs12">
		    						<div class="layui-input-block">
		      							<button class="layui-btn layui-btn-radius" lay-submit lay-filter="">
		      								<i class="iconfont">&#xe62b;</i> 保存修改
		      							</button>
		    						</div>
		    					</div>
		    					<div class="layui-col-md6 layui-col-sm6 layui-col-xs12">
		    						<div class="layui-input-block">
		      							<p class="error" style="display: none">邮箱格式错误</p>
		    						</div>
		    					</div>
	    					</div>
    					</form>
    				</div>
    				<h3><i class="iconfont title">&#xe644;</i> 绑定手机</h3>
    				<hr class="layui-bg-green">
    				<!-- 绑定手机 -->
    				<div class="layui-container tel">
						<form  class="layui-form" action="<%=formPath%>" method="post">
	    					<div class="layui-form-item">
	    						<div class="layui-col-md6 layui-col-sm6 layui-col-xs12">
		    						<label class="layui-form-label">手机号：</label>
		    						<div class="layui-input-block">
		      							<input type="text" name="phone" required  lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input" value="${user.phone}">
		    						</div>
		    					</div>
		    					<div class="layui-col-md6 layui-col-sm6 layui-col-xs12">
		    						<div class="layui-input-block">
		      							<button class="layui-btn layui-btn-radius" lay-submit lay-filter="">
		      								<i class="iconfont">&#xe62b;</i> 保存修改
		      							</button>
		    						</div>
		    					</div>
		    					<div class="layui-col-md6 layui-col-sm6 layui-col-xs12">
		    						<div class="layui-input-block">
		      							<p class="error" style="display: none" >手机格式错误</p>
		    						</div>
		    					</div>
	    					</div>
    					</form>
    				</div>
    				<h3><i class="iconfont title">&#xe6b2;</i> 修改密码</h3>
    				<hr class="layui-bg-green">
    				<!-- 修改密码 -->
    				<div class="layui-container password">
						<form  class="layui-form" action="<%=passwordPath%>" method="post">
    						<!-- 原密码 -->
	    					<div class="layui-form-item">
	    						<div class="layui-col-md6 layui-col-sm6 layui-col-xs12">
		    						<label class="layui-form-label">原密码：</label>
		    						<div class="layui-input-block">
		      							<input type="password"  required  lay-verify="required" placeholder="请输入原密码" autocomplete="off" class="layui-input" id="oldPassword">
		    						</div>
		    					</div>
		    					<div class="layui-col-md6 layui-col-sm6 layui-col-xs12">
		    						<div class="layui-input-block">
		      							<p class="error" style="display: none">原密码错误</p>
		    						</div>
		    					</div>
	    					</div>
	    					<!-- 新密码 -->
	    					<div class="layui-form-item">
	    						<div class="layui-col-md6 layui-col-sm6 layui-col-xs12">
		    						<label class="layui-form-label">新密码：</label>
		    						<div class="layui-input-block">
		      							<input type="password" name="password" required  lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input" id="password">
		    						</div>
		    					</div>
		    					<div class="layui-col-md6 layui-col-sm6 layui-col-xs12">
		    						<div class="layui-input-block">
		      							<p class="error" style="display: none">密码不得小于x位</p>
		    						</div>
		    					</div>
	    					</div>
	    					<!-- 确认密码 -->
	    					<div class="layui-form-item">
	    						<div class="layui-col-md6 layui-col-sm6 layui-col-xs12">
		    						<label class="layui-form-label">确认密码：</label>
		    						<div class="layui-input-block">
		      							<input type="password"  required  lay-verify="required" placeholder="请确认密码" autocomplete="off" class="layui-input" id="rePassword">
		    						</div>
		    					</div>
		    					<div class="layui-col-md6 layui-col-sm6 layui-col-xs12">
		    						<div class="layui-input-block">
		      							<p class="error" style="display: none">两次输入的密码不一致</p>
		    						</div>
		    					</div>
	    					</div>
	    					<!-- 提交 -->
	    					<div class="layui-form-item">
    							<div class="layui-input-block">
     								<button class="layui-btn" lay-submit lay-filter="">
     									<i class="iconfont">&#xe62b;</i> 保存修改
     								</button>
    							</div>
  							</div>
						</form>
    				</div>
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
					<img id="head-img">
				</div>
		</div>
	</div>
	</div>
</body>
<script>
    var registNum = "${user.registNum}";
    var headImg = "${user.headImg}";
    var updatePath = "<%=updatePath%>";
    var userPassword = "${user.password}";
	var oldPassword = $("#oldPassword");
	var password = $("#password");
	var rePassword = $("#rePassword");
	oldPassword.blur(function (e) {
		var value = hex_md5($(this).val());
		if(value != userPassword){
		    $(".error:eq(2)").show();
		}else {
            $(".error:eq(2)").hide();
		}
    });
	rePassword.blur(function (e) {
		var passwordVal = password.val();
		var rePasswordVal = rePassword.val();
		if(passwordVal != rePasswordVal){
		    $(".error:eq(4)").show();
		}else {
            $(".error:eq(4)").hide();
		}

    })
</script>
</html>