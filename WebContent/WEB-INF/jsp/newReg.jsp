<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"
+request.getServerPort()+path+"/";
request.getSession().setAttribute("myappurl", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=basePath%>resource/jquery/jquery.min.js"></script>
<style type="text/css">
.code 
{
 font-family:Arial;
 font-style:italic;
 color:red;
 font-size:30px;
 border:0;
 padding:2px 3px;
 letter-spacing:3px;
 font-weight:bolder;
 float:left;
 cursor:pointer;
 width:150px;
 height:60px;
 line-height:60px;
 text-align:center;
 vertical-align:middle;
}
a 
{
 text-decoration:none;
 font-size:12px;
 color:#288bc4;
}
a:hover 
{
 text-decoration:underline;
}
</style>
<link href="${myappurl}resource/login/css/login.css" type="text/css" rel="stylesheet"> 
<script type="text/javascript">
function mylogin(){
	window.location.href="goToLoginPage.do";
}

function myreg()
{
	 $.ajax({
	        cache: true,
	        type: "GET",
	        url:"${myappurl}addSysUser.do",
	        data : {
				tUserName : $("#myUserName").val(),
				tUserPwd : $("#mypwd").val(),
				tMobile:$("#tMobileID").val(),
				tEmail:$("#tEmailID").val()
			},
	        async: true,
	        success: function(data) {
	        	if(data=="allok")
	        		{
	        		alert("注册成功,请等待审核！");
	        		}else{
	        			alert("注册失败");
	        		}
	        }
	    }); 

	}

</script>

</head>
<body onload="createCode()">
<div class="login">
    <div class="message">用户注册</div>
    <div id="darkbannerwrap"></div>
    
		<input id="myUserName" placeholder="用户名" required="" type="text">
		<hr class="hr15">
		<input id="mypwd" placeholder="密码" required="" type="password">
		<hr class="hr15">
		<input id="tMobileID" placeholder="手机号" required="" type="text">
		<hr class="hr15">
		<input id="tEmailID" placeholder="Email" required="" type="text">
		<hr class="hr15">
		
				<input value="注册" style="width:100%;" type="button" onclick="myreg();">
		<label><a href="#" onclick="javascript:mylogin();">返回登录</a></label>
		<hr class="hr20">

	
</div>
<script type="text/javascript">
function mylogin(){
	window.location.href="goToLoginPage.do";
}

function myreg()
{
	 $.ajax({
	        cache: true,
	        type: "GET",
	        url:"${myappurl}addSysUser.do",
	        data : {
				tUserName : $("#myUserName").val(),
				tUserPwd : $("#mypwd").val(),
				tMobile:$("#tMobileID").val(),
				tEmail:$("#tEmailID").val()
			},
	        async: true,
	        success: function(data) {
	        	if(data=="allok")
	        		{
	        		alert("注册成功,请等待审核！");
	        		}else{
	        			alert("注册失败");
	        		}
	        }
	    }); 

	}

</script>
</body>
</html>