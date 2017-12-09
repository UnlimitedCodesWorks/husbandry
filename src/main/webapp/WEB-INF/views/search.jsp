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
    <link rel="stylesheet" href="../../resources/css/search.css">
    <title>智慧社区-搜索</title>
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
    <div class="layui-row layui-col-md12 layui-col-sm12 layui-col-xs12 search_search_div">
        <img src="../../resources/images/backloginimg.jpg" class="layui-col-md8 layui-col-sm8 layui-col-xs12 layui-col-md-offset2 layui-col-sm-offset2 search_serach_img">
        <input type="text" placeholder="请输入要搜索的服务内容" class="layui-col-md6 layui-col-sm6 layui-col-xs10 layui-col-md-offset3 layui-col-sm-offset3 layui-col-xs-offset1 search_input">
        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
            <div class="layui-col-md4 layui-col-xs6 layui-col-sm4 layui-col-md-offset4 layui-col-xs-offset3 layui-col-sm-offset4 search_button">
                <div class="search_button1"></div>
            </div>
        </div>
    </div>
    <!-- 标题栏 -->
    <div class=" layui-row layui-col-md10 layui-col-xs10 layui-col-sm10 layui-col-md-offset1 layui-col-xs-offset1 layui-col-sm-offset1 search_title ">
        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 search_classify1">
            <span class="layui-col-md1 layui-col-sm1 layui-col-xs12 search_classify">分类</span>
            <div class="layui-col-md11 layui-col-sm18 layui-col-xs24 search_classify_choose">
                <span class="layui-col-md1 layui-col-sm2 layui-col-xs3" data-kind="0" >全部</span>
                <span class="layui-col-md1 layui-col-sm2 layui-col-xs3" data-kind="1" >保姆</span>
                <span class="layui-col-md1 layui-col-sm2 layui-col-xs3" data-kind="2" >月嫂</span>
                <span class="layui-col-md1 layui-col-sm2 layui-col-xs3" data-kind="3" >涉外家政</span>
                <span class="layui-col-md1 layui-col-sm2 layui-col-xs3" data-kind="4" >钟点工</span>
                <span class="layui-col-md1 layui-col-sm2 layui-col-xs3" data-kind="5" >老人陪护</span>
                <span class="layui-col-md1 layui-col-sm2 layui-col-xs3" data-kind="6" >病人陪护</span>
                <span class="layui-col-md1 layui-col-sm2 layui-col-xs3" data-kind="7" >育婴师</span>
                <span class="layui-col-md1 layui-col-sm2 layui-col-xs3" data-kind="8" >催乳师</span>
            </div>
        </div>
        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 search_area1">
            <span class="layui-col-md1 layui-col-sm1 layui-col-xs12 search_area">地区</span>
            <div class="layui-col-md11  layui-col-sm11 layui-col-xs24 search_area_choose">
                <div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
                    <span class="layui-col-md1 layui-col-sm2 layui-col-xs2" style="font-size: 13px">省份：</span>
                    <span class="layui-col-md2 layui-col-sm2 layui-col-xs4">
                        <select  id="province" runat="server" style="font-size: 13px" class="layui-col-md12 layui-col-sm12 layui-col-xs12 search_area_province">
                            <c:set var="provinceId" value="${provinceId}" />
                            <c:forEach var="province" items="${provinces}" >
                                <option label="${province.value}"  <c:if test="${province.key == provinceId}">selected</c:if> > ${province.key}</option>
                            </c:forEach>
                        </select>
                    </span>
                    <span class="layui-col-md1 layui-col-sm2 layui-col-xs2" style="font-size: 13px">城市：</span>
                    <span class="layui-col-md2 layui-col-sm2 layui-col-xs4">
                        <select  id="city" runat="server" style="font-size: 13px" class="layui-col-md12 layui-col-sm12 layui-col-xs12 search_area_city">
                            <c:set var="ciid" value="${ciid}" />
                            <c:forEach var="city" items="${citys}">
                                <option label="${city.city}"  <c:if test="${city.ciid == ciid}">selected</c:if> >${city.ciid}</option>
                            </c:forEach>
                        </select>
                    </span>
                </div>
            </div>
        </div>
        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
            <span class="layui-col-md1 layui-col-sm1 layui-col-xs12 search_rank">排序</span>
            <div class="layui-col-md11 search_rank_choose">
                <span class="layui-col-md1 layui-col-sm2 layui-col-xs3" data-rank="5">综合降序</span>
                <span class="layui-col-md1 layui-col-sm2 layui-col-xs3" data-rank="4">综合升序</span>
                <span class="layui-col-md1 layui-col-sm2 layui-col-xs3" data-rank="1">评分降序</span>
                <span class="layui-col-md1 layui-col-sm2 layui-col-xs3" data-rank="0">评分升序</span>
                <span class="layui-col-md1 layui-col-sm2 layui-col-xs3" data-rank="3">销量降序</span>
                <span class="layui-col-md1 layui-col-sm2 layui-col-xs3" data-rank="2">销量升序</span>
            </div>
        </div>

    </div>
    <!-- 具体项目 -->
    <div class="layui-row layui-col-md10 layui-col-md-offset1 layui-col-sm10 layui-col-sm-offset1 layui-col-xs10 layui-col-xs-offset1 search_main">
        <c:set var="content" value="${content}" />
        <c:set var="redContent" value="${redContent}" />
        <c:if test="${offerServiceList!=null}">
            <c:forEach var="offerService" items="${offerServiceList}">
        <ul class="layui-row layui-col-md3 layui-col-sm6 layui-col-xs12 search_main_ul">
            <ul class="layui-col-md10 layui-col-sm10 layui-col-sm-offset1 layui-col-xs12 layui-col-md-offset1 search_main_ul_ul">
                <img src="${offerService.serviceImg}" onerror="this.src = '../../resources/images/house.jpg'" class="layui-col-md12 layui-col-sm12 layui-col-xs12 search_main_ul_img">
                <div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
                    <div class="layui-col-md4 layui-col-sm5 layui-col-xs5 search_price text1">＄${offerService.price}</div>
                    <div class="layui-col-md8 layui-col-sm7 layui-col-xs7 search_price_noise">市场价：${offerService.marketPrice}<c:if test="${offerService.priceJudge ==true}"><i class="iconfont price_high">&#xe702;</i><div class="price_high1">高于市场价</div></c:if> <c:if test="${offerService.priceJudge ==false}"><i class="iconfont price_low">&#xe6e5;</i><div class="price_low1">低于市场价</div></c:if></div>
                </div>
                <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 search_service">${fn:replace(offerService.serviceName,content,redContent)}</div>
                <div class="layui-col-md12 layui-col-sm12 layui-col-xs12 search_comsco ">
                    <div class="layui-col-md6 layui-col-sm6 layui-col-xs6 search_company">${fn:replace(offerService.store.storeName,content,redContent)}</div>
                    <div class="layui-col-md6 layui-col-sm6 layui-col-xs6 search_score"><c:if test="${offerService.grade ==0}">未评分</c:if><c:if test="${offerService.grade !=0}">${offerService.grade}分</c:if><span class="search_score_peoplenum" >(${offerService.gradeNum}人评分)</span></div>
                </div>
            </ul>
        </ul>
            </c:forEach>
        </c:if>
    </div>
    <!-- 分页处理 -->
    <div class="layui-col-md10 layui-col-md-offset1 layui-col-sm10 layui-col-sm-offset1 layui-col-xs12">
        <div id="search_page"></div>
    </div>
    <div class="layui-row layui-col-md12 layui-col-xs12 layui-col-sm12">
        <footer>
            <p>Husbandry-&copy2017</p>
        </footer>
    </div>

</body>
<script type="text/javascript" src="../../resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../../resources/layui.all.js"></script>
<script type="text/javascript" src="../../resources/js/search.js"></script>
<script type="text/javascript" src="../../resources/js/vue.js"></script>
<script type="text/javascript">
    var pages = ${pages};
    var province = $("#province");
    var city = $("#city");
    var portPath = "<%=portPath%>";
    var kind = getUrlParam("kind");
    var content = '${content}';
    var redContent = "${redContent}";
    var rank = "${rank}";
    var ciid = "${ciid}";
    var currentPage = 1;
    if(content.length !=0){
        $(".search_input:eq(0)").val(content);
    }
    $(".search_classify_choose span").each(function (index,element) {
        var value = $(this).attr("data-kind");
        if(kind == value){
            $(this).css("color","rgb(0,150,136)");
        }
    });
    $(".search_rank_choose span").each(function (index,element) {
        var value = $(this).attr("data-rank");
        if(rank == value){
            $(this).css("color","rgb(0,150,136)");
        }

    });
    layui.use('laypage', function() {
        var laypage = layui.laypage;

        //执行一个laypage实例
        laypage.render({
            elem: 'search_page' //注意，这里的 test1 是 ID，不用加 # 号
            ,
            count: pages*8 //数据总数，从服务端得到
            ,
            limit: 8,
            groups: 4
            ,jump: function(obj, first) {
                if(!first){
                    currentPage = obj.curr;
                    var href = portPath+"search/search.do?";
                    if(kind !=null){
                        href += 'kind='+kind;
                    }
                    if(ciid!=null){
                        href += '&ciid='+ciid;
                    }
                    if(content !=null){
                        href += '&content='+content;
                    }
                    if(rank!=null){
                        href += '&rank='+rank;
                    }
                    href +='&currentPage='+currentPage;
                    changePage(href);
                }

            }
        });
    });
    province.change(function (e) {
        city.html("");
        city.append('<option value="NONE" label="市" />');
        var value = province.val();
        $.ajax({
            url :portPath + 'store/getCitys.do',
            type : "post",
            data:{
                provinceId : value
            },
            dataType : "json",
            success: function(data){
                for(var i=0;i<data.length;i++){
                    var node = '<option value="'+data[i].ciid+ '" label="'+data[i].city+'" />';
                    city.append(node);
                }
            },
            error: function(jqXHR){
                alert("发生错误：" + jqXHR.status);
            }
        });
    })
    city.change(function (e) {
        if(e.target.value !="NONE"){
            var href = portPath+"search/search.do?";
            if(kind!=null){
                href += 'kind='+kind;
            }
            if(content !=null){
                href += '&content='+content;
            }
            if(rank !=null){
                href += '&rank='+rank;
            }
            href+='&ciid='+e.target.value;
            currentPage = 1;
            href+='&currentPage='+currentPage;
            $.ajax({
                url :href,
                type : "get",
                dataType : "json",
                success: function(data){
                    pages = data.pages;
                    ciid = e.target.value;
                    createOfferService(data);
                },
                error: function(jqXHR){
                    alert("发生错误：" + jqXHR.status);
                }
            });
        }
    });
    $(".search_classify_choose span").click(function () {
        var kindId = $(this).attr("data-kind");
        var href = portPath+"search/search.do?";
        href+='kind='+kindId;
        if(ciid!=null){
            href += '&ciid='+ciid;
        }
        if(content !=null){
            href += '&content='+content;
        }
        if(rank !=null){
            href += '&rank='+rank;
        }
        currentPage = 1;
        href+='&currentPage='+currentPage;
        $.ajax({
            url :href,
            type : "get",
            dataType : "json",
            success: function(data){
                pages = data.pages;
                kind = kindId;
                createOfferService(data);
            },
            error: function(jqXHR){
                alert("发生错误：" + jqXHR.status);
            }
        });
    });
    $(".search_rank_choose span").click(function () {
       var rankId =  $(this).attr("data-rank");
       var href = portPath+"search/search.do?";
        if(kind !=null){
            href += 'kind='+kind;
        }
        if(ciid!=null){
            href += '&ciid='+ciid;
        }
        if(content !=null){
            href += '&content='+content;
        }
        href+='&rank='+rankId;
        currentPage = 1;
        href+='&currentPage='+currentPage;
        $.ajax({
            url :href,
            type : "get",
            dataType : "json",
            success: function(data){
                pages = data.pages;
                rank = rankId;
                createOfferService(data);
            },
            error: function(jqXHR){
                alert("发生错误：" + jqXHR.status);
            }
        });
    });
    $(".search_button1:eq(0)").click(function (e) {
        var href = portPath+"search/view.html?";
        var content = $(".search_input:eq(0)").val();
        if(kind !=null){
            href += 'kind='+kind;
        }
        if(ciid!=null){
            href += '&ciid='+ciid;
        }
        if(rank !=null){
            href += '&rank='+rank;
        }
        href += '&content='+content;
        location.href = href;
    });
    function getUrlParam(name)
    {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r!=null) return unescape(r[2]); return null; //返回参数值
    }
    function changePage(href){
        $.ajax({
            url :href,
            type : "get",
            dataType : "json",
            success: function(data){
                pages = data.pages;
                createOfferService1(data);
            },
            error: function(jqXHR){
                alert("发生错误：" + jqXHR.status);
                currentPage = 1;
            }
        });
    }
    function createOfferService(data){
        var searchDiv = $(".search_main:eq(0)");
        searchDiv.html("");
        $("#search_page").html("");
        layui.use('laypage', function() {
            var laypage = layui.laypage;

            //执行一个laypage实例
            laypage.render({
                elem: 'search_page' //注意，这里的 test1 是 ID，不用加 # 号
                ,
                count: pages*8 //数据总数，从服务端得到
                ,
                limit: 8,
                groups: 4
                ,jump: function(obj, first) {
                    if(!first){
                        currentPage = obj.curr;
                        var href = portPath+"search/search.do?";
                        if(kind !=null){
                            href += 'kind='+kind;
                        }
                        if(ciid!=null){
                            href += '&ciid='+ciid;
                        }
                        if(content !=null){
                            href += '&content='+content;
                        }
                        if(rank!=null){
                            href += '&rank='+rank;
                        }
                        href +='&currentPage='+currentPage;
                        changePage(href);
                    }
                }
            });
        });
        for(var i=0;i<data.list.length;i++){
            var priceJudge;
            var grade;
            var serviceName = data.list[i].serviceName;
            var storeName = data.list[i].store.storeName;
            if(content.length!=0){
                serviceName=serviceName.replace(content,redContent);
                storeName=storeName.replace(content,redContent);
            }
            priceJudge = data.list[i].priceJudge;
            if(priceJudge){
                priceJudge = '<i class="iconfont price_high">&#xe702;</i><div class="price_high1">高于市场价</div>';
            }else{
                priceJudge = '<i class="iconfont price_low">&#xe6e5;</i><div class="price_low1">低于市场价</div>';
            }
            if(data.list[i].grade == 0){
                grade = "未评分";
            }else {
                grade = data.list[i].grade;
            }
            var node = '<ul class="layui-row layui-col-md3 layui-col-sm6 layui-col-xs12 search_main_ul">' +
                '<ul class="layui-col-md10 layui-col-sm10 layui-col-sm-offset1 layui-col-xs12 layui-col-md-offset1 search_main_ul_ul">' +
                '<img src="'+data.list[i].serviceImg+'" onerror="this.src = \'../../resources/images/house.jpg\'" class="layui-col-md12 layui-col-sm12 layui-col-xs12 search_main_ul_img">' +
                '<div class="layui-col-md12 layui-col-sm12 layui-col-xs12">' +
                '<div class="layui-col-md5 layui-col-sm5 layui-col-xs5 search_price text1">＄'+data.list[i].price+'</div>' +
                '<div class="layui_col-md7 layui-col-sm7 layui-col-xs7 search_price_noise">' +
                '市场价：'+data.list[i].marketPrice+priceJudge+'</div>' +
                '</div>' +
                '<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 search_service">'+serviceName+'</div>' +
                '<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 search_comsco ">' +
                '<div class="layui-col-md6 layui-col-sm6 layui-col-xs6 search_company">'+storeName+'</div>' +
                '<div class="layui-col-md6 layui-col-sm6 layui-col-xs6 search_score">'+grade+'<span class="search_score_peoplenum" >('+data.list[i].gradeNum+'人评分)</span>'+'</div>' +
                '</div>' +
                '</ul>' +
                '</ul>';
            searchDiv.append(node);
        }
    }
    function createOfferService1(data) {
        var searchDiv = $(".search_main:eq(0)");
        searchDiv.html("");
        for (var i = 0; i < data.list.length; i++) {
            var priceJudge;
            var grade;
            var serviceName = data.list[i].serviceName;
            var storeName = data.list[i].store.storeName;
            if(content.length!=0){
                serviceName=serviceName.replace(content,redContent);
                storeName=storeName.replace(content,redContent);
            }
            priceJudge = data.list[i].priceJudge;
            if(priceJudge){
                priceJudge = '<i class="iconfont price_high">&#xe702;</i><div class="price_high1">高于市场价</div>';
            }else{
                priceJudge = '<i class="iconfont price_low">&#xe6e5;</i><div class="price_low1">低于市场价</div>';
            }
            if(data.list[i].grade == 0){
                grade = "未评分";
            }else {
                grade = data.list[i].grade;
            }
            var node = '<ul class="layui-row layui-col-md3 layui-col-sm6 layui-col-xs12 search_main_ul">' +
                '<ul class="layui-col-md10 layui-col-sm10 layui-col-sm-offset1 layui-col-xs12 layui-col-md-offset1 search_main_ul_ul">' +
                '<img src="'+data.list[i].serviceImg+'" onerror="this.src = \'../../resources/images/house.jpg\'" class="layui-col-md12 layui-col-sm12 layui-col-xs12 search_main_ul_img">' +
                '<div class="layui-col-md12 layui-col-sm12 layui-col-xs12">' +
                '<div class="layui-col-md5 layui-col-sm5 layui-col-xs5 search_price text1">＄'+data.list[i].price+'</div>' +
                '<div class="layui_col-md7 layui-col-sm7 layui-col-xs7 search_price_noise">' +
                '市场价：'+data.list[i].marketPrice+priceJudge+'</div>' +
                '</div>' +
                '<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 search_service">'+serviceName+'</div>' +
                '<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 search_comsco ">' +
                '<div class="layui-col-md6 layui-col-sm6 layui-col-xs6 search_company">'+storeName+'</div>' +
                '<div class="layui-col-md6 layui-col-sm6 layui-col-xs6 search_score">'+grade+'<span class="search_score_peoplenum" >('+data.list[i].gradeNum+'人评分)</span>'+'</div>' +
                '</div>' +
                '</ul>' +
                '</ul>';
            searchDiv.append(node);
        }
    }
</script>
</html>