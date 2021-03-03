<%@ page language="java" contentType="text/html; charset=UTF-8" import="memberone.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="memberone.StudentDAO" />
<jsp:useBean id="svo" class="memberone.StudentVO" />
<jsp:setProperty name="svo" property="*"/>
<%
String loginID = (String)session.getAttribute("loginID");
svo.setId(loginID);
dao.updateMember(svo);
%>
<html>
<head>
<title>Update Process</title>
</head>
<meta http-equiv="Refresh" content="3;url=login.jsp">
<body>
<center>
<font size="5" face="바탕체">
입력하신 내용대로 <b>회원정보가 수정되었습니다.</b><br></br>
3초 후에 LogOn Page로 이동합니다.</font>
</center>
</body>
</html>