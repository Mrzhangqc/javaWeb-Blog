<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>


<!--博主信息-->
<c:set var="master" value="${sessionScope.callBlogMaster}"/>
<div class="row text-center leftT box_shadow">
	<span>个人形象</span>
	<div class="Hcontainer"><img src="images/ico/${master.userIco}"></div>
	<a style="margin:6px 0;" class="btn btn-default" href="my/admin/friend?action=insert" ><i class="fa fa-user-plus"></i>【加为好友】</a>
    <a class="btn btn-default" href="my/guest/word?action=linkTo"><i class="fa fa-envelope-o"></i>【给我留言】</a>
</div>

<!--活动地带-->
<div class="row"><span>活动地带</span></div>
<div class="row box_shadow" >
	<div class="col-md-6">
		<div class="list-group">
		  <a href="pages/myInfo.jsp" target="_blank" class="list-group-item list-group-item-success"><i class="fa fa-file-word-o"></i>&nbsp;个人资料</a>
		  <a href="my/guest/article?action=listShow" class="list-group-item list-group-item-info"><i class="fa fa-file-text-o"></i>&nbsp;我的文章</a>
		  <a href="my/guest/media?action=listShow" class="list-group-item list-group-item-warning"><i class="fa fa-film"></i>&nbsp;我的影音</a>
		</div>
	</div>
	<div class="col-md-6">
		<div class="list-group">
		  <a href="my/logon?goWhere=adminTemp" class="list-group-item list-group-item-success"><i class="fa fa-cogs"></i>&nbsp;管理博客</a>
		  <a href="my/guest/photo?action=listShow" class="list-group-item list-group-item-info"><i class="fa fa-picture-o"></i>&nbsp;我的相册</a>
		  <a href="my/guest/word?action=linkTo" class="list-group-item list-group-item-warning"><i class="fa fa-envelope-o"></i>&nbsp;给我留言</a>
		</div>
	</div>
</div>

<!-- 文章推荐 -->
<c:set var="elect" value="${sessionScope.electlist}"/>
<div class="row"><span>文章推荐</span></div>
<div class="row box_shadow" style="height:240px;">
	<div class="col-md-12" style="margin-top:20px">
		<c:if test="${empty elect}">
		<div class="text-center">没有推荐文章!</div>
		</c:if>
		
		<c:if test="${!empty elect}">
		<c:forEach var="esingle" items="${elect}">
		<div class="text-left" style="word-break:break-all"><a href="${esingle.electSrc}"><c:out value="${esingle.electTitle}" escapeXml="true"/></a></div>
		</c:forEach>
	</c:if>
	</div>
</div>

 <!--好友博客 -->
<c:set var="friend" value="${sessionScope.friendlist}"/>
<div class="row"><span>好友博客</span></div>
<div class="row box_shadow" style="height:240px;">
	<div class="col-md-12" >
		<div class="text-right" style="font-size:20px"><a href="my/guest/friend?action=listShow" target="_blank">更多</a></div>
		<c:if test="${empty friend}">
   		<div class="text-center">博主目前没有添加任何好友！</div>
   		</c:if>
   		
   		<c:if test="${!empty friend}">
   		<c:forEach var="fsingle" items="${friend}">
   		<div class="text-left">
   		<a href="my/goBlog?master=${fsingle.id}" title="${fsingle.userName}"><c:out value="${fsingle.cutUserBlogName}" escapeXml="true"/></a>
   		</div>
   		</c:forEach>
   		</c:if>
	</div>
</div>

<!-- 友情链接  -->
<c:set var="link" value="${sessionScope.linklist}"/>
<div class="row"><span>友情链接</span></div>
<div class="row box_shadow" style="height:150px;">
	<div class="col-md-12">
		<c:if test="${empty link}">
		<div class="text-center" style="padding-top:20px">没有友情链接！</div>
		</c:if>
	
		<c:if test="${!empty link}">
		<div class="row">
		<c:forEach var="lsingle" items="${link}">
		<div class="col-md-4 text-center" style=""><a class="_btn" href="${lsingle.linkSrc}"><c:out value="${lsingle.cutLinkTitle}" escapeXml="true"/></a></div>
		</c:forEach>
		</div>
		</c:if>
	</div>
</div>

<!--博客访问排行榜  -->
<c:set var="top" value="${sessionScope.toplist}"/>
<div class="row"><span>博客访问排行榜</span></div>
<div class="row box_shadow" style="height:200px;">
	<div class="col-md-12">
		<div class="text-left">排行榜</div>	
		<div class="text-right" style="margin-top:-20px">前10名</div>	
		
		<c:if test="${!empty top}">
		<c:forEach var="tsingle" items="${top}">
		<div style="padding-top:5px">
			<div class="text-left"><a href="my/goBlog?master=${tsingle.id}"><i class="fa fa-user"></i>&nbsp;<c:out value="${tsingle.userName}" escapeXml="true"/></a></div>
			<div class="text-right" style="margin-top:-20px"><c:out value="${tsingle.userHitNum}"/> 次&nbsp;</div>
		</div>
		</c:forEach>
		</c:if>
	</div>
</div>
<style>
.box_shadow{
 	box-shadow:0 0 6px #333;  
}
._btn{
	display:inline-block;
	border:1px solid #CCC;
	border-radius:5px;
	width:100px;
	height:40px;
	line-height:40px;
	background-color:#5bc0de;
	margin:10px;
	color:#FFF;
}
._btn:hover{
	background:#337ab7;
	color:#FFF;
	border:1px solid #5bc0de;
}
.box_shadow .row a{
	text-decoration:none;
}
</style>