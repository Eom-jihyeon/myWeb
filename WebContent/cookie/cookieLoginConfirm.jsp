<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="color.jsp" %>
<%
	String id="";
	try{
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("name")) {
					id=cookies[i].getValue();
				}
			}
			if(id.equals("")) {
				response.sendRedirect("cookieMemberLogin.jsp");
			}
		}else {
			response.sendRedirect("cookieMemberLogin.jsp");
		}
	}catch(Exception ex) {}
%>
<html>
<head>
<title>쿠키를 사용한 간단한 회원인증</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
	<form method="post" action="cookieLogOut.jsp">
		<table width="300" border="1" align="center">
			<tr>
				<td align="center" bgcolor="<%=value_c %>">
				<b><%=id %></b>님이 로그인하셨습니다.
				</td>
			</tr>
			<tr>
				<td align="center" bgcolor="<%=value_c%>">
			</tr>
		</table>
	</form>
</body>
</html>