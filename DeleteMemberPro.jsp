<%@page import ="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import ="Myproject.LogonDataBean" %>
<%@page import ="Myproject.LogonDBBean" %>
<% 
	request.setCharacterEncoding("UTF-8");

	String id = (String)request.getAttribute("id");
	String passwd = (String)request.getAttribute("passwd");
	String name = (String)request.getAttribute("name");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="Myproject.css" type="text/css">
</head>
<body>
<!-- 
	1. 폼에서 저장된 값 가져오고, 
	2. db연결
	3. 쿼리문 작성
	(2번 & 3번 -> 빈즈에서 작성(java문서로 작성)
 -->
<jsp:useBean id="member" class="Myproject.LogonDataBean">
	<jsp:setProperty name="id" property="*"/>
	<jsp:setProperty name="passwd" property="*"/>
</jsp:useBean>
<% %>
<%
	member.setReg_date(new Timestamp(System.currentTimeMillis()));
	LogonDBBean logon = LogonDBBean.getInstance();

	logon.deleteMember(id,passwd);
	%>
</body>
</html>