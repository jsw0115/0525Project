<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���ۼ�</title>
<link rel="stylesheet" href="Myproject.css" type="text/css">

</head>
<body>
	<h2>���ۼ�</h2>
	<!-- 
	�ۼ���...
	���� �߰� ��....
	-->
	<%
	String name1 = (String)session.getAttribute("name");
	String id1=(String)session.getAttribute("id"); 
	%>
	<!-- 
	1. ������ ����� �� ��������, 
	2. db����
	3. ������ �ۼ�
	(2�� & 3�� -> ����� �ۼ�(java������ �ۼ�)
 -->
	<form method = "post" action="WritePro.jsp">
	<table border="2" width="1000">
		<tr><td>���̵�</td><td><%=id1 %></td></tr>
		<tr><td>�̸�</td><td><input type="text" name="text" size=20 maxlength=50></td></tr>
		<tr><td>�۳���</td><td><input type="text" name="text" size=20 maxlength=50></td></tr>
 		<tr><td></td><td><input type ="submit" value ="���"></td></tr>
 		</table>
 	</form>
</body>
</html>