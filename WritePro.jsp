<%@page import ="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import ="Myproject.LogonDataBean" %>
<%@page import ="Myproject.LogonDBBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="Myproject.css" type="text/css">

</head>
<body>
<!-- 
	1. ������ ����� �� ��������, 
	2. db����
	3. ������ �ۼ�
	(2�� & 3�� -> ����� �ۼ�(java������ �ۼ�)
 -->
<jsp:useBean id="t3" class="Myproject.LogonDataBean">
	<jsp:setProperty name="t3" property="*"/>
</jsp:useBean>
<%
	t3.setReg_date(new Timestamp(System.currentTimeMillis()));
	LogonDBBean logon = LogonDBBean.getInstance();
	
	logon.insertWrite(t3);
%>
	<h2>��ϵǾ����ϴ�.</h2>
	<button onclick ="location='WriteList.jsp'">�۸��</button>

</body>
</html>