<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String portPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
    String submitPath=portPath+"serviceForm/submitRequire.do";
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
    <div class="layui-row layui-col-md12 layui-col-sm12 layui-col-xs12 service_form_second"></div>
    <div class="layui-row layui-col-md10 layui-col-sm10 layui-col-xs12 layui-col-sm-offset1  layui-col-md-offset1">
        <div class="layui-row layui-col-md7 layui-col-sm12 layui-col-xs12  service_form_main">
            <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 service_form_main_title">${serviceName}服务具体需求</div>
            <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 service_form_main_hint">您需要填写对服务的具体需求，以便您和服务商进行更好的沟通：</div>
            <div class="layui-col-md10 layui-col-md-offset1 layui-col-sm10 layui-col-sm-offset1 layui-col-xs10 layui-col-xs-offset1 service_form_main_qa">
                <form class="layui-col-md12 layui-form" method="post" action="<%=submitPath%>">
                    <input type="hidden" name="serviceId" value="${serviceId}"/>
                    <c:forEach var="problem" items="${serviceForm}" varStatus="status">
                        <c:if test="${problem.proType=='checkbox'}">
                            <div class="layui-form-item">
                                <label class="layui-col-md12 layui-col-sm12 layui-col-xs12 service_form_main_q">${problem.proName}</label>
                                <input type="text" hidden="hidden" name="requireList[${status.index}].problem" value="${problem.proName}"/>
                                <c:forEach var="value" items="${problem.values}">
                                    <input type="checkbox" name="requireContents[${status.index}].content" value="${value.content}" title="${value.content}"/>
                                </c:forEach>
                            </div>
                        </c:if>
                        <c:if test="${problem.proType=='radio'}" >
                            <div class="layui-form-item">
                                <label class="layui-col-md12 layui-col-sm12 layui-col-xs12 service_form_main_q">${problem.proName}</label>
                                <input type="text" hidden="hidden" name="requireList[${status.index}].problem" value="${problem.proName}"/>
                                <c:forEach var="value" items="${problem.values}">
                                    <input name="requireContents[${status.index}].content" type="radio"  value="${value.content}" title="${value.content}"/>
                                </c:forEach>
                            </div>
                        </c:if>
                        <c:if test="${problem.proType=='select'}" >
                            <div class="layui-form-item">
                                <label class="layui-col-md12 layui-col-sm12 layui-col-xs12 service_form_main_q">${problem.proName}</label>
                                <input type="text" hidden="hidden" name="requireList[${status.index}].problem" value="${problem.proName}"/>
                                <select name="requireContents[${status.index}].content" lay-verify="required">
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
                                <input type="text" hidden="hidden" name="requireList[${status.index}].problem" value="${problem.proName}"/>
                                <textarea name="requireContents[${status.index}].content" placeholder="请输入内容" class="layui-textarea"></textarea>
                            </div>
                        </c:if>
                    </c:forEach>
                    <div class="layui-form-item">
                        <label class="layui-col-md12 layui-col-sm12 layui-col-xs12 service_form_main_q">您期望的服务时长？</label>
                        <div class="layui-col-md12 layui-col-sm12 layui-col-xs24 service_form_main_a1">
                            <div class="layui-col-md4 layui-col-sm3 layui-col-xs6">
                                <div class="layui-col-md8 layui-col-sm8 layui-col-xs8">
                                    <input name="month" type="text" required lay-verify="required" value="0" autocomplete="off" class="layui-input service_input service_input_month">
                                </div>
                                <div class="layui-col-md3 layui-col-sm3 layui-col-xs3">月</div>
                            </div>
                            <div class="layui-col-md3 layui-col-sm3 layui-col-xs6">
                                <div class="layui-col-md9 layui-col-sm8 layui-col-xs8">
                                    <input name="day" type="text" required lay-verify="required" value="0" autocomplete="off" class="layui-input service_input service_input_day">
                                </div>
                                <div class="layui-col-md3 layui-col-sm3 layui-col-xs3">天</div>
                            </div>
                            <div class="layui-col-md3 layui-col-sm3 layui-col-xs6 ">
                                <span class="service_form_main_hourprs">${perHour}</span>元/小时
                            </div>
                            <button type="button" class="layui-btn layui-btn-primary layui-col-md2 layui-col-sm3 layui-col-xs5 service_addbtn">周期服务</button>
                        </div>

                        <div class="service_form_main_a2">

                            <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 service_form_main_aa2">
                                <div class="layui-col-md4 layui-col-sm4 layui-col-xs3">
                                    <input name="smallTimeList[0].startHour" type="text" required lay-verify="required" value="0" autocomplete="off" class="layui-input service_input service_input_times">
                                </div>
                                <div class="layui-col-md1 layui-col-sm1 layui-col-xs2">
                                    时~
                                </div>
                                <div class="layui-col-md4 layui-col-sm4 layui-col-xs3">
                                    <input name="smallTimeList[0].endHour" type="text" required lay-verify="required" value="0" autocomplete="off" class="layui-input service_input service_input_timeo">
                                </div>
                                <div class="layui-col-md1 layui-col-sm1 layui-col-xs2">
                                    时
                                </div>
                                <div class="layui-col-md2 layui-col-sm2 layui-col-xs2"><i class="iconfont service_time_delete">&#xe641;</i></div>
                            </div>
                        </div>
                        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
                            <div class="layui-col-md6 layui-col-sm6 layui-col-xs6 service_form_a_time">总时长：0小时</div>
                            <div class="layui-col-md6 layui-col-sm6 layui-col-xs6 service_form_a_money">总金额：0元</div>
                        </div>
                    </div>
                    <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 layui-form-button">
                        <button type="submit" class="layui-btn layui-btn-primary layui-col-md12 layui-col-sm12 layui-col-xs12 service_form_btn">提交信息</button>
                    </div>
                </form>
                <div class="layui-row layui-col-md12 layui-col-sm12 layui-col-xs12 service_form_back">
                    <div class="layui-col-md2 layui-col-md-offset10 layui-col-sm2 layui-col-sm-offset10 layui-col-xs4 layui-col-xs-offset8 service_form_back1" onclick="location.href='<%=portPath%>index.html'">其他服务</div>
                </div>
            </div>
        </div>
        <div class="layui-col-md5 layui-col-sm12 layui-col-xs12">
            <div class="layui-col-md11 layui-col-sm12 layui-col-xs12 layui-col-md-offset1 service_advert">
                <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 service_advert_title">
                    <i class="iconfont">&#xe6e9;</i> Husbandry makes housewifery easy.
                </div>
                <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 service_advert_spt1">
                    <div class="layui-col-md10 layui-col-md-offset1 layui-col-sm12 layui-col-xs12 service_advert_spt1_title">
                        <i class="iconfont">&#xe619;</i>
                        <font>搜索您需要的家政服务</font>
                    </div>
                    <div class="layui-col-md9 layui-col-sm12 layui-col-xs12 layui-col-md-offset1 service_advert_spt1_img">
                        <img src="../../resources/images/stp1.png">
                    </div>
                </div>
                <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 service_advert_spt2">
                    <div class="layui-col-md10 layui-col-md-offset1 layui-col-sm12 layui-col-xs12 service_advert_spt2_title">
                        <i class="iconfont">&#xe611;</i>
                        <font>选择预约您中意的家政服务</font>
                    </div>
                    <div class="layui-col-md9 layui-col-sm12 layui-col-xs12 layui-col-md-offset1 service_advert_spt2_img">
                        <img src="../../resources/images/stp1.png">
                    </div>
                </div>

                <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 service_advert_spt3">
                    <div class="layui-col-md10 layui-col-md-offset1 layui-col-sm12 layui-col-xs12 service_advert_spt3_title">
                        <i class="iconfont">&#xe61b;</i>
                        <font>填写一份需求详情问卷</font>
                    </div>
                    <div class="layui-col-md9 layui-col-sm12 layui-col-xs12 layui-col-md-offset1 service_advert_spt3_img">
                        <img src="../../resources/images/stp3.png">
                    </div>
                </div>
                <!-- <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 service_advert_spt2"><i class="iconfont">&#xe611;</i></div>
                <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 service_advert_spt3"><i class="iconfont">&#xe61b;</i></div> -->
            </div>
        </div>
    </div>
    <div class="layui-row layui-col-md12 layui-col-sm12 layui-col-xs12">
        <footer>
            <p>Husbandry-&copy2017</p>
        </footer>
    </div>

    <script type="text/javascript" src="../../resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../../resources/layui.js"></script>
    <script type="text/javascript" src="../../resources/js/vue.js"></script>
    <script>
        var n=0;
        $(function() {
            layui.use('element', function(){
                //实例化element
                var element = layui.element;
                //初始化动态元素
                element.init();
                //tab切换监听
                element.on('tab(demo)',function (data) {
                    console.log(data);
                });
            });

            layui.use('form', function() {
                //实例化form
                var form = layui.form;
            });
            var nav = new Vue({
                el: 'nav',
                data: {
                    isLogin: false
                }
            });
        });
        $(window).resize(function() {
            if ($(window).width() < 768) {
                $(".layui-form-checkbox").css("width", "100%");
                $(".layui-form-radio").css("width", "100%");
            } else {
                $(".layui-form-checkbox").css("width", "45%");
                $(".layui-form-radio").css("width", "45%");
            }
        });

        function abc() {
            var del = $(".service_time_delete");      //x
            var mydiv = $(".service_form_main_aa2");  //点周期预约生成的div
            var times = $(".service_input_times");    //xx时
            var timeo = $(".service_input_timeo");    //xx时
            var timem = $(".service_input_month");    //xx月
            var timed = $(".service_input_day");      //xx天
            var price = $(".service_form_main_hourprs").text();  //xx元/时

            function calculate() {
                var x1 = 0;
                for (var j = 0; j < times.length; j++) {
                    x1 += (parseInt(timeo.eq(j).val()) - parseInt(times.eq(j).val()));
                }
                if (x1 < 0) {
                    x1 = 0;
                }
                var x = ((parseInt(timem.val()) * 30) + (parseInt(timed.val()))) * x1;
                $(".service_form_a_time").html("总时长：" + x + "小时");
                $(".service_form_a_money").html("总金额：" + (parseInt(price) * x) + "元");
            }
            $(".service_input").blur(function() {
                calculate();
            });

//            del.click(function () {
//                $(this).parent().parent().remove();
//                times = $(".service_input_times");
//                timeo = $(".service_input_timeo");
//                calculate();
//            })

            var fun1 = function(i) {
                del.eq(i).click(function() {
                    alert($('.service_time_delete').index(this));
                    mydiv.eq(i).remove();
                    times = $(".service_input_times");
                    timeo = $(".service_input_timeo");
                    calculate();
                })
            }
            for (var i = 0; i < del.length; i++) {
                fun1(i);
            }
        };
        abc();
        $(".service_addbtn").click(function() {
            n++;
            var timechose = '<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 service_form_main_aa2">' +
                '<div class="layui-col-md4 layui-col-sm4 layui-col-xs3">' +
                '  <input name="smallTimeList['+n+'].startHour" type="text" required lay-verify="required" value="0" autocomplete="off" class="layui-input service_input service_input_times">' +
                '</div>' +
                ' <div class="layui-col-md1 layui-col-sm1 layui-col-xs2">' +
                '时~' +
                '</div>' +
                ' <div class="layui-col-md4 layui-col-sm4 layui-col-xs3">' +
                '<input name="smallTimeList['+n+'].endHour" type="text" required lay-verify="required" value="0" autocomplete="off" class="layui-input service_input service_input_timeo">' +
                ' </div>' +
                ' <div class="layui-col-md1 layui-col-sm1 layui-col-xs2">' +
                '  时' +
                '</div>' +
                ' <div class="layui-col-md2 layui-col-sm2 layui-col-xs2"><i class="iconfont service_time_delete">&#xe641;</i></div>' +
                '</div>';
            $(".service_form_main_a2").append(timechose);
            abc();
        });
    </script>
</body>

</html>