<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	request.setCharacterEncoding("UTF-8");

	String id = (String)request.getAttribute("id");
	String name = (String)request.getAttribute("name");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>정보변경</title>
<link rel="stylesheet" href="Myproject.css" type="text/css">
</head>
<body>
<h2>정보 수정페이지</h2>
<%String id1=(String)session.getAttribute("id"); %>
	<form action="sessionModifyPro.jsp" method="post">
	<table border="1" width="600">
		<tr><td>아이디</td><td><%=id1 %></td></tr>
		<tr><td>비밀번호</td><td><input type="password" name="pw"></td></tr>
		<tr><td>이름</td><td><input type="text" name="name"></td></tr>
		<tr><td></td><td><input type="submit" value="수정"/></td></tr>
		</table>
	</form>
</body>
</html>