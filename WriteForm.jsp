<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글작성</title>
<link rel="stylesheet" href="Myproject.css" type="text/css">

</head>
<body>
	<h2>글작성</h2>
	<!-- 
	작성중...
	내용 추가 중....
	-->
	<%
	String name1 = (String)session.getAttribute("name");
	String id1=(String)session.getAttribute("id"); 
	%>
	<!-- 
	1. 폼에서 저장된 값 가져오고, 
	2. db연결
	3. 쿼리문 작성
	(2번 & 3번 -> 빈즈에서 작성(java문서로 작성)
 -->
	<form method = "post" action="WritePro.jsp">
	<table border="2" width="1000">
		<tr><td>아이디</td><td><%=id1 %></td></tr>
		<tr><td>이름</td><td><input type="text" name="text" size=20 maxlength=50></td></tr>
		<tr><td>글내용</td><td><input type="text" name="text" size=20 maxlength=50></td></tr>
 		<tr><td></td><td><input type ="submit" value ="등록"></td></tr>
 		</table>
 	</form>
</body>
</html>