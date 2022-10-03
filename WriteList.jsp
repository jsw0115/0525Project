<%@page import ="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import ="Myproject.LogonDataBean" %>
<%@page import ="Myproject.LogonDBBean" %>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="Myproject.css" type="text/css">

</head>
<body>
<!--
 작성중...
내용 추가 중.,...
 -->
	<h2>글목록</h2>
	<!-- 
	1. 폼에서 저장된 값 가져오고, 
	2. db연결
	3. 쿼리문 작성
	(2번 & 3번 -> 빈즈에서 작성(java문서로 작성)
 -->
<jsp:useBean id="member" class="Myproject.LogonDataBean">
	<jsp:setProperty name="member" property="*"/>
</jsp:useBean>
	<%
	// 작성 중.......
		String Url = "jdbc:mysql://localhost:3306/jsp02";
		String dbId="root";
		String dbPass="jsw0101151!";

		String sql = "select * from t3";
		//수정
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp02","root","jsw0101151!");
		
		// Connection conn = DriverManager.getConnection(Url,dbId,dbPass);
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs =pstmt.executeQuery();
		%>
		<table border="1" width="600">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>내용</td>
			<td>작성일</td>
		</tr>
		<%
		try{
			conn = DriverManager.getConnection(Url,dbId,dbPass);
			pstmt = conn.prepareStatement(sql);
			//아이디가 틀린지 비밀번호가 틀린지
			rs=pstmt.executeQuery();
			while(rs.next()){
				%>
				<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>				
				<td><%=rs.getString(4) %></td>
				</tr>
				<%
			}
			pstmt.close();
			conn.close();
		}catch(Exception e){
			System.out.println("...");
		}finally{
			pstmt.close();
			conn.close();
		}
		%>
	</table>
	<button onclick ="location='WriteForm.jsp'">글작성하기</button>
</body>
</html>