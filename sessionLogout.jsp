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
	alert("로그아웃 되었습니다.");
	location.href="sessionMain.jsp";
	</script>
	<!-- 
		팝업창 만들기
	 -->
	 <button onclick ="location='sessionLoginForm.jsp'">로그인</button>
</body>
</html>