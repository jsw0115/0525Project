<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="Myproject.LogonDBBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �α���</title>
<link rel="stylesheet" href="Myproject.css" type="text/css">
</head>
<body>
<!-- 
	1. ������ �Է¹��� ���̵�, ��й�ȣ ���� �����;� ��
	2. ���̵�, ����� �����ͺ��̽��� ����� ���� ��ġ�Ǵ��� Ȯ��
		2-1) �����ͺ��̽� ����
		2-2) ������ �ۼ�
	* 2�� �۾� -> �ڹٺ� ���(java)
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
		<tr><td><button onclick ="location='sessionModifyForm.jsp'">��������</button></td></tr>
		<tr><td><button onclick ="location='DeleteMemberForm.jsp'">Ż��</button></td></tr>
		<tr><td><button onclick ="location='WriteList.jsp'">�۸��</button></td></tr>
</table>
<%
 	}else if(check==0){
 		out.println("����� Ʋ���ϴ�");
 	}else{
 		out.println("���̵� ���� �ʴ´�");
 		}
 %>
 <table border="1" width="600">
		<tr><td><button onclick ="location='sessionModifyForm.jsp'">��������</button></td></tr>
		<tr><td><button onclick ="location='DeleteMemberForm.jsp'">Ż��</button></td></tr>
		<tr><td><button onclick ="location='WriteList.jsp'">�۸��</button></td></tr>
		<tr><td><button onclick ="location='WriteList.jsp'">��� ����Ʈ</button></td></tr>
</table>
</body>
</html>