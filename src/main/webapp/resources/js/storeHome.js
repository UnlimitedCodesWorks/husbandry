jQuery(document).ready(function($) {
  $("#wrap").css({
    minHeight: ($(window).height()-110)+'px'
  });

  var layerWidth;
  if($(window).width()>=768) {
    layerWidth = '50%';
  }
  else {
    layerWidth = '80%';
  }

    $('#comment-submit').click(function(event) {
        var value = $(this).prevAll('textarea').val();
        if (value.length==0) {
            layer.open({
                title: '提示'
                ,content: '请先完善评论'
            });
        }else {
            $.ajax({
                type: "POST",
                url: portPath+"store/evaluateStore.do",
                data: {
                    storeId:storeId,
                    userId:userId,
                    content:value
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


    layui.use('element', function(){
    //实例化element
      var element = layui.element;
      //初始化动态元素
      element.init();
  });

  layui.use('form', function(){
    var form = layui.form;
    form.on('select(mode)', function(data){
        var value = data.value;
        if(value==1){
            schema = true;
            $.ajax({
                type: "POST",
                url: portPath+"store/getAllEvaluateByStoreId.do",
                data: {
                    storeId:storeId,
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
                url: portPath+"store/getAllEvaluateByStoreId.do",
                data: {
                    storeId:storeId,
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

    //评论分页
    laypage.render({
      elem: 'comment-page' //注意，这里的 test1 是 ID，不用加 # 号
      ,count: evaluatePages*evaluatePageSize //数据总数，从服务端得到
      ,limit: evaluatePageSize
      ,jump: function(obj, first){
        //首次不执行
        if(!first){
          //do something
            $.ajax({
                type: "POST",
                url: portPath+"store/getAllEvaluateByStoreId.do",
                data: {
                    storeId:storeId,
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

    //服务分页
    laypage.render({
      elem: 'store-page' //注意，这里的 test1 是 ID，不用加 # 号
      ,count: servicePages*servicePageSize //数据总数，从服务端得到
      ,limit: servicePageSize
        ,jump: function(obj, first){
        //首次不执行
        if(!first){
          //do something
            $.ajax({
                type: "POST",
                url: portPath+"store/getAllSimpleOfferServiceByStoreId.do",
                data: {
                    storeId:storeId,
                    currentPage:obj.curr
                },
                dataType: "json",
                success: function(data){
                    createServices(data);
                },
                error: function(jqXHR){
                    alert("发生错误：" + jqXHR.status);
                }
            });
        }
      }
    });
  });

  var nav = new Vue({
    el: 'nav',
    data: {
      isLogin: loginStatus
    }
  });

  var rateHead = new Vue({
    el: '.wrap-head',
    data() {
      return {
        value: score
      }
    }
  });


  //particles
  particlesJS("particles-js", {
    "particles": {
        "number": {
          "value": 50,//点的个数
            "density": {
              "enable": true,
              "value_area": 500
            }
        },
        "color": {
          "value": "#a8a8a8"//点的颜色
        },
        "shape": {
            "type": "triangle",
            "stroke": {
              "width": 0,
              "color": "#000000"
            },
            "polygon": {
              "nb_sides": 5
            },
            "image": {
              "src": "img/github.svg",
              "width": 100,
              "height": 100
            }
        },
        "opacity": {
            "value": 0.08,//点的透明度
            "random": false,
            "anim": {
              "enable": false,
              "speed": 1,
              "opacity_min": 0.1,
              "sync": false
            }
        },
        "size": {
            "value": 24,//点的大小
            "random": true,//点的大小是否随机
            "anim": {
              "enable": false,
              "speed": 40,
              "size_min": 0.1,
              "sync": false
            }
        },
        "line_linked": {
            "enable": true,//是否有线
            "distance": 300,//线的密度
            "color": "#a8a8a8",//线的颜色
            "opacity": 0.1,//线的透明度
            "width": 1
        },
        "move": {
            "enable": true,
            "speed": 3,//点的移动速度
            "direction": "none",
            "random": false,
            "straight": false,
            "out_mode": "out",
            "bounce": false,
            "attract": {
              "enable": false,
              "rotateX": 600,
              "rotateY": 1200
            }
        }
    },
    "interactivity": {
        "detect_on": "canvas",
        "events": {
            "onhover": {
              "enable": true,
              "mode": "grab"
            },
            "onclick": {
              "enable": false,
              "mode": "push"
            },
            "resize": true
        },
        "modes": {
            "grab": {
              "distance": 140,
              "line_linked": {
                  "opacity": 1
              }
            },
            "bubble": {
              "distance": 400,
              "size": 40,
              "duration": 2,
              "opacity": 8,
              "speed": 3
            },
            "repulse": {
              "distance": 200,
              "duration": 0.4
            },
            "push": {
              "particles_nb": 4
            },
            "remove": {
              "particles_nb": 2
            }
        }
    },
    "retina_detect": true
  });
});