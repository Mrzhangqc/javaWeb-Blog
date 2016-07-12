<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<script type="text/javascript" src="js/inputCheck.js"></script>

<c:set var="single" value="${requestScope.articlesingle}"/>
<c:if test="${empty single}"><br><li>对不起，阅读文章失败！</li></c:if>
<c:if test="${!empty single}">       	
	<!-- 显示文章详细内容 -->
	<form action="my/admin/article" method="post" class="form-horizontal" >
	<input type="hidden" name="id" value="${single.id}">
	<input type="hidden" name="action" value="modify">
	<input type="hidden" name="type" value="update">
	<div class="form-group">
		<div><c:out value="${requestScope.message}" escapeXml="false"/></div></br>
   		<div class="col-md-12 text-right">
     		<div>阅读：${single.artCount} 次 | 评论：${single.revCount} 条 | 发表于：${single.artPubTime}&nbsp;</div>
   		</div>
	</div>
	<div class="form-group">
    	<label  class="col-sm-2 control-label">文章标题：</label>
    	<div class="col-sm-10">
      		<input type="text" class="form-control" name="title" value="${single.artTitle}">
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
      <input type="submit" class="btn btn-default" value="提交修改">
      <input type="reset" class="btn btn-default" value="重新填写">
    </div>
  </div>
</form>	
</c:if>