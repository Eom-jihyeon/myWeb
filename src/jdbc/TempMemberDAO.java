package jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class TempMemberDAO {
	//private ConnectionPool pool = null;
	
	public TempMemberDAO() {
//		try {
//			pool = ConnectionPool.getInstance();
//		}catch(Exception e) {
//			System.out.println("Error: 커넥션 얻어오기 실패");
//		}
		
	}
	
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
	
	public Vector<TempMemberVO> getMemberList() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector<TempMemberVO> vecList = new Vector<TempMemberVO>();
		try {
			conn = getConnection();
			String strQuery = "select * from tempmember";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strQuery);
			while(rs.next()) {
				TempMemberVO vo = new TempMemberVO();
				vo.setId(rs.getString("id"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setName(rs.getString("name"));
				vo.setMem_num1(rs.getString("mem_num1"));
				vo.setMem_num2(rs.getString("mem_num2"));
				vo.setEmail(rs.getString("email"));
				vo.setPhone(rs.getString("phone"));
				vo.setZipcode(rs.getString("zipcode"));
				vo.setAddress(rs.getString("address"));
				vo.setJob(rs.getString("job"));
				vecList.add(vo);
			}
		}catch(Exception ex) {
			System.out.println("Exception: " + ex);
		}finally {
			if(rs != null) {
				try {
					rs.close();
				}catch(SQLException e) {}
			}
			if(stmt != null) {
				try {
					stmt.close();
				}catch(SQLException e) {}
			}
			if(conn != null) {
				try {
					conn.close();
				}catch(SQLException e) {}
			}
		}
		
		return vecList;
	}
}
