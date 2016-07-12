<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:set var="photo" value="${requestScope.photolist}"/>
<c:if test="${empty photo}"><br><div class="text-center"><h1>☆★☆ 博主暂时没有上传任何图片！☆★☆</h1></div></c:if>
<c:if test="${!empty photo}">
<div class="container-fluid" style="padding-right:1px;">
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
					      <a href="my/guest/photo?action=singleShow&id=${single.id}" title="点击查看全图"><img src="images/photo/${single.photoSrc}" style="height:130px;width:154px" ></a>
					      <div class="caption">
					        <p>${single.subPhotoInfo}</p>
					      </div>
					    </div>
					</div>			
				</c:if>
	 		</c:forEach>
	 	</div>
 	</c:forEach>
</div>
   	<jsp:include page="/pages/page.jsp"/>
</c:if>