 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>  
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <title >彩虹健康</title>
  <!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/default.css">

<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/carousel.css" > -->
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" >

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script	src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
<!-- <script src="${pageContext.request.contextPath}/js/common.js"></script> -->

 </head>
 <body>

 <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 ">
		<div class="navbar ">
 			<ol class="breadcrumb text-right" id="info">
					<li id="li1"><span>欢迎来到彩虹健康!</span>
					<a href="${pageContext.request.contextPath }/customerlogin.action">[退出]</a></li>
					<li><a href="#" onclick="">我的收藏 <span class="badge" id="cartBadge"></span></a></li>
			 </ol>
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header" style="background:#FF4500">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="${pageContext.request.contextPath}/customernews/show.action"><span class="logo">彩虹</span> 健康</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" >
					<ul class="nav navbar-nav" >
						<li class="active">
							 <a href="${pageContext.request.contextPath}/customernews/show.action">首页</a>
						</li>
						<li class="active">
							 <a href="${pageContext.request.contextPath}/news/healthclassshow.action">健康小课堂</a>
						</li>
						<li class="active">
							 <a href="${pageContext.request.contextPath}/comment/customercomshow.action">健康广场</a>
						</li>
						<li class="active">
							 <a href="${pageContext.request.contextPath}/movie/healthhomeshow.action">健康之家</a>
						</li>
						<li class="active">
							 <a href="${pageContext.request.contextPath}/bmitest.action">BMI测试</a>
						</li>
						<li class="active" >
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">直播<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
							   <c:forEach begin="1" end="3" var="c1" varStatus="vs">								
				                    <c:forEach begin="1" end="2" var="a" varStatus="i">
							  			<li><a href="https://www.icourse163.org/course/SCU-1003488003">✸脑健康知识讲座</a></li>
							  			<li><a href="https://www.icourse163.org/course/SCU-1003488003">✸女生健康管理私享课</a></li>
							  			<li><a href="https://www.icourse163.org/course/SCU-1003488003">✸大学生心理健康</a></li>
							  			<li><a href="https://www.icourse163.org/course/SCU-1003488003">✸海员心理健康教育</a></li>
							  			<li><a href="https://www.icourse163.org/course/SCU-1003488003">✸学前儿童健康教育</a></li>
							  			<li><a href="https://www.icourse163.org/course/SCU-1003488003">✸营养与健康讲座</a></li>
							  			<li><a href="https://www.icourse163.org/course/SCU-1003488003">✸Mooc专区</a></li>
							  			</c:forEach>	
						            <li class="divider"></li>							
							   </c:forEach>						
							</ul>
						</li>
					</ul>
					<form class="navbar-form navbar-left" role="search" action="customersearch.action" method="post">
						<div class="form-group">
							<input type="text" class="form-control" name="commodity_name"/>
						<button type="submit" class="btn btn-default">搜索</button>
						<button><a href="https://www.wjx.cn/jq/27404213.aspx">知识测评</a></button>
						</div> 
					</form>
					<a href="${pageContext.request.contextPath }/publishComment.action">
					<button  class="btn btn-warning btn-xs" >发布评论</button></a>
					<ul class="nav navbar-nav navbar-right ">

			</nav>