<%@page import ="java.sql.Timestamp"%>
<%@page import ="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import ="Myproject.LogonDataBean" %>
<%@page import ="Myproject.LogonDBBean" %>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������Ʈ</title>
<link rel="stylesheet" href="Myproject.css" type="text/css">
</head>
<body>
	<h2>ȸ������Ʈ</h2>
	<!-- 
	1. ������ ����� �� ��������, 
	2. db����
	3. ������ �ۼ�
	(2�� & 3�� -> ����� �ۼ�(java������ �ۼ�)
 -->
<jsp:useBean id="member" class="Myproject.LogonDataBean">
	<jsp:setProperty name="member" property="*"/>
</jsp:useBean>
		<%
		String Url = "jdbc:mysql://localhost:3306/jsp02";
		String dbId="root";
		String dbPass="jsw0101151!";

		String sql = "select * from member";
		// ����
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp02","root","jsw0101151!");
		
		//Connection conn = DriverManager.getConnection(Url,dbId,dbPass);
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs =pstmt.executeQuery();
		%>
	<table border="1" width="600">
		<tr>
			<td>���̵�</td>
			<td>��й�ȣ</td>
			<td>�̸�</td>
			<td>������</td>
		</tr>
		<%
		try{
			conn = DriverManager.getConnection(Url,dbId,dbPass);
			pstmt = conn.prepareStatement(sql);
			//���̵� Ʋ���� ��й�ȣ�� Ʋ����
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
</body>
</html>