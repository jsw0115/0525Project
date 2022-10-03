<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="Myproject.LogonDBBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>세션 로그인</title>
<link rel="stylesheet" href="Myproject.css" type="text/css">
</head>
<body>
<!-- 
	1. 폼에서 입력받은 아이디, 비밀번호 값을 가져와야 함
	2. 아이디, 비번이 데이터베이스에 저장된 값과 일치되는지 확인
		2-1) 데이터베이스 연결
		2-2) 쿼리문 작성
	* 2번 작업 -> 자바빈 사용(java)
 -->
 <%
 	String id = request.getParameter("id");
 	String passwd = request.getParameter("passwd");
 	out.print(id);
 	out.print(passwd);
 	LogonDBBean logon=LogonDBBean.getInstance();
 	int check =logon.userCheck( id,passwd);       
 	out.println(check);
 	if(check ==1){
 		session.setAttribute("id",id);
 		response.sendRedirect("sessionMain.jsp");
 		%>
 		
		 <table border="1" width="600">
		<tr><td><button onclick ="location='sessionModifyForm.jsp'">정보수정</button></td></tr>
		<tr><td><button onclick ="location='DeleteMemberForm.jsp'">탈퇴</button></td></tr>
		<tr><td><button onclick ="location='WriteList.jsp'">글목록</button></td></tr>
</table>
<%
 	}else if(check==0){
 		out.println("비번이 틀립니다");
 	}else{
 		out.println("아이디가 맞지 않는다");
 		}
 %>
 <table border="1" width="600">
		<tr><td><button onclick ="location='sessionModifyForm.jsp'">정보수정</button></td></tr>
		<tr><td><button onclick ="location='DeleteMemberForm.jsp'">탈퇴</button></td></tr>
		<tr><td><button onclick ="location='WriteList.jsp'">글목록</button></td></tr>
		<tr><td><button onclick ="location='WriteList.jsp'">멤버 리스트</button></td></tr>
</table>
</body>
</html>