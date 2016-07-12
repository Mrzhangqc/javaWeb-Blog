<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:set var="single" value="${requestScope.articlesingle}"/>
<c:if test="${empty single}"><br><li>对不起，阅读文章失败！</li></c:if>
<c:if test="${!empty single}">       	
	<!-- 显示文章详细内容 -->
	<table border="0" width="88%" style="margin-top:5;margin-left:25;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none">
		<tr height="40" style="color:#777"><td align="right"><i class="fa fa-eye">&nbsp;</i>浏览：(<font style="color:#989B08">${single.artCount}</font>)&nbsp;&nbsp; <i class="fa fa-comment-o">&nbsp;</i>评论：(<font style="color:#989B08">${single.revCount}</font>)&nbsp;&nbsp;<i style="color:#7ED0EC" class="fa fa-clock-o">&nbsp;</i>${single.artPubTime}</td></tr>       				
		<tr>
			<td align="right">
				<c:out value="${requestScope.message}" escapeXml="false"/>
				<a class="btn btn-info" href="my/admin/article?action=modify&id=${single.id}">修改文章</a>
				<a class="btn btn-danger" href="my/admin/article?action=delete&id=${single.id}">删除文章</a>
				<a class="btn btn-info" href="my/admin/artReview?action=adminList&id=${single.id}" target="_blank">查看评论</a>
			</td>
		</tr>
		<tr height="50"><td><b><font color="#4E6900" size="4"><c:out value="${single.artTitle}" escapeXml="false"/></font></b></td></tr>
		<tr height="100"><td valign="top"><font color="#595959"><c:out value="${single.artContent}" escapeXml="false"/></font></td></tr>
		<tr><td><hr></td></tr>
	</table>
	<!-- 显示文章最新评论 -->
	<c:set var="artReview" value="${requestScope.artrlist}"/>
	<table border="0" width="88%" style="margin-top:5;margin-left:25;word-break:break-all" cellpadding="0" cellspacing="0"  bordercolordark="white" bordercolorlight="#4E6900" rules="all">
		<tr height="34" bgcolor="#5bc0de">
			<td width="675" style="padding-left:30" >最新评论</td>
			<td width="110" align="right" ><a style="color:#FFF" href="my/admin/artReview?action=adminList&id=${single.id}" target="_blank">查看更多...</a></td>
		</tr>
		<c:if test="${empty artReview}"><tr height="100"><td align="center" colspan="2"><li>该文章目前没有任何评论！</li></td></tr></c:if>
		<c:if test="${!empty artReview}">
		<c:forEach var="rsingle" items="${artReview}">
		<tr height="30" style="color:#666"><td colspan="2"><i class="fa fa-user">&nbsp;</i><u>${rsingle.artRAuthor}</u></td></tr>
		<tr><td colspan="2" align="right"><i style="color:#7ED0EC" class="fa fa-clock-o"></i><font color="gray">${rsingle.artRTime}</font></td></tr>
		<tr><td colspan="2" valign="top">${rsingle.artRContent}</td></tr>
	
		</c:forEach>
		</c:if>
	</table>		
</c:if>