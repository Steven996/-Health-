<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="b"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
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
	<link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
</head>
<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>layui/layui.js"></script>
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
<script type="text/javascript" src="${APP_PATH}/static/js/jqthumb.min.js"></script>	
<script type="text/javascript">
function DrawImage(hotimg){
		$(hotimg).jqthumb({
			width : '100%',//宽度
			height : '142px',//高度
			//position : { y: '50%', x: '50%'},//从图片的中间开始产生缩略图
			zoom : '1',//缩放比例
			method : 'auto'//提交方法，用于不同的浏览器环境，默认为‘auto’
		});
	}
layui.use('layer', function(){
	  var $ = layui.jquery, layer = layui.layer;
      $(document).on('click','#jump',function(){
	layer.alert('快去做点什么  ! ! !', {
		  skin: 'layui-layer-molv' //样式类名
		  ,closeBtn: 0
		}, function(){
		  layer.alert('到处逛逛~~', {
		    skin: 'layui-layer-lan'
		    ,closeBtn: 0
		    ,anim: 4 //动画类型
		  });
		});
      });
      $(document).on('click','#jump2',function(){
    	  layer.msg('玩命卖萌中', function(){
    		//关闭后的操作
    		});
    	      });
});

</script>
<%@include file="header.jsp"%>
<section id="header" class="jumbotron">
    <div class="d-flex flex-column align-items-center"> 
        <div><h1 class="display-3">WELCOME</h1></div>
        <div><p class="lead">Happiness lies first of all in health</p></div>
        <div>
            <button  id ="jump" class="layui-btn layui-btn-radius"  href="#">do something</button>
             <button  id ="jump2" class="layui-btn layui-btn-radius layui-btn-danger"  href="#">do another</button>
        </div>
    </div>
    </section>
     <!-- 轮播图 -->
     
  <div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="carousel slide" id="carousel-654045">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-654045">
					</li>
					<li data-slide-to="1" data-target="#carousel-654045">
					</li>
					<li data-slide-to="2" data-target="#carousel-654045" class="active">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item">
						<img alt="" src="${pageContext.request.contextPath }/images/l3.jpg" />
						<div class="carousel-caption">
							
							
						</div>
					</div>
					<div class="item">
						<img alt="" src="${pageContext.request.contextPath }/images/l2.jpg" />
						<div class="carousel-caption">
							<h4>
								
							</h4>
							<p>
							</p>
						</div>
					</div>
					<div class="item active">
						<img alt="" src="${pageContext.request.contextPath }/images/l1.jpg" />
						<div class="carousel-caption">
							<h4>
								
							</h4>
							<p>
								</p>
						</div>
					</div>
				</div> <a data-slide="prev" href="#carousel-654045" class="left carousel-control">‹</a> <a data-slide="next" href="#carousel-654045" class="right carousel-control">›</a>
			</div>
		</div>
	</div>
</div>  
    <ul class="breadcrumb">
				<li>
					 <a href="#">Home</a>
				</li>
				<li>
					 <a href="#">Library</a>
				</li>
				<li class="active">
					Data
				</li>
			</ul>
			
			
<section id="gallery" class="container">

        <div class="row">
        <b:forEach items="${newslist}" var="e" varStatus="vs">
            <div class="col-lg-4 mb -4">
                 <div class="card">
                 <a class="btn btn-outline-success btn-sm" href="${pageContext.request.contextPath}/movie/getclassById.action?news_id=${e.news_id}">
           
                 <img class="card-img-top" src="${pageContext.request.contextPath }/${e.news_pic}"></img>
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">${e.news_title}</h5>
                        <a class="btn btn-outline-success btn-sm" href="${pageContext.request.contextPath}/movie/getclassById.action?news_id=${e.news_id}">【详情】</a>
                        <a class="btn btn-outline-danger btn-sm" href="#"><i class="fas fa-heart"></i></a>
                    </div>
                </div>
                
            </div>
          </b:forEach>  
        </div>
</section>
<nav class="navbar navbar-dark bg-dark">
        <div class="container">
          <a class="navbar-brand" href="#"> <i class="fas fa-binoculars mr-3 "></i>视频资讯</a>
        </div>
</nav>
<section id="gallery" class="container">
     <center>
		<video width="320" height="240" controls="controls" autoplay="autoplay">
			  <source src="${pageContext.request.contextPath}/images/v1.mp4" type="video/mp4" />
			  <object data="${pageContext.request.contextPath}/images/v1.mp4" width="320" height="240">
   			  <embed width="320" height="240" src="${pageContext.request.contextPath}/images/v1.mp4" />
  			  </object>
		</video> 	   
		<video width="320" height="240" controls="controls" autoplay="autoplay">
			  <source src="${pageContext.request.contextPath}/images/v2.mp4" type="video/mp4" />
			  <object data="${pageContext.request.contextPath}/images/v2.mp4" width="320" height="240">
   			  <embed width="320" height="240" src="${pageContext.request.contextPath}/images/v2.mp4" />
  			  </object>
		</video>
		<video width="320" height="240" controls="controls" autoplay="autoplay">
			  <source src="${pageContext.request.contextPath}/images/v3.mp4" type="video/mp4" />
			  <object data="${pageContext.request.contextPath}/images/v3.mp4" width="320" height="240">
   			  <embed width="320" height="240" src="${pageContext.request.contextPath}/images/v3.mp4" />
  			  </object>
		</video>
	</center>     	
</section> 
</body>
</html>