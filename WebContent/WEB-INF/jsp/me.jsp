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
	<!-- 引入css样式文件 -->
	<!-- Bootstrap Core CSS -->
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
	<!-- MetisMenu CSS -->
	<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
	<!-- DataTables CSS -->
	<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
	<!-- Custom CSS -->
	<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
	<!-- Custom Fonts -->
	<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css" />
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
<script type="text/javascript">
layer.open({
	  type: 2,
	  title: 'layer mobile页',
	  shadeClose: true,
	  shade: 0.8,
	  area: ['380px', '90%'],
	  content: 'mobile/' //iframe的url
	}); 
</script>
<button class="layui-btn layui-btn-normal" onclick="window.location.href='main.action'">返回</button>
<body>

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
		<div >
			<img width="300" height="300" align="middle" src="${pageContext.request.contextPath }/${CUSTOMER_SESSION.customer_photo}" class="img-circle" />
			</div>
			<table class="table table-hover table-striped">
			
				<tbody>
					
					<tr class="success">
						<td>
							用户名：${CUSTOMER_SESSION.customer_name}
						</td>
						
					</tr>
					<tr class="error">
						<td>
							身高：${CUSTOMER_SESSION.customer_height}   <b color="red">厘米</b>  
						</td>
					
					</tr>
					<tr class="warning">
						<td>
							电话：${CUSTOMER_SESSION.customer_tel}     
						</td>
					
					</tr>
					<tr class="error">
						<td>
							体重：${CUSTOMER_SESSION.customer_weight}        <b>斤</b>  
						</td>
						
					</tr>
					<tr class="info">
						<td>
							BMI指数及建议：<font color="red">${CUSTOMER_SESSION.customer_bmi}</font>
						</td>
						
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>