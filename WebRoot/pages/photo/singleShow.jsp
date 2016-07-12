<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:set var="single" value="${requestScope.photosingle}"/>
<c:if test="${empty single}"><div class="text-center"><h1>☆★☆ 对不起，查看图片详细信息失败！☆★☆</h1></div></c:if>
<c:if test="${!empty single}">       	
	<!-- 显示图片详细信息 -->
<div class="container-fluid" style="padding-right:1px;">
	<div class="row">
		<a href="pages/photo/bigShow.jsp?src=${single.photoSrc}" title="点击放大图片" target="_blank"><img class="img-rounded" src="images/photo/${single.photoSrc}" width="100%" height="380px" style="border:1 solid;border-color:lightgrey"></a>
	</div>
	<div class="row" style="padding:10px 0">
		<div class="col-md-6 text-left">上传时间：<c:out value="${single.photoUptime}"/></div>
		<div class="col-md-6 text-left"><a class="btn btn-info" href="javascript:window.history.go(-1)">&nbsp;&nbsp;&nbsp;返回&nbsp;&nbsp;&nbsp;</a></div>	
	</div>
	<div class="row" style="background:#eee;height:40px;line-height:40px;">
		<div class="text-left" style="padding-left:20px">图片介绍</div>
	</div>
	<div class="row" style="border:1px solid #CCC">
		<div class="text-left" style="padding-left:25px;word-break:break-all;min-height:100px"><c:out value="${single.photoInfo}" escapeXml="false"/></div>
	</div>
</div>	
</c:if>