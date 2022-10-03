package Myproject;

import java.sql.*;
import java.util.ArrayList;


public class LogonDBBean {
	private static LogonDBBean instance = new LogonDBBean();	// ������ ��ü ����
	public static LogonDBBean getInstance(){	// static : 
		return instance;	//������ ���� ��ü�� �ٸ� �ۺ��� ����
	}
	private LogonDBBean(){}//������ - �θ����� ����
	
	// 1. DB����
	public Connection getConnection() throws ClassNotFoundException, SQLException{
		Connection conn=null;
		
		String Url = "jdbc:mysql://localhost:3306/jsp02";
		String dbId="root";
		String dbPass="jsw0101151!";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(Url,dbId,dbPass);
		System.out.println("���� ����");
		
		return conn;
	}
	
	// 2. ȸ������ �ڵ�
	public void insertMember(LogonDataBean member){
		//
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn=getConnection();
			String sql = "insert into member values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			System.out.println(pstmt);

			pstmt.setString(1,member.getId());
			pstmt.setString(2,member.getPasswd());
			pstmt.setString(3,member.getName());
			pstmt.setTimestamp(4,member.getReg_date());
			pstmt.executeUpdate();
			
			System.out.println("insert����");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
	}
	
	
	// 3. ���̵�/��� Ȯ�� �ڵ�
	public int userCheck(String id,String passwd){
		System.out.println("id"+id);
		System.out.println("passwd"+passwd);
		// DB����
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		int x = 0;
		
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("Select passwd from member where id =?");
			//���̵� Ʋ���� ��й�ȣ�� Ʋ����
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				String dbpass = rs.getString("passwd");
				if(dbpass.equals(passwd)){
					// ��������
					x = 1;
				}else{
					// ��й�ȣ Ʋ��
					x=0;
				}
			}else{
				// �ش� ���̵� ����
				x = -1;
			}
			
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}catch(NullPointerException e){
			e.printStackTrace();

		}finally{
			
		}return x;
		// conn = getConnection();
		// ���̵�� ��й�ȣ�� �����ͺ��̽����� ����
	}
	
	// 4.����
	// ���̵� �� ��й�ȣ Ż���ϱ� 
	public int deleteMember(String id,String passwd){
			System.out.println("id"+id);
			System.out.println("passwd"+passwd);
			// DB����
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs =null;
			int x = 0;
			String sql = "select * from member where id=?";
			try{
				conn = getConnection();
				pstmt = conn.prepareStatement("Delete from member where id =?");
				//���̵� Ʋ���� ��й�ȣ�� Ʋ����
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				//HttpSession session = request.getSession();
				
				if(rs.next()){
					String dbpass = rs.getString("passwd");
					if(dbpass.equals(passwd)&&dbpass.equals(id)){
						sql = "Delete from member where id=?";
						// ���ǿ� ��������
						pstmt=conn.prepareStatement(sql);
						pstmt.setString(1, id);
						pstmt.executeUpdate();
						//response.sendRedirect("sessionLoginForm.jsp");
					}else{ 
						// ��й�ȣ Ʋ��
						x=-1;
						// response.sendRedirect("sessionLoginForm.jsp");
					}
				}else{
					// �ش� ���̵� ����
					x = -1;
				}
				
				
			}catch(ClassNotFoundException e){
				e.printStackTrace();
			}catch(SQLException e){
				e.printStackTrace();
				
			}catch(NullPointerException e){
				e.printStackTrace();

			}finally{
				if(pstmt !=null)
					try{pstmt.close();}catch(SQLException ex){}
				if(conn !=null)
					try{conn.close();}catch(SQLException ex){}
			}
			return x;
			
			// ���̵�� ��й�ȣ�� �����ͺ��̽����� ����
	}
	
	
	// ����
	// ���̵� ������ ��й�ȣ �����ϱ�
	public boolean updateMember (LogonDataBean member){
		// ����
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		// ������ �ۼ�
		String sql = "update member set passwd=?, name=? where id=?";
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPasswd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getId());
			pstmt.executeUpdate();
		}catch(SQLException e){
			return false;
		}
		return true;
	}
	
	
	// ȸ�� ��� 
	// ��Ϻ���
	// å�� �ִ� �Խ��� �ҽ� ����
	public ArrayList<LogonDataBean> getDBLsit(){
			// ����
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		ArrayList<LogonDataBean> datas = new ArrayList<LogonDataBean>();
		String sql = "Select * from member";
		try{
			pstmt = conn.prepareStatement(sql);
			ResultSet Rs = pstmt.executeQuery();
			while(Rs.next()){
				LogonDataBean LDB = new LogonDataBean();
				LDB.setId(Rs.getString("id"));
				LDB.setPasswd(Rs.getString("passwd"));
				LDB.setName(Rs.getString("name"));
				datas.add(LDB);
			}
		}catch(SQLException e){
			
		}catch(NullPointerException e){
			e.printStackTrace();

		}
		return datas;
		
	}
	
	// �ۼ���....
	// �߰�����
	// ���ۼ� ��� ��������
	public ArrayList<LogonDataBean> getWriteLsit(){
		// ����
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	
	ArrayList<LogonDataBean> datas = new ArrayList<LogonDataBean>();
	String sql = "Select * from t3";
	try{
		pstmt = conn.prepareStatement(sql);
		ResultSet Rs = pstmt.executeQuery();
		while(Rs.next()){
			LogonDataBean LDB = new LogonDataBean();
			LDB.setId(Rs.getString("id"));
			LDB.setName(Rs.getString("name"));
			LDB.setText(Rs.getString("text"));
			datas.add(LDB);
		}
	}catch(SQLException e){

	}catch(NullPointerException e){
		e.printStackTrace();

	}
	return datas;
	
	}
	// �� �� �ۼ� 
	public void insertWrite(LogonDataBean t3){
		//
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn=getConnection();
			String sql = "insert into t3 values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			System.out.println(pstmt);

			pstmt.setString(1,t3.getId());
			pstmt.setString(2,t3.getName());
			pstmt.setString(3,t3.getText());
			pstmt.setTimestamp(4,t3.getReg_date());
			pstmt.executeUpdate();
			
			System.out.println("�ۼ�����");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
	}
}
