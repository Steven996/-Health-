<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="multipart/form-data;charset=utf-8" />
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
<body>
<!-- 左侧显示列表部分 start-->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li class="sidebar-search">
				<form action="search.action">
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" name="commodity_name" placeholder="查询内容...">
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
				<h1 class="page-header">商品管理</h1>
			</div>
		</div>
			<a href="#" class="btn btn-primary" data-toggle="modal" 
		           data-target="#newCateDialog" >上架</a>
			<table class="table table-bordered table-striped">
						<thead>
							
							<tr>
								<th>编号</th>
								<th>商品名</th>
								<th>商品图片</th>
								<th>销量</th>
								<th>商品详情</th>
								<th>类别</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${movielist}" var="l1">
								<tr>
									<td>${l1.commodity_id}</td>
									<td>${l1.commodity_name}</td>
									<td><img src="${pageContext.request.contextPath }/${l1.commodity_picture}" width="150px" height="100px"/></td>
									
									<td>${l1.commodity_totalCount}</td>
									<td>${l1.commodity_detail}</td>
									<td>${l1.commodity_type_name}</td>
								    
									<td>
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#cateEditDialog" onclick= "editUser(${l1.commodity_id})">修改</a>
										<a href="#" class="btn btn-danger btn-xs" onclick="deleteUser(${l1.commodity_id})">下架</a>
										<a href="${pageContext.request.contextPath}/movie/getMovieByIdpc.action?commodity_id=${l1.commodity_id}" class="btn btn-warning btn-xs">商品详情</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						</table>
				</div>
</div>
<!-- 创建电影 -->
<div class="modal fade" id="newCateDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新建商品</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_cate_form" enctype="multipart/form-data">

					<div class="form-group">
						<label for="new_cateFrom" class="col-sm-2 control-label">商品名</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_cateName" placeholder="请输入商品名" name="commodity_name" />
						</div>
					</div>
		
					<div class="form-group">
						<label for="new_cateName" class="col-sm-2 control-label">类别</label>
						<div class="col-sm-10">
							<select	class="form-control" id="new_cateFrom" name="commodity_type">
								<option value="-1">--请选择--</option>
								<option value="1">医疗器材</option>
								<option value="2">医疗药品</option>
								
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="new_catedesc" class="col-sm-2 control-label">商品详情</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_catedesc" placeholder="商品详情" name="commodity_detail" />
						</div>
						
					</div>
					<div class="form-group">
						<label for="new_catedesc" class="col-sm-2 control-label">上传图片</label>
						<div class="col-sm-10">
						<input type="file" name="picture" id="picture" placeholder="请选择图片"/><br>
						</div>
					</div>
					<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="add()">创建</button>
			</div>
				</form>
			</div>
			
		</div>
	</div>
</div>

<!-- 修改电影 -->
<div class="modal fade" id="cateEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改商品信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_user_form">
				 <input type="hidden" id="commodity_id" name="commodity_id"/>
					<div class="form-group" id="form_parentid">
						<label for="edit_cateFrom" class="col-sm-2 control-label">商品名</label> 
						<div class="col-sm-10">
							<input type="text" class="form-control" id="commodity_name" placeholder="商品名" name="commodity_name"/>
						</div>
					
					<div class="form-group">
						<label for="edit_cateName" class="col-sm-2 control-label">
						    类别
						</label>
						<div class="col-sm-10">
							<select	class="form-control" id="commodity_type" name="commodity_type">
								<option value="-1">--请选择--</option>
								<option value="1">医疗药品</option>
								<option value="2">医疗器材</option>
							
							</select>
							</div>
					</div>
				
					<div class="form-group">
						<label for="edit_cateName" class="col-sm-2 control-label">
						   商品详情
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="commodity_detail" placeholder="商品详情" name="commodity_detail"/>
						</div>
					</div>
					
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="update()">修改</button>
			</div>
		</div>
	</div>
</div>
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
//创建电影
function add() {
	processData: false;//因为data值是FormData对象，不需要对数据做处理。
    contentType: false
	$.post("${pageContext.request.contextPath}/movie/add.action",
			
	$("#new_cate_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("商品创建成功！");
	            window.location.reload();
	        }else{
	            alert("商品创建失败！");
	            window.location.reload();
	        }
	        
	    });
	
	}
	

	// 通过id获取修改的商品信息

	function editUser(commodity_id) {
		
		$.post("${pageContext.request.contextPath}/movie/getMovieById?.action",{"commodity_id":commodity_id},function(data){
			 $("#commodity_id").val(data.commodity_id);
			 $("#commodity_name").val(data.commodity_name);
	         $("#commodity_detail").val(data.commodity_detail);
	         $("#commodity_type").val(data.commodity_type);
		});
	}
	// 执行修改电影操作
	function update() {
		$.post("${pageContext.request.contextPath}/movie/upd.action",$("#edit_user_form").serialize(),function(data){
			if(data == "OK"){
				alert("更新成功！");
				window.location.reload();
			}else{
				alert("更新失败！");
				
				window.location.reload();
			}
		});
	}
	// 删除电影
	function deleteUser(commodity_id) {
	    if(confirm('确定要删除该商品吗?')) {
	$.post("${pageContext.request.contextPath}/movie/del.action",{"commodity_id":commodity_id},
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
</body>
</html>