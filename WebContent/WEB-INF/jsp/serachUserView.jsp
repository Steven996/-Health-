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
<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>头像</th>
								<th>用户名</th>
								<th>密码</th>
								<th>用户类型</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${searchUserlist}" var="l1">
							
								<tr>
									<td>${l1.customer_id}</td>
									<td><img src="${pageContext.request.contextPath }/${l1.customer_photo}" width="100px" height="100px"/></td>
							
									<td>${l1.customer_name}</td>
									<td>${l1.customer_pass}</td>
									<td>${l1.vip}</td>
							</tr>
							</c:forEach>
						</tbody>
						<button class="btn btn-primary" onclick="window.location.href='list.action'">返回</button>
						</table>
</html>