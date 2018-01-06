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
	<link rel="stylesheet" type="text/css" href="../../../resources/font/font-awesome/css/font-awesome.min.css">
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
    			<a href="<%=portPath%>userResident/security.html"><li><i class="iconfont">&#xe643;</i> 账号安全</li></a>
    			<li class="layui-this"><i class="iconfont">&#xe6c1;</i> 我的订单</li>
    			<a href="<%=portPath%>userResident/focus/${user.userid}"><li><i class="iconfont">&#xe611;</i> 我关注的</li></a>
    			<a href="<%=portPath%>userResident/refund.html"><li><i class="iconfont">&#xe614;</i> 退款详情</li></a>
				<a href="<%=portPath%>userResident/message.html"><li><i class="iconfont">&#xe694;</i> 消息中心</li></a>
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
    						<li>待派遣 <c:if test="${dispatchedOrderNum!=0}"><span class="layui-badge">${dispatchedOrderNum}</span></c:if></li>
    						<li>待确认 <c:if test="${confirmedOrderNum!=0}"><span class="layui-badge">${confirmedOrderNum}</span></c:if></li>
    						<li>待评价 <c:if test="${remarkedOrderNum!=0}"><span class="layui-badge">${remarkedOrderNum}</span></c:if></li>
  						</ul>
					  	<div class="layui-tab-content">
					  		<!-- 全部订单 -->
					    	<div class="layui-tab-item layui-show tab3-1">
					    		<div class="layui-container">
									<c:if test="${empty allOrders}">
										<!-- 无订单 -->
										<div class="no-service">
											<p>您还没有预约过任何服务，快去预约吧！</p>
										</div>
									</c:if>
					    			<c:if test="${allOrders!=null}">
										<c:forEach var="order" items="${allOrders}">
											<div class="order-wrap">
												<hr>
												<!-- 公司名&关注 -->
												<div class="layui-row layui-col-space10 row1">
													<div class="layui-col-md10 layui-col-sm10 layui-col-xs12 name-wrap">
														<a href="<%=portPath%>store/information/${order.storeInfo.storeid}">${order.storeInfo.storeName}</a>
														<p>订单状态：已完成</p>
														<span class="price-total">总价：￥${order.orderBigTime.sum}</span>
													</div>
													<div class="layui-col-md2 layui-col-sm2 layui-col-xs12">
														<button class="layui-btn" onclick="location.href='<%=portPath%>service/detail/${order.offerService.offerserviceid}'">
															<i class="iconfont">&#xe611;</i> 关注服务
														</button>
													</div>
												</div>
												<div class="layui-row layui-col-space10 row2">
													<div class="layui-col-md3 layui-col-sm4 layui-col-xs12 img-wrap">
														<img src="${order.offerService.serviceImg}" onerror="this.src='../../../resources/images/家居9.jpg'">
													</div>
													<!-- 服务名&描述 -->
													<div class="layui-col-md7 layui-col-sm8 layui-col-xs12">
														<div class="layui-row row2-1 layui-col-space10">
															<div class="layui-col-md8 layui-col-sm8 layui-col-xs12 service-wrap">
																<a href="<%=portPath%>service/detail/${order.offerService.offerserviceid}">${order.offerService.serviceName}</a>
															</div>
															<div class="layui-col-md4 layui-col-sm4 layui-col-xs12 price-wrap">
																<p>￥${order.offerService.price}/小时</p>
															</div>
															<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 detail-wrap">
																<p>${order.offerService.introduce}</p>
															</div>
														</div>
													</div>
													<!-- 按钮组 -->
													<div class="layui-col-md2 layui-col-sm12 layui-col-xs12">
														<div class="layui-row layui-col-space10 row2-2">
															<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">
																<button class="layui-btn layui-btn-danger delete" data-orderId="${order.orderid}" >
																	<i class="iconfont">&#xe615;</i> 删除订单
																</button>
															</div>
															<div class="layui-col-md12 layui-col-sm8 layui-col-xs12 fill">
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:if>
					    		</div>
								<div id="all-page1" class="order-page"></div>
					    	</div>
					    	<!-- 待派遣 -->
					    	<div class="layui-tab-item tab3-1">
					    		<div class="layui-container">
									<c:if test="${empty dispatchedOrders}">
										<!-- 无订单 -->
										<div class="no-service">
											<p>您还没有预约过任何服务，快去预约吧！</p>
										</div>
									</c:if>
					    			<c:if test="${dispatchedOrders!=null}">
										<c:forEach var="order" items="${dispatchedOrders}">
											<div class="order-wrap">
												<hr>
												<!-- 公司名&关注 -->
												<div class="layui-row layui-col-space10 row1">
													<div class="layui-col-md10 layui-col-sm10 layui-col-xs12 name-wrap">
														<a href="<%=portPath%>store/information/${order.storeInfo.storeid}">${order.storeInfo.storeName}</a>
														<p>订单状态：待派遣</p>
														<span class="price-total">总价：￥${order.orderBigTime.sum}</span>
													</div>
													<div class="layui-col-md2 layui-col-sm2 layui-col-xs12">
														<button class="layui-btn" onclick="location.href='<%=portPath%>service/detail/${order.offerService.offerserviceid}'">
															<i class="iconfont">&#xe611;</i> 关注服务
														</button>
													</div>
												</div>
												<div class="layui-row layui-col-space10 row2">
													<div class="layui-col-md3 layui-col-sm4 layui-col-xs12 img-wrap">
														<img src="${order.offerService.serviceImg}" onerror="this.src='../../../resources/images/家居9.jpg'">
													</div>
													<!-- 服务名&描述 -->
													<div class="layui-col-md7 layui-col-sm8 layui-col-xs12">
														<div class="layui-row row2-1 layui-col-space10">
															<div class="layui-col-md8 layui-col-sm8 layui-col-xs12 service-wrap">
																<a href="<%=portPath%>service/detail/${order.offerService.offerserviceid}">${order.offerService.serviceName}</a>
															</div>
															<div class="layui-col-md4 layui-col-sm4 layui-col-xs12 price-wrap">
																<p>￥${order.offerService.price}/小时</p>
															</div>
															<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 detail-wrap">
																<p>${order.offerService.introduce}</p>
															</div>
														</div>
													</div>
													<!-- 按钮组 -->
													<div class="layui-col-md2 layui-col-sm12 layui-col-xs12">
														<div class="layui-row layui-col-space10 row2-2">
															<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">
																<button class="layui-btn layui-btn-danger refund" data-orderId="${order.orderid}" >
																	<i class="iconfont">&#xe614;</i> 撤销订单
																</button>
															</div>
															<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">
																<button class="layui-btn layui-btn-normal check-progress" data-orderId="${order.orderid}" data-serviceName="${order.offerService.serviceName}" >
																	<i class="iconfont">&#xe608;</i> 查看服务进展
																</button>
															</div>
															<div class="layui-col-md12 layui-col-sm4 layui-col-xs12 fill">
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:if>
					    		</div>
								<div id="all-page2" class="order-page"></div>
					    	</div>
					    	<!-- 待确认 -->
					    	<div class="layui-tab-item tab3-1">
					    		<div class="layui-container">
									<c:if test="${empty confirmedOrders}">
										<!-- 无订单 -->
										<div class="no-service">
											<p>您还没有预约过任何服务，快去预约吧！</p>
										</div>
									</c:if>
					    			<c:if test="${confirmedOrders!=null}">
										<c:forEach var="order" items="${confirmedOrders}">
											<div class="order-wrap">
												<hr>
												<!-- 公司名&关注 -->
												<div class="layui-row layui-col-space10 row1">
													<div class="layui-col-md10 layui-col-sm10 layui-col-xs12 name-wrap">
														<a href="<%=portPath%>store/information/${order.storeInfo.storeid}">${order.storeInfo.storeName}</a>
														<p>订单状态：待确认</p>
														<a href="javascript:;" class="service-cycle" data-orderId="${order.orderid}">查看服务周期</a>
														<span class="price-total">总价：￥${order.orderBigTime.sum}</span>
													</div>
													<div class="layui-col-md2 layui-col-sm2 layui-col-xs12">
														<button class="layui-btn" onclick="location.href='<%=portPath%>service/detail/${order.offerService.offerserviceid}'">
															<i class="iconfont">&#xe611;</i> 关注服务
														</button>
													</div>
												</div>
												<div class="layui-row layui-col-space10 row2">
													<div class="layui-col-md3 layui-col-sm4 layui-col-xs12 img-wrap">
														<img src="${order.offerService.serviceImg}" onerror="this.src='../../../resources/images/家居9.jpg'">
													</div>
													<!-- 服务名&描述 -->
													<div class="layui-col-md7 layui-col-sm8 layui-col-xs12">
														<div class="layui-row row2-1 layui-col-space10">
															<div class="layui-col-md8 layui-col-sm8 layui-col-xs12 service-wrap">
																<a href="<%=portPath%>service/detail/${order.offerService.offerserviceid}">${order.offerService.serviceName}</a>
															</div>
															<div class="layui-col-md4 layui-col-sm4 layui-col-xs12 price-wrap">
																<p>￥${order.offerService.price}/小时</p>
															</div>
															<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 detail-wrap">
																<p>${order.offerService.introduce}</p>
															</div>
														</div>
													</div>
													<!-- 按钮组 -->
													<div class="layui-col-md2 layui-col-sm12 layui-col-xs12">
														<div class="layui-row layui-col-space10 row2-2">
															<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">
																<button class="layui-btn layui-btn-danger refund" data-orderId="${order.orderid}" >
																	<i class="iconfont">&#xe614;</i> 撤销订单
																</button>
															</div>
															<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">
																<button class="layui-btn layui-btn-normal check-progress" data-orderId="${order.orderid}" data-serviceName="${order.offerService.serviceName}" >
																	<i class="iconfont">&#xe608;</i> 查看服务进展
																</button>
															</div>
															<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">
																<button class="layui-btn layui-btn-primary orderConfirm" data-orderId="${order.orderid}"  >
																	<i class="iconfont confirm">&#xe6e2;</i> 确认订单
																</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:if>
					    		</div>
								<div id="all-page3" class="order-page"></div>
					    	</div>
					    	<!-- 待评价 -->
					    	<div class="layui-tab-item tab3-1">
					    		<div class="layui-container">
									<c:if test="${empty remarkedOrders}">
										<!-- 无订单 -->
										<div class="no-service">
											<p>您还没有预约过任何服务，快去预约吧！</p>
										</div>
									</c:if>
					    			<c:if test="${remarkedOrders!=null}">
										<c:forEach var="order" items="${remarkedOrders}">
											<div class="order-wrap">
												<hr>
												<!-- 公司名&关注 -->
												<div class="layui-row layui-col-space10 row1">
													<div class="layui-col-md10 layui-col-sm10 layui-col-xs12 name-wrap">
														<a href="<%=portPath%>store/information/${order.storeInfo.storeid}">${order.storeInfo.storeName}</a>
														<p>订单状态：已确认</p>
														<span class="price-total">总价：￥${order.orderBigTime.sum}</span>
													</div>
													<div class="layui-col-md2 layui-col-sm2 layui-col-xs12">
														<button class="layui-btn" onclick="location.href='<%=portPath%>service/detail/${order.offerService.offerserviceid}'">
															<i class="iconfont">&#xe611;</i> 关注服务
														</button>
													</div>
												</div>
												<div class="layui-row layui-col-space10 row2">
													<div class="layui-col-md3 layui-col-sm4 layui-col-xs12 img-wrap">
														<img src="${order.offerService.serviceImg}" onerror="this.src='../../../resources/images/家居9.jpg'">
													</div>
													<!-- 服务名&描述 -->
													<div class="layui-col-md7 layui-col-sm8 layui-col-xs12">
														<div class="layui-row row2-1 layui-col-space10">
															<div class="layui-col-md8 layui-col-sm8 layui-col-xs12 service-wrap">
																<a href="<%=portPath%>service/detail/${order.offerService.offerserviceid}">${order.offerService.serviceName}</a>
															</div>
															<div class="layui-col-md4 layui-col-sm4 layui-col-xs12 price-wrap">
																<p>￥${order.offerService.price}/小时</p>
															</div>
															<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 detail-wrap">
																<p>${order.offerService.introduce}</p>
															</div>
														</div>
													</div>
													<!-- 按钮组 -->
													<div class="layui-col-md2 layui-col-sm12 layui-col-xs12">
														<div class="layui-row layui-col-space10 row2-2">
															<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">
																<button class="layui-btn layui-btn-danger delete" data-orderId="${order.orderid}" >
																	<i class="iconfont">&#xe615;</i> 删除订单
																</button>
															</div>
															<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">
																<button class="layui-btn layui-btn-normal check-progress" data-orderId="${order.orderid}" data-serviceName="${order.offerService.serviceName}" >
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
										</c:forEach>
									</c:if>
					    		</div>
								<div id="all-page4" class="order-page"></div>
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
		<div class="layui-fluid" id="service-container" >
		</div>
	</div>
	<!-- 撤销订单 -->
	<div id="refund">
		<div class="layui-fluid">
			<h2 class="layui-col-md12 layui-col-sm12 layui-col-xs12">退款理由</h2>
			<hr>
  				<div class="layui-form-item layui-form-text">
      				<textarea placeholder="请输入您的退款理由" required lay-verify="required" class="layui-textarea" rows="6" id="cancelReason" ></textarea>
      				<p>至多输入300个字</p>
      				<button id="cancelButton" class="layui-btn" lay-submit>提交</button>
  				</div>
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
	<!-- 服务周期 -->
	<div id="service-cycle">
		<div class="layui-row" style="margin-top: 20px;">
			<div class="layui-col-md2 layui-col-sm2 layui-col-xs2">
				<p class="cycle-time" id="start-time"></p>
			</div>
			<div class="layui-col-md8 layui-col-sm8 layui-col-xs8">
				<h3 class="progressbar-title" style="margin-bottom: 20px;">每日<span></span></h3>
				<div class="progress">
					<div class="layui-progress-bar" style="width: 10%; background: #92c26a;">
						<span class="progress-icon fa fa-check" style="border-color:#92c26a; color:#92c26a;"></span>
						<div class="progress-value"></div>
					</div>
				</div>
			</div>
			<div class="layui-col-md2 layui-col-sm2 layui-col-xs2">
				<p class="cycle-time" id="end-time">2018-1-31</p>
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
    var allOrderPages = "${allOrderPages}";
    var dispatchedOrderPages = "${dispatchedOrderPages}";
    var confirmedOrderPages = "${confirmedOrderPages}";
    var remarkedOrderPages = "${remarkedOrderPages}";
    var pageSize = "${pageSize}";
    var portPath = "<%=portPath%>";


    layui.use('laypage', function() {
        var laypage = layui.laypage;
        //执行一个laypage实例
        //全部订单
        laypage.render({
            elem: 'all-page1', //注意，这里是ID，不用加 # 号
            count: allOrderPages*pageSize, //数据总数，从服务端得到
            limit: pageSize,
            jump: function(obj, first){
                //obj包含了当前分页的所有参数，比如：
                //首次不执行
                if(!first){
                    $.ajax({
                        type: "POST",
                        url: portPath+"userResident/getOrders.do",
                        data: {
                            currentPage:obj.curr,
                            schema:0
                        },
                        dataType: "json",
                        success: function(data){
                            createOrders(data);
                        },
                        error: function(jqXHR){
                            alert("发生错误：" + jqXHR.status);
                        }
                    });
                }
            }
        });
        //待派遣
        laypage.render({
            elem: 'all-page2', //注意，这里是ID，不用加 # 号
            count: dispatchedOrderPages*pageSize, //数据总数，从服务端得到
            limit: pageSize,
            jump: function(obj, first){
                //obj包含了当前分页的所有参数，比如：
                //首次不执行
                if(!first){
                    $.ajax({
                        type: "POST",
                        url: portPath+"userResident/getOrders.do",
                        data: {
                            currentPage:obj.curr,
                            schema:1
                        },
                        dataType: "json",
                        success: function(data){
                            createOrders(data);
                        },
                        error: function(jqXHR){
                            alert("发生错误：" + jqXHR.status);
                        }
                    });
                }
            }
        });
        //待确认
        laypage.render({
            elem: 'all-page3', //注意，这里是ID，不用加 # 号
            count: confirmedOrderPages*pageSize, //数据总数，从服务端得到
            limit: pageSize,
            jump: function(obj, first){
                //obj包含了当前分页的所有参数，比如：
                //首次不执行
                if(!first){
                    $.ajax({
                        type: "POST",
                        url: portPath+"userResident/getOrders.do",
                        data: {
                            currentPage:obj.curr,
                            schema:2
                        },
                        dataType: "json",
                        success: function(data){
                            createOrders(data);
                        },
                        error: function(jqXHR){
                            alert("发生错误：" + jqXHR.status);
                        }
                    });
                }
            }
        });
        //待评价
        laypage.render({
            elem: 'all-page4', //注意，这里是ID，不用加 # 号
            count: remarkedOrderPages*pageSize, //数据总数，从服务端得到
            limit: pageSize,
            jump: function(obj, first){
                //obj包含了当前分页的所有参数，比如：
                //首次不执行
                if(!first){
                    $.ajax({
                        type: "POST",
                        url: portPath+"userResident/getOrders.do",
                        data: {
                            currentPage:obj.curr,
                            schema:3
                        },
                        dataType: "json",
                        success: function(data){
                            createOrders(data);
                        },
                        error: function(jqXHR){
                            alert("发生错误：" + jqXHR.status);
                        }
                    });
                }
            }
        });
    });

    //撤销提交
    $("#cancelButton").click(function (e) {
        var value = $(this).attr("data-orderId");
        var reason = $("#cancelReason").val();
        if(reason.length!=0){
            $.ajax({
                type: "POST",
                url: portPath+"userResident/cancelOrder.do",
                data: {
                    orderId:value,
                    reason:reason
                },
                dataType: "json",
                success: function(data){
                    if(data){
                        layer.msg("撤销成功",{
                            time: 1000
                        });
                        setTimeout("location.replace(location.href)",1000);
                    }
                },
                error: function(jqXHR){
                    alert("发生错误：" + jqXHR.status);
                }
            });
        }


    });
    function createOrders(data) {
        for(var i=0;i<data.list.length;i++){
            var status = data.list[i].status;
            var orderId = data.list[i].orderid;
            var line;
            var container;
            var buttons;
            var href= portPath+"service/detail/"+data.list[i].offerService.offerserviceid;
            var storePath = portPath+"store/information/"+data.list[i].storeInfo.storeid;
            switch (status){
				case 5:
				    container = $(".layui-container:eq(1)");
				    container.html("");
				    line = "<p>订单状态：已完成</p>";
				    buttons ='<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">' +
                        '<button class="layui-btn layui-btn-danger delete" data-orderId="'+orderId+'">' +
                        '<i class="iconfont">&#xe615;</i> 删除订单' +
                        '</button>' +
                        '</div>' +
                        '<div class="layui-col-md12 layui-col-sm8 layui-col-xs12 fill">' +
                        '</div>';
				    break;
				case 0:
                    container = $(".layui-container:eq(2)");
                    container.html("");
                    line = "<p>订单状态：待派遣</p>";
                    buttons='<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">' +
                        '<button class="layui-btn layui-btn-danger refund" data-orderId="'+orderId+'" >' +
                        '<i class="iconfont">&#xe614;</i> 撤销订单' +
                        '</button>' +
                        '</div>' +
                        '<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">' +
                        '<button class="layui-btn layui-btn-normal check-progress" data-orderId="'+orderId+'" data-serviceName="'+data.list[i].offerService.serviceName+'" >' +
                        '<i class="iconfont">&#xe608;</i> 查看服务进展' +
                        '</button>' +
                        '</div>' +
                        '<div class="layui-col-md12 layui-col-sm4 layui-col-xs12 fill">' +
                        '</div>';
				    break;
				case 1:
                    container = $(".layui-container:eq(3)");
                    container.html("");
                    line = "<p>订单状态：待确认</p>"+"<a href='javascript:;' class='service-cycle' data-orderId='"+orderId+"'>查看服务周期</a>";
                    buttons = '<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">' +
                        '<button class="layui-btn layui-btn-danger refund" data-orderId="'+orderId+'" >' +
                        '<i class="iconfont">&#xe614;</i> 撤销订单' +
                        '</button>' +
                        '</div>' +
                        '<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">' +
                        '<button class="layui-btn layui-btn-normal check-progress" data-orderId="'+orderId+'" data-serviceName="'+data.list[i].offerService.serviceName+'" >' +
                        '<i class="iconfont">&#xe608;</i> 查看服务进展' +
                        '</button>' +
                        '</div>' +
                        '<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">' +
                        '<button class="layui-btn layui-btn-primary orderConfirm" data-orderId="'+orderId+'" >' +
                        '<i class="iconfont confirm">&#xe6e2;</i> 确认订单' +
                        '</button>' +
                        '</div>';
                    break;
				case 2:
                    container = $(".layui-container:eq(4)");
                    container.html("");
                    line = "<p>订单状态：待评价</p>";
                    buttons = '<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">' +
                        '<button class="layui-btn layui-btn-danger delete" data-orderId="'+orderId+'" >' +
                        '<i class="iconfont">&#xe615;</i> 删除订单' +
                        '</button>' +
                        '</div>' +
                        '<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">' +
                        '<button class="layui-btn layui-btn-normal check-progress" data-orderId="'+orderId+'" data-serviceName="'+data.list[i].offerService.serviceName+'" >' +
                        '<i class="iconfont">&#xe608;</i> 查看服务进展' +
                        '</button>' +
                        '</div>' +
                        '<div class="layui-col-md12 layui-col-sm4 layui-col-xs12">' +
                        '<button class="layui-btn layui-btn-primary">' +
                        '<i class="iconfont evaluate">&#xe62b;</i> 评价' +
                        '</button>' +
                        '</div>';
                    break;
			}
            var node = '<div class="order-wrap">' +
                '<hr>' +
                '<!-- 公司名&关注 -->' +
                '<div class="layui-row layui-col-space10 row1">' +
                '<div class="layui-col-md10 layui-col-sm10 layui-col-xs12 name-wrap">' +
                '<a href="'+storePath+'">'+data.list[i].storeInfo.storeName+'</a>' +
                line +
				'<span class="price-total">总价：￥'+data.list[i].orderBigTime.sum+'</span>'	+
                '</div>' +
                '<div class="layui-col-md2 layui-col-sm2 layui-col-xs12">' +
                '<button class="layui-btn" onclick="location.href=\''+href+'\'" >' +
                '<i class="iconfont">&#xe611;</i> 关注服务' +
                '</button>' +
                '</div>' +
                '</div>' +
                '<div class="layui-row layui-col-space10 row2">' +
                '<div class="layui-col-md3 layui-col-sm4 layui-col-xs12 img-wrap">' +
                '<img src="'+data.list[i].offerService.serviceImg+'" onerror="this.src=\'../../../resources/images/家居9.jpg\'">' +
                '</div>' +
                '<!-- 服务名&描述 -->' +
                '<div class="layui-col-md7 layui-col-sm8 layui-col-xs12">' +
                '<div class="layui-row row2-1 layui-col-space10">' +
                '<div class="layui-col-md8 layui-col-sm8 layui-col-xs12 service-wrap">' +
                '<a href="'+href+'">'+data.list[i].offerService.serviceName+'</a>' +
                '</div>' +
                '<div class="layui-col-md4 layui-col-sm4 layui-col-xs12 price-wrap">' +
                '<p>￥'+data.list[i].offerService.price+'/小时</p>' +
                '</div>' +
                '<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 detail-wrap">' +
                '<p>'+data.list[i].offerService.introduce+'</p>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '<!-- 按钮组 -->' +
                '<div class="layui-col-md2 layui-col-sm12 layui-col-xs12">' +
                '<div class="layui-row layui-col-space10 row2-2">' +
                 buttons+
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>';
            container.append(node);

		}
		layui.use('layer', function() {
            var layer = layui.layer;
            $(".delete").click(function (event) {
                var value = $(this).attr("data-orderId");
                layer.confirm('您确定要删除该订单吗？', {
                    btn: ['确定', '关闭'] //按钮
                }, function () {
                    $.ajax({
                        type: "POST",
                        url: portPath + "userResident/deleteOrder.do",
                        data: {
                            orderId: value
                        },
                        dataType: "json",
                        success: function (data) {
                            if (data) {
                                layer.msg("已删除", {
                                    time: 1000
                                });
                                setTimeout("location.replace(location.href)", 1000);
                            }
                        },
                        error: function (jqXHR) {
                            alert("发生错误：" + jqXHR.status);
                        }
                    });
                }, function () {
                    //dosomething
                });

            });
            $(".refund").click(function (event) {
                $("#cancelButton").attr("data-orderId", $(this).attr("data-orderId"));
                layer.open({
                    type: 1,
                    title: '撤销订单',
                    area: layerWidth,
                    anim: 2,
                    content: $('#refund')
                });
            });
            $(".check-progress").click(function(event) {
                var value = $(this).attr("data-orderId");
                $.ajax({
                    type: "POST",
                    url: portPath+"userResident/getOrderServicePeople.do",
                    data: {
                        orderId:value
                    },
                    dataType: "json",
                    success: function(data){
                        createServicePeople(data);
                        layer.open({
                            type: 1,
                            title:''+data[0].serviceName+ '服务进展状态',
                            area: layerWidth,
                            anim: 2,
                            content: $('#service-progress')
                        });
                    },
                    error: function(jqXHR){
                        alert("发生错误：" + jqXHR.status);
                    }
                });
            });
            $(".orderConfirm").click(function(event) {
                var value = $(this).attr("data-orderId");
                layer.confirm('确认订单？', {
                    btn: ['确定','关闭'] //按钮d
                }, function(){
                    $.ajax({
                        type: "POST",
                        url: portPath+"userResident/confirmOrder.do",
                        data: {
                            orderId:value
                        },
                        dataType: "json",
                        success: function(data){
                            if(data){
                                layer.msg("已确认",{
                                    time: 1000
                                });
                                setTimeout("location.replace(location.href)",1000);
                            }
                        },
                        error: function(jqXHR){
                            alert("发生错误：" + jqXHR.status);
                        }
                    });
                }, function(){
                    //dosomething
                });

            });
        });
    }

    function createServicePeople(data) {
        var container = $("#service-container");
        container.html("");
        var status;
        if(data.length==0){
            status = 0;
		}else {
            status = data[0].orderStatus;
		}
        var node;
        switch (status){
			case 0:
                node = '<!-- 状态 -->' +
                    '<div class="state layui-row">' +
                    '<hr class="layui-bg-green">' +
                    '<div class="layui-col-md4 layui-col-sm4 layui-col-xs4">' +
                    '<div class="state-detail" id="process1" style="background: #009688;"><p style="color: #fff">派遣中</p></div>' +
                    '</div>' +
                    '<div class="layui-col-md4 layui-col-sm4 layui-col-xs4">' +
                    '<div class="state-detail" id="process2"><p>已到达目的地</p></div>' +
                    '</div>' +
                    '<div class="layui-col-md4 layui-col-sm4 layui-col-xs4">' +
                    '<div class="state-detail" id="process3"><p>订单交易成功</p></div>' +
                    '</div>' +
                    '</div>' +
                    '<hr>' ;
				break;
			case 1:
                node = '<!-- 状态 -->' +
                    '<div class="state layui-row">' +
                    '<hr class="layui-bg-green">' +
                    '<div class="layui-col-md4 layui-col-sm4 layui-col-xs4">' +
                    '<div class="state-detail" id="process1" ><p >派遣中</p></div>' +
                    '</div>' +
                    '<div class="layui-col-md4 layui-col-sm4 layui-col-xs4">' +
                    '<div class="state-detail" id="process2" style="background: #009688;"><p style="color: #fff">已到达目的地</p></div>' +
                    '</div>' +
                    '<div class="layui-col-md4 layui-col-sm4 layui-col-xs4">' +
                    '<div class="state-detail" id="process3"><p>订单交易成功</p></div>' +
                    '</div>' +
                    '</div>' +
                    '<hr>' +
                    '<!-- 员工 -->' +
                    '<h2 class="layui-col-md12 layui-col-sm12 layui-col-xs12">服务人员情况</h2>';
			    break;
			case 2:
                node = '<!-- 状态 -->' +
                    '<div class="state layui-row">' +
                    '<hr class="layui-bg-green">' +
                    '<div class="layui-col-md4 layui-col-sm4 layui-col-xs4">' +
                    '<div class="state-detail" id="process1" ><p >派遣中</p></div>' +
                    '</div>' +
                    '<div class="layui-col-md4 layui-col-sm4 layui-col-xs4">' +
                    '<div class="state-detail" id="process2" ><p >已到达目的地</p></div>' +
                    '</div>' +
                    '<div class="layui-col-md4 layui-col-sm4 layui-col-xs4">' +
                    '<div class="state-detail" id="process3" style="background: #009688;"><p style="color: #fff">订单交易成功</p></div>' +
                    '</div>' +
                    '</div>' +
                    '<hr>' +
                    '<!-- 员工 -->' +
                    '<h2 class="layui-col-md12 layui-col-sm12 layui-col-xs12">服务人员情况</h2>';
			    break;
		}

		for(var i=0;i<data.length;i++){
			 node += '<div class="staff-wrap">' +
                 '<div class="staff layui-row row1 layui-col-space10">' +
                 '<div class="layui-col-md4 layui-col-sm4 layui-col-xs12 img-wrap">' +
                 '<img src="'+data[i].spHead+'" onerror="this.src=\"http://t.cn/RCzsdCq\" " >' +
                 '</div>' +
                 '<div class="layui-col-md8 layui-col-sm12 layui-col-xs12">' +
                 '<div class="layui-row row2 layui-col-space10">' +
                 '<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">姓名：'+data[i].spName+'</p>' +
                 '<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">年龄：'+jsGetAge(data[i].spBirth)+'</p>' +
                 '<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">性别：'+data[i].spSex+'</p>' +
                 '<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">体重：'+data[i].spWeight+'</p>' +
                 '<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">身高：'+data[i].spHeight+'</p>' +
                 '<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">民族：'+data[i].spNation+'</p>' +
                 '<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">联系电话：'+data[i].spPhone+'</p>' +
                 '<p class="layui-col-md12 layui-col-sm12 layui-col-xs12">其他说明：'+data[i].spOtherinfo+'</p>' +
                 '</div>' +
                 '</div>' +
                 '</div>' +
                 '</div>' +
                 '<hr>';
		}
		container.append(node);
    }

    /*根据出生日期算出年龄*/
    function jsGetAge(strBirthday){
        var returnAge;
        var strBirthdayArr=strBirthday.split("-");
        var birthYear = strBirthdayArr[0];
        var birthMonth = strBirthdayArr[1];
        var birthDay = strBirthdayArr[2];

        d = new Date();
        var nowYear = d.getFullYear();
        var nowMonth = d.getMonth() + 1;
        var nowDay = d.getDate();

        if(nowYear == birthYear){
            returnAge = 0;//同年 则为0岁
        }
        else{
            var ageDiff = nowYear - birthYear ; //年之差
            if(ageDiff > 0){
                if(nowMonth == birthMonth) {
                    var dayDiff = nowDay - birthDay;//日之差
                    if(dayDiff < 0)
                    {
                        returnAge = ageDiff - 1;
                    }
                    else
                    {
                        returnAge = ageDiff ;
                    }
                }
                else
                {
                    var monthDiff = nowMonth - birthMonth;//月之差
                    if(monthDiff < 0)
                    {
                        returnAge = ageDiff - 1;
                    }
                    else
                    {
                        returnAge = ageDiff ;
                    }
                }
            }
            else
            {
                returnAge = -1;//返回-1 表示出生日期输入错误 晚于今天
            }
        }

        return returnAge;//返回周岁年龄

    }
</script>
</html>