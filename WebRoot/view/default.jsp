<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<style>
	.toTop{
	width:45px;
	height:45px;
	position:fixed;
	bottom:50px;
	right:14px;
	background:#554A00;
	cursor:pointer;
}
.toTop:hover{
	border-radius:45px;
}
</style>
<!-- 显示近期上传视频” -->
<div class="container-fluid" style="margin-right:-15px">
<div class="row" style="border:1px solid #EDE7C8">	
	<c:set var="media" value="${requestScope.medialist}"/>
   	<div class="col-md-12">
   		<c:if test="${empty media}">
   		<div class="row" style="height:25px;width:100%;background:#FFF"></div>
   		<div class="row text-center">
   			<div class="col-md-12" style="height:50px;margin-top:30px">暂时没有上传任何视频！</div>
   		</div>
   		</c:if>
   		
   		<c:if test="${!empty media}">
 		<div class="row" style="background:#eee;height:40px;line-height:40px;border-bottom:1px solid #CCC">
 			<div class="col-md-5 text-left">我的最新影音</div>
 			<div class="col-md-7 text-right"><a rel=popover title="点击查看更多" data-content="" style="margin-top:40px;" href="my/guest/media?action=listShow"><i style="color:#000;font-size:20px" class="fa fa-expand"></i></a></div>
 		</div>
 		<div class="row" style="padding-top:10px;padding-bottom:10px">
	 		<c:forEach var="mediaBean" items="${media}">
			<div class="col-md-3" style="">
				<c:if test="${empty mediaBean}">
				<img src="images/media/null.jpg" width="100%" height="150" style="border:1 solid;border-color:white">
				<center><font color="#666"><b>没有视频预览</b></font></center>
				</c:if>
				
				<c:if test="${!empty mediaBean}">
				<a href="my/guest/media?action=singleShow&id=${mediaBean.id}" title="点击播放《${mediaBean.mediaTitle}》视频"><img src="images/media/${mediaBean.mediaPic}" width="100%" height="150" style="border:1 solid;border-color:gray"></a>
				<center><font color="#666"><b>${mediaBean.subMediaTitle}</b></font></center>
				</c:if>
			</div>	
			</c:forEach>
 		</div>
 		</c:if>
   	</div>
</div>

<!-- 显示我的最新文章 -->
<div class="row" style="border:1px solid #EDE7C8; margin-top:10px" >
	<c:set var="article" value="${requestScope.articlelist}"/>
	<div class="col-md-12">
		<c:if test="${empty article}">
   		<div class="row" style="height:25px;width:100%;background:#FFF">我的最新文章</div>
   		<div class="row text-center">
   			<div class="col-md-12" style="height:180px;margin-top:30px">暂时没有发表任何文章！</div>
   		</div>
   		</c:if>
   		
   		<c:if test="${!empty article}">
		<div class="row" style="background:#eee;height:40px;line-height:40px;border-bottom:1px solid #CCC">
 			<div class="col-md-5 text-left">我的最新文章</div>
 			<div class="col-md-7 text-right"><a rel=popover title="点击查看更多" data-content=""  style="margin-top:40px;"  href="my/guest/article?action=listShow"><i style="color:#000;font-size:20px" class="fa fa-expand"></i></a></div>
 		</div>
		<c:forEach var="articleBean" items="${article}">
		<div class="row text-left" style="height:30px;padding-left:15px"><b><a href="my/guest/article?action=singleShow&id=${articleBean.id}"><i class="fa fa-send-o"></i>&nbsp;<font color="#4E6900"><c:out value="${articleBean.artTitle}" escapeXml="false"/></font></a></b></div>
		<div class="row text-left" style="height:150px;padding-left:15px;border-bottom:1px dashed #666"><font color="#595959"><c:out value="${articleBean.artCutContent}" escapeXml="false"/></font></div>
		<div class="row">
			<div  class="col-md-3 text-center" ><a href="my/guest/article?action=singleShow&id=${articleBean.id}">阅读全文</a></div>
			<div class="col-md-9 text-center"><i class="fa fa-eye">&nbsp;</i>浏览：(<font style="color:#989B08">${articleBean.artCount}</font>)&nbsp;&nbsp; <i class="fa fa-comment-o">&nbsp;</i>评论：(<font style="color:#989B08">${articleBean.revCount}</font>)&nbsp;&nbsp;<i style="color:#7ED0EC" class="fa fa-clock-o">&nbsp;</i>${articleBean.artPubTime}</div>
		</div>
 		<div style="height:20px"><div style="width:96%;border-bottom:1px solid #D6E3C6;padding-bottom:10px"></div></div>
		</c:forEach>
	</c:if>  		
	</div>
</div>

<!-- 显示最新上传的图片 -->
<div class="row" style="border:1px solid #EDE7C8; margin-top:10px">
	<c:set var="photo" value="${requestScope.photolist}"/>
	<div class="col-md-12">
		<c:if test="${empty photo}">
		<div class="row" style="height:25px;width:100%;background:#FFF">我的相册</div>
   		<div class="row text-center">
   			<div class="col-md-12" style="height:180px;margin-top:30px">暂时没有上传图片！</div>
   		</div>
		</c:if>
	
		<c:if test="${!empty photo}">
 		<div class="row" style="background:#eee;height:40px;line-height:40px;border-bottom:1px solid #CCC">
 			<div class="col-md-5 text-left">我的相册</div>
 			<div class="col-md-7 text-right"><a rel=popover title="点击查看更多" data-content="" style="margin-top:40px;"  href="my/guest/photo?action=listShow"><i style="color:#000;font-size:20px" class="fa fa-expand"></i></a></div>
 		</div>
 		<div class="row" style="">
	 		<c:forEach var="photoBean" items="${photo}">
			<div class="col-md-3" style="padding-top:10px;padding-bottom:10px">
				<c:if test="${empty photoBean}">
				<img src="images/photo/null.jpg" width="100%" height="150" style="border:1 solid;border-color:white">
				<center><font color="#666"><b>没有图片预览</b></font></center>
				</c:if>
				
				<c:if test="${!empty photoBean}">
				<div style="background:#CCC;padding-bottom:10px">
				<img title="${photoBean.subPhotoInfo}" src="images/photo/${photoBean.photoSrc}" width="100%" height="150" style="border:1 solid;border-color:gray">
				<h4><font color="#666" >${photoBean.subPhotoInfo}</font></h4>
				<br/>
				<a href="my/guest/photo?action=singleShow&id=${photoBean.id}" class="btn btn-default">details</a>
				</div>
				</c:if>
			</div>	
			</c:forEach>
 		</div>
 		</c:if>
	</div>
</div>
<div class="toTop" title="回到顶端"><i style="font-size:42px;color:#FFF" class="fa fa-angle-up"></i></div>
</div>
<script>
	$(document).ready(function(){
			$(window).scroll(function(){
				if($(window).scrollTop()>300){
					$(".toTop").show();
				}else{$(".toTop").hide();}
			});
			$(".toTop").click(function(){
				$('html,body').animate({scrollTop:(0)},1000);
			});
		});
</script>

