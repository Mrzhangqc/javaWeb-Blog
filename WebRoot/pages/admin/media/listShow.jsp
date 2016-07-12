<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:set var="media" value="${requestScope.medialist}"/>
<c:if test="${empty media}"><br><div class="text-center">☆★☆ 博主暂时没有上传任何视频！☆★☆</div></c:if>
<c:if test="${!empty media}">
	<div class="row" style="background:#eee;height:40px;line-height:40px;">
 		<div class="col-md-5 text-left">【我的影音 共 ${requestScope.createPage.allR} 个】</div>
 	</div>
  	<c:forEach var="sonlist" items="${media}">
  		<div class="row">
  			<c:forEach var="single" items="${sonlist}">
	 			<c:if test="${empty single}">
					<div class="col-md-3">
					    <div class="thumbnail">
					    <img src="images/media/null.jpg" alt="" style="height:130px;width:154px">
					      <div class="caption">
					        <p>没视频预览</p>
					      </div>
					    </div>
					 </div>
				</c:if>
				<c:if test="${!empty single}">
					<div class="col-md-3">
					    <div class="thumbnail">
					      <div title="[${single.mediaTitle}]"><img src="images/media/${single.mediaPic}" style="height:130px;width:154px" ></div>
					      <div class="caption text-left" style="text-indent:25">
					        <div>观看：${single.lookCount}次</div>
					        <div>评论：${single.reviCount}条</div>
					        <div>标题：${single.subMediaTitle}</div>
					      </div>
					      <a class="btn btn-danger" href="my/admin/media?action=delete&id=${single.id}">删除</a>
					      <a class="btn btn-info" href="my/admin/media?action=adminSingle&id=${single.id}">播放</a>
					    </div>
					</div>
				</c:if>
			</c:forEach>
  		</div> 	
  	</c:forEach>
   	<jsp:include page="/pages/page.jsp"/>
</c:if>