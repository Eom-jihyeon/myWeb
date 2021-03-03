<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*, jdbc.*"%>
<%
	ConnectionPool pool = ConnectionPool.getInstance();
	//Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String id = "",
		   passwd = "",
		   name = "",
		   mem_num1 = "",
		   mem_num2 = "",
		   email = "",
		   phone = "",
		   zipcode = "",
		   job = "",
		   address = "";
	int counter = 0;
	try{
		conn = pool.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery("SELECT * FROM TEMPMEMBER1");
%>
<html>
<head>
<title>JSP에서 데이터베이스 연동</title>
<link href = "style.css" rel = "stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<h2>JSP에서 커넥션 풀을 사용한 데이터베이스 연동 예제입니다.</h2>
<h3>회원정보</h3>
<table bordercolor="#0000FF" border="1">
<tr>
	<td><strong>ID</strong></td>
	<td><strong>PASSWD</strong></td>
	<td><strong>NAME</strong></td>
	<td><strong>MEM_NUM1</strong></td>
	<td><strong>MEM_NUM2</strong></td>
	<td><strong>EMAIL</strong></td>
	<td><strong>PHONE</strong></td>
	<td><strong>ZIPCODE</strong></td>
	<td><strong>JOB</strong></td>
	<td><strong>ADDRESS</strong></td>
</tr>
<%
	if(rs != null) {
		while(rs.next()) {
			id = rs.getString("id");
			passwd = rs.getString("passwd");
			name = rs.getString("name");
			mem_num1 = rs.getString("mem_num1");
			mem_num2 = rs.getString("mem_num2");
			email = rs.getString("email");
			phone = rs.getString("phone");
			zipcode = rs.getString("zipcode");
			job = rs.getString("job");
			address = rs.getString("address");
%>

<tr>
<td><%= id %></td>
<td><%= passwd %></td>
<td><%= name %></td>
<td><%= mem_num1 %></td>
<td><%= mem_num2 %></td>
<td><%= email %></td>
<td><%= phone %></td>
<td><%= zipcode %></td>
<td><%= job %></td>
<td><%= address %></td>

<%
		counter++;
		}//end while
	}//end if
%>
</tr>
</table><br></br>
total recodes: <%= counter %>

<%
	}catch(SQLException e) {
		e.printStackTrace();
	}catch(Exception exception) {
		exception.printStackTrace();
	}finally{
		if(rs != null) 
			try{rs.close();}
			catch(SQLException ex) {}
		if(stmt != null) 
			try{stmt.close();}
			catch(SQLException ex) {}
		if(conn != null) 
			try{pool.releaseConnection(conn);}
			catch(SQLException ex) {}
	}
%>
</body>
</html>