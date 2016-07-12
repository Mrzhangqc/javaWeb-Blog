<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	response.addHeader("Pragma","No-cache");
	response.addHeader("Cache-Control","no-cache");
	response.addDateHeader("Expires",1);
	request.setCharacterEncoding("utf-8"); 
%>

<jsp:useBean id="regUser" class="com.zhangqichang.valueBean.UserSingle" scope="request">
	<jsp:setProperty name="regUser" property="*"/>
</jsp:useBean>
<jsp:forward page="/userReg"/>
