<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bufferSize = out.getBufferSize();
	int remainSize = out.getRemaining();
	int usedSize = bufferSize-remainSize;
%>
<html>
<head>
</head>
<body>
버퍼 전체 크기: <%=bufferSize%><br></br>
사용한 버퍼 크기: <%=usedSize %><br></br>
남은 버퍼: <%=remainSize %> byte<br></br>
</body>
</html>