package Myproject;

import java.sql.*;
import java.util.ArrayList;


public class LogonDBBean {
	private static LogonDBBean instance = new LogonDBBean();	// 스스로 객체 만듦
	public static LogonDBBean getInstance(){	// static : 
		return instance;	//스스로 만든 객체를 다른 퍼블릭에 리턴
	}
	private LogonDBBean(){}//생성자 - 부르지를 못함
	
	// 1. DB연결
	public Connection getConnection() throws ClassNotFoundException, SQLException{
		Connection conn=null;
		
		String Url = "jdbc:mysql://localhost:3306/jsp02";
		String dbId="root";
		String dbPass="jsw0101151!";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(Url,dbId,dbPass);
		System.out.println("연결 성공");
		
		return conn;
	}
	
	// 2. 회원가입 코드
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
			
			System.out.println("insert성공");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
	}
	
	
	// 3. 아이디/비번 확인 코드
	public int userCheck(String id,String passwd){
		System.out.println("id"+id);
		System.out.println("passwd"+passwd);
		// DB연결
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		int x = 0;
		
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("Select passwd from member where id =?");
			//아이디가 틀린지 비밀번호가 틀린지
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				String dbpass = rs.getString("passwd");
				if(dbpass.equals(passwd)){
					// 인증성공
					x = 1;
				}else{
					// 비밀번호 틀림
					x=0;
				}
			}else{
				// 해당 아이디가 없음
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
		// 아이디와 비밀번호를 데이터베이스에서 검증
	}
	
	// 4.삭제
	// 아이디 및 비밀번호 탈퇴하기 
	public int deleteMember(String id,String passwd){
			System.out.println("id"+id);
			System.out.println("passwd"+passwd);
			// DB연결
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs =null;
			int x = 0;
			String sql = "select * from member where id=?";
			try{
				conn = getConnection();
				pstmt = conn.prepareStatement("Delete from member where id =?");
				//아이디가 틀린지 비밀번호가 틀린지
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				//HttpSession session = request.getSession();
				
				if(rs.next()){
					String dbpass = rs.getString("passwd");
					if(dbpass.equals(passwd)&&dbpass.equals(id)){
						sql = "Delete from member where id=?";
						// 세션에 정보삭제
						pstmt=conn.prepareStatement(sql);
						pstmt.setString(1, id);
						pstmt.executeUpdate();
						//response.sendRedirect("sessionLoginForm.jsp");
					}else{ 
						// 비밀번호 틀림
						x=-1;
						// response.sendRedirect("sessionLoginForm.jsp");
					}
				}else{
					// 해당 아이디가 없음
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
			
			// 아이디와 비밀번호를 데이터베이스에서 검증
	}
	
	
	// 수정
	// 아이디 맞으면 비밀번호 수정하기
	public boolean updateMember (LogonDataBean member){
		// 연결
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		// 쿼리문 작성
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
	
	
	// 회원 목록 
	// 목록보기
	// 책에 있는 게시판 소스 참고
	public ArrayList<LogonDataBean> getDBLsit(){
			// 연결
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
	
	// 작성중....
	// 추가내용
	// 글작성 목록 가져오기
	public ArrayList<LogonDataBean> getWriteLsit(){
		// 연결
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
	// 새 글 작성 
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
			
			System.out.println("작성성공");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
	}
}
