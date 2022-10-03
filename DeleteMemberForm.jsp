<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>탈퇴폼</title>
<link rel="stylesheet" href="Myproject.css" type="text/css">
</head>
<body>
	<form method = "post" action="DeleteMemberPro.jsp">
	<table>
 		<tr><td>id</td><td> <input type="text" name="id"></td></tr>
 		<tr><td>password </td><td> <input type = "password"name="passwd"></td></tr>
 		<tr><td>name </td><td> <input type ="text" name ="name"></td></tr>
 		<tr><td><input type ="submit" value ="탈퇴"></td></tr>
 		</table>
 	</form>
</body>
</html>