<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="js/inputCheck.js"></script>

<c:set var="single" value="${requestScope.mediasingle}"/>
<c:if test="${empty single}"><br><center>☆★☆ 对不起，播放视频失败！☆★☆</center></c:if>
<c:if test="${!empty single}">       	
	<!-- 显示视频信息，并播放视频 -->
	<div class="container-fluid" style="padding-right:1px;">
		<div class="row" style="background:#eee;height:40px;line-height:40px;">
		<div class="text-left" style="padding-left:20px">正在播放视频：<c:out value="${single.mediaTitle}" escapeXml="false"/></div>
		</div>
		<div class="media">
			<video controls=controls  loop =loop>
				 <source src="<%=basePath%>/pages/media/videos/${single.mediaSrc}"></source>
			</video>
		</div>
		<div class="row" style="background:#eee;height:40px;line-height:40px;">
			<div class="text-left"  style="padding-left:20px">视频信息</div>
		</div>
		<div class="row">
			<div class="text-left" style="padding-left:25px;word-break:break-all;">
				<div class="col-md-4">观看：<c:out value="${single.lookCount}"/> 次</div>
				<div class="col-md-4">评论：<c:out value="${single.reviCount}"/> 条</div>
				<div class="col-md-4">上传时间：<c:out value="${single.mediaUptime}"/></div>
			</div>
		</div>
		<div class="row" style="margin-top:5px">
			<label class="col-md-2 text-right">视频介绍：</label>
			<div class="col-md-10 text-left" style="word-break:break-all;padding:0px">
				<textarea class="form-control" disabled><c:out value="${single.mediaInfo}" escapeXml="false"/></textarea>
			</div>
		</div>
		
		<!-- 显示视频评论 -->
		<c:set var="mediaRev" value="${requestScope.mediaRlist}"/>
		<div class="row" style="height:40px;line-height:40px;margin-top:5px">
			<div class="col-md-10 text-left" style="padding-left:20px;background:#eee;">最新评论</div>
			<div class="col-md-2" style="padding-left:20px;background:#CCC;cursor:pointer;"><a href="my/admin/mediaRev?action=adminList&id=${single.id}" target="_blank">查看更多...</a></div>
		</div>
		<div class="row">
			<c:if test="${empty mediaRev}">
				<div class="text-center">该视频目前没有任何评论！</div>
			</c:if>
			<c:if test="${!empty mediaRev}">
			<c:forEach var="rsingle" items="${mediaRev}">
				<div class="text-left" style="padding-left:20px"><i class="fa fa-user"></i><u>${rsingle.mediaRAuthor}</u></div>
				<label class="col-md-2 text-right"><i class="fa fa-commenting-o"></i>评论：</label>
				<div class="col-md-10 text-left" style="word-break:break-all;padding:0px">
				<textarea class="form-control" disabled>${rsingle.mediaRContent}</textarea>
				</div>
				<div class="text-right"><i class="fa fa-clock-o" style="color:#77BDD4"></i><font color="gray">${rsingle.mediaRTime}</font></div>
				<div style="height:10px;border-bottom:1px dashed #333"></div>
			</c:forEach>
			</c:if>
		</div>
		<table border="0" width="98%" height="30" cellpadding="0" cellspacing="0" style="margin-top:3;margin-left:25" rules="none">
		<tr valign="bottom">
			<td>评论请先<a href="pages/userLogon.jsp" target="_blank">【登录】</a>，您也可以选中 <b>匿名评论</b> 无需登录进行留言！</td>
			<td align="center"><c:out value="${requestScope.message}" escapeXml="false"/></td>			
		</tr>
		</table>
		<!-- 实现发表评论界面 -->
		<form action="my/admin/mediaRev" method="post">
		<input type="hidden" name="action" value="review">
		<input type="hidden" name="rootId" value="${single.id}">
			<table border="" width="98%" style="margin-left:25;word-break:break-all" cellpadding="0" cellspacing="0" bordercolor="#d6e3c6" bordercolordark="white" bordercolorlight="#4E6900" rules="rows">
			<tr height="35" bgcolor="#F0F0F0">
				<td bgcolor="#EEE" style="text-indent:25;">【我要评论】</td>
				<td bgcolor="#CCC" width="18%" align="center">匿名评论：<input type="checkbox" name="noname" value="true"></td>
			</tr>
			<tr height="35" valign="bottom">
				<td colspan="2"  style="text-indent:34;">
					<font color="#7F7F7F">
						写入：<input type="text" name="use" value="0" size="4" disabled style="text-align:center;border:0;"> 个&nbsp;&nbsp;
						剩余：<input type="text" name="rem" value="1000" size="4" disabled style="text-align:center;border:0;"> 个 
					</font>
				</td>
			</tr>
			<tr><td colspan="2" align="center"><textarea class="form-control" name="mediaRContent" rows="10" cols="85" onkeydown="check(mediaRContent,use,rem,1000)" onkeyup="check(mediaRContent,use,rem,1000)" placeholder="输入评论内容..."></textarea></tr>	 		
		</table>
		<div class="row" style="padding:5px 0">
			<input class="btn btn-default" type="submit" value="提交评论">
			<input class="btn btn-default" type="reset" value="重新填写">
		</div>
		</form>
	</div>
</c:if>