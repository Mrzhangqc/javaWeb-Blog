<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<title>博主登录</title>
		<base href="<%=basePath%>">
		<link rel="icon" href="images/icon.ico" type="image/x-icon" />
		 <link rel="stylesheet" href="css/bootstrap.min.css">
		<link type="text/css" rel="stylesheet" href="css/mylogonStyle.css">
		<link rel="stylesheet" href="css/font-awesome.css">
		 <script src="js/jquery-1.11.0.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/mylogonScripts.js"></script>
	</head>
	<body>
	<!-- Top content -->
    	<div class="top-content" style="background:url(images/mylogonBg.jpg) no-repeat center fixed;background-size:cover;">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>博主登陆</strong></h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>登入博客系统</h3>
                            		<p>用正确的用户名和密码登陆</p>
                        		</div>
                        		<div class="prompt form-top-right">
                        			<i class="fa fa-lock"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="my/logon" method="post" class="login-form">
			                    	<div class="row alert alert-warning">
   										<c:out value="${requestScope.message}" escapeXml="false"/>
									</div>
			                    	<div class="form-group input-group-lg">
			                        	<input type="text" name="userName" placeholder="用户名" class="form-control">
			                        </div>
			                        <div class="form-group input-group-lg">
			                        	<input type="password" name="userPswd" placeholder="密码" class="form-control">
			                        </div>
			                        <div class="row">
			                        	<div class="col-md-6" onclick = "press()"><button type="submit" class="btn btn-success btn-lg">登陆</button></div>
			                        	<div class="col-md-6"><button type="reset" class="btn btn-danger btn-lg" value="" >重置</button></div>
			                        </div>
			                    </form>
		                    </div>
                        </div>
                    </div>             
                </div>
            </div>          
        </div>
	</body>
</html>