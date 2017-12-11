<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String portPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
	String updatePath = portPath+"userResident/updateHeadImg.do";
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
    			<li class="layui-this"><i class="iconfont">&#xe6c1;</i> 我的订单</li>
    			<a href="<%=portPath%>userResident/focus.html"><li><i class="iconfont">&#xe611;</i> 我关注的</li></a>
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
    			<div class="layui-tab-item layui-show tab3">
    				<div class="layui-tab layui-tab-card">
  						<ul class="layui-tab-title">
    						<li class="layui-this">全部订单</li>
    						<li>待派遣</li>
    						<li>待确认</li>
    						<li>待评价</li>
  						</ul>
					  	<div class="layui-tab-content">
					  		<!-- 全部订单 -->
					    	<div class="layui-tab-item layui-show tab3-1">
					    		<div class="layui-container">
					    			<!-- 无订单 -->
					    			<div class="no-service">
					    				<p>您还没有预约过任何服务，快去预约吧！</p>
					    			</div>
					    		</div>
					    	</div>
					    	<!-- 待派遣 -->
					    	<div class="layui-tab-item tab3-1">
					    		<div class="layui-container">
					    			<div class="order-wrap">
					    				<hr>
					    				<!-- 公司名&关注 -->
					    				<div class="layui-row layui-col-space10 row1">
					    					<div class="layui-col-md10 layui-col-sm10 layui-col-xs12 name-wrap">
					    						<a href="javascrapt:">华峰国际有限公司</a>
					    						<p>订单状态：待派遣</p>
					    					</div>
					    					<div class="layui-col-md2 layui-col-sm2 layui-col-xs12">
					    						<button class="layui-btn">
					    							<i class="iconfont">&#xe611;</i> 关注服务
					    						</button>
					    					</div>
					    				</div>
					    				<div class="layui-row layui-col-space10 row2">
					    					<div class="layui-col-md3 layui-col-sm4 layui-col-xs12 img-wrap">
					    						<img src="../../../resources/images/家居9.jpg">
					    					</div>
					    					<!-- 服务名&描述 -->
					    					<div class="layui-col-md7 layui-col-sm8 layui-col-xs12">
					    						<div class="layui-row row2-1 layui-col-space10">
					    							<div class="layui-col-md8 layui-col-sm8 layui-col-xs12 service-wrap">
					    								<a href="javascrapt:">何华峰南美洲风格马杀鸡服务</a>
					    							</div>
					    							<div class="layui-col-md4 layui-col-sm4 layui-col-xs12 price-wrap">
					    								<p>￥1200.00</p>
					    							</div>
					    							<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 detail-wrap">
					    								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Culpa harum maiores repellat minima illo laudantium ducimus cumque facere ullam, facilis asperiores, dolore beatae libero doloribus tempora, architecto quo. Reprehenderit, omnis. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Id odit provident, nihil ad quis debitis, ipsam dicta libero, voluptates, explicabo non. Modi et eum reprehenderit odit, quis neque ipsum repellendus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Culpa soluta vitae voluptatum fugit quas nesciunt, praesentium provident nam minima, sed voluptate cum voluptatem, qui possimus in, iure facilis quam esse!</p>
					    							</div>
					    						</div>
					    					</div>
					    					<!-- 按钮组 -->
					    					<div class="layui-col-md2 layui-col-sm12 layui-col-xs12">
					    						<div class="layui-row layui-col-space10 row2-2">
					    							<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">
					    								<button class="layui-btn layui-btn-danger refund">
					    								 	<i class="iconfont">&#xe614;</i> 撤销订单
					    								</button>
					    							</div>
					    							<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">
					    								<button class="layui-btn layui-btn-normal check-progress">
					    									<i class="iconfont">&#xe608;</i> 查看服务进展
					    								</button>
					    							</div>
					    							<div class="layui-col-md12 layui-col-sm4 layui-col-xs12 fill">
					    							</div>
					    						</div>
					    					</div>
					    				</div>
					    			</div>
					    			<div id="all-page2"></div>
					    		</div>
					    	</div>
					    	<!-- 待确认 -->
					    	<div class="layui-tab-item tab3-1">
					    		<div class="layui-container">
					    			<div class="order-wrap">
					    				<hr>
					    				<!-- 公司名&关注 -->
					    				<div class="layui-row layui-col-space10 row1">
					    					<div class="layui-col-md10 layui-col-sm10 layui-col-xs12 name-wrap">
					    						<a href="javascrapt:">华峰国际有限公司</a>
					    						<p>订单状态：待确认</p>
					    					</div>
					    					<div class="layui-col-md2 layui-col-sm2 layui-col-xs12">
					    						<button class="layui-btn">
					    							<i class="iconfont">&#xe611;</i> 关注服务
					    						</button>
					    					</div>
					    				</div>
					    				<div class="layui-row layui-col-space10 row2">
					    					<div class="layui-col-md3 layui-col-sm4 layui-col-xs12 img-wrap">
					    						<img src="../../../resources/images/家居9.jpg">
					    					</div>
					    					<!-- 服务名&描述 -->
					    					<div class="layui-col-md7 layui-col-sm8 layui-col-xs12">
					    						<div class="layui-row row2-1 layui-col-space10">
					    							<div class="layui-col-md8 layui-col-sm8 layui-col-xs12 service-wrap">
					    								<a href="javascrapt:">马杀鸡服务</a>
					    							</div>
					    							<div class="layui-col-md4 layui-col-sm4 layui-col-xs12 price-wrap">
					    								<p>￥1200.00</p>
					    							</div>
					    							<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 detail-wrap">
					    								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Culpa harum maiores repellat minima illo laudantium ducimus cumque facere ullam, facilis asperiores, dolore beatae libero doloribus tempora, architecto quo. Reprehenderit, omnis. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Id odit provident, nihil ad quis debitis, ipsam dicta libero, voluptates, explicabo non. Modi et eum reprehenderit odit, quis neque ipsum repellendus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Culpa soluta vitae voluptatum fugit quas nesciunt, praesentium provident nam minima, sed voluptate cum voluptatem, qui possimus in, iure facilis quam esse!</p>
					    							</div>
					    						</div>
					    					</div>
					    					<!-- 按钮组 -->
					    					<div class="layui-col-md2 layui-col-sm12 layui-col-xs12">
					    						<div class="layui-row layui-col-space10 row2-2">
					    							<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">
					    								<button class="layui-btn layui-btn-danger refund">
					    									<i class="iconfont">&#xe614;</i> 撤销订单
					    								</button>
					    							</div>
					    							<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">
					    								<button class="layui-btn layui-btn-normal check-progress">
					    									<i class="iconfont">&#xe608;</i> 查看服务进展
					    								</button>
					    							</div>
					    							<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">
					    								<button class="layui-btn layui-btn-primary">
					    									<i class="iconfont confirm">&#xe6e2;</i> 确认订单
					    								</button>
					    							</div>
					    						</div>
					    					</div>
					    				</div>
					    			</div>
					    			<div id="all-page3"></div>
					    		</div>
					    	</div>
					    	<!-- 待评价 -->
					    	<div class="layui-tab-item tab3-1">
					    		<div class="layui-container">
					    			<div class="order-wrap">
					    				<hr>
					    				<!-- 公司名&关注 -->
					    				<div class="layui-row layui-col-space10 row1">
					    					<div class="layui-col-md10 layui-col-sm10 layui-col-xs12 name-wrap">
					    						<a href="javascrapt:">华峰国际有限公司</a>
					    						<p>订单状态：已确认</p>
					    					</div>
					    					<div class="layui-col-md2 layui-col-sm2 layui-col-xs12">
					    						<button class="layui-btn">
					    							<i class="iconfont">&#xe611;</i> 关注服务
					    						</button>
					    					</div>
					    				</div>
					    				<div class="layui-row layui-col-space10 row2">
					    					<div class="layui-col-md3 layui-col-sm4 layui-col-xs12 img-wrap">
					    						<img src="../../../resources/images/家居9.jpg">
					    					</div>
					    					<!-- 服务名&描述 -->
					    					<div class="layui-col-md7 layui-col-sm8 layui-col-xs12">
					    						<div class="layui-row row2-1 layui-col-space10">
					    							<div class="layui-col-md8 layui-col-sm8 layui-col-xs12 service-wrap">
					    								<a href="javascrapt:">马杀鸡服务</a>
					    							</div>
					    							<div class="layui-col-md4 layui-col-sm4 layui-col-xs12 price-wrap">
					    								<p>￥1200.00</p>
					    							</div>
					    							<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 detail-wrap">
					    								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Culpa harum maiores repellat minima illo laudantium ducimus cumque facere ullam, facilis asperiores, dolore beatae libero doloribus tempora, architecto quo. Reprehenderit, omnis. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Id odit provident, nihil ad quis debitis, ipsam dicta libero, voluptates, explicabo non. Modi et eum reprehenderit odit, quis neque ipsum repellendus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Culpa soluta vitae voluptatum fugit quas nesciunt, praesentium provident nam minima, sed voluptate cum voluptatem, qui possimus in, iure facilis quam esse!</p>
					    							</div>
					    						</div>
					    					</div>
					    					<!-- 按钮组 -->
					    					<div class="layui-col-md2 layui-col-sm12 layui-col-xs12">
					    						<div class="layui-row layui-col-space10 row2-2">
					    							<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">
					    								<button class="layui-btn layui-btn-danger delete">
					    									<i class="iconfont">&#xe615;</i> 删除订单
					    								</button>
					    							</div>
					    							<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">
					    								<button class="layui-btn layui-btn-normal check-progress">
					    									<i class="iconfont">&#xe608;</i> 查看服务进展
					    								</button>
					    							</div>
					    							<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">
					    								<button class="layui-btn layui-btn-primary">
					    									<i class="iconfont evaluate">&#xe62b;</i> 评价
					    								</button>
					    							</div>
					    						</div>
					    					</div>
					    				</div>
					    			</div>
					    			<div id="all-page4"></div>
					    		</div>
					    	</div>
					  	</div>
					</div>
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
	<!-- 服务进展 -->
	<div id="service-progress">
		<div class="layui-fluid">
			<!-- 状态 -->
			<div class="state layui-row">
				<hr class="layui-bg-green">
				<div class="layui-col-md4 layui-col-sm4 layui-col-xs4">
					<div class="state-detail"><p>派遣中</p></div>
				</div>
				<div class="layui-col-md4 layui-col-sm4 layui-col-xs4">
					<div class="state-detail"><p>已到达目的地</p></div>
				</div>
				<div class="layui-col-md4 layui-col-sm4 layui-col-xs4">
					<div class="state-detail"><p>订单交易成功</p></div>
				</div>
			</div>
			<hr>
			<!-- 员工 -->
			<h2 class="layui-col-md12 layui-col-sm12 layui-col-xs12">服务人员情况</h2>
			<div class="staff-wrap">
				<div class="staff layui-row row1 layui-col-space10">
					<div class="layui-col-md4 layui-col-sm4 layui-col-xs12 img-wrap">
						<img src="http://t.cn/RCzsdCq">
					</div>
					<div class="layui-col-md8 layui-col-sm12 layui-col-xs12">
						<div class="layui-row row2 layui-col-space10">
							<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">姓名：何华峰</p>
							<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">年龄：22</p>
							<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">性别：男</p>
							<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">体重：80kg</p>
							<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">身高：190cm</p>
							<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">民族：大和民族</p>
							<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">联系电话：13333333333</p>
							<p class="layui-col-md12 layui-col-sm12 layui-col-xs12">其他说明：Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quibusdam animi aliquam ex mollitia id maxime, ipsa rem fugit delectus optio molestiae alias facere dicta eius nostrum, voluptates molestias quod doloribus!</p>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<div class="staff-wrap">
				<div class="staff layui-row row1 layui-col-space10">
					<div class="layui-col-md4 layui-col-sm4 layui-col-xs12 img-wrap">
						<img src="http://t.cn/RCzsdCq">
					</div>
					<div class="layui-col-md8 layui-col-sm12 layui-col-xs12">
						<div class="layui-row row2 layui-col-space10">
							<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">姓名：何华峰</p>
							<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">年龄：22</p>
							<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">性别：男</p>
							<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">体重：80kg</p>
							<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">身高：190cm</p>
							<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">民族：大和民族</p>
							<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">联系电话：13333333333</p>
							<p class="layui-col-md12 layui-col-sm12 layui-col-xs12">其他说明：Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quibusdam animi aliquam ex mollitia id maxime, ipsa rem fugit delectus optio molestiae alias facere dicta eius nostrum, voluptates molestias quod doloribus! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolor vero, eius sint, itaque eum voluptate, consequatur quibusdam quo ratione dolores iure animi laudantium, natus neque quia vel provident perspiciatis sed.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 撤销订单 -->
	<div id="refund">
		<div class="layui-fluid">
			<h2 class="layui-col-md12 layui-col-sm12 layui-col-xs12">退款理由</h2>
			<hr>
			<form class="layui-form" action="">
  				<div class="layui-form-item layui-form-text">
      				<textarea placeholder="请输入您的退款理由" required lay-verify="required" class="layui-textarea" rows="6"></textarea>
      				<p>至少输入X个字</p>
      				<button class="layui-btn" lay-submit>提交</button>
  				</div>
  			</form>
		</div>
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
		<form id="uploadForm" enctype="multipart/form-data">

		</form>
</body>
<script>
    var registNum = "${user.registNum}";
    var headImg = "${user.headImg}";
    var updatePath = "<%=updatePath%>";
    var initHead = "${user.headImg}";
</script>
</html>