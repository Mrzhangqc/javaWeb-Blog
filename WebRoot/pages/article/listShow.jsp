<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:set var="article" value="${requestScope.articlelist}"/>
<c:if test="${empty article}"><br><center>☆★☆ 博主暂时没有发表任何文章！☆★☆</center></c:if>
<c:if test="${!empty article}">
<div class="container-fluid" style="padding-right:1px">
	<div class="row" style="background:#eee;height:40px;line-height:40px;">
 		<div class="col-md-5 text-left">【我的文章 共${requestScope.createPage.allR}篇】</div>
 	</div>
 	<div class="row" style="border:1px solid #EDE7C8;">
		<div class="col-md-12">
			<c:forEach var="single" items="${article}">
				<div class="row text-left" style="height:30px;padding-left:15px"><b><a href="my/guest/article?action=singleShow&id=${single.id}"><i class="fa fa-send-o"></i>&nbsp;<font color="#4E6900"><c:out value="${single.artTitle}" escapeXml="false"/></font></a></b></div>
				<div class="row text-left" style="height:100px;padding-left:20px;"><font color="#595959"><c:out value="${single.artCutContent}" escapeXml="false"/></font></div>
				<div class="row">
					<div  class="col-md-3 text-center" ><a href="my/guest/article?action=singleShow&id=${single.id}">阅读全文</a></div>
					<div class="col-md-9 text-center"><i class="fa fa-eye">&nbsp;</i>浏览：(<font style="color:#989B08">${single.artCount}</font>)&nbsp;&nbsp; <i class="fa fa-comment-o">&nbsp;</i>评论：(<font style="color:#989B08">${single.revCount}</font>)&nbsp;&nbsp;<i style="color:#7ED0EC" class="fa fa-clock-o">&nbsp;</i>${single.artPubTime}</div>
				</div>
				<div style="height:20px"><div style="width:100%;border-bottom:1px dashed #666;padding-bottom:10px"></div></div>
			</c:forEach>
		</div>
	</div> 	
</div>
<jsp:include page="/pages/page.jsp"/>
</c:if>