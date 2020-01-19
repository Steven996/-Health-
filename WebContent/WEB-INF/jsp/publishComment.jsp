<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <script src="uEditor/ueditor.parse.js"></script>
    <title></title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
</head>
<script type="text/javascript" charset="utf-8" src="uEditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="uEditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8" src="uEditor/lang/zh-cn/zh-cn.js"></script>
<title>ueditor</title>
<body>
<form action="server.php" method="post">
        <!-- 加载编辑器的容器 -->
        <script id="container" name="content" type="text/plain">
            请输入您的评论......
        </script>
    </form>
    <!-- 配置文件 -->
    <script type="text/javascript" src="ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="ueditor.all.js"></script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        var editor = UE.getEditor('container');
    </script>
 		<a href="${pageContext.request.contextPath }/comment/customercomshow.action">
        <div>
        <button class="btn-warning btn-xs">返回</button>
        </a>
        
        <button class="btn-primary"  id="submit" onclick="getstring()">发布</button>
</body>
</html>