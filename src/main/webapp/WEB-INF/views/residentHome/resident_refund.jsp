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
    			<a href="<%=portPath%>userResident/order.html"><li><i class="iconfont">&#xe6c1;</i> 我的订单</li></a>
    			<a href="<%=portPath%>userResident/focus.html"><li><i class="iconfont">&#xe611;</i> 我关注的</li></a>
    			<li class="layui-this"><i class="iconfont">&#xe614;</i> 退款详情</li>
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
    			<div class="layui-tab-item tab4">
    			</div>
    			<!-- 退款详情 -->
    			<div class="layui-tab-item layui-show tab5">
    				<h3><i class="iconfont title">&#xe614;</i> 退款详情</h3>
    				<hr class="layui-bg-green">
    				<div class="layui-container">
						<c:if test="${orderCancels!=null}">
							<c:forEach var="order" items="${orderCancels}">
								<div class="refund-wrap">
									<hr>
									<!-- 公司名&关注 -->
									<div class="layui-row layui-col-space10 row1">
										<div class="layui-col-md8 layui-col-sm12 layui-col-xs12 name-wrap">
											<a href="javascrapt:">${order.storeInfo.storeName}</a>
											<c:if test="${order.status==3}">
												<p>退款状态：退款中</p>
											</c:if>
											<c:if test="${order.status==4}">
												<p>退款状态：退款成功</p>
											</c:if>
										</div>
										<div class="layui-col-md2 layui-col-sm6 layui-col-xs12">
											<button class="layui-btn" onclick="location.href='<%=portPath%>service/detail/${order.offerService.offerserviceid}'">
												<i class="iconfont">&#xe611;</i> 关注服务
											</button>
										</div>
										<div class="layui-col-md2 layui-col-sm6 layui-col-xs12">
											<button class="layui-btn layui-btn-danger refund-reason" data-refundId="${order.cancel.cancelid}">
												<i class="iconfont">&#xe614;</i> 退款原因
											</button>
										</div>
									</div>
									<div class="layui-row layui-col-space10 row2">
										<div class="layui-col-md3 layui-col-sm4 layui-col-xs12 img-wrap">
											<img src="${order.offerService.serviceImg}" onerror="this.src='../../../resources/images/家居9.jpg'">
										</div>
										<!-- 服务名&描述 -->
										<div class="layui-col-md9 layui-col-sm8 layui-col-xs12">
											<div class="layui-row row2-1 layui-col-space10">
												<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 service-wrap">
													<a href="<%=portPath%>service/detail/${order.offerService.offerserviceid}" class="layui-col-md6 layui-col-sm6 layui-col-xs12">${order.offerService.serviceName}</a>
													<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">退款编号：${order.orderNumber}</p>
												</div>
												<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 price-wrap">
													<p>退款金额：￥${order.offerService.price}</p>
												</div>
												<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 detail-wrap">
													<p>${order.offerService.introduce}</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
    				</div>
    				</div>
					<div id="refund-page"></div>
				</div>
  			</div>
		</div>
	</div>
	</div>
	<footer>
		<p>Husbandry-&copy2017</p>
	</footer>
	<form id="uploadForm" enctype="multipart/form-data">

	</form>
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
	</div>
</body>
<script>
    var registNum = "${user.registNum}";
    var headImg = "${user.headImg}";
    var updatePath = "<%=updatePath%>";
    var orderCancelPages = "${orderCancelPages}";
    var pageSize = "${pageSize}";
    var portPath = "<%=portPath%>";

    layui.use('laypage', function() {
        var laypage = layui.laypage;
        //执行一个laypage实例
        //退款详情
        laypage.render({
            elem: 'refund-page', //这里是ID，不用加 # 号
            count: orderCancelPages*pageSize, //数据总数，从服务端得到
            limit: pageSize,
            jump: function(obj, first){
                //obj包含了当前分页的所有参数，比如：
                //首次不执行
                if(!first){
                    $.ajax({
                        type: "POST",
                        url: portPath+"userResident/getOrderCancel.do",
                        data: {
                            currentPage:obj.curr,
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

    function createOrders(data) {
        var container = $(".layui-container:eq(1)");
        var line;
        for(var i=0;i<data.length;i++){
            if(data[i].status==3){
                line = '<p>退款状态：退款中</p>';
            }else if(data[i].status ==4){
                line = '<p>退款状态：退款成功</p>';
            }
			var href= portPath+"service/detail/"+data[i].offerService.offerserviceid;
            container.html("");
            var node = '<div class="refund-wrap">' +
                '<hr>' +
                '<!-- 公司名&关注 -->' +
                '<div class="layui-row layui-col-space10 row1">' +
                '<div class="layui-col-md8 layui-col-sm12 layui-col-xs12 name-wrap">' +
                '<a href="javascrapt:">'+data[i].storeInfo.storeName+'</a>' +
                line+
                '</div>' +
                '<div class="layui-col-md2 layui-col-sm6 layui-col-xs12">' +
                '<button class="layui-btn" onclick="location.href=\''+href+'\'">' +
                '<i class="iconfont">&#xe611;</i> 关注服务' +
                '</button>' +
                '</div>' +
                '<div class="layui-col-md2 layui-col-sm6 layui-col-xs12">' +
                '<button class="layui-btn layui-btn-danger refund-reason" data-refundId="'+data[i].cancel.cancelid+'">' +
                '<i class="iconfont">&#xe614;</i> 退款原因' +
                '</button>' +
                '</div>' +
                '</div>' +
                '<div class="layui-row layui-col-space10 row2">' +
                '<div class="layui-col-md3 layui-col-sm4 layui-col-xs12 img-wrap">' +
                '<img src="'+data[i].offerService.serviceImg+'" onerror="this.src=\'../../../resources/images/家居9.jpg\'">' +
                '</div>' +
                '<!-- 服务名&描述 -->' +
                '<div class="layui-col-md9 layui-col-sm8 layui-col-xs12">' +
                '<div class="layui-row row2-1 layui-col-space10">' +
                '<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 service-wrap">' +
                '<a href="'+href+'" class="layui-col-md6 layui-col-sm6 layui-col-xs12">'+data[i].offerService.serviceName+'</a>' +
                '<p class="layui-col-md6 layui-col-sm6 layui-col-xs12">退款编号：'+data[i].orderNumber+'</p>' +
                '</div>' +
                '<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 price-wrap">' +
                '<p>退款金额：￥'+data[i].offerService.price+'</p>' +
                '</div>' +
                '<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 detail-wrap">' +
                '<p>'+data[i].offerService.introduce+'</p>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>';
            container.append(node);
		}


    }
</script>
</html>