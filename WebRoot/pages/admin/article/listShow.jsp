<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:set var="article" value="${requestScope.articlelist}"/>
<c:if test="${empty article}"><br><center>☆★☆ 博主暂时没有发表任何文章！☆★☆</center></c:if>
<c:if test="${!empty article}">
	<div class="row" style="background:#eee;height:40px;line-height:40px;">
 		<div class="col-md-5 text-left">【我的文章 共${requestScope.createPage.allR}篇】</div>
 	</div>
	<div class="row" style="border:1px solid #EDE7C8;">
		<div class="col-md-12">
			<c:forEach var="single" items="${article}">
				<div class="row">
					<div class="text-left" style="padding:15px"><a href="my/admin/article?action=adminSingle&id=${single.id}"><i class="fa fa-send-o"></i>&nbsp;<c:out value="${single.artTitle}" escapeXml="false"/></a></div>
				</div>
				<div class="row">
					<div class="col-md-3"><font color="gray">${single.artPubTime}</font></div>
					<div class="col-md-9 text-right">
						<a class="btn btn-info" href="my/admin/article?action=modify&id=${single.id}">【√修改】</a>
    					<a class="btn btn-danger" href="my/admin/article?action=delete&id=${single.id}">【×删除】</a>
					</div>
				</div>
				<div style="height:20px"><div style="width:96%;border-bottom:1px solid #D6E3C6;padding-bottom:10px"></div></div>
			</c:forEach>
		</div>
	</div>
   	<jsp:include page="/pages/page.jsp"/>
</c:if>