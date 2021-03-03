<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="logon.LogonDBBean"%>
<%@ include file="color.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String id=request.getParameter("id");
	String passwd = request.getParameter("passwd");
	LogonDBBean manager = LogonDBBean.getInstance();
	int check = manager.userCheck(id, passwd);
	if(check == 1) {
		Cookie cookie =  new Cookie("memId", id);
		cookie.setMaxAge(20*60);
		response.addCookie(cookie);
		response.sendRedirect("cookieLoginConfirm.jsp");
	}else if(check == 0){
%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
<% }else { %>
	<script>
		alert("아이디가 맞지 않습니다.");
		history.go(-1);
	</script>
<% } %>
<html>
<head>
<title>쿠키를 사용한 간단한 회원인증</title>
<link href="style.css" rel="stylesheet" type="text.css">
</head>
<body bgcolor="<%=bodyback_c %>">
	<form method="post" action="cookieLogOut.jsp">
	<table width="300" border="1" align="center">
		<tr>
			<td align="center" bgcolor="<%=value_c %>">
			<b><%=id %></b>님이 로그인하셨습니다.
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="<%=value_c %>">
			<input type="submit" value="로그아웃">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>