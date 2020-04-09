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

<nav class="navbar navbar-default" role="navigation">
		<div>
		 <img src="${pageContext.request.contextPath}/images/rainbow.jpg"   class="img-circle" height="45" width="45" alt="rainbow">
		
        <a class="navbar-brand" href="#">彩虹健康管理平台</a>
        </div>
</nav>
	
	
<div class="collapse navbar-collapse" id="example-navbar-collapse">
					<ul class="nav navbar-nav">
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
				 </li>
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
				<li>
				<div class="pull-right info" >
				${USER_SESSION.user_name}&nbsp;<a href="#"><i class="fa fa-circle text-success"></i>在线</a>
	   			</div>	
	   			</li>	
		</ul>				
</div>

				<form action="serachcom.action">
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" name="customer_name" placeholder="查询内容...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
							</button>
						</span>
					</div> 
					</form>
	
	<!-- 左侧显示列表部分 end--> 
	
			
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
						
							<c:forEach items="${comlist}" var="l1">
							
								<tr>
								
									
									<td>${l1.customer_name}</td>
									<td>${l1.comment_detail}</td>
									<td>${l1.date}</td>
									
									<td>
									<a href="#" class="btn btn-danger btn-xs" onclick="deleteCom(${l1.comment_id})">删除</a>
									</td>
								</tr>
							</c:forEach>
						
						</tbody>
						</table>
</body>
</html>