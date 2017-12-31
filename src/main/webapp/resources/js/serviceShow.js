jQuery(document).ready(function($) {
  $("#wrap").css({
    minHeight: ($(window).height()-110)+'px'
  });

  $(".raty").raty({
      path: '../../resources/images',
      readOnly: true,
      score: function() {
          return $(this).attr('data-score');
      }
  });

  var layerWidth;
  if($(window).width()>=768) {
    layerWidth = '50%';
  }
  else {
    layerWidth = '80%';
  }

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

  layui.use('form', function(){
    var form = layui.form;
    form.on('select(mode)', function(data){
      var value = data.value;
      if(value==1){
          schema = true;
          $.ajax({
              type: "POST",
              url: portPath+"service/getAllEvaluateByServiceId.do",
              data: {
                  serviceId:serviceId,
                  schema:schema,
                  currentPage:1
              },
              dataType: "json",
              success: function(data){
                  createEvaluates(data);
              },
              error: function(jqXHR){
                  alert("发生错误：" + jqXHR.status);
              }
          });
      }else if(value==2){
          schema = false;
          $.ajax({
              type: "POST",
              url: portPath+"service/getAllEvaluateByServiceId.do",
              data: {
                  serviceId:serviceId,
                  schema:schema,
                  currentPage:1
              },
              dataType: "json",
              success: function(data){
                  createEvaluates(data);
              },
              error: function(jqXHR){
                  alert("发生错误：" + jqXHR.status);
              }
          });
      }
    });
  });

  layui.use('laypage', function(){
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

    laypage.render({
      elem: 'comment-page' //注意，这里的 test1 是 ID，不用加 # 号
      ,count: evaluatePages*pageSize //数据总数，从服务端得到
      ,limit: pageSize
      ,jump: function(obj, first){
        //obj包含了当前分页的所有参数，比如：
        //首次不执行
        if(!first){
          //do something
            $.ajax({
                type: "POST",
                url: portPath+"service/getAllEvaluateByServiceId.do",
                data: {
                    serviceId:serviceId,
                    schema:schema,
                    currentPage:obj.curr
                },
                dataType: "json",
                success: function(data){
                    createEvaluates(data);
                },
                error: function(jqXHR){
                    alert("发生错误：" + jqXHR.status);
                }
            });
        }
      }
    });
  });

  layui.use('layer', function(){
    var layer = layui.layer;
    //发表评论
    $('#comment').click(function(event) {
      layer.open({
        type: 1,
        title: '发表评论',
        area: layerWidth,
        anim: 2,
        content: $('#comment-modal')
      });
    });

    //投诉
    $('.layui-btn-danger').click(function(event) {
        layer.open({
            type: 1,
            title: '联系商家',
            area: layerWidth,
            anim: 2,
            content: $('#complaint-modal')
        });
    });

    $('#comment-submit').click(function(event) {
        var value = $(this).prevAll('textarea').val();
        var grade = rateComment.value;
      if (grade==0 || value.length==0) {
        layer.open({
          title: '提示'
          ,content: '请先完善评论'
        });
      }else {
          $.ajax({
              type: "POST",
              url: portPath+"service/evaluateService.do",
              data: {
                  serviceId:serviceId,
                  userId:userId,
                  content:value,
                  grade:grade*2
              },
              dataType: "json",
              success: function(data){
                  if(data!=0){
                      layer.msg("评论成功",{
                          time: 1000
                      });
                      setTimeout("location.replace(location.href)",1000);
                  }else {
                      layer.msg("评论失败",{
                          time: 1000
                      });
                  }

              },
              error: function(jqXHR){
                  alert("发生错误：" + jqXHR.status);
              }
          });
      }
    });

      $('#complaint-submit').click(function(event) {
          var value = $(this).prevAll('textarea').val();
          if (value.length!=0) {
              $.ajax({
                  type: "POST",
                  url: portPath+"service/complainService.do",
                  data: {
                      serviceId:serviceId,
                      userId:userId,
                      reason:value
                  },
                  dataType: "json",
                  success: function(data){
                      if(data!=0){
                          layer.msg("提交成功",{
                              time: 1000
                          });
                      }else {
                          layer.msg("提交失败",{
                              time: 1000
                          });
                      }

                  },
                  error: function(jqXHR){
                      alert("发生错误：" + jqXHR.status);
                  }
              });
          }
      });
  });

  var nav = new Vue({
    el: 'nav',
    data: {
      isLogin: false
    }
  });

  var rateHead = new Vue({
    el: '.wrap-head',
    data() {
      return {
      }
    }
  });

  var rateComment = new Vue({
    el: '#comment-modal',
    data() {
      return {
        value: null
      }
    }
  });
});
