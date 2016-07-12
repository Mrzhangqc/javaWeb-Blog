<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<div id="container" class="navbar navbar-fixed-top">
<div class="buttons">
  <div class="container col-md-12">
  	<div class="row">
   		<a href="goIndex" class="butn btn-1">
      	<svg><rect x="0" y="0" fill="none" width="100%" height="100%"/></svg>博客首页
     	</a>
     	<a href="my/goBlog?master=${sessionScope.callBlogMaster.id}" class="butn btn-1">
      	<svg><rect x="0" y="0" fill="none" width="100%" height="100%"/></svg>个人首页
     	</a>
     	<a href="my/guest/article?action=listShow" class="butn btn-1">
      	<svg><rect x="0" y="0" fill="none" width="100%" height="100%"/></svg>我的文章
     	</a>
     	<a href="my/guest/photo?action=listShow" class="butn btn-4"><span>我的相册</span>
     	</a>
     	<a href="my/guest/media?action=listShow" class="butn btn-4"><span>我的影音</span>
     	</a>
     	<a href="my/guest/word?action=linkTo" class="butn btn-4"><span>给我留言</span>
     	</a>
    	<a href="my/logon?goWhere=adminTemp" class="butn btn-5">后台管理</a> 
  	</div>
  	<div class="row text-left" style="margin-top:-78px;color:#FFF">
		<b><c:out value="${sessionScope.callBlogMaster.userName}"/>&nbsp;<i style="color:#337ab7">Blog</i></b>
  	</div>
  	<div class="row text-left" style="margin-top:-42px;width:150px;height:53px;">
  		<c:set var="visitor" value="${sessionScope.logoner}"/>
   		<c:if test="${empty visitor}">
   			<a href="pages/userLogon.jsp">【访问者登录】</a>
   		</c:if>
   		<c:if test="${!empty visitor}">
   		欢迎您：<c:out value="${visitor.userName}"/>
   		</c:if>
  	</div>
  	</div>
</div>
</div>
