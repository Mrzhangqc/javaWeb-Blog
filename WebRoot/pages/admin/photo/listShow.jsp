<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:set var="photo" value="${requestScope.photolist}"/>
<c:if test="${empty photo}"><br><center>☆★☆ 博主暂时没有上传任何图片！☆★☆</center></c:if>
<c:if test="${!empty photo}">
	<div class="row" style="background:#eee;height:40px;line-height:40px;">
 		<div class="col-md-5 text-left">【我的相册 共 ${requestScope.createPage.allR} 张】</div>
 	</div>
 	<c:forEach var="sonlist" items="${photo}">
	 	<div class="row">
	 		<c:forEach var="single" items="${sonlist}">
	 			<c:if test="${empty single}">
					<div class="col-md-3">
					    <div class="thumbnail">
					    <img src="images/photo/null.jpg" alt="" style="height:130px;width:154px">
					      <div class="caption">
					        <p>没有图片预览</p>
					      </div>
					    </div>
					 </div>
				</c:if>
				<c:if test="${!empty single}">
					<div class="col-md-3">
					    <div class="thumbnail">
					      <a href="my/admin/photo?action=adminSingle&id=${single.id}" title="点击查看全图"><img src="images/photo/${single.photoSrc}" style="height:130px;width:154px" ></a>
					      <div class="caption">
					        <p>${single.subPhotoInfo}</p>
					        <p><a class="btn btn-danger" href="my/admin/photo?action=delete&id=${single.id}">&nbsp;删除&nbsp;</a></p>
					      </div>
					    </div>
					</div>			
				</c:if>
	 		</c:forEach>
	 	</div>
 	</c:forEach>
  	
   	<jsp:include page="/pages/page.jsp"/>
</c:if>