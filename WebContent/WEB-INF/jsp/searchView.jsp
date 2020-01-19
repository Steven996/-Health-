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
								<th>商品名</th>
								<th>商品图片</th>
								<th>销量</th>
								<th>商品详情</th>
								<th>类别</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${searchlist}" var="l1">
							
								<tr>
									<td>${l1.commodity_id}</td>
									<td>${l1.commodity_name}</td>
									<td><img src="${pageContext.request.contextPath }/${l1.commodity_picture}" width="80px" height="70px"/></td>
									<td>${l1.commodity_totalCount}</td>
									<td>${l1.commodity_detail}</td>
									<td>${l1.commodity_type_name}</td>
										</tr>
							</c:forEach>
						</tbody>
						<button class="btn btn-primary" onclick="window.location.href='show.action'">返回</button>
						</table>
</html>