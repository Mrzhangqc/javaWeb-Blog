<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!-- 实现上传影音界面 -->
<form action="my/admin/media?action=insert&type=upload" method="post" enctype="multipart/form-data">
<div class="row" style="background:#eee;height:40px;line-height:40px;">
 	<div class="col-md-5 text-left">【上传视频】</div>
</div>
<table border="0" width="90%" style="margin-top:10;margin-left:30" cellpadding="0" cellspacing="0" bordercolor="#4E6900" bordercolordark="white" bordercolorlight="#4E6900" rules="none">
	<tr height="30"><td colspan="2"><c:out value="${requestScope.message}" escapeXml="false"/></td></tr>
	<tr height="50">
		<td width="20%" align="center">选择视频：</td>
		<td>
		<div class="btn btn-info" style="height:30px;line-height:30px;">
			<i class="fa fa-video-camera" style="color:#FFF;margin-top:2px;margin-left:0px">&nbsp;&nbsp;选择...</i>
			<input type="file" name="mymedia" style="width:80px;margin-top:-26px;opacity:0">
		</div>
		</td>
	</tr>
	<tr height="50">
		<td align="center">视频标题：</td>
		<td><input class="form-control" type="text" name="title" size="70"></td>
	</tr>
	<tr height="50">
		<td align="center">视频描述：</td>
		<td><input class="form-control" type="text" name="info" size="70"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input class="btn btn-warning" type="submit" value="上传视频">
			<input class="btn btn-danger"  type="reset"  value="重新选择">
		</td>
	</tr>
</table>
</form>