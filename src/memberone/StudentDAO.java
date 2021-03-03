package memberone;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
public class StudentDAO {
	
	
	
	//db연동 메서드 
	public Connection getConnection() {
		Connection conn = null;
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/myOracle");
			conn = ds.getConnection();
		}catch(NamingException ne) {
			ne.printStackTrace();
		}catch(SQLException sqle) {
			sqle.printStackTrace();
		}
		return conn;
	}
	
	//아이디 중복확인 메서드 : idCheck
	public boolean idCheck(String id) {
		boolean result=true;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("select * from student where id=?");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(!rs.next()) {
				result = false;//사용가능
			}
		}catch(SQLException sqle) {
			sqle.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException sqle1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn != null) try {conn.close();}catch(SQLException sqle3) {}
		}
		return result;
	}
	
	//동 검색: zipcodeRead
	public Vector<ZipCodeVO> zipcodeRead(String dong) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector<ZipCodeVO> vecList = new Vector<ZipCodeVO>();
		try {
			conn = getConnection();
			String strQuery = "select * from zipcode where dong like'" + dong + "%'";
			pstmt=conn.prepareStatement(strQuery);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ZipCodeVO tempZipcode = new ZipCodeVO();
				tempZipcode.setZipcode(rs.getString("zipcode"));
				tempZipcode.setSido(rs.getString("sido"));
				tempZipcode.setGugun(rs.getString("gugun"));
				tempZipcode.setDong(rs.getString("dong"));
				tempZipcode.setRi(rs.getString("ri"));
				tempZipcode.setBunji(rs.getString("bunji"));
				vecList.addElement(tempZipcode);
			}
		}catch(SQLException sqle) {
			sqle.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException sqle1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn != null) try {conn.close();}catch(SQLException sqle3) {}
		}
		return vecList;
	}
	
	//회원가입 정보 저장
	public boolean memberInsert(StudentVO svo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		
		try {
			conn=getConnection();
			String strQuery = "insert into student values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, svo.getId());
			pstmt.setString(2, svo.getPass());
			pstmt.setString(3, svo.getName());
			pstmt.setString(4, svo.getPhone1());
			pstmt.setString(5, svo.getPhone2());
			pstmt.setString(6, svo.getPhone3());
			pstmt.setString(7, svo.getEmail());
			pstmt.setString(8, svo.getZipcode());
			System.out.println(svo.getZipcode());
			pstmt.setString(9, svo.getAddress1());
			System.out.println(svo.getAddress1());
			pstmt.setString(10, svo.getAddress2());
			int count = pstmt.executeUpdate();
			if(count > 0) {
				flag = true;
			}
		}catch(Exception ex) {
			System.out.println("Exception: "+ex);
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException sqle1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn != null) try {conn.close();}catch(SQLException sqle3) {}
		}
		return flag;
	}
	
	//비밀번호 얻어오기
	public String getPass(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbPass=null;
		try {
			conn = getConnection();
			String strQuery="select pass from student where id=?";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dbPass = rs.getString("pass");
				//System.out.println(dbPass);
			}
		}catch(Exception ex) {
			System.out.println("Exception: "+ex);
		}finally {
			if(rs != null) try{rs.close();}catch(SQLException sqle1) {}
			if(pstmt !=null) try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn != null) try {conn.close();}catch(SQLException sqle3) {}
		}
		return dbPass;
	}
	
	//로그인(check에 숫자 부여) 메서드 : loginCheck
	public int loginCheck(String id, String pass) {
		int check = -1;
		String dbPass = getPass(id);
		if(pass.equals(dbPass)) {
			check = 1;
		}
		System.out.println(check);
		return check;
	}
	
	//정보수정 기존 정보를 나타내는 메서드
	public StudentVO getMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StudentVO svo = null;
		try {
			conn = getConnection();
			pstmt= conn.prepareStatement("select * from student where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				svo = new StudentVO();
				svo.setId(rs.getString("id"));
				svo.setPass(rs.getString("pass"));
				svo.setName(rs.getString("name"));
				svo.setPhone1(rs.getString("phone1"));
				svo.setPhone2(rs.getString("phone2"));
				svo.setPhone3(rs.getString("phone3"));
				svo.setEmail(rs.getString("email"));
				svo.setZipcode(rs.getString("zipcode"));
				svo.setAddress1(rs.getString("address1"));
				svo.setAddress2(rs.getString("address2"));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException sqle1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn != null) try {conn.close();}catch(SQLException sqle3) {}
		}
		return svo;
	}
	
	//정보수정 메서드
	public void updateMember(StudentVO svo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update student set pass=?, phone1=?, phone2=?, phone3=?, email=?, zipcode=?, address1=?, address2=? where id=?");
			pstmt.setString(1, svo.getPass());
			pstmt.setString(2, svo.getPhone1());
			pstmt.setString(3, svo.getPhone2());
			pstmt.setString(4, svo.getPhone3());
			pstmt.setString(5, svo.getEmail());
			pstmt.setString(6, svo.getZipcode());
			pstmt.setString(7, svo.getAddress1());
			pstmt.setString(8, svo.getAddress2());
			pstmt.setString(9, svo.getId());
			pstmt.executeUpdate();
		}catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if(pstmt != null) try {pstmt.close();}catch(SQLException sqle1) {}
			if(conn != null) try {conn.close();}catch(SQLException sqle2) {}
		}
	}
	
	//회원탈퇴 메서드
	public int deleteMember(String id, String pass) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		String dbPass = getPass(id);
		System.out.println(dbPass);
		
		try {
			if(pass.equals(dbPass)) {
				conn=getConnection();
				pstmt=conn.prepareStatement("delete from student where id=?");
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				result = 1;
			}else {
				result = 0;
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException sqle1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn != null) try {conn.close();}catch(SQLException sqle3) {}
		}
		return result;
	}
	
}
