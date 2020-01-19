<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="b"%>
<%@include file="header.jsp"%>
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
	<link rel="stylesheet" type="text/css" media="screen" href="https://cdn.staticfile.org/ionicons/2.0.1/css/ionicons.min.css">
</head>
<!-- 引入js文件 -->
<!-- jQuery -->
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
<!--轮播图-->
	<div class="carousel slide" id="carousel-210314" data-ride="carousel" data-interval="2000">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-210314">
					</li>
					<li data-slide-to="1" data-target="#carousel-210314">
					</li>
					<li data-slide-to="2" data-target="#carousel-210314">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="${pageContext.request.contextPath}/images/l1.jpg" />
					</div>
					<div class="item">
						<img alt="" src="${pageContext.request.contextPath}/images/l2.jpg" />
					</div>
					<div class="item">
						<img alt="" src="${pageContext.request.contextPath}/images/l3.jpg" />
					</div>
				</div><a class="left carousel-control" href="#carousel-210314" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-210314" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
			
			
	
		<video width="375" height="240" controls="controls" >
 			 <source src="movie.ogg" type="video/ogg">
  			 <source src="${pageContext.request.contextPath}/images/v1.mp4" type="video/mp4">
你的浏览器不支持video标签
		</video>
			<video width="375" height="240" controls="controls">
 			 <source src="movie.ogg" type="video/ogg">
  			 <source src="${pageContext.request.contextPath}/images/v2.mp4" type="video/mp4">
你的浏览器不支持video标签
		</video>
		<video width="375" height="240" controls="controls">
 			 <source src="movie.ogg" type="video/ogg">
  			 <source src="${pageContext.request.contextPath}/images/v3.mp4" type="video/mp4">
你的浏览器不支持video标签
		</video>
<!-- 电影缩略图 -->
<h3 style="color:white"><b>健康头条</b></h3>
	<b:forEach items="${newslist}" var="e" varStatus="vs">

  <div class="col-md-2">
  		<a href="detail.action">
  		<div >
       <img   src="${pageContext.request.contextPath }/${e.news_pic}" width="150px" height="100px"/>
        <p>${e.news_title}</p>
        </a>
  		</div>
	</div>

	
</b:forEach>
</body>
</html>