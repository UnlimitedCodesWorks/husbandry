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
      console.log(data);
    });
  });

  layui.use('laypage', function(){
    var laypage = layui.laypage;
    //执行一个laypage实例
    laypage.render({
      elem: $('.reply-page') //注意，这里的 test1 是 ID，不用加 # 号
      ,count: 40 //数据总数，从服务端得到
      ,limit: 8
      ,theme: 'reply'
      ,jump: function(obj, first){
        //obj包含了当前分页的所有参数，比如：
        console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
        console.log(obj.limit); //得到每页显示的条数
        //首次不执行
        if(!first){
          //do something
        }
      }
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
    //回复
    $('.reply').click(function(event) {
      layer.open({
        type: 1,
        title: '回复',
        area: layerWidth,
        anim: 2,
        content: $('#reply-modal')
      });
    });




    $('#comment-submit').click(function(event) {
      if (rateComment.value==0 && $(this).prevAll('textarea').val().length!=0) {
        layer.open({
          title: '提示'
          ,content: '请先打分'
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
        value: 4.5
      }
    }
  });

  var rateBody = new Vue({
    el: '.tab2',
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