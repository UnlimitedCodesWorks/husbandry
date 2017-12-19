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
									<div class="layui-col-md4 layui-col-sm12" id="concern-container">
										<c:if test="${!userConcern}">
										<button class="layui-btn" onclick="concernStore()">
											<i class="iconfont">&#xe611;</i> 关注
										</button>
										</c:if>
										<c:if test="${userConcern}">
										<button class="layui-btn" style="background: #c2c2c2" onclick="unconcernStore()">
											<i class="iconfont">&#xe611;</i> 取消关注
										</button>
										</c:if>
									</div>
									</c:if>
									<c:if test="${!empty store}">
									<div class="layui-col-md4 layui-col-sm12">
										<button class="layui-btn layui-btn-normal" onclick="javascript:window.location.href='<%=portPath%>storeAdmin/storeScore/${storeId}'">
											<i class="iconfont">&#xe722;</i>后台管理
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
	    						<div class="layui-row layui-col-space10" style="padding-bottom: 10px;" id="service-container">
									<c:if test="${!empty services}">
									<c:forEach var="service" items="${services}">
	    							<!-- 服务 -->
	    							<div class="layui-col-md3 layui-col-sm6 layui-col-xs12" >
		    							<div class="layui-row row-in" title="${service.serviceName}">
		    								<div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
												<a href="<%=portPath%>service/detail/${service.offerServiceId}"> <img src="${service.serviceImg}" onerror="this.src='../../resources/images/201291810101174356.jpg'"></a>
											</div>
		    								<div class="layui-row row-in2">
												<div class="layui-col-md8 layui-col-sm8 layui-col-xs8"><a href="<%=portPath%>service/detail/${service.offerServiceId}" class="service-title">${service.serviceName}</a></div>
												<div class="layui-col-md4 layui-col-sm4 layui-col-xs4">评分：<c:if test="${service.grade==0}">未评分</c:if><c:if test="${service.grade!=0}">${service.grade}分</c:if></div>
											</div>
											<div class="layui-row row-in3">
												<div class="layui-col-md6 layui-col-sm6 layui-col-xs6">${service.serviceFans}关注</div>
												<div class="layui-col-md6 layui-col-sm6 layui-col-xs6">${service.markNum}笔交易</div>
											</div>
		    							</div>
	    							</div>
									</c:forEach>
									</c:if>
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
						<c:if test="${!empty user}">
   						<div class="layui-fluid" style="padding: 20px;background: #efefef;">
   							<form class="layui-form" id="comment" action="" style="position: relative;cursor: text;">
   								<p style="font-size: 18px;color: #a8a8a8;position: absolute;left: 10px;top: 5px;"><i class="iconfont">&#xe62b;</i> 发表评论</p>
      							<input type="text" autocomplete="off" class="layui-input" disabled style="cursor: text;">
  							</form>
   						</div>
						</c:if>
   						<div class="layui-fliud comment-wrap" id="commet-container">
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
									<div class="reply-page" data-pages="${evaluate.estorePages}" data-evaluateId="${evaluate.evaluatestoreid}"></div>
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
</body>
<script>
    var loginStatus = ${!loginStatus};
    var servicePages = ${servicePages};
    var evaluatePages = ${evaluatePages};
    var servicePageSize = ${servicePageSize};
    var evaluatePageSize = ${evaluatePageSize};
    var sonPageSize = ${sonPageSize};
    var storeId = ${storeId};
    var portPath = "<%=portPath%>";
    var userId ="${user.userid}";
    var schema = true;

    function support(evaluateId,praise,e) {
        $.ajax({
            type: "POST",
            url: portPath+"store/support.do",
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
                    url: portPath+"store/replyEvaluate.do",
                    data: {
                        estoreId:value,
                        userId:userId,
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

    function concernStore () {
        layui.use('layer', function() {
            var layer = layui.layer;
            layer.confirm('您确定要关注该商户吗？', {
                btn: ['确定','关闭'] //按钮d
            }, function(){
                $.ajax({
                    type: "POST",
                    url: portPath+"store/concernStore.do",
                    data: {
                        storeId:storeId,
                        userId:userId
                    },
                    dataType: "json",
                    success: function(data){
                        if(data){
                            layer.msg("关注成功",{
                                time: 1000
                            });
                            var node ='<button class="layui-btn" style="background: #c2c2c2" onclick="unconcernStore()">'+
                                '<i class="iconfont">&#xe611;</i> 取消关注'+
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

    function unconcernStore() {
        layui.use('layer', function() {
            var layer = layui.layer;
            layer.confirm('您确定要取消关注该商户吗？', {
                btn: ['确定','关闭'] //按钮d
            }, function(){
                $.ajax({
                    type: "POST",
                    url: portPath+"store/unConcernStore.do",
                    data: {
                        storeId:storeId,
                        userId:userId
                    },
                    dataType: "json",
                    success: function(data){
                        if(data){
                            layer.msg("取消关注成功",{
                                time: 1000
                            });
                            var node ='<button class="layui-btn" onclick="concernStore()">' +
                                '<i class="iconfont">&#xe611;</i> 关注' +
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
                    url: portPath+"store/deleteEvaluate.do",
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
                    url: portPath+"store/deleteReply.do",
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


    function createServices(data) {
        var container = $("#service-container");
		container.html("");
		for(var i=0;i<data.length;i++){
		    var grade = data[i].grade;
		    if(grade == 0){
		        grade = "未评分";
			}else{
		        grade = ""+grade+"分";
			}
			var servicePath = portPath+"service/detail/"+data[i].offerServiceId;
		    var node = '<!-- 服务 -->' +
                '<div class="layui-col-md3 layui-col-sm6 layui-col-xs12" >' +
                '<div class="layui-row row-in" title="'+data[i].serviceName+'">' +
                '<div class="layui-col-md12 layui-col-sm12 layui-col-xs12">' +
                '<a href="'+servicePath+'"> <img src="'+data[i].serviceImg+'" onerror="this.src=\'../../resources/images/201291810101174356.jpg\'"></a>' +
                '</div>' +
                '<div class="layui-row row-in2">' +
                '<div class="layui-col-md8 layui-col-sm8 layui-col-xs8"><a href="'+servicePath+'" class="service-title">'+data[i].serviceName+'</a></div>' +
                '<div class="layui-col-md4 layui-col-sm4 layui-col-xs4">评分：'+grade+'</div>' +
                '</div>' +
                '<div class="layui-row row-in3">' +
                '<div class="layui-col-md6 layui-col-sm6 layui-col-xs6">'+data[i].serviceFans+'关注</div>' +
                '<div class="layui-col-md6 layui-col-sm6 layui-col-xs6">'+data[i].markNum+'笔交易</div>' +
                '</div>' +
                '</div>' +
                '</div>';
		    container.append(node);
		}
    }

    function createEvaluates(data) {
        var container = $("#commet-container");
        container.html("");
        for(var i=0;i<data.length;i++){
            var userHref = portPath+"userResident/information/"+data[i].user.userId;
            var replyId = data[i].user.userId;
            var evaluateId = data[i].evaluatestoreid;
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
                '</div>'+
                '</div>' +
                '<div class="layui-col-md12 layui-col-sm12" style="min-height: 49.8px;">'+data[i].content+'</div>' +
                '<div class="layui-col-md12 layui-col-sm12">' +
                '<p>'+data[i].time+'</p>' +
                '<span class="layui-breadcrumb" lay-separator="|"  >' +
                '<a href="javascript:void(0);" onclick="support('+data[i].evaluatestoreid+','+data[i].praise+',this)" class="good"><i class="iconfont">&#xe60a;</i> ('+data[i].praise+')</a>' +
                '<a href="javascript:void(0);" onclick="reply('+data[i].evaluatestoreid+')" class="reply">回复</a>' +
                '</span>' +
                '</div>' +
                '</div>' +
                '<!-- 回复 -->' ;
            for(var j=0;j<data[i].estoreUserList.length;j++){
                var euserHref = portPath+"userResident/information/"+data[i].estoreUserList[j].user.userId;
                var ereplyId = data[i].estoreUserList[j].user.userId;
                var edeleteNode="";
                if(userId==ereplyId){
                    edeleteNode = '<a href="javascript:void(0)" onclick="deleteReply('+data[i].estoreUserList[j].estoreuserid+')">删除评论</a>';
                }
                node+=
                    '<hr>' +
                    '<div class="row-in2 layui-row layui-col-space10">' +
                    '<!-- 回复人头像 -->' +
                    '<div class="layui-col-md1 layui-col-sm2">' +
                    '<div class="head-wrap-sub">' +
                    '<a href="'+euserHref+'"> <img src="'+data[i].estoreUserList[j].user.headImg+'" onerror="this.src=\'http://t.cn/RCzsdCq\'"></a>' +
                    '</div>' +
                    '</div>' +
                    '<!-- 容器 -->' +
                    '<div class="layui-col-md11 layui-col-sm10">' +
                    '<!-- 回复人内容 -->' +
                    '<div class="row-in-in layui-row layui-col-space10">' +
                    '<div class="layui-col-md6 layui-col-sm6">' +
                    ' <a href="'+euserHref+'"><h4>'+data[i].estoreUserList[j].user.userName+'</h4></a>' +
                    edeleteNode +
                    '</div>' +
                    '<div class="layui-col-md12 layui-col-sm12">'+data[i].estoreUserList[j].content+'</div>' +
                    '<div class="layui-col-md12 layui-col-sm12">' +
                    '<p>'+data[i].estoreUserList[j].time+'</p>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' ;

            }
            node+='<div class="reply-page" data-pages="'+data[i].estorePages+'" data-evaluateId="'+data[i].evaluatestoreid+'"></div>'+'</div>' +
                '</div>';
            container.append(node);
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
                                url: portPath+"store/getAllEstoreUserByEstoreId.do",
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
                edeleteNode = '<a href="javascript:void(0)" onclick="deleteReply('+data[i].estoreuserid+')">删除评论</a>';
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
</html>