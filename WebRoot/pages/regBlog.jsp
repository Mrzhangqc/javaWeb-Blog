<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<title>注册博客</title>
		<base href="<%=basePath%>">
		<link rel="icon" href="images/icon.ico" type="image/x-icon" />
		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
		<link type="text/css" rel="stylesheet" href="css/font-awesome.css"/>
		<link type="text/css"  rel="stylesheet" href="css/adminStyle.css"/>
	</head>
	<body>
		<center class="container-fluid">
			<div class="container">
			<div class="proinfo"><div class="text-center" style="height:200px;font-size:50px;color:#333">注册博客</div></div>
     		<div style="background-color:#fff;opacity: 0.9;">
     		<div class="row text-left" style="position:absolute;left:130px;width:200px;"><c:out value="${requestScope.message}" escapeXml="false"/></div>
     			<div class="row">
       	    	<div class="col-md-12 form-horizontal">
       	    		<form action="userReg?action=upIco" method="post" enctype="multipart/form-data">
       	    			<div class="form-group" style="margin-top:15px;">
       	    				<label class="col-md-3 control-label">头像：</label>
       	    				<div class="col-md-3">
	       	    				<div class="btn btn-info" style="cursor:pointer;height:30px;line-height:30px;">
									<i class="fa fa-folder-open-o" style="color:#FFF;margin-top:2px;margin-left:0px">&nbsp;&nbsp;选择...</i>
									<input type="file" name="userIco" value="${param.userIco}" style="width:80px;margin-top:-21px;opacity:0">
								</div>
       	    				</div>
       	    				<div class="col-md-3">【建议尺寸：237*140】</div>
       	    			</div>
       	    			<div class="row">
       	    				<input class="btn btn-warning" type="submit" value="上传头像">
       	    			</div>
       	    			<div style="height:5px;border-bottom:1px dashed #CCC"></div>
       	    		</form>
       	    		<form action="pages/getRegForm.jsp" method="post">
       	    		<input type="hidden" name="action" value="userReg">
       	    		<div class="form-group">
					    <label class="col-md-3 control-label">博客：</label>
					    <div class="col-md-6">
					      <input type="text" class="form-control" name="userBlogName" value="${param.userBlogName}" />
					    </div>
					</div>
	       	    	<div class="form-group">
					    <label class="col-md-3 control-label">姓名：</label>
					    <div class="col-md-6">
					      <input type="text" class="form-control" name="userName" value="${param.userName}"/>
					    </div>
					 </div>
					 <div class="form-group">
					    <label class="col-md-3 control-label">密码：</label>
					    <div class="col-md-6">
					      <input type="password"  class="form-control" name="userPswd" />
					    </div>
					</div>
					<div class="form-group">
					    <label class="col-md-3 control-label">确认密码：</label>
					    <div class="col-md-6">
					      <input type="password"  class="form-control" name="aginPswd" />
					    </div>
					</div>
					 <div class="form-group">
					    <label class="col-md-3 control-label">性别：</label>
					    <div class="col-md-2">
					      <input type="radio"  name="userSex" value="男" checked>&nbsp;&nbsp;男
					    </div>
					    <div class="col-md-2 text-left">
       					  <input type="radio" name="userSex" value="女">&nbsp;&nbsp;女
					    </div>
					 </div>
       	    		<div class="form-group">
					    <label class="col-md-3 control-label">QQ：</label>
					    <div class="col-md-6">
					      <input type="text" class="form-control" name="userOicq"  value="${param.userOicq}"/>
					    </div>
					</div>
					<div class="form-group">
					    <label class="col-md-3 control-label">Email：</label>
					    <div class="col-md-6">
					      <input type="text" class="form-control" name="userEmail" value="${param.userEmail}" />
					    </div>
					</div>
					<div class="form-group">
					    <label class="col-md-3 control-label">签名：</label>
					    <div class="col-md-6">
					      <input type="text" class="form-control" name="userMotto"  value="${param.userMotto}" />
					    </div>
					</div>
					<div class="form-group">
					    <label class="col-md-3 control-label">来自：</label>
					    <div class="col-md-6">
					      <input type="text" class="form-control" name="userFrom" value="${param.userFrom}" />
					    </div>
					</div>
					<div class="row">
						<input class="btn btn-warning" type="submit" value="注册博客">
       					<input class="btn btn-info" type="reset" value="重新填写">
					</div>
					</form>
       	    	</div>
            </div>
     		</div>   
   	        <div class="footer" style="height:80px;background:#1E1E1E;color:#FFF">
   	        	<div class="row">
				<div>
					<i class="fa fa-flag">&nbsp;</i>博客个人·系统<span class="hide-xs"></span>
					<br class="hide-sm hide-md hide-lg">作者
					<a target="_blank" href="http://weibo.com/u/3450740922/home?wvr=5&lf=reg">Zhang QiChang</a>
				</div>
				<div >
				本博客系统前端开发框架   参考
				<a target="_blank" href="http://www.bootcss.com/">BootStrap</a>
				中文文档。
				</div>
				</div>
   	        </div>
		</div>
    	</center>
	</body>
</html>