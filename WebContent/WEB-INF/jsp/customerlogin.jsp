<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>登录页面</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/css/style.css"
	   type=text/css rel=stylesheet>
	<!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
<script src=
       "${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
</script>

<script>
// 判断是登录账号和密码是否为空
function check(){
    var customer_name = $("#customer_name").val();
    var customer_pass = $("#customer_pass").val();
    if(customer_name=="" || customer_pass==""){
    	$("#message").text("账号或密码不能为空！");
        return false;
    }  
    return true;
}
</script>
</head>
<body leftMargin=0 topMargin=0 marginwidth="0" marginheight="0"
	background="${pageContext.request.contextPath}/images/welc.png"  style="background-repeat:repeat">
<div ALIGN="center">
<table border="0" width="100%" cellspacing="0" cellpadding="0"
                                                           id="table1">
	<tr>
		<td height="93"></td>
		<td></td>
	</tr>
	<tr>

   <td class="login_msg" width="100%" align="center">
	 <!-- margin:0px auto; 控制当前标签居中 -->
	 <fieldset style="width: 70%; margin: 0px auto;">
		  <legend>
		     <font style="font-size:25px" face="宋体" color="black">
		          彩虹健康
		     </font>
		      <font style="font-size:15px" face="宋体" color="black">
		          您的私人健康助手
		     </font>
		  </legend> 
		<font color="red">
			 <%-- 提示信息--%>
			 <span id="message">${msg}</span>
		</font>
		<%-- 提交后的位置：/WEB-INF/jsp/customer.jsp--%>
		<form action="${pageContext.request.contextPath }/customerlogin.action" 
			                       method="post" onsubmit="return check()"<%--提交表单时，进行验证 --%> class="form-horizontal">
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /><br />

          账&nbsp;号：<input id="customer_name" type="text" name="customer_name" />
          <br /><br />
          密&nbsp;码：<input id=customer_pass type="password" name="customer_pass" />
          <br /><br />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="submit" value="登录" class="btn btn-primary" />
          <a href="${pageContext.request.contextPath }/login.action">
    				<b>🍀</b>
		</a>
		 <p><input type="checkbox" name="vehicle" value="Bike" />记住我</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 </form>&nbsp;&nbsp;&nbsp;
		 <a href="${pageContext.request.contextPath }/customer/add.action">
    				还没有账号？
    	<b>立即注册!</b>
		</a>
	 </fieldset>
	</td>
	</tr>
</table>
</div>


</body>
</html>
