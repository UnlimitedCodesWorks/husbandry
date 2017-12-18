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
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script src="../../resources/js/jquery-3.2.1.min.js"></script>
	<script src="../../resources/js/jquery.raty.min.js"></script>
	<script src="../../resources/layui.js"></script>
	<script src="../../resources/js/vue.js"></script>
	<script src="../../resources/js/storeHome.js"></script>
	<script src="https://unpkg.com/element-ui/lib/index.js"></script>
	<script src="../../resources/js/particles.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../../resources/css/layui.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/storeHome.css">
	<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
	<title>智慧社区-商户中心</title>
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
					<c:if test="${!empty user}">
						<!-- 居民 -->
						<a href="<%=portPath%>userResident/information/${user.userid}"><img src="${user.headImg}" onerror="this.src='http://t.cn/RCzsdCq'" class="layui-nav-img">${user.userName}</a>
						<dl class="layui-nav-child">
							<dd><a href="<%=portPath%>userResident/information/${user.userid}">个人中心<span class="layui-badge-dot"></span></a></dd>
							<dd><a href="<%=portPath%>login/exit.do">登出</a></dd>
						</dl>
					</c:if>
					<!-- 商户 -->
					<c:if test="${!empty store}">
						<a href="<%=portPath%>store/information/${store.storeid}"><img src="${store.headImg}" onerror="this.src='http://t.cn/RCzsdCq'" class="layui-nav-img">${store.storeName}</a>
						<dl class="layui-nav-child">
							<dd><a href="<%=portPath%>store/information/${store.storeid}">商户中心<span class="layui-badge-dot"></span></a></dd>
							<dd><a href="<%=portPath%>store/information/${store.storeid}">商户后台</a></dd>
							<dd><a href="<%=portPath%>store/information/${store.storeid}">消息中心</a></dd>
							<dd><a href="<%=portPath%>login/exit.do">登出</a></dd>
						</dl>
					</c:if>
				</li>
			</ul>
		</nav>
	</header>
	<div class="layui-container" id="wrap">
		<!-- 头部信息 -->
		<div class="wrap-head">
			<hr>
			<!-- 大logo -->
			<div class="big-logo-wrap layui-fuild">
				<img src="${storeInfo.logoImg}" onerror="this.src='../../resources/images/家居9.jpg'">
			</div>
			<hr>
			<!-- 基本信息 -->
			<div class="layui-fuild">
				<!-- 头像&名字&评分&粉丝数&按钮组 -->
				<div class="layui-row layui-col-space10">
					<!-- 头像 -->
					<div class="layui-col-md2 layui-col-sm2">
						<div class="head-wrap">
							<img src="${storeInfo.headImg}" onerror="this.src='http://t.cn/RCzsdCq'">
						</div>
					</div>
					<!-- 名字&评分&粉丝&按钮组 -->
					<div class="layui-col-md10 layui-col-sm10">
						<div class="row layui-row layui-col-space10">
							<div class="layui-col-md6 layui-col-sm6">
								<div class="row-in layui-row layui-col-space10">
									<div class="layui-col-md12">
										<h3>${storeInfo.storeName}</h3>
									</div>
									<div class="layui-col-md12">
										<el-rate
	    									v-model="${storeInfo.grade}"
	  										disabled
					  						show-score
					  						text-color="#ff9900"
					  						score-template="${storeInfo.grade}">
				  						</el-rate>
									</div>
									<div class="layui-col-md12">
										<p>粉丝数：<span>${storeInfo.fans}</span></p>
									</div>
								</div>
							</div>
							<div class="layui-col-md6 layui-col-sm6">
								<div class="row-in2 layui-row layui-col-space10">
									<c:if test="${!empty user}">
									<div class="layui-col-md4 layui-col-sm12">
										<c:if test="${!userConcern}">
										<button class="layui-btn">
											<i class="iconfont">&#xe611;</i> 关注
										</button>
										</c:if>
										<c:if test="${userConcern}">
										<button class="layui-btn" style="background: #c2c2c2">
											<i class="iconfont">&#xe611;</i> 取消关注
										</button>
										</c:if>
									</div>
									<div class="layui-col-md4 layui-col-sm12">
										<button class="layui-btn layui-btn-danger">
											<i class="iconfont">&#xe66e;</i> 投诉
										</button>
									</div>
									</c:if>
									<c:if test="${!empty store}">
									<div class="layui-col-md4 layui-col-sm12">
										<button class="layui-btn layui-btn-normal">
											<i class="iconfont">&#xe722;</i> 后台管理
										</button>
									</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 所在地&邮箱&类别 -->
				<div class="layui-row layui-col-space10">
					<div class="information-wrap layui-col-md4 layui-col-sm4">
						<div class="information">
							<p><i class="iconfont">&#xe62a;</i> 所在地：<span>${storeInfo.areas.city.provinces.province} ${storeInfo.areas.city.city} ${storeInfo.areas.area}</span></p>
						</div>
					</div>
					<div class="information-wrap layui-col-md4 layui-col-sm4">
						<div class="information">
							<p><i class="iconfont">&#xe76a;</i> 邮箱：<span>${storeInfo.email}</span></p>
						</div>
					</div>
					<div class="information-wrap layui-col-md4 layui-col-sm4">
						<div class="information">
							<p><i class="iconfont">&#xe638;</i> 类别：<span>${storeInfo.storeType}</span></p>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<!-- 详细信息 -->
			<div class="layui-fuild">
				<div class="layui-row">
					<div class="layui-col-md12">
						<p style="padding: 20px;background: rgba(168, 168, 168, 0.2);border-radius: 20px;">${storeInfo.detailInfo}</p>
					</div>
				</div>
			</div>
		</div>
		<!-- 服务&评论 -->
		<div class="wrap-body">
			<div class="layui-tab layui-tab-brief">
  				<ul class="layui-tab-title">
    				<li class="layui-this"><i class="iconfont">&#xe602;</i> 商户服务</li>
    				<li><i class="iconfont">&#xe694;</i> 用户评价</li>
  				</ul>
  				<div class="layui-tab-content">
  					<!-- 商户服务 -->
    				<div class="layui-tab-item layui-show tab1">
						<div class="layui-fuild">
	    					<h3>商户服务</h3>
	    					<hr>
	    					<div class="layui-fuild" style="padding-bottom: 10px;">
	    						<div class="layui-row layui-col-space10" style="padding-bottom: 10px;">
	    							<!-- 服务 -->
	    							<div class="layui-col-md3 layui-col-sm6 layui-col-xs12" id="service-container">
										<c:if test="${!empty services}">
											<c:forEach var="service" items="${services}">
		    							<div class="layui-row row-in" title="${service.serviceName}">
		    								<div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
												<img src="${service.serviceImg}" onerror="this.src='../../resources/images/201291810101174356.jpg'">
											</div>
		    								<div class="layui-row row-in2">
												<div class="layui-col-md8 layui-col-sm8 layui-col-xs8"><a href="#" class="service-title">${service.serviceName}</a></div>
												<div class="layui-col-md4 layui-col-sm4 layui-col-xs4">评分：<c:if test="${service.grade==0}">未评分</c:if><c:if test="${service.grade!=0}">${service.grade}分</c:if></div>
											</div>
											<div class="layui-row row-in3">
												<div class="layui-col-md6 layui-col-sm6 layui-col-xs6">${service.serviceFans}关注</div>
												<div class="layui-col-md6 layui-col-sm6 layui-col-xs6">${service.markNum}笔交易</div>
											</div>
		    							</div>
											</c:forEach>
										</c:if>
	    							</div>
	    						</div>
		    					<div class="layui-row">
		    						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
		    							<div id="store-page"></div>
		    						</div>
		    					</div>
    						</div>
    					</div>
    				</div>
    				<!-- 用户评论 -->
   					<div class="layui-tab-item tab2">
   						<h3>用户评论</h3>
   						<form class="layui-form sort" action="">
	   						<select name="mode" lay-filter="mode">
	  							<option value="1">按时间排序</option>
	  							<option value="2">按热度排序</option>
							</select>
						</form>
   						<hr>
   						<div class="layui-fluid" style="padding: 20px;background: #efefef;">
   							<form class="layui-form" id="comment" action="" style="position: relative;cursor: text;">
   								<p style="font-size: 18px;color: #a8a8a8;position: absolute;left: 10px;top: 5px;"><i class="iconfont">&#xe62b;</i> 发表评论</p>
      							<input type="text" autocomplete="off" class="layui-input" disabled style="cursor: text;">
  							</form>
   						</div>
   						<div class="layui-fliud comment-wrap" id="evaluate-container">
							<c:if test="${!empty evaluates}">
								<c:forEach var="evaluate" items="${evaluates}">
   							<!-- 评论 -->
   							<hr>
   							<div class="row layui-row layui-col-space10">
   								<!-- 主评人头像 -->
   								<div class="layui-col-md2 layui-col-sm2" style="position: relative;min-height: 110px;">
   									<div class="head-wrap">
										<a href="<%=portPath%>userResident/information/${evaluate.user.userId}"> <img src="${evaluate.user.headImg}" onerror="this.src='http://t.cn/RCzsdCq'"></a>
   									</div>
   								</div>
   								<!-- 主容器 -->
   								<div class="layui-col-md10 layui-col-sm10">
   									<!-- 主评人内容 -->
   									<div class="row-in1 layui-row layui-col-space10">
   										<div class="layui-col-md12 layui-col-sm12">
											<a href="<%=portPath%>userResident/information/${evaluate.user.userId}"><h4>${evaluate.user.userName}</h4></a>
											<c:set var="userId" value="${user.userid}" />
											<c:set var="replyId" value="${evaluate.user.userId}" />
											<c:if test="${userId==replyId}"><a href="javascript:void(0)" onclick="deleteEvaluate(${evaluate.evaluatestoreid})">删除评论</a></c:if>
   										</div>
   										<div class="layui-col-md12 layui-col-sm12" style="min-height: 49.8px;">${evaluate.content}</div>
   										<div class="layui-col-md12 layui-col-sm12">
   											<p><fmt:formatDate value="${evaluate.time}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
   											<span class="layui-breadcrumb" lay-separator="|">
  												<a href="javascript:void(0);" onclick="support(${evaluate.evaluatestoreid},${evaluate.praise},this)" class="good"><i class="iconfont">&#xe60a;</i> (${evaluate.praise})</a>
  												<a href="javascript:void(0);" onclick="reply(${evaluate.evaluatestoreid})" class="reply">回复</a>
											</span>
   										</div>
   									</div>
   									<!-- 回复 -->
									<c:if test="${!empty evaluate.estoreUserList}">
										<c:forEach var="estoreEvaluate" items="${evaluate.estoreUserList}">
   									<hr>
   									<div class="row-in2 layui-row layui-col-space10">
   										<!-- 回复人头像 -->
   										<div class="layui-col-md1 layui-col-sm2">
   											<div class="head-wrap-sub">
												<a href="<%=portPath%>userResident/information/${estoreEvaluate.user.userId}"> <img src="${estoreEvaluate.user.headImg}" onerror="this.src='http://t.cn/RCzsdCq'"></a>
   											</div>
   										</div>
   										<!-- 容器 -->
   										<div class="layui-col-md11 layui-col-sm10">
   											<!-- 回复人内容 -->
   											<div class="row-in-in layui-row layui-col-space10">
   												<div class="layui-col-md6 layui-col-sm6">
													<a href="<%=portPath%>userResident/information/${estoreEvaluate.user.userId}"><h4>${estoreEvaluate.user.userName}</h4></a>
													<c:set var="userId" value="${user.userid}" />
													<c:set var="replyId" value="${estoreEvaluate.user.userId}" />
													<c:if test="${userId==replyId}"><a href="javascript:void(0)" onclick="deleteReply(${estoreEvaluate.estoreuserid})">删除评论</a></c:if>
   												</div>
   												<div class="layui-col-md12 layui-col-sm12">${estoreEvaluate.content}</div>
   												<div class="layui-col-md12 layui-col-sm12">
   													<p><fmt:formatDate value="${estoreEvaluate.time}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
   												</div>
   											</div>
   										</div>
   									</div>
										</c:forEach>
									</c:if>
   								</div>
   							</div>
								</c:forEach>
								<div class="reply-page" data-pages="${evaluate.estorePages}" data-evaluateId="${evaluate.evaluatestoreid}"></div>
							</c:if>
   						</div>
   						<div class="layui-fulid" style="height: 120px;">
							<div id="comment-page"></div>
						</div>
   					</div>
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
	<!-- 评论 -->
	<div id="comment-modal" class="modal">
		<div class="layui-fluid">
			<h2 style="margin-bottom: 0px;">发表评论</h2>
			<hr>
			<form class="layui-form" action="">
  				<div class="layui-form-item layui-form-text">
      				<textarea placeholder="请输入您想要发表的评论" required lay-verify="required" class="layui-textarea" rows="6" id="comment-content"></textarea>
      				<p>最多输入300个字</p>
      				<button type="button" class="layui-btn" lay-submit id="comment-submit">提交</button>
  				</div>
  			</form>
		</div>
	</div>
	<!-- 回复 -->
	<div id="reply-modal" class="modal">
		<div class="layui-fluid">
			<h2 class="layui-col-md12 layui-col-sm12 layui-col-xs12">回复</h2>
			<hr>
			<form class="layui-form" action="">
  				<div class="layui-form-item layui-form-text">
      				<textarea placeholder="请输入您想要回复的内容" required lay-verify="required" class="layui-textarea" rows="6" id="reply-content"></textarea>
      				<p>最多输入300个字</p>
      				<button class="layui-btn" lay-submit id="reply-submit">回复</button>
  				</div>
  			</form>
		</div>
	</div>
	<!-- 投诉 -->
	<div id="complaint-modal" class="modal">
		<div class="layui-fluid">
			<h2 class="layui-col-md12 layui-col-sm12 layui-col-xs12" style="color: #FF5722;">投诉</h2>
			<hr>
			<form class="layui-form" action="">
				<div class="layui-form-item layui-form-text">
					<textarea placeholder="请输入投诉理由" required lay-verify="required" class="layui-textarea" rows="6" id="complaint-content"></textarea>
					<p>至多输入300个字</p>
					<button class="layui-btn" lay-submit id="complaint-submit" style="background: #FF5722;">提交</button>
				</div>
			</form>
		</div>
	</div>
</body>
<script>
    var loginStatus = ${!loginStatus};
    var servicePages = ${servicePages};
    var evaluatePages = ${evaluatePages};
    var servicePageSize = ${servicePageSize};
    var evaluatePageSize = ${evaluatePageSize};
    var sonPageSize = ${sonPageSize};

</script>
</html>