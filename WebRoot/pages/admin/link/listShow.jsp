<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:set var="link" value="${requestScope.linklist}"/>
<c:if test="${empty link}"><div class="text-center"><h1>☆★☆ 博主暂时没有任何友情链接！☆★☆</h1></div></c:if>
<c:if test="${!empty link}">
	<div class="row" style="background:#eee;height:40px;line-height:40px;border-bottom:1px solid #CCC">
		<div class="col-md-5 text-left">【友情链接】</div>
 	</div>
 	<c:forEach var="single" items="${link}">
 		<div class="row"><label class="col-md-2 text-right">标题：</label><div class="col-md-8 text-left"><c:out value="${single.linkTitle}" escapeXml="false"/></div></div>
 		<div class="row"><label class="col-md-2 text-right">地址：</label><div class="col-md-8 text-left"><a href="${single.linkSrc}" target="_blank">${single.linkSrc}</a></div></div>
		<div class="row"><div class="col-md-12 text-left" style="padding-left:75px"><i class="fa fa-clock-o" style="color:#5bc0de">&nbsp;</i>${single.linkTime}</div></div>
		<div class="row text-right"><div class="col-md-12 text-right"><a class="btn btn-danger" href="my/admin/link?action=delete&id=${single.id}">删除</a></div></div>
		<div style="height:5px;border-bottom:1px solid #CCC"></div>
	</c:forEach>
</c:if>