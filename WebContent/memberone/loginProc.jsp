<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<jsp:useBean id="dao" class="memberone.StudentDAO" />

<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	int check = dao.loginCheck(id, pass);
%>
<%
if(check == 1) {//로그인 성공
	session.setAttribute("loginID", id);
	response.sendRedirect("login.jsp");
}else if(check == 0) {//아이디는 있는데 비밀번호 오류
%>

<script>
	alert("비밀번호가 틀립니다.");
	history.go(-1);
</script>
<%
}else{//아이디가 존재하지 않는 경우
%>

	<script>
		alert("아이디가 존재하지 않습니다.");
		history.go(-1);
	</script>
<% } %>
