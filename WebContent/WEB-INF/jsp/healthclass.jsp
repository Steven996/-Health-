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
    	layer.msg('往下翻翻？', {
    		  time: 0 //不自动关闭
    		  ,btn: ['必须的']
    		  ,yes: function(index,layero){
    		    layer.close(index);
    		    layer.msg('奥里给 O.o', {
    		      icon: 6
    		      ,btn: ['嗷','嗷','嗷']
    		    });
    		  }
    		});
    });
    
});
</script>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="jumbotron">
				<h1 style="color:red">
					风雨同行 共克时艰
				</h1>
				<p>
					2019年12月以来，湖北省武汉市持续开展流感及相关疾病监测，发现多起病毒性肺炎病例，均诊断为病毒性肺炎/肺部感染 [1]  。
新型冠状病毒感染的肺炎疫情牵动全国人心，大家守望相助、众志成城、共克时艰，一起驰援武汉。相信在党中央、国务院的领导下，一定能打赢这场没有硝烟的疫情防控战役。武汉加油！	</p>
				<p>
				<button  id ="jump" class="layui-btn layui-btn-radius"  href="#">Learn more</button>
            </p>
			</div>
		
<%@include file="header.jsp"%>
	<!-- 	<b:forEach items="${newslist}" var="e" varStatus="vs">
		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-6" >
    <div class="thumbnail">
	    <img src="${pageContext.request.contextPath }/${e.news_pic}" alt="..."  class="img-responsive" οnlοad="DrawImage(this)" >
	    <div class="caption">
	        <h4>${e.news_title}</h4>
	        
		        <a class="btn btn-primary" href="${pageContext.request.contextPath}/movie/getclassById.action?news_id=${e.news_id}">查看详情</a> 

		</div>
    </div>
</div>
		</b:forEach> -->
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
                        <a class="btn btn-outline-success btn-sm" href="${pageContext.request.contextPath}/movie/getclassById.action?news_id=${e.news_id}">[详情]</a>
                       
                    </div>
                </div>
                
            </div>
          </b:forEach>  
        </div>
</section>
	
</div>
</body>
</html>