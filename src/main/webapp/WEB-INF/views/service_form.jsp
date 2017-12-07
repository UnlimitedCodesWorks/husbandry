<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String portPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../../resources/css/layui.css">
    <link rel="stylesheet" href="../../resources/css/service_form.css">
    <title>智慧社区-需求表单</title>
</head>

<body>
    <header>
        <!-- 导航栏 -->
        <nav>
            <ul class="layui-nav">
                <li class="layui-nav-item ">
                    <a href="<%=portPath%>index.html" title="Husbandry">Husbandry</a>
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
                    <a href="javascript:;"><img src="../../resources/images/user.png" class="layui-nav-img">何华峰</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">个人中心<span class="layui-badge-dot"></span></a></dd>
                        <dd><a href="javascript:;">登出</a></dd>
                    </dl>
                </li>
            </ul>
        </nav>
    </header>
    <div class="layui-row layui-col-md12 layui-col-sm12 layui-col-xs12 service_form_second"></div>
    <div class="layui-row layui-col-md10 layui-col-sm10 layui-col-xs12 layui-col-sm-offset1  layui-col-md-offset1">
        <div class="layui-row layui-col-md7  service_form_main">
            <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 service_form_main_title">${serviceName}服务具体需求</div>
            <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 service_form_main_hint">您需要填写对服务的具体需求，以便您和服务商进行更好的沟通：</div>
            <div class="layui-col-md10 layui-col-md-offset1 layui-col-sm10 layui-col-sm-offset1 layui-col-xs10 layui-col-xs-offset1 service_form_main_qa">
                <form class="layui-col-md12 layui-form">
                    <input type="hidden" name="serviceId" value="${serviceId}">
                    <c:forEach var="problem" items="${serviceForm}">
                        <c:if test="${problem.proType=='checkbox'}" >
                            <div class="layui-form-item">
                                <label class="layui-col-md12 layui-col-sm12 layui-col-xs12 service_form_main_q">${problem.proName}</label>
                                <c:forEach var="value" items="${problem.values}">
                                    <input type="checkbox"  title="${value.content}">
                                </c:forEach>
                            </div>
                        </c:if>
                        <c:if test="${problem.proType=='radio'}" >
                            <div class="layui-form-item">
                                <label class="layui-col-md12 layui-col-sm12 layui-col-xs12 service_form_main_q">${problem.proName}</label>
                                <c:forEach var="value" items="${problem.values}">
                                    <input type="radio"  value="${value.content}" title="${value.content}">
                                </c:forEach>
                            </div>
                        </c:if>
                        <c:if test="${problem.proType=='select'}" >
                            <div class="layui-form-item">
                                <label class="layui-col-md12 layui-col-sm12 layui-col-xs12 service_form_main_q">${problem.proName}</label>
                                <select name="city" lay-verify="required">
                                    <option value=""></option>
                                    <c:forEach var="value" items="${problem.values}">
                                    <option value="${value.content}">${value.content}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </c:if>
                        <c:if test="${problem.proType=='textarea'}" >
                            <div class="layui-form-item layui-form-text">
                                <label class="layui-col-md12 layui-col-sm12 layui-col-xs12 service_form_main_q">${problem.proName}</label>
                                <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
                            </div>
                        </c:if>
                    </c:forEach>
                    <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-button">
                        <button type="submit" class="layui-btn layui-btn-primary layui-col-md12 layui-col-sm12 layui-col-xs12 service_form_btn">提交信息</button>
                    </div>
                </form>
                <div class="layui-row layui-col-md12 layui-col-sm12 layui-col-xs12 service_form_back">
                    <div class="layui-col-md2 layui-col-md-offset10 layui-col-sm2 layui-col-sm-offset10 layui-col-xs4 layui-col-xs-offset8 service_form_back1" onclick="location.href='<%=portPath%>index.html'">其他服务</div>
                </div>
            </div>
        </div>
        <div class="layui-col-md4">预约服务简单流程 等王总页面做好一起总和</div>
    </div>
    <div class="layui-row layui-col-md12 layui-col-sm12 layui-col-xs12">
        <footer>
            <p>Husbandry-&copy2017</p>
        </footer>
    </div>

    <script type="text/javascript" src="../../resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../../resources/layui.all.js"></script>
    <script type="text/javascript" src="../../resources/js/service_form.js"></script>
    <script type="text/javascript" src="../../resources/js/vue.js"></script>
</body>

</html>