<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>서버 정보 출력</title>
</head>
<body>
서버 정보: <%=application.getServerInfo() %><br></br>
서블릿 규약 메이저 버전:
	<%= application.getMajorVersion() %><br></br>
</body>
</html>