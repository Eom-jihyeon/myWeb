<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//pageContext Scope에 속성 저장하기
pageContext.setAttribute("pageAttribute", "이주현");
//pageContext.setAttribute("pageAttribute", "이주현", PageContext.PAGE_SCOPE);

//request Scope에 속성 저장하기
request.setAttribute("requestAttribute", "010-2061-5471");
//pageContext.setAttribute("requestAttribute", "010-2061-5471", PageContext.REQUEST_SCOPE);

//session Scope에 속성 저장하기
session.setAttribute("sessionAttribute", "beeper4263@naver.com");
//pageContext.setAttribute("sessionAttribute", "beeper4263@naver.com", PageContext.SESSION_SCOPE);

//application Scope에 속성 저장하기
application.setAttribute("applicationAttribute", "KH Information");
//pageContext.setAttribute("applicationAttribute", "KH Information", PageContext.APPLICATION_SCOPE);
 %>
<html>
<head>
<title>Scope Example</title>
</head>
<body>
<ul>
	<li>이름: <%=pageContext.getAttribute("pageAttribute") %>
	<li>전화: <%=request.getAttribute("requestAttribute") %>
	<li>이메일: <%=session.getAttribute("sessionAttribute") %>
	<li>회사: <%=application.getAttribute("applicationAttribute") %>
</ul>
</body>
</html>