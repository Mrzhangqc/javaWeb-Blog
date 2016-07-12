<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="col-md-12">
	<div class="panel panel-primary" style="margin-top:10px">
		<div class="panel-heading"><div class="text-left"><i class="fa fa-cog fa-spin"></i>文章管理</div></div>
    	<div class="panel-body">
    		<div class="text-left" style="font-size:16px"><i class="fa fa-desktop" style="color:#4483BB"></i><a href="my/admin/article?action=adminList">&nbsp;浏览文章</a></div>
    		<div class="text-left" style="font-size:16px;padding-left:47px;"><i class="fa fa-angle-double-right" style="color:#4483BB"></i><a href="my/admin/article?action=insert">&nbsp;发表文章</a></div>
    	</div>
	</div>
	
	<div class="panel panel-success" style="margin-top:-17px">
		<div class="panel-heading"><div class="text-left"><i class="fa fa-cog fa-spin"></i>相册管理</div></div>
   	 	<div class="panel-body">
   	 		<div class="text-left" style="font-size:16px"><i class="fa fa-desktop" style="color:#4c7f48"></i><a href="my/admin/photo?action=adminList">&nbsp;浏览相册</a></div>
    		<div class="text-left" style="font-size:16px;padding-left:47px;"><i class="fa fa-angle-double-right" style="color:#4c7f48"></i><a href="my/admin/photo?action=insert">&nbsp;上传图片</a></div>
   	 	 </div>
	</div>
	
	<div class="panel panel-info" style="margin-top:-17px">
		<div class="panel-heading"><div class="text-left"><i class="fa fa-cog fa-spin"></i>影音管理</div></div>
    	<div class="panel-body">
    		<div class="text-left" style="font-size:16px"><i class="fa fa-desktop" style="color:#437a93"></i><a href="my/admin/media?action=adminList">&nbsp;浏览影音</a></div>
    		<div class="text-left" style="font-size:16px;padding-left:47px;"><i class="fa fa-angle-double-right" style="color:#437a93"></i><a href="my/admin/media?action=insert">&nbsp;上传影音</a></div>
    	 </div>
	</div>
	
	<div class="panel panel-warning" style="margin-top:-17px">
		<div class="panel-heading"><div class="text-left"><i class="fa fa-cog fa-spin"></i>推荐文章</div></div>
    	<div class="panel-body">
    		<div class="text-left" style="font-size:16px"><i class="fa fa-desktop" style="color:#937748"></i><a href="my/admin/elect?action=adminList">&nbsp;浏览推荐文章</a></div>
    		<div class="text-left" style="font-size:16px;padding-left:47px;"><i class="fa fa-angle-double-right" style="color:#937748"></i><a href="my/admin/elect?action=insert">&nbsp;添加推荐文章</a></div>
    	 </div>
	</div>
	
	<div class="panel panel-danger" style="margin-top:-17px">
		<div class="panel-heading"><div class="text-left"><i class="fa fa-cog fa-spin"></i>好友管理</div></div>
    	<div class="panel-body">
			<div class="text-left" style="font-size:16px"><i class="fa fa-desktop" style="color:#ab4c3f"></i><a href="my/admin/friend?action=adminList">&nbsp;浏览好友</a></div>
		 </div>
	</div>
	
	<div class="panel panel-success" style="margin-top:-17px">
		<div class="panel-heading"><div class="text-left"><i class="fa fa-cog fa-spin"></i>友情链接</div></div>
   	 	<div class="panel-body">
   	 		<div class="text-left" style="font-size:16px"><i class="fa fa-desktop" style="color:#4a7d43"></i><a href="my/admin/link?action=adminList">&nbsp;浏览友情链接</a></div>
    		<div class="text-left" style="font-size:16px;padding-left:47px;"><i class="fa fa-angle-double-right" style="color:#4a7d43"></i><a href="my/admin/link?action=insert">&nbsp;添加友情链接</a></div>
   	 	</div>
	</div>
</div>
