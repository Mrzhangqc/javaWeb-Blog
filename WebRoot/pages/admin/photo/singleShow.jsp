<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:set var="single" value="${requestScope.photosingle}"/>
<c:if test="${empty single}"><br><center>☆★☆ 对不起，查看图片详细信息失败！☆★☆</center></c:if>
<c:if test="${!empty single}">       	
	<!-- 显示图片详细信息 -->
	<div class="row">
		<a href="pages/photo/bigShow.jsp?src=${single.photoSrc}" title="点击放大图片" target="_blank"><img class="img-rounded" src="images/photo/${single.photoSrc}" width="100%" height="80%" style="border:1 solid;border-color:lightgrey"></a>
	</div>
	<div class="row">
		<div class="text-left">上传时间：<c:out value="${single.photoUptime}"/></div>
	</div>
	<div class="row" style="padding:10px 0">
		<div class="col-md-6 text-right"><a class="btn btn-danger" href="my/admin/photo?action=delete&id=${single.id}">删除图片</a></div>
		<div class="col-md-6 text-left"><a class="btn btn-info" href="javascript:window.history.go(-1)">&nbsp;&nbsp;&nbsp;返回&nbsp;&nbsp;&nbsp;</a></div>	
	</div>
	<div class="row" style="background:#eee;height:40px;line-height:40px;">
		<div class="text-left" style="padding-left:20px">图片介绍</div>
	</div>
	<div class="row">
		<div class="text-left" style="padding-left:25px;word-break:break-all;min-height:100px"><c:out value="${single.photoInfo}" escapeXml="false"/></div>
	</div>
</c:if>