<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<div class="container topBg" >
	<div class="row" >
		<div class="text-center" style="height:200px;font-size:50px;color:#333">后台管理</div>
		<div class="text-right">
		<br>---
		<b><c:out value="${sessionScope.logoner.userName}"/></b>【博客】
		</div>	
	</div>
	
	 <!-- 导航菜单 -->
	<div class="row" style="">
		<div class="col-md-2 text-left">
			<a href="my/goBlog?master=${sessionScope.logoner.id}" class="btn btn-default "><i class="fa fa-reply-all"></i>&nbsp;前台页面</a>
		</div>
		<div class="col-md-2 text-left">
			<a href="logoff" class="btn btn-default"><i class="fa fa-sign-out" ></i>&nbsp;退出登录</a>
		</div>
	</div>
</div>
