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
    var del = $(".service_time_delete");
    var mydiv = $(".service_form_main_aa2");
    var times = $(".service_input_times");
    var timeo = $(".service_input_timeo");
    var timem = $(".service_input_month");
    var timed = $(".service_input_day");
    var price = $(".service_form_main_hourprs").text();
    $(".service_input").blur(function() {
        var x1 = 0;
        for (var j = 0; j < times.length; j++) {
            x1 += (parseInt(timeo.eq(j).val()) - parseInt(times.eq(j).val()));
        }
        if (x1 < 0) {
            x1 = 0;
        }
        var x = ((parseInt(timem.val()) * 31) + (parseInt(timed.val()))) * x1;
        $(".service_form_a_time").html("总时长：" + x + "小时");
        $(".service_form_a_money").html("总金额：" + (parseInt(price) * x) + "元");
    })

    var fun1 = function(i) {
        del.eq(i).click(function() {
            mydiv.eq(i).remove();
        })
    }
    for (var i = 0; i < del.length; i++) {
        fun1(i);
    }
};
abc();
var timechose = '<div class="layui-col-md12 layui-col-sm12 layui-col-xs12 service_form_main_aa2">' +
    '<div class="layui-col-md-offset2 layui-col-md2 layui-col-sm2 layui-col-sm-offset2 layui-col-xs3">' +
    '  <input type="text" required lay-verify="required" value="0" autocomplete="off" class="layui-input service_input service_input_times">' +
    '</div>' +
    ' <div class="layui-col-md1 layui-col-sm1 layui-col-xs2">' +
    '时~' +
    '</div>' +
    ' <div class="layui-col-md2 layui-col-sm2 layui-col-xs3">' +
    '<input type="text" required lay-verify="required" value="0" autocomplete="off" class="layui-input service_input service_input_timeo">' +
    ' </div>' +
    ' <div class="layui-col-md1 layui-col-sm1 layui-col-xs2">' +
    '  时' +
    '</div>' +
    ' <div class="layui-col-md3 layui-col-sm3 layui-col-xs2"><i class="iconfont service_time_delete">&#xe641;</i></div>' +
    '</div>';
$(".service_addbtn").click(function() {
    $(".service_form_main_a2").append(timechose);
    abc();
});