<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Enumeration" %>
<%@ page import = "java.util.Map" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<title>요청 파라미터 출력</title>
</head>
<body>
<b>request.getParameter() 메서드 사용</b><br></br>
name 파라미터 = <%= request.getParameterValues("name") %><br></br>
address 파라미터 = <%= request.getParameter("address") %>
<br></br><br></br>
<b>request.getParameterValues() 메서드 사용</b><br></br>
<%
	String[] values =request.getParameterValues("pet");
	if (values != null) {
		for(int i = 0; i < values.length; i++) {
%>
	<%= values[i] %>
<%		}
	}
%>
<br></br><br></br>
<b>request.getParameterNames() 메서드 사용</b><br></br>
<%
	Enumeration enumData = request.getParameterNames();
	while(enumData.hasMoreElements()) {
		String name = (String)enumData.nextElement();
%>
	<%=name %>
<%
	}
%>
<br></br><br></br>
<b>request.getParameterMap() 메서드 사용</b><br></br>
<%
	Map parameterMap = request.getParameterMap();
	String[] nameParam = (String[])parameterMap.get("name");
	if(nameParam != null) {
%>
name = <%= nameParam[0] %>
<%
	}
%>
</body>
</html>