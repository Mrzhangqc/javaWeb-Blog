<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="js/inputCheck.js"></script>

<c:set var="single" value="${requestScope.mediasingle}"/>
<c:if test="${empty single}"><br><div class="text-center">☆★☆ 对不起，播放视频失败！☆★☆</div></c:if>
<c:if test="${!empty single}">       	
	<!-- 显示视频信息，并播放视频 -->
	<div class="row" style="background:#eee;height:40px;line-height:40px;">
		<div class="text-left" style="padding-left:20px">正在播放视频：<c:out value="${single.mediaTitle}" escapeXml="false"/></div>
	</div>
	<div class="media">
		<video controls=controls  loop =loop>
			 <source src="<%=basePath%>/pages/media/videos/${single.mediaSrc}"></source>
		</video>
	</div>
	<div class="row" style="padding:15px 0">
		<div class="col-md-4"><a class="btn btn-info" href="my/admin/mediaRev?action=adminList&id=${single.id}" target="_blank">查看评论</a></div>
		<div class="col-md-4"><a class="btn btn-danger" href="my/admin/media?action=delete&id=${single.id}">删除视频</a></div>
		<div class="col-md-4"><a class="btn btn-info" href="javascript:window.history.go(-1)">【返回】</a></div>
	</div>
	<div class="row" style="background:#eee;height:40px;line-height:40px;">
		<div class="text-left"  style="padding-left:20px">视频信息</div>
	</div>
	<div class="row">
		<div class="text-left" style="padding-left:25px;word-break:break-all;">
			<div class="col-md-4">观看：<c:out value="${single.lookCount}"/> 次</div>
			<div class="col-md-4">评论：<c:out value="${single.reviCount}"/> 条</div>
			<div class="col-md-4">上传时间：<c:out value="${single.mediaUptime}"/></div>
		</div>
	</div>
	<div class="row" style="margin-top:5px">
		<label class="col-md-2 text-right">视频介绍：</label>
		<div class="col-md-10 text-left" style="word-break:break-all;padding:0px">
			<textarea class="form-control" disabled><c:out value="${single.mediaInfo}" escapeXml="false"/></textarea>
		</div>
	</div>
	
	<!-- 显示视频评论 -->
	<c:set var="mediaRev" value="${requestScope.mediaRlist}"/>
	<div class="row" style="height:40px;line-height:40px;margin-top:5px">
		<div class="col-md-10 text-left" style="padding-left:20px;background:#eee;">最新评论</div>
		<div class="col-md-2" style="padding-left:20px;background:#CCC;cursor:pointer;"><a href="my/admin/mediaRev?action=adminList&id=${single.id}" target="_blank">查看更多...</a></div>
	</div>
	<div class="row">
		<c:if test="${empty mediaRev}">
			<div class="text-center">该视频目前没有任何评论！</div>
		</c:if>
		<c:if test="${!empty mediaRev}">
		<c:forEach var="rsingle" items="${mediaRev}">
			<div class="text-left" style="padding-left:20px"><i class="fa fa-user"></i><u>${rsingle.mediaRAuthor}</u></div>
			<label class="col-md-2 text-right"><i class="fa fa-commenting-o"></i>评论：</label>
			<div class="col-md-10 text-left" style="word-break:break-all;padding:0px">
			<textarea class="form-control" disabled>${rsingle.mediaRContent}</textarea>
			</div>
			<div class="text-right"><i class="fa fa-clock-o" style="color:#77BDD4"></i><font color="gray">${rsingle.mediaRTime}</font></div>
			<div style="height:10px;border-bottom:1px dashed #333"></div>
		</c:forEach>
		</c:if>
	</div>
</c:if>