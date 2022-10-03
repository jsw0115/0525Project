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
<%
	String id=(String)session.getAttribute("id"); 
	if(id==null || id.equals("")){
		response.sendRedirect("sessionLoginForm.jsp");
	}else{
		
%>
	<b><%=id%>님이 로그인 하셨습니다.</b>
	<form method="post" action ="sessionLogout.jsp">
		<input type="submit" value="로그아웃">
	
	</form>
<% } %>
<table>
<tr><tb><button onclick ="location='sessionModifyForm.jsp'">정보수정</button></tb></tr>
<tr><tb><button onclick ="location='DeleteMemberForm.jsp'">탈퇴</button></tb></tr>
<tr><tb><button onclick ="location='WriteList.jsp'">글목록</button></tb></tr>
<tr><tb><button onclick ="location='ListMember2.jsp'">회원목록</button></tb></tr>
</table>
</body>
</html>