<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:set var="friend" value="${requestScope.friendList}"/>
<c:if test="${empty friend}"><br><div class="text-center"><h1>☆★☆ 博主目前没有添加任何好友！☆★☆</h1></div></c:if>

<c:if test="${!empty friend}"> 
	<div class="row" style="background:#eee;height:40px;line-height:40px;border-bottom:1px solid #CCC">
		<div class="col-md-5 text-left">我的所有好友</div>
 	</div>
 	<div class="row"><c:out value="${requestScope.message}" escapeXml="false"/></div>
	<table class="table table-striped">
		 <thead style="color:#DA8D1F;">
		      <tr>
		         <th>好友姓名</th>
		         <th>好友博客</th>
		         <th>访问次数</th>
		         <th>操作</th>
		      </tr>
   		</thead>
	   <tbody>
	   <c:forEach var="single" items="${friend}">
	      <tr>
	         <td><a href="my/admin/friend?action=adminSingle&id=${single.id}" title="点击查看信息" target="_blank"><c:out value="${single.userName}"/></a></td>
	     	 <td><a href="my/goBlog?master=${single.id}" target="_blank" title="点击浏览博客"><c:out value="${single.userBlogName}"/></a></td>
	     	 <td><c:out value="${single.userHitNum}"/>　次</td>
	     	 <td><a class="btn btn-danger" href="my/admin/friend?action=delete&id=${single.id}">删除</a></td>
	      </tr>
	   </c:forEach>   
	   </tbody>
	</table>
</c:if>
<style>
    .table th, .table td {
        text-align: center;
    }
</style>