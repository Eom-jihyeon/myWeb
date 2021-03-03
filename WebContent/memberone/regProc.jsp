<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="memberone.StudentDAO"/>
<jsp:useBean id="svo" class="memberone.StudentVO"/>
<jsp:setProperty name="svo" property='*'/>
<%
	boolean flag=dao.memberInsert(svo);
%>
<html>
<head>
<title>회원가입 확인</title></head>
<link href="style.css" rel="stylesheet" type="text/css">
<body bgcolor="#FFFFCC">
<br></br>
<center>
<%
	if(flag){
		out.println("<b>회원가입을 축하드립니다.</b></br>");
		out.println("<a href=login.jsp>로그인</a>");
	}
%>
</center>
</body>
</html>