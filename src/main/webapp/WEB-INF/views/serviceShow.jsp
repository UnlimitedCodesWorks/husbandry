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
	<script src="../../resources/layui.js"></script>
	<script src="../../resources/js/vue.js"></script>
	<script src="../../resources/js/serviceShow.js"></script>
	<script src="https://unpkg.com/element-ui/lib/index.js"></script>
	<link rel="stylesheet" type="text/css" href="../../resources/css/layui.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/serviceShow.css">
	<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
	<title>智慧社区-服务详情</title>
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
						<dd><a href="<%=portPath%>userResident/information/${user.userid}">个人中心<span class="layui-badge-dot"></span></a></dd>
						<dd><a href="<%=portPath%>login/exit.do">登出</a></dd>
					</dl>
				</li>
			</ul>
		</nav>
	</header>
	<div class="layui-container" id="wrap">
		<!-- 头部信息 -->
		<div class="wrap-head">
			<hr style="margin: 30px 0;">
			<div class="row layui-row layui-col-space10">
				<!-- 左 -->
				<div class="layui-col-md8 layui-col-sm8 layui-col-xs12">
					<div class="row-in layui-row layui-col-space10">
						<!-- 左-左 -->
						<div class="layui-col-md6 layui-col-sm8 layui-col-xs12">
							<div class="row-in2 layui-row layui-col-space15">
								<!-- 服务名 -->
								<div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
									<h2>${service.serviceName}</h2>
								</div>
								<!-- 发布时间&浏览数 -->
								<div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
									<div class="row-in-in layui-row layui-col-space10">
										<div class="layui-col-md6 layui-col-sm12 layui-col-xs4">
											<p><fmt:formatDate value="${service.publishTime}" pattern="yyyy-MM-dd" />发布</p>
										</div>
										<div class="layui-col-md6 layui-col-sm12 layui-col-xs8">
											<p>${service.viewNum}次浏览</p>
										</div>
									</div>
								</div>
								<!-- 服务类别 -->
								<div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
									<p><i class="iconfont">&#xe603;</i> 类&emsp;&emsp;别：<span>${service.kind}服务</span></p>
								</div>
								<!-- 负责人 -->
								<div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
									<p><i class="iconfont">&#xe645;</i> 负&ensp;责&ensp;人 电 话：<span>${service.peoplePhone}</span></p>
								</div>
							</div>
						</div>
						<!-- 左-右 -->
						<div class="layui-col-md6 layui-col-sm4 layui-col-xs12">
							<div class="row-in3 layui-row layui-col-space15">
								<!-- 价格 -->
								<div class="price-wrap layui-col-md12 layui-col-sm12 layui-col-xs12">
									<p class="price"><i class="iconfont">&#xe616;</i> ${service.price}元/小时</p>
								</div>
								<!-- 价位判断 -->
								<div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
									<c:if test="${service.priceJudgement}">
										<p class="warning"><i class="iconfont">&#xe6a4;</i> 该价格高于市场价</p>
									</c:if>
									<c:if test="${!service.priceJudgement}">
										<p class="normal"><i class="iconfont">&#xe626;</i> 该价格正常</p>
									</c:if>
								</div>
								<!-- 评分 -->
								<div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
									<el-rate
    									v-model="${service.grade/2}"
  										disabled
				  						show-score
				  						text-color="#ff9900"
				  						score-template="<c:if test="${service.grade==0}">未评分</c:if><c:if test="${service.grade!=0}">${service.grade}</c:if>"
				  						:colors="['#99A9BF', '#F7BA2A', '#FF9900']">
				  					</el-rate>
								</div>
								<!-- 评价数&交易量 -->
								<div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
									<div class="row-in-in layui-row layui-col-space10">
										<div class="layui-col-md4 layui-col-sm12 layui-col-xs4">
											<p>评价数：<span>${service.markNum}</span></p>
										</div>
										<div class="layui-col-md8 layui-col-sm12 layui-col-xs8">
											<p>已完成的订单数：<span>${service.orderNum}</span></p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 左-下 -->
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12" style="padding-top: 25px;">
							<div class="row-in4 layui-row layui-col-space10">
								<div class="layui-col-md4 layui-col-sm4 layui-col-xs12">
									<button class="layui-btn layui-btn-primary">
									<i class="iconfont">&#xe6c9;</i> 预约
									</button>
								</div>
								<div class="layui-col-md4 layui-col-sm4 layui-col-xs12">
									<button class="layui-btn">
									<i class="iconfont">&#xe611;</i> 关注服务
									</button>
								</div>
								<div class="layui-col-md4 layui-col-sm4 layui-col-xs12">
									<button class="layui-btn layui-btn-danger">
									<i class="iconfont">&#xe66e;</i> 投诉
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 右 -->
				<div class="layui-col-md4 layui-col-sm4 layui-col-xs12">
					<div class="row-in5 layui-row layui-col-space10">
						<!-- LOGO -->
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
							<div class="img-wrap">
								<img src="${service.store.headImg}" onerror="this.src='../../resources/images/家居9.jpg'">
							</div>
						</div>
						<!-- 服务商名 -->
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
							<a href="javascrapt:" title="${service.store.storeName}"><h3 style="text-align: center;font-weight: bold;">${service.store.storeName}</h3></a>
						</div>
						<!-- 注册时间 -->
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
							<p><i class="iconfont">&#xe6a9;</i> 注册于：<span><fmt:formatDate value="${service.store.registTime}" pattern="yyyy-MM-dd" /></span></p>
						</div>
						<!-- 已服务次数 -->
						<div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
							<p><i class="iconfont">&#xe69a;</i> 服务数量：<span>${service.store.serviceNum}</span>个</p>
						</div>
					</div>
				</div>
			</div>
			<hr style="margin-top: 30px;margin-bottom: 20px;">
			<div class="layui-container">
				<p class="area"><i class="iconfont">&#xe6a3;</i> 服务区域：
					<c:if test="${service.cities!=null}">
					<c:forEach var="city" items="${service.cities}">
					<span>${city.provinces.province} ${city.city}</span>
					</c:forEach>
					</c:if>
				</p>
			</div>
		</div>
		<!-- 详细信息&用户评价 -->
		<div class="wrap-body">
			<div class="layui-tab layui-tab-brief">
  				<ul class="layui-tab-title">
    				<li class="layui-this"><i class="iconfont">&#xe64c;</i> 详细信息</li>
    				<li><i class="iconfont">&#xe694;</i> 用户评价</li>
  				</ul>
  				<div class="layui-tab-content">
  					<!-- 详细信息 -->
    				<div class="layui-tab-item layui-show tab1">
    					<div class="layui-fuild">
							<!-- 服务介绍 -->
    						<div class="introduce box">
    							<h3><i class="iconfont">&#xe60e;</i>服务介绍</h3>
    							<p>${service.introduce}</p>
    						</div>
    						<!-- 服务特色 -->
    						<div class="characteristic box">
    							<h3><i class="iconfont">&#xe6c2;</i>服务特色</h3>
    							<div class="layui-row layui-col-space10 layui-fuild">
									<c:if test="${service.serviceSpecial!=null}">
										<c:forEach var="serviceImg" items="${service.serviceSpecial}">
											<div class="layui-col-md4"><img src="${serviceImg.specialImg}" onerror="this.src='../../resources/images/家居9.jpg'"></div>
										</c:forEach>
									</c:if>
    							</div>
    						</div>
    						<!-- 注意事项 -->
    						<div class="notice box">
    							<h3><i class="iconfont">&#xe629;</i>注意事项</h3>
    							<p>${service.notice}</p>
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
   						<div class="layui-fliud comment-wrap">
   							<!-- 评论 -->
   							<hr>
                            <c:if test="${evaluates!=null}">
                                <c:forEach var="evaluate" items="${evaluates}">
   							<div class="row layui-row layui-col-space10">
   								<!-- 主评人头像 -->
   								<div class="layui-col-md2 layui-col-sm2" style="position: relative;min-height: 110px;">
   									<div class="head-wrap">
   										<a href="<%=portPath%>userResident/information.html"> <img src="${evaluate.user.headImg}" onerror="this.src='http://t.cn/RCzsdCq'"></a>
   									</div>
   								</div>
   								<!-- 主容器 -->
   								<div class="layui-col-md10 layui-col-sm10">
   									<!-- 主评人内容 -->
   									<div class="row-in1 layui-row layui-col-space10">
   										<div class="layui-col-md12 layui-col-sm12">
   											<a href="<%=portPath%>userResident/information.html"><h4>${evaluate.user.userName}</h4></a>
   											<a href="javascrapt:">删除评论</a>
   											<el-rate
    											v-model="${evaluate.grade/2}"
  												disabled
				  								show-score
				  								text-color="#ff9900"
				  								score-template="${evaluate.grade}"
				  								:colors="['#99A9BF', '#F7BA2A', '#FF9900']"
				  								style="float: right;">
				  							</el-rate>
   										</div>
   										<div class="layui-col-md12 layui-col-sm12" style="min-height: 49.8px;">${evaluate.content}</div>
   										<div class="layui-col-md12 layui-col-sm12">
   											<p><fmt:formatDate value="${evaluate.time}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
   											<span class="layui-breadcrumb" lay-separator="|">
  												<a href="javascrapt:" class="good"><i class="iconfont">&#xe60a;</i> (${evaluate.praise})</a>
  												<a href="javascrapt:" class="reply">回复</a>
											</span>
   										</div>
   									</div>
   									<!-- 回复 -->
   									<hr>
                                    <c:if test="${evaluate.eserviceUsers!=null}">
                                        <c:forEach var="eserviceEvaluate" items="${evaluate.eserviceUsers}">
   									<div class="row-in2 layui-row layui-col-space10">
   										<!-- 回复人头像 -->
   										<div class="layui-col-md1 layui-col-sm2">
   											<div class="head-wrap-sub">
   												<img src="${eserviceEvaluate.user.headImg}" onerror="this.src='http://t.cn/RCzsdCq'">
   											</div>
   										</div>
   										<!-- 容器 -->
   										<div class="layui-col-md11 layui-col-sm10">
   											<!-- 回复人内容 -->
   											<div class="row-in-in layui-row layui-col-space10">
   												<div class="layui-col-md6 layui-col-sm6">
   													<a href="javascrapt:"><h4>${eserviceEvaluate.user.userName}</h4></a>
   													<a href="javascrapt:">删除评论</a>
   												</div>
   												<div class="layui-col-md12 layui-col-sm12">${eserviceEvaluate.content}</div>
   												<div class="layui-col-md12 layui-col-sm12">
   													<p><fmt:formatDate value="${eserviceEvaluate.time}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
   												</div>
   											</div>
   										</div>
   									</div>
   									<div class="reply-page"></div>
                                        </c:forEach>
                                    </c:if>
   								</div>
   							</div>
                                </c:forEach>
                            </c:if>
   						</div>
						<div class="layui-fulid" style="height: 180px;">
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
	<!-- 评论 -->
	<div id="comment-modal" class="modal">
		<div class="layui-fluid">
			<h2 style="margin-bottom: 0px;">发表评论</h2>
			<el-rate
    			v-model="value"
				text-color="#ff9900"
				:colors="['#99A9BF', '#F7BA2A', '#FF9900']"
				style="float: right;margin-top: 10px;">
			</el-rate>
			<hr>
			<form class="layui-form" action="">
  				<div class="layui-form-item layui-form-text">
      				<textarea placeholder="请输入您想要发表的评论" required lay-verify="required" class="layui-textarea" rows="6"></textarea>
      				<p>至少输入X个字</p>
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
      				<textarea placeholder="请输入您想要回复的内容" required lay-verify="required" class="layui-textarea" rows="6"></textarea>
      				<p>至多输入300个字</p>
      				<button class="layui-btn" lay-submit id="reply-submit">回复</button>
  				</div>
  			</form>
		</div>
	</div>
</body>
<script>
    var evaluatePages = "${evaluatePages}";
    var pageSize = "${pageSize}";
	var sonPageSize = "${sonPageSize}";
</script>
</html>