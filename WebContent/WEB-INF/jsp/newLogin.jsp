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
var code;
function createCode() 
{
 code = "";
 var codeLength = 4; //验证码的长度
 var checkCode = document.getElementById("checkCode");
 var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
      'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
 for(var i = 0; i < codeLength; i++) 
 {
  var charNum = Math.floor(Math.random() * 52);
  code += codeChars[charNum];
 }
 if(checkCode) 
 {
  checkCode.className = "code";
  checkCode.innerHTML = code;
 }
}
function validateCode() 
{
 var inputCode=document.getElementById("inputCode").value;
 if(inputCode.length <= 0) 
 {
	 alert('验证码不能为空!');
	 return false;
 }
 else if(inputCode.toUpperCase() != code.toUpperCase()) 
 {
	 alert("验证码输入错误！");
   		createCode();
 }
 else 
 {
	 return true;
 }    
}  
</script>

</head>
<body onload="createCode()">
<div class="login">
    <div class="message">航天科工财务管理分析系统</div>
    <div id="darkbannerwrap"></div>
    
		<input id="myUserName" placeholder="用户名" required="" type="text">
		<hr class="hr15">
		<input id="mypwd" placeholder="密码" required="" type="password">
		<hr class="hr15">
		<input id="inputCode" name="password" placeholder="验证码" required="" type="text">
		<hr class="hr15">
		<span class="code" id="checkCode" onclick="createCode()" ></span><a href="#" onclick="createCode()">看不清换一张</a>
		<input value="登录" style="width:100%;" type="button" onclick="mylogin();">
		<label>如没有用户<a href="#" onclick="javascript:myreg();">请注册</a></label>
		<hr class="hr20">

	
</div>
<script type="text/javascript">

function changeCode(){
    window.location.href="goToLoginPage.do";
}

function mylogin(){
	if(validateCode())
		{
		 $.ajax({
		        cache: true,
		        type: "GET",
		        url:"${myappurl}mylogin.do",
		        data : {
					tUserName : $("#myUserName").val(),
					tUserPwd : $("#mypwd").val()
				},
		        async: true,
		        success: function(data) {
		        	if(data=="allok")
		        		{
		        		 window.location.href="goToLoanIn.do";
		        		}else{
		        			alert("登陆失败");
		        		}
		        }
		    }); 
		}
	
}

function myreg()
{	
	window.location.href="gotoRegister.do";
}

</script>
</body>
</html>