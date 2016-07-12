<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<title>用户登录</title>
		<base href="<%=basePath%>">
		<link rel="icon" href="images/icon.ico" type="image/x-icon" />
		<link type="text/css" rel="stylesheet" href="css/userLogon.css">
	</head>
	<body>
		<form action="visitor/logon" method="post">
    		<div class="login">
				<h1>用户登录</h1>
				<div class="prompt"><c:out value="${requestScope.message}" escapeXml="false"/></div>
				<input type="text" name="userName" placeholder="用户名" />
				<input type="password" name="userPswd" placeholder="密码"/>
				<button type="submit" class="btn btn-primary btn-block btn-large">登录</button>
				<button type="reset" class="btn reset">&nbsp&nbsp&nbsp重置&nbsp&nbsp&nbsp</button>
				<a href="javascript:window.close()" class="btn close">关闭本页</a>
			</div>
    	</form>
	</body>
</html>