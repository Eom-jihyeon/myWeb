<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>autoFlash 속성값 false 예제</title></head>
<body>
<!-- 이부분에서 4KB 이상의 데이터가 발생 -->
<%  for(int i = 0; i < 1000; i++) { %>
1234
<% } %>
</body>
</html>