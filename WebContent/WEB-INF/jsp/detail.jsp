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
<button class="btn btn-primary" onclick="window.location.href='healthhomeshow.action'">返回</button>

<table class="table table-bordered table-striped">
						<thead>
						<div class="item">
						<img alt="" height="400" weight="800" src="${pageContext.request.contextPath }/${commodity.commodity_picture}" />
						<tr>
						<th>商品名</th><td>${commodity.commodity_name}</td>
						</tr>
						<tr>
						<th>销量</th><td>${commodity.commodity_totalCount}</td>
						</tr>
						<tr>
						<th>类别</th><td>${commodity.commodity_type_name}</td>
						</tr>
						<tr>
						<td>商品详情</td><td>${commodity.commodity_detail}</td>
						</tr>
						</div>
</table>
</html>