<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
	<head>
		<title>首页</title>
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<script src="js/jquery-1.11.0.min.js"></script>
		<link rel="icon" href="images/icon.ico" type="image/x-icon" />
		<link rel='stylesheet' href="css/bootstrap.css" />
		<script src="js/popover.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<link rel='stylesheet' href="css/style.css" />
		<link rel="stylesheet" href="css/swipebox.css">
		<link rel="stylesheet" href="css/font-awesome.css" type="text/css">
<!---- start-smoth-scrolling---->
		<script type="text/javascript" src="js/easing.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
		</script>
<!--end-smoth-scrolling-->
<!--start-animated-css-->
		<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
		<script src="js/wow.min.js"></script>
		<script>new WOW().init();</script>
<!--end-animated-css-->  
</head>
<body>
<!------Start-banner------>
		<div class="banner" id="home">
			<div  id="top" class="callbacks_container">
			     <ul class="rslides" id="slider4">
			       <li>
	    				<div class="banner-1">
						</div>
					</li>
					 <li>
	    				<div class="banner-2">
						</div>
					</li>
			     </ul>
			</div>
			<div class="clearfix"> </div>
			<div class="header">
				<div class="logo">
					<a href="index.jsp"><img src="images/logo.png" alt=""></a>
				</div>
				<div class="navigation">
				 <span class="menu"></span> 
					<ul class="navig">
						<li><a href="index.jsp">首页</a><span>|</span></li>
						<li><a href="#allBlog" class="scroll">所有博客</a><span>|</span></li>
						<li><a href="#contact" class="scroll">联系我们</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="banner-bottom">
				<ul>
					<li><a href="http://www.tui-te.com/"><span class="twt"> </span></a></li>
					<li><a href="http://www.facebook.com/"><span class="t"> </span></a></li>
					<li><a href="http://www.google.com/"><span class="g"> </span></a></li>
				</ul>
			</div>
		</div>	
	<!--Start-script-for-menu -->
		 <script>
				$("span.menu").click(function(){
					$(" ul.navig").slideToggle("slow" , function(){
					});
				});
		 </script>
	<!-- End-script-for-menu -->
		<!--Slider-Starts-Here-->
			<script src="js/responsiveslides.min.js"></script>
			<script>
			    // You can also use "$(window).load(function() {"
			    $(function () {
			      // Slideshow 4
			      $("#slider4").responsiveSlides({
			        auto: true,
			        pager: false,
			        nav: true,
			        speed: 500,
			        namespace: "callbacks",
			        before: function () {
			          $('.events').append("<li>before event fired.</li>");
			        },
			        after: function () {
			          $('.events').append("<li>after event fired.</li>");
			        }
			      });
			
			    });
			  </script>
		<!--End-slider-script-->
<!------End-banner------>

<!--Start-center-->
	<div class="free wow bounce"  id="allBlog">
		<div class="container">
			<div class="free-main">
				<center class="center">
						<c:set var="user" value="${requestScope.masterlist}" />
						<c:if test="${empty user}">
							<div class="panel panel-danger" style="height:200px;line-height:130px ">
							<div class="panel-heading">
							<h3 class="panel-title">服务异常</h3>
							</div>
							<div class="panel-body" style="color:#a94442">
								<span><i class="fa fa-angle-double-right"></i>对不起！该服务器中不存在任何博客!<i class="fa fa-angle-double-left"></i>&nbsp;&nbsp;&nbsp;&nbsp;
								如果想查看更多,请检查数据是否完整！
								</span>
							</div>
							</div>
						</c:if>
						<c:if test="${!empty user}">
						<h1>THE BOOK IN WHICH THIS RECORD IS KEPT .</h1>
						<p>With the appearance of blog  Blogs will always be the embodiment of the spirit of sharing and sharing.</p><br/>
						<div class="container">
					        <div class="row contain">
					            <div class="col-md-12">
					            	<div class="row" style="margin-top:17px">
					            	<div class="col-md-2"></div>
					                <div class="col-md-8 text-right"><span><a class="btn btn-danger" href="my/logon?goWhere=indexTemp"><i class="fa fa-user-secret"></i>我的博客</a></span></div>
					                <div class="col-md-2 text-right"><span><a class="btn btn-danger" href="pages/regBlog.jsp"><i class="fa fa-flag "></i>注册博客</a></span></div>
					            	</div>
					            </div>
					            <div class="col-sm-12 text-left">浏览其他博客</div>
					            <div class="col-sm-12 row2">
					                <div class="col-md-4">博客名称</div>
					                <div class="col-md-4">博主</div>
					                <div class="col-md-4">创建时间</div>
					            </div>
					            <div class="col-sm-12">
					            	<c:forEach var="single" items="${user}">
					                <div class="col-md-4 row3"><i class="fa fa-spinner fa-spin"></i><a rel="popover" title="点击查看博客" href="my/goBlog?master=${single.id}">${single.userBlogName}</a></div>
					                <div class="col-md-4 row3">${single.userName}</div>
					                <div class="col-sm-4 row3">${single.userCTTime}</div>
					                </c:forEach>
					            </div>
					        </div>
					    </div>
						</c:if>
				</center>
			</div>
		</div>
	</div>
<!--End-center-->
<!--Start-Footer--->
	<div class="container-fluid foot">
		<div class="col-md-9 footer-text" data-wow-delay="0.1s">
			<div class="row" style="padding: 20px 115px;">
				<p>Copyright &copy; 2015.Company name All rights reserved.myBlog</p>
			</div>
			<div class="row" style="padding-right:260px">
				<ul>
					<li><a href="http://www.tui-te.com/"><span class="twt"> </span></a></li>
					<li><a href="http://www.facebook.com/"><span class="t"> </span></a></li>
					<li><a href="http://www.google.com/"><span class="g"> </span></a></li>
				</ul>
			</div>
		</div>
		<div class="col-md-2 contact-text" id="contact">
			<p>关于我们/contact：QQ</p>
			<img alt="联系我们" src="images/QQ.jpg" class="img-rounded" width="130" height="130">
		</div>
		<a title="回到顶端" href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	</div>
<!--End-Footer-->
</body>
</html>