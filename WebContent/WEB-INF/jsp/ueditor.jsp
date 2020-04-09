<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="b"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>	
   
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
</head>
<body>

<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>
<script src="<%=basePath%>layui/layui.js"></script>

<button class="layui-btn layui-btn-normal" onclick="window.location.href='comment/customercomshow.action'">返回</button>
<form class="layui-form" action="user/bbs.action" method="post">
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label"></label>
    <div class="layui-input-block">
      <textarea  rows="20" cols="20" id="comment_detail" name="comment_detail" lay-verify="comment"
      placeholder="发表您的评论吧" class="layui-textarea"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button id="but1" class="layui-btn" type="button"  onclick="go()" lay-submit lay-filter="formDemo">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-warm">重置</button>
    </div>
  </div>
</form>
<script type="text/javascript">
layui.use('form', function(){
	  var form = layui.form;
	  //监听提交
	   form.verify({
		  comment: function(value){
	      if(value.length < 5){
	        return '多说点啊！至少5个字';
	      }
	    }
	   });  
	});
function go(data) {
	//confirm("确定上传数据?");
	var comment_detail=(document.getElementById("comment_detail").value);
    if(confirm('确定发布评论?')) {
    	$.post("${pageContext.request.contextPath }/user/bbs.action",{"comment_detail":comment_detail},function(data){
    	            if(data == true){
    	                alert("发布成功！");
    	                window.location.reload();
    	            }else{
    	                alert("发布失败！");
    	                window.location.reload();
    	            }
    	        });
    	    }
}


</script>
</body>
</html>