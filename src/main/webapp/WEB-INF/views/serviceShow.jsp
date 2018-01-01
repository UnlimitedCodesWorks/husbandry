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
	<script src="../../resources/js/serviceShow.js"></script>
	<script src="https://unpkg.com/element-ui/lib/index.js"></script>
	<script src="https://webapi.amap.com/js/marker.js"></script>
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
						<dd><a href="<%=portPath%>userResident/information/${user.userid}">个人中心</a></dd>
						<dd><a href="<%=portPath%>userResident/message.html">消息中心<span class="layui-badge">${feedbackNum}</span></a></dd>
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
				  						score-template="<c:if test="${service.grade==0}">未评分</c:if><c:if test="${service.grade!=0}">${service.grade}</c:if>">
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
									<button class="layui-btn layui-btn-primary" onclick="location.href='<%=portPath%>serviceForm/view.html?kind=${service.serid}&serviceId=${service.offerserviceid}'">
									<i class="iconfont">&#xe6c9;</i> 预约
									</button>
								</div>
								<div class="layui-col-md4 layui-col-sm4 layui-col-xs12" id="concern-container">
									<c:if test="${!ifConcern}">
										<button class="layui-btn" onclick="concernService()">
											<i class="iconfont">&#xe611;</i> 关注服务
										</button>
									</c:if>
									<c:if test="${ifConcern}">
										<button class="layui-btn" style="background: #c2c2c2;" onclick="unconcernService()" >
											<i class="iconfont">&#xe611;</i> 取消关注
										</button>
									</c:if>
								</div>
								<div class="layui-col-md4 layui-col-sm4 layui-col-xs12">
									<button class="layui-btn layui-btn-danger">
									<i class="iconfont">&#xe66e;</i> 联系商家
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
							<a href="<%=portPath%>store/information/${service.store.storeid}" title="${service.store.storeName}"><h3 style="text-align: center;font-weight: bold;">${service.store.storeName}</h3></a>
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
				<div class="serviceShow_map" id="serviceshow_map"></div>
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
							<c:if test="${ifComment}">
   							<form class="layui-form" id="comment" action="" style="position: relative;cursor: text;">
   								<p style="font-size: 18px;color: #a8a8a8;position: absolute;left: 10px;top: 5px;"><i class="iconfont">&#xe62b;</i> 发表评论</p>
      							<input type="text" autocomplete="off" class="layui-input" disabled style="cursor: text;">
  							</form>
							</c:if>
							<c:if test="${!ifComment}">
								<form class="layui-form" id="comment1" action="" style="position: relative;cursor: text;">
									<p style="font-size: 18px;color: #a8a8a8;position: absolute;left: 10px;top: 5px;"><i class="iconfont">&#xe62b;</i> 你已经评价过或未预约该服务，故无法发表评论</p>
									<input type="text" autocomplete="off" class="layui-input" disabled style="cursor: text;">
								</form>
							</c:if>
   						</div>
   						<div class="layui-fliud comment-wrap" id="commet-container">
   							<!-- 评论 -->
                            <c:if test="${evaluates!=null}">
                                <c:forEach var="evaluate" items="${evaluates}">
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
   											<c:if test="${userId==replyId}"><a href="javascript:void(0)" onclick="deleteEvaluate(${evaluate.evaluateserviceid})">删除评论</a></c:if>
   											<%--<el-rate v-model="${evaluate.grade/2}" disabled show-score text-color="#ff9900" score-template="${evaluate.grade}" :colors="['#99A9BF', '#F7BA2A', '#FF9900']" style="float: right;">--%>
				  							<%--</el-rate>--%>
											<div style="float:right;">
												<span class="raty" data-score="${evaluate.grade/2}"></span>
												<p style="color: rgb(255, 153, 0);padding-left: 5px;">${evaluate.grade}</p>
											</div>
   										</div>
   										<div class="layui-col-md12 layui-col-sm12" style="min-height: 49.8px;">${evaluate.content}</div>
   										<div class="layui-col-md12 layui-col-sm12">
   											<p><fmt:formatDate value="${evaluate.time}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
   											<span class="layui-breadcrumb" lay-separator="|">
  												<a href="javascript:void(0);" onclick="support(${evaluate.evaluateserviceid},${evaluate.praise},this)" class="good"><i class="iconfont">&#xe60a;</i> (${evaluate.praise})</a>
  												<a href="javascript:void(0);" onclick="reply(${evaluate.evaluateserviceid})" class="reply">回复</a>
											</span>
   										</div>
   									</div>
   									<!-- 回复 -->
                                    <c:if test="${evaluate.eserviceUsers!=null}">
                                        <c:forEach var="eserviceEvaluate" items="${evaluate.eserviceUsers}">
											<hr>
   									<div class="row-in2 layui-row layui-col-space10">
   										<!-- 回复人头像 -->
   										<div class="layui-col-md1 layui-col-sm2">
   											<div class="head-wrap-sub">
   												<a href="<%=portPath%>userResident/information/${eserviceEvaluate.user.userId}"> <img src="${eserviceEvaluate.user.headImg}" onerror="this.src='http://t.cn/RCzsdCq'"></a>
   											</div>
   										</div>
   										<!-- 容器 -->
   										<div class="layui-col-md11 layui-col-sm10">
   											<!-- 回复人内容 -->
   											<div class="row-in-in layui-row layui-col-space10">
   												<div class="layui-col-md6 layui-col-sm6">
   													<a href="<%=portPath%>userResident/information/${eserviceEvaluate.user.userId}"><h4>${eserviceEvaluate.user.userName}</h4></a>
													<c:set var="userId" value="${user.userid}" />
													<c:set var="replyId" value="${eserviceEvaluate.user.userId}" />
													<c:if test="${userId==replyId}"><a href="javascript:void(0)" onclick="deleteReply(${eserviceEvaluate.eserviceuserid})">删除评论</a></c:if>
   												</div>
   												<div class="layui-col-md12 layui-col-sm12">${eserviceEvaluate.content}</div>
   												<div class="layui-col-md12 layui-col-sm12">
   													<p><fmt:formatDate value="${eserviceEvaluate.time}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
   												</div>
   											</div>
   										</div>
   									</div>
                                        </c:forEach>
										<div class="reply-page" data-pages="${evaluate.eservicePages}" data-evaluateId="${evaluate.evaluateserviceid}"></div>
                                    </c:if>
   								</div>
   							</div>
                                </c:forEach>
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
	<!-- 评论 -->
	<div id="comment-modal" class="modal">
		<div class="layui-fluid">
			<h2 style="margin-bottom: 0px;">发表评论</h2>
			<el-rate
    			v-model="value"
				text-color="#ff9900"
				style="float: right;margin-top: 10px;">
			</el-rate>
			<hr>
			<form class="layui-form" action="">
  				<div class="layui-form-item layui-form-text">
      				<textarea placeholder="请输入您想要发表的评论" required lay-verify="required" class="layui-textarea" rows="6"></textarea>
      				<p>至多输入300个字</p>
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
      				<p>至多输入300个字</p>
      				<button class="layui-btn" lay-submit id="reply-submit" >回复</button>
  				</div>
  			</form>
		</div>
	</div>
	<!-- 投诉 -->
	<div id="complaint-modal" class="modal">
		<div class="layui-fluid">
			<h2 class="layui-col-md12 layui-col-sm12 layui-col-xs12" style="color: #FF5722;">联系商家</h2>
			<hr>
			<form class="layui-form" action="">
				<div class="layui-form-item layui-form-text">
					<textarea placeholder="请输入内容" required lay-verify="required" class="layui-textarea" rows="6" id="complain-content"></textarea>
					<p>至多输入300个字</p>
					<button class="layui-btn" lay-submit id="complaint-submit" style="background: #FF5722;">提交</button>
				</div>
			</form>
		</div>
	</div>
</body>
<script>
	var areaData=${areaJson};
    var evaluatePages = "${evaluatePages}";
    var pageSize = "${pageSize}";
	var sonPageSize = "${sonPageSize}";
	var portPath = '<%=portPath%>';
    var userId = "${user.userid}";
    var serviceId = "${service.offerserviceid}";
    var schema = true;

	function support(evaluateId,praise,e) {
        $.ajax({
            type: "POST",
            url: portPath+"service/support.do",
            data: {
                evaluateId:evaluateId
            },
            dataType: "json",
            success: function(data){
                praise++;
				if(data){
				    $(e).html('<i class="iconfont">&#xe60a;</i> ('+praise+')');
				}
				$(e).removeAttr("onclick");
            },
            error: function(jqXHR){
                alert("发生错误：" + jqXHR.status);
            }
        });
    }

    function reply(evaluateId) {
		$("#reply-submit").attr("data-evaluateId",evaluateId);
        if($(window).width()>=768) {
            layerWidth = '50%';
        }
        else {
            layerWidth = '80%';
        }
        layui.use('layer', function() {
            var layer = layui.layer;
            layer.open({
                type: 1,
                title: '回复',
                area: layerWidth,
                anim: 2,
                content: $('#reply-modal')
            });
        });
    }

    $("#reply-submit").click(function () {
		var value = $(this).attr("data-evaluateId");
		var content = $("#reply-content").val();
		if(content.length!=0){
            layui.use('layer', function() {
                var layer = layui.layer;
            $.ajax({
                type: "POST",
                url: portPath+"service/replyEvaluate.do",
                data: {
                    eserviceId:value,
					userId:${user.userid},
					content:content
                },
                dataType: "json",
                success: function(data){
                    layer.msg("回复成功",{
                        time: 1000
                    });
                    setTimeout("location.replace(location.href)",1000);
                },
                error: function(jqXHR){
                    alert("发生错误：" + jqXHR.status);
                }
            });
			});
		}
    });

	function concernService () {
        layui.use('layer', function() {
            var layer = layui.layer;
            layer.confirm('您确定要关注该服务吗？', {
                btn: ['确定','关闭'] //按钮d
            }, function(){
                $.ajax({
                    type: "POST",
                    url: portPath+"service/concernService.do",
                    data: {
                        serviceId:serviceId,
                        userId:userId
                    },
                    dataType: "json",
                    success: function(data){
                        if(data){
                            layer.msg("关注成功",{
                                time: 1000
                            });
                            var node ='<button class="layui-btn" style="background: #c2c2c2" onclick="unconcernService()">' +
                                '<i class="iconfont">&#xe611;</i> 取消关注' +
                                '</button>';
                            $("#concern-container").html(node);
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
    }

   function unconcernService() {
        layui.use('layer', function() {
            var layer = layui.layer;
            layer.confirm('您确定要取消关注该服务吗？', {
                btn: ['确定','关闭'] //按钮d
            }, function(){
                $.ajax({
                    type: "POST",
                    url: portPath+"service/unConcernService.do",
                    data: {
                        serviceId:serviceId,
                        userId:userId
                    },
                    dataType: "json",
                    success: function(data){
                        if(data){
                            layer.msg("取消关注成功",{
                                time: 1000
                            });
                            var node ='<button class="layui-btn" onclick="concernService()">' +
                                '<i class="iconfont">&#xe611;</i> 关注服务' +
                                '</button>';
                            $("#concern-container").html(node);
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
    }
	function deleteEvaluate(evaluateId) {
        layui.use('layer', function() {
            var layer = layui.layer;
            layer.confirm('您确定要删除该评论吗？', {
                btn: ['确定','关闭'] //按钮d
            }, function(){
                $.ajax({
                    type: "POST",
                    url: portPath+"service/deleteEvaluate.do",
                    data: {
                        evaluateId:evaluateId
                    },
                    dataType: "json",
                    success: function(data){
                        if(data){
                            layer.msg("删除成功",{
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
    }
    function deleteReply(replyId) {
        layui.use('layer', function() {
            var layer = layui.layer;
            layer.confirm('您确定要删除该评论吗？', {
                btn: ['确定', '关闭'] //按钮d
            }, function () {
                $.ajax({
                    type: "POST",
                    url: portPath+"service/deleteReply.do",
                    data: {
                        replyId:replyId
                    },
                    dataType: "json",
                    success: function(data){
                        if(data){
                            layer.msg("删除成功",{
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
    }

    function createEvaluates(data) {
	    var container = $("#commet-container");
	    container.html("");
		for(var i=0;i<data.length;i++){
		    var userHref = portPath+"userResident/information/"+data[i].user.userId;
		    var replyId = data[i].user.userId;
		    var evaluateId = data[i].evaluateserviceid;
		    var deleteNode="";
		    if(userId ==replyId){
		        deleteNode = '<a href="javascript:void(0)" onclick="deleteEvaluate('+evaluateId+')">删除评论</a>';
            }
		    var node = '<hr>' +
                    '<div class="row layui-row layui-col-space10">' +
                    '<!-- 主评人头像 -->' +
                    '<div class="layui-col-md2 layui-col-sm2" style="position: relative;min-height: 110px;">' +
                    '<div class="head-wrap">' +
                    '<a href="'+userHref+'"> <img src="'+data[i].user.headImg+'" onerror="this.src=\'http://t.cn/RCzsdCq\'"></a>' +
                    '</div>' +
                    '</div>' +
                    '<!-- 主容器 -->' +
                    '<div class="layui-col-md10 layui-col-sm10">' +
                    '<!-- 主评人内容 -->' +
                    '<div class="row-in1 layui-row layui-col-space10">' +
                    '<div class="layui-col-md12 layui-col-sm12">' +
                    '<a href="'+userHref+'"><h4>'+data[i].user.userName+'</h4></a>' +
                    deleteNode+'<div style="float:right;">' +
                	'<span class="raty" data-score="'+(data[i].grade/2)+'"></span>' +
                	'<p style="color: rgb(255, 153, 0);padding-left: 5px;">'+data[i].grade.toFixed(1)+'</p>' +
                	'</div>'+
                    '</div>' +
                    '<div class="layui-col-md12 layui-col-sm12" style="min-height: 49.8px;">'+data[i].content+'</div>' +
                    '<div class="layui-col-md12 layui-col-sm12">' +
                    '<p>'+data[i].time+'</p>' +
                    '<span class="layui-breadcrumb" lay-separator="|"  >' +
                    '<a href="javascript:void(0);" onclick="support('+data[i].evaluateserviceid+','+data[i].praise+',this)" class="good"><i class="iconfont">&#xe60a;</i> ('+data[i].praise+')</a>' +
                    '<a href="javascript:void(0);" onclick="reply('+data[i].evaluateserviceid+')" class="reply">回复</a>' +
                    '</span>' +
                    '</div>' +
                    '</div>' +
                    '<!-- 回复 -->' ;
		    for(var j=0;j<data[i].eserviceUsers.length;j++){
                var euserHref = portPath+"userResident/information/"+data[i].eserviceUsers[j].user.userId;
                var ereplyId = data[i].eserviceUsers[j].user.userId;
                var edeleteNode="";
                if(userId==ereplyId){
                    edeleteNode = '<a href="javascript:void(0)" onclick="deleteReply('+data[i].eserviceUsers[j].eserviceuserid+')">删除评论</a>';
				}
		        node+=
                    '<hr>' +
                    '<div class="row-in2 layui-row layui-col-space10">' +
                    '<!-- 回复人头像 -->' +
                    '<div class="layui-col-md1 layui-col-sm2">' +
                    '<div class="head-wrap-sub">' +
                    '<a href="'+euserHref+'"> <img src="'+data[i].eserviceUsers[j].user.headImg+'" onerror="this.src=\'http://t.cn/RCzsdCq\'"></a>' +
                    '</div>' +
                    '</div>' +
                    '<!-- 容器 -->' +
                    '<div class="layui-col-md11 layui-col-sm10">' +
                    '<!-- 回复人内容 -->' +
                    '<div class="row-in-in layui-row layui-col-space10">' +
                    '<div class="layui-col-md6 layui-col-sm6">' +
                    ' <a href="'+euserHref+'"><h4>'+data[i].eserviceUsers[j].user.userName+'</h4></a>' +
                   	edeleteNode +
                    '</div>' +
                    '<div class="layui-col-md12 layui-col-sm12">'+data[i].eserviceUsers[j].content+'</div>' +
                    '<div class="layui-col-md12 layui-col-sm12">' +
                    '<p>'+data[i].eserviceUsers[j].time+'</p>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' ;

			}
			node+='<div class="reply-page" data-pages="'+data[i].eservicePages+'" data-evaluateId="'+data[i].evaluateserviceid+'"></div>'+'</div>' +
                '</div>';
		    container.append(node);
            $(".raty").raty({
                path: '../../resources/images',
                readOnly: true,
                score: function() {
                    return $(this).attr('data-score');
                }
            });
		}
        layui.use('element', function(){
            //实例化element
            var element = layui.element;
            //初始化动态元素
            element.init();
        });
        layui.use('laypage', function() {
            var laypage = layui.laypage;
            //执行一个laypage实例
            $('.reply-page').each(function () {
                var node = $(this);
                var container = node.prev();
                var pages = $(this).attr("data-pages");
                var evaluateId = $(this).attr("data-evaluateId");
                laypage.render({
                    elem: node //注意，这里的 test1 是 ID，不用加 # 号
                    ,count: pages*sonPageSize //数据总数，从服务端得到
                    ,limit: sonPageSize
                    ,theme: 'reply'
                    ,container:container
                    ,evaluateId:evaluateId
                    ,jump: function(obj, first){
                        //首次不执行
                        if(!first){
                            $.ajax({
                                type: "POST",
                                url: portPath+"service/getAllReplyByEvaluateId.do",
                                data: {
                                    evaluateId:obj.evaluateId,
                                    currentPage:obj.curr
                                },
                                dataType: "json",
                                success: function(data){
                                    createReplys(data,obj.container);
                                },
                                error: function(jqXHR){
                                    alert("发生错误：" + jqXHR.status);
                                }
                            });
                        }
                    }
                });
            });
        });
    }

    function createReplys(data,container) {
	    container.html("");
		for(var i=0;i<data.length;i++){
            var euserHref = portPath+"userResident/information/"+data[i].user.userId;
            var ereplyId = data[i].user.userId;
            var edeleteNode="";
            if(userId==ereplyId){
                edeleteNode = '<a href="javascript:void(0)" onclick="deleteReply('+data[i].eserviceuserid+')">删除评论</a>';
            }
            var node=
                '<div class="row-in2 layui-row layui-col-space10">' +
                '<!-- 回复人头像 -->' +
                '<div class="layui-col-md1 layui-col-sm2">' +
                '<div class="head-wrap-sub">' +
                '<a href="'+euserHref+'"> <img src="'+data[i].user.headImg+'" onerror="this.src=\'http://t.cn/RCzsdCq\'"></a>' +
                '</div>' +
                '</div>' +
                '<!-- 容器 -->' +
                '<div class="layui-col-md11 layui-col-sm10">' +
                '<!-- 回复人内容 -->' +
                '<div class="row-in-in layui-row layui-col-space10">' +
                '<div class="layui-col-md6 layui-col-sm6">' +
                ' <a href="'+euserHref+'"><h4>'+data[i].user.userName+'</h4></a>' +
                edeleteNode +
                '</div>' +
                '<div class="layui-col-md12 layui-col-sm12">'+data[i].content+'</div>' +
                '<div class="layui-col-md12 layui-col-sm12">' +
                '<p>'+data[i].time+'</p>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>' ;
            container.append(node);
		}
    }
</script>
<script src="http://webapi.amap.com/maps?v=1.4.2&key=d03a55076cfdeee9a60430078e3c2904"></script>
<script type="text/javascript">

	$(function() {
	    console.log(areaData);
        var map = new AMap.Map('serviceshow_map');
        //设置放大级别
        map.setZoom(4);
        map.setCenter([105.387951,36.27871]);
        //自定义图标
        var icon = new AMap.Icon({
            image: '../../resources/images/storemark.png',
            size: new AMap.Size(24, 24)
        });
        // 创建地图上的标记点
        var title_storename = '${service.serviceName}';


        //添加题图上的各类使用工具
        AMap.plugin(['AMap.ToolBar'], function () {
            //工具条 ToolBar
            //比例尺 Scale
            //定位 Geolocation
            //鹰眼 OverView
            //类型切换 MapType

            var toolBar = new AMap.ToolBar();
            map.addControl(toolBar);

        });
        //添加地图样式
        map.setMapStyle('amap://styles/whitesmoke');

        addChina();
        //叠加云数据图层
        function addChina() {
            //加载云图层插件
            AMap.service('AMap.DistrictSearch', function() {
                var opts = {
                    subdistrict: 1, //返回下一级行政区
                    extensions: 'all', //返回行政区边界坐标组等具体信息
                    level: 'city' //查询行政级别为 市
                };

                //实例化DistrictSearch
                district = new AMap.DistrictSearch(opts);
                district.setLevel('district');
                //行政区查询
                var search_city = [];
                for(var i=0;i<areaData.length;i++){
                    search_city[i]=areaData[i].city;
                }
                for (var i = 0; i < search_city.length; i++) {
                    district.search(search_city[i], function(status, result) {
                        var bounds = result.districtList[0].boundaries;
                        var polygons = [];
                        if (bounds) {
                            for (var i = 0, l = bounds.length; i < l; i++) {
                                //生成行政区划polygon
                                var polygon = new AMap.Polygon({
                                    map: map,
                                    strokeWeight: 1,
                                    path: bounds[i],
                                    fillOpacity: 0.3,
                                    fillColor: '#CCF3FF',
                                    strokeColor: '#393D49'
                                });
                                polygons.push(polygon);
                            }

                        }
                    });
                }
            });
        }

        var address = [];
        for(var i=0; i< areaData.length;i++){
            address[i]=areaData[i].provinces.province+areaData[i].city;
		}
        for (var i = 0; i < address.length; i++) {
            addressInfo(address[i]);
        }

        function addressInfo(villPlace) {
            var geo;
            map.plugin(['AMap.Geocoder'], function() {
                geo = new AMap.Geocoder({});
                map.addControl(geo);
            });
            geo.getLocation(villPlace, function(status, result) {
                if (status === 'complete' && result.info === 'OK') {
                    callback(result);
                }
            });
        }


        //转化信息窗地址--------->经度纬度！！！！！再生成标记！！！
        function callback(place) {
            var code = place.geocodes;
            for (var i = 0; i < code.length; i++) {
                var Marker = new AMap.Marker({
                    icon: icon,
                    offset: new AMap.Pixel(-12, -24),
                    title: title_storename,
                    map: map,
                    position: [code[i].location.getLng(), code[i].location.getLat()],
                });
            }
        }

        $(window).resize(function () {
            if ($(window).width() < 768) {
                $(".serviceShow_map").css("width", "100%");

            } else {
                $(".serviceShow_map").css("width", "60%");

            }
        });
    })
</script>
</html>