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
<body>
<!-- 左侧显示列表部分 start-->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li class="sidebar-search">
				<form action="serachUser.action">
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" name="username" placeholder="查询内容...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
							</button>
						</span>
					</div> 
					</form>
				</li>
				<li>
				      <a href="${pageContext.request.contextPath }/movie/showMovieType.action" class="active">
				        <i class="fa fa-dashboard fa-fw" ></i> 商品分类管理
				      </a>
				</li>				
				<li>
				    <a href="${pageContext.request.contextPath }/movie/show.action">
				      <i class="fa fa-edit fa-fw"></i> 商品管理
				    </a>
				</li>
				
				<li>
				    <a href="${pageContext.request.contextPath }/user/list.action">
				      <i class="fa fa-user fa-fw" ></i> 用户管理
				    </a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath }/comment/comshow.action">
				      <i class="icon ion-ios-analytics" ></i> 评论管理
				    </a>
				    <li>
				    <a href="${pageContext.request.contextPath }/news/show.action">
				      <i class="icon ion-star" ></i> 资讯管理
				    </a>
				</li>	
				<li>
				    <a href="${pageContext.request.contextPath }/logout.action">
				      <i class="icon ion-ios-eye" ></i> 退出
				    </a>
				</li>	
				</li>				
			</ul>
		</div>
	</div>
	<!-- 左侧显示列表部分 end--> 
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">评论管理</h1>
			</div>
		</div>
			
			<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>评论编号</th>
								<th>评论详情</th>
								<th>时间</th>
								<th>用户id</th>			
								<th>操作</th>				
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${comlist}" var="l1">
							
								<tr>
									<td>${l1.comment_id}</td>
									<td>${l1.comment_detail}</td>
									<td>${l1.date}</td>
									<td>${l1.customer_id}</td>
									<td>
									<a href="#" class="btn btn-danger btn-xs" onclick="deleteCom(${l1.comment_id})">删除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						</table>
				</div>
</div>
</body>
</html>