 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>  
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <title >彩虹健康</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
	<!-- MetisMenu CSS -->
	<link href="${pageContext.request.contextPath}/css/metisMenu.min.css" rel="stylesheet" />
	<!-- DataTables CSS -->
	<link href="${pageContext.request.contextPath}/css/dataTables.bootstrap.css" rel="stylesheet" />
	<!-- Custom CSS -->
	<link href="${pageContext.request.contextPath}/css/sb-admin-2.css" rel="stylesheet" />
	<!-- Custom Fonts -->
	<link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/boot-crm.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" media="screen" href="https://cdn.staticfile.org/ionicons/2.0.1/css/ionicons.min.css">
	
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
 <nav class="navbar navbar-dark bg-dark">
        <div class="container">
          <a class="navbar-brand" href="#"> <i class="fa fa-h-square" aria-hidden="true"></i> 彩虹健康资讯信息服务平台</a>
        </div>
    </nav>
<div class="container">
    <div class="row">
        <div class="span8">
            <ul class="nav nav-pills">
                <li class="active"><a href="${pageContext.request.contextPath}/customernews/show.action">首页</a></li>
                <li> <a href="${pageContext.request.contextPath}/news/healthclassshow.action">健康资讯</a></li>
                <li> <a href="${pageContext.request.contextPath}/comment/customercomshow.action">健康广场</a></li>
                <li> <a href="${pageContext.request.contextPath}/movie/healthhomeshow.action">健康之家</a></li>
                <li><a href="${pageContext.request.contextPath}/bmitest.action">BMI测试</a></li>
                <li class="dropdown">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">直播<strong class="caret"></strong></a>
						<ul class="dropdown-menu">
							<li><a href="https://www.icourse163.org/course/SCU-1003488003">✸脑健康知识讲座</a></li>
							<li><a href="https://www.icourse163.org/course/SCU-1003488003">✸女生健康管理私享课</a></li>
							<li><a href="https://www.icourse163.org/course/SCU-1003488003">✸大学生心理健康</a></li>
							<li class="divider"></li>
							<li><a href="https://www.icourse163.org/course/SCU-1003488003">✸海员心理健康教育</a></li>
							<li class="divider"></li>
							<li><a href="https://www.icourse163.org/course/SCU-1003488003">✸学前儿童健康教育</a></li>
							<li><a href="https://www.icourse163.org/course/SCU-1003488003">✸营养与健康讲座</a></li>
							<li><a href="https://www.icourse163.org/course/SCU-1003488003">✸Mooc专区</a></li>		
		            	</ul>
            	</li>
            	<form class="navbar-form navbar-left" role="search" action="customersearch.action" method="post">
						<div class="form-group">
						<input type="text" class="form-control" name="commodity_name"/>
						</div> <button type="submit" class="btn btn-default">搜索</button>
						<button class="layui-btn layui-btn-sm layui-btn-disabled"><a href="https://www.wjx.cn/jq/27404213.aspx">知识测评</a></button>
				</form>
					<li><a href="${pageContext.request.contextPath }/ueditor.action"><button  class="btn btn-warning btn-xs" >发布评论</button></a></li>
					<li><a>${CUSTOMER_SESSION.customer_name}&nbsp;<i class="fa fa-circle text-success"></i>在线</a></li>
					<li><a href="${pageContext.request.contextPath }/customerlogin.action">[退出]</a></li>
							<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							More 
							<b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/customer/me.action">我的信息</a></li>
							<li><a href="#">我的收藏</a></li>
						</ul>
					</li>
            </ul>
        </div>
    </div>
</div> 
</body>