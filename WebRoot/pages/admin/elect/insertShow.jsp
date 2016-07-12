<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!-- 显示添加推荐文章界面 -->
<form action="my/admin/elect" method="post">
	<input type="hidden" name="action" value="insert">
	<input type="hidden" name="type" value="add">
	<div class="row" style="background:#eee;height:40px;line-height:40px;border-bottom:1px solid #CCC">
		<div class="col-md-5 text-left">【添加推荐文章】</div>
 	</div>
	<div class="row"><c:out value="${requestScope.message}" escapeXml="false"/></div>
	<div class="row" style="margin-top:10px">
		<label class="col-md-2 control-label">文章标题：</label>
		<div class="col-md-10"><input class="form-control" type="text" name="title" value="${param.title}"></div>
	</div>
	<div class="row" style="margin-top:10px">
		<label class="col-md-2 control-label">文章地址：</label>
		<div class="col-md-10"><input class="form-control" type="text" name="src" value="${param.src}"></div>
	</div>
	<div class="row" style="margin-top:10px">
		<input class="btn btn-warning" type="submit" value="添加">
		<input class="btn btn-info" type="reset" value="重置">
	</div>
</form>