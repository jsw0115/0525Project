<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="Myproject.css" type="text/css">
</head>
<body>
<h2>멤버 추가</h2>
	<form method = "post" action="insertMemberPro.jsp">
 		id : <input type="text" name="id"><br>
 		password : <input type = "password"name="passwd"><br>
 		name : <input type ="text" name ="name"> <br>
 		<input type ="submit" value ="등록">
 	</form>
</body>
</html>