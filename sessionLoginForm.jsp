<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α��� �ϱ�</title>
<link rel="stylesheet" href="Myproject.css" type="text/css">
</head>
<body>
	<h2>�α��� �ϱ�</h2>
	<form method="post"action="sessionLoginPro.jsp">
	<table border="1" width="600">
		<tr><td>id</td><td><input type="text" name="id"></td></tr>
		<tr><td>password</td><td><input type="password" name="passwd"></td></tr>
		<tr><td><input type="submit" value="�α���"> </td><td></td></tr>
		</table>
	</form>
<button onclick ="location='insertMemberForm.jsp'">ȸ������</button>
</body>
</html>