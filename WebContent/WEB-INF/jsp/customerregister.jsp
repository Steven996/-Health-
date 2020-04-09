<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>登录页面</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/css/style.css"
	   type=text/css rel=stylesheet>
	<!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
<script src=
       "${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
</script>
<body leftMargin=0 topMargin=0 marginwidth="0" marginheight="0"
	background="${pageContext.request.contextPath}/images/registerbg.png">
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form role="form" action="${pageContext.request.contextPath }/user/add.action" method="post" enctype="multipart/form-data">
				<div class="form-group">
					 <label for="exampleInputEmail1">用户名：</label><input type="text" class="form-control" name="customer_name" />
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">密码：</label><input type="password" class="form-control" name="customer_pass" />
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">电话：</label><input type="tel" class="form-control" name="customer_tel" />
				</div>
				<div class="form-group">
					 <label for="exampleInputFile">点击上传头像</label><input type="file" name = "pictureFile"/>
					
				</div>
				<button type="submit" class="btn btn-primary">注册</button>
			</form>
		</div>
	</div>
</div>
</body>