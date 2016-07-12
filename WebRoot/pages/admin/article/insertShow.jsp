<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<script type="text/javascript" src="js/inputCheck.js"></script>
<!-- 发表文章页面 -->
	<form action="my/admin/article" method="post" class="form-horizontal" >
	<input type="hidden" name="action" value="insert">
	<input type="hidden" name="type" value="add">
	<div class="row" style="background:#eee;height:40px;line-height:40px;">
 	<div class="col-md-5 text-left">【发表文章】</div>
	</div>
	<div class="form-group">
		<div><c:out value="${requestScope.message}" escapeXml="false"/></div></br>
	</div>
	<div class="form-group">
    	<label  class="col-sm-2 control-label">文章标题：</label>
    	<div class="col-sm-10">
      		<input type="text" class="form-control" name="title" value="${param.title}">
   		</div>
   </div>
	<div class="form-group">
    	<label class="col-sm-2 control-label"></label>
    	<div class="col-sm-10 text-right">
			<font color="#7F7F7F">
					写入：<input type="text" name="use" value="0" size="4" disabled style="text-align:center;border:0;"> 个&nbsp;&nbsp;
					剩余：<input type="text" name="rem" value="1000" size="4" disabled style="text-align:center;border:0;"> 个&nbsp;
			</font>
    	</div>
   </div>
   <div class="form-group">
   		<label class="col-sm-2 control-label">文章内容：</label>
   		<div class="col-md-10">
   			<textarea name="content" class="form-control" rows="20" onfocus="check(content,use,rem,1000)" onkeydown="check(content,use,rem,1000)" onkeyup="check(content,use,rem,1000)">${single.initArtContent}</textarea>
   		</div>
   </div>
    <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <input type="submit" class="btn btn-default" value="提交">
      <input type="reset" class="btn btn-default" value="重置">
    </div>
  </div>
</form>	