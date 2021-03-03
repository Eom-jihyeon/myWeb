package bbs;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class VisitInsert {
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); //�ѱ� ó��
		//client�� http��û���� ������ �� �б�
		String writer = request.getParameter("writer");
		String memo = request.getParameter("memo");
		System.out.println("�ۼ���: "+writer);
		System.out.println("����: "+memo);
		
		StringBuffer sql = new StringBuffer();
		sql.append("insert into visit(no, writer, memo, regdate) ");
		sql.append("values (visit_seq.nextval, ?, ?, sysdate) ");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XEPDB1", "c##mytest", "mytest");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, writer);
			pstmt.setString(2, memo);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}finally {
			try {if(pstmt != null) pstmt.close(); }catch(SQLException e) {}
			try {if(con != null) con.close(); }catch(SQLException e) {}
		}
		
		response.sendRedirect("VisitList");
	}
 }
