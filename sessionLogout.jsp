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
	<% session.invalidate(); %>
	<script>
	alert("�α׾ƿ� �Ǿ����ϴ�.");
	location.href="sessionMain.jsp";
	</script>
	<!-- 
		�˾�â �����
	 -->
	 <button onclick ="location='sessionLoginForm.jsp'">�α���</button>
</body>
</html>