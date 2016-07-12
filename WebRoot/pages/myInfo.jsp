<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	response.addHeader("Pragma","No-cache");
	response.addHeader("Cache-Control","no-cache");
	response.addDateHeader("Expires",1);

	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<title>查看博主资料</title>
		<base href="<%=basePath%>">
		<link rel="icon" href="images/icon.ico" type="image/x-icon" />
		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
		<link type="text/css" rel="stylesheet" href="css/font-awesome.css"/>
		<link type="text/css"  rel="stylesheet" href="css/adminStyle.css"/>
	</head>
	<body>
	<center class="container-fluid">
	<c:set var="master" value="${sessionScope.callBlogMaster}"/>
		<div class="container">
			<div class="proinfo"><div class="text-center" style="height:200px;font-size:50px;color:#333">博主资料</div></div>
			
			<c:if test="${empty master}">
   			<div  class="row" style="min-height:350px;width:100%;margin-top:100px;"><div class="text-center" style="color:#FFF"><h1>☆★☆ 对不起，查看博主资料失败！☆★☆</h1></div></div>
     		</c:if>
     		
     		<c:if test="${!empty master}">
     		<div style="background-color:#fff;opacity: 0.9;">
     			<div class="row">
       	    	<div class="col-md-12 form-horizontal">
       	    		<div class="form-group">
       	    			<label class="col-md-3 control-label" style="margin-top:70px;">头像：</label>
       	    			<div class="col-md-6 text-left" style="padding-top:10px">
       	    			<img src="images/ico/${master.userIco}" style="border:1 solid;width:150px;border-radius:75px;height:150px;">
       	    			</div>
       	    		</div>
       	    		<div class="form-group">
					    <label class="col-md-3 control-label">博客：</label>
					    <div class="col-md-6">
					      <input type="text" class="form-control" value="${master.userBlogName}" disabled style="background-color:#fdfcfb">
					    </div>
					</div>
	       	    	<div class="form-group">
					    <label class="col-md-3 control-label">姓名：</label>
					    <div class="col-md-6">
					      <input type="text" class="form-control" value="${master.userName}" disabled style="background-color:#fdfcfb">
					    </div>
					 </div>
					 <div class="form-group">
					    <label class="col-md-3 control-label">性别：</label>
					    <div class="col-md-6">
					      <input type="text" class="form-control" value="${master.userSex}" disabled style="background-color:#fdfcfb">
					    </div>
					 </div>
       	    		<div class="form-group">
					    <label class="col-md-3 control-label">QQ：</label>
					    <div class="col-md-6">
					      <input type="text" class="form-control" value="${master.userOicq}" disabled style="background-color:#fdfcfb">
					    </div>
					</div>
					<div class="form-group">
					    <label class="col-md-3 control-label">Email：</label>
					    <div class="col-md-6">
					      <input type="text" class="form-control" value="${master.userEmail}" disabled style="background-color:#fdfcfb">
					    </div>
					</div>
					<div class="form-group">
					    <label class="col-md-3 control-label">来自：</label>
					    <div class="col-md-6">
					      <input type="text" class="form-control" value="${master.userFrom}" disabled style="background-color:#fdfcfb">
					    </div>
					</div>
					<div class="form-group">
					    <label class="col-md-3 control-label">签名：</label>
					    <div class="col-md-6">
					      <input type="text" class="form-control" value="${master.userMotto}" disabled style="background-color:#fdfcfb">
					    </div>
					</div>
					<div class="form-group">
					    <label class="col-md-3 control-label">创建时间：</label>
					    <div class="col-md-6">
					      <input type="text" class="form-control" value="${master.userCTTime}" disabled style="background-color:#fdfcfb">
					    </div>
					</div>
					<div class="form-group">
					    <label class="col-md-3 control-label">访问次数：</label>
					    <div class="col-md-6">
					      <input type="text" class="form-control" value="${master.userHitNum}" disabled style="background-color:#fdfcfb">
					    </div>
					</div>
       	    	</div>
            </div>
     		</div>
          	</c:if>     
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