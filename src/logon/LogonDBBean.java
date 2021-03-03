package logon;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class LogonDBBean {
	private static LogonDBBean instance = new LogonDBBean();

	public static LogonDBBean getInstance() {
		return instance;
	}

	private LogonDBBean() {
	}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:conp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/myOracle");
		return ds.getConnection();
	}

	public int userCheck(String id, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbpasswd = "";
		int x = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select passwd from TEMPMEMBER where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbpasswd=rs.getString("passwd");
				if(dbpasswd.equals("passwd")) {
					x = 1; //인증 성공
				}else if(!dbpasswd.equals("passwd")) {
					x = 0; //비밀번호 틀림
				}else {
					x = -1; //해당 아이디 없음
				}
			}
		}catch(Exception ex) {
			if(rs != null) try {rs.close(); }catch(SQLException sqle1) {}
			if(pstmt != null) try {pstmt.close(); }catch(SQLException sqle2) {}
			if(conn != null) try {conn.close(); }catch(SQLException sqle3) {} 
		}
		return x;
	}
}
