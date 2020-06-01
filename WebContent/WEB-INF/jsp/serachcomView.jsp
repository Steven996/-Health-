<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>Insert title here</title>
</head>

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
<!-- 编写js代码 -->
<script type="text/javascript">
	// 删除
	function deleteCom(comment_id) {
	    if(confirm('确定要删除该评论吗?')) {
	$.post("${pageContext.request.contextPath}/comment/comdel.action",{"comment_id":comment_id},
	function(data){
	            if(data =="OK"){
	                alert("删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
<table class="table table-bordered table-striped">
						<thead>
							<tr>
								
								<th>用户</th>		
								<th>评论详情</th>
								<th>时间</th>
								
								<th>操作</th>		
										
							</tr>
						</thead>
						<tbody>
						
							<c:forEach items="${searchcomlist}" var="l1">
							
								<tr>
								
									
									<td>${l1.customer_name}</td>
									<td>${l1.comment_detail}</td>
									<td>${l1.date}</td>
									
									<td>
									<a href="#" class="btn btn-danger btn-xs" onclick="deleteCom(${l1.comment_id})">删除</a>
									</td>
								</tr>
							</c:forEach>
						<button class="btn btn-primary" onclick="window.location.href='comshow.action'">返回</button>
						
						</tbody>
						</table>

</html>