<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<script type="text/javascript" src="js/inputCheck.js"></script>

<c:set var="single" value="${requestScope.articlesingle}"/>
<c:if test="${empty single}"><br><div class="text-center"><h1>☆★☆ 对不起，阅读文章失败！☆★☆</h1></div></c:if>
<c:if test="${!empty single}">   
<div class="container-fluid" style="padding-right:1px;">  	
	<!-- 显示文章详细内容 -->
	<div class="row" style="background:#eee;height:40px;line-height:40px;">
 		<div class="col-md-5 text-left">【文章内容】</div>
 	</div>
	<div class="row">
		<div  class="col-md-3" ></div>
		<div class="col-md-9 text-center"><i class="fa fa-eye">&nbsp;</i>浏览：(<font style="color:#989B08">${single.artCount}</font>)&nbsp;&nbsp; <i class="fa fa-comment-o">&nbsp;</i>评论：(<font style="color:#989B08">${single.revCount}</font>)&nbsp;&nbsp;<i style="color:#7ED0EC" class="fa fa-clock-o">&nbsp;</i>${single.artPubTime}</div>
	</div>
	<div class="row text-left" style="height:30px;padding-left:15px"><b><i class="fa fa-send-o"></i>&nbsp;<font color="#4E6900"><c:out value="${single.artTitle}" escapeXml="false"/></font></b></div>
	<div class="row text-left" style="height:100px;padding-left:20px;"><font color="#595959"><c:out value="${single.artCutContent}" escapeXml="false"/></font></div>
	<div class="row text-right" style="border-bottom:1px solid #CCC">【文章结束】</div>     	
	<!-- 显示文章评论 -->
	<c:set var="artReview" value="${requestScope.artrlist}"/>
	<div class="row" style="background:#eee;height:40px;line-height:40px;margin-top:10px">
 		<div class="col-md-10 text-left">【最新评论】</div>
 		<div class="col-md-2 text-center" style="background:#CCC"><a href="my/guest/artReview?action=listShow&id=${single.id}" target="_blank" title="点击查看更多">查看更多...</a></div>
 	</div>
	<c:if test="${empty artReview}"><div class="text-center">该文章目前没有任何评论！</div></c:if>
		<c:if test="${!empty artReview}">
		<c:forEach var="rsingle" items="${artReview}">
		<div class="row text-left" style="padding-left:20px"><i class="fa fa-user">&nbsp;</i><u>${rsingle.artRAuthor}</u></div>
		<div class="row text-left" style="padding-left:20px"><i class="fa fa-commenting-o">&nbsp;</i><font color="#595959">${rsingle.artRContent}</font></div>
		<div class="row text-right"><i class="fa fa-clock-o" style="color:#5bc0de">&nbsp;</i><font color="gray">${rsingle.artRTime}</font></div>
		<div style="height:10px;border-bottom:1px dashed #CCC;"></div>
		</c:forEach>
	</c:if>
	<!--实现发表评论界面 -->
	<form action="my/admin/artReview" method="post">
	<input type="hidden" name="action" value="review">
	<input type="hidden" name="rootId" value="${single.id}">
	<table width="100%" style="word-break:break-all;margin-top:10px" cellpadding="0" cellspacing="0" bordercolor="#d6e3c6" bordercolordark="white" bordercolorlight="#4E6900" rules="rows">
		<tr height="35" bgcolor="#F0F0F0">
			<td bgcolor="#eee" style="text-indent:25;">发表评论</td>
			<td bgcolor="#CCC" width="18%" align="center">匿名发表：<input type="checkbox" name="noname" value="true"></td>
		</tr>
		<tr height="35" valign="bottom">
			<td colspan="2"  style="text-indent:34;">
				<font color="#7F7F7F">
					写入：<input type="text" name="use" value="0" size="4" disabled style="text-align:center;border:0;"> 个&nbsp;&nbsp;
					剩余：<input type="text" name="rem" value="1000" size="4" disabled style="text-align:center;border:0;"> 个 
					评论请先<a href="pages/userLogon.jsp" target="_blank">【登录】，</a>您也可以选中 <b>匿名发表</b> 无需登录进行发表！
				</font>
			</td>
		</tr>
		<tr><td colspan="2" align="center"><textarea class="form-control" name="artRContent" rows="10" cols="85" onkeydown="check(artRContent,use,rem,1000)" onkeyup="check(artRContent,use,rem,1000)" placeholder="输入评论内容..."></textarea></tr>	 		
	</table>
	<div class="row" style="padding:5px 0">
		<input class="btn btn-default" type="submit" value="提交留言">
		<input class="btn btn-default" type="reset" value="重新填写">
	</div>	     
	</form>
</div>  
</c:if>