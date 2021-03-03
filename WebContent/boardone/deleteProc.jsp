<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "boardone.BoardDAO" %>
<%@ page import = "boardone.BoardVO" %>
<%@ page import = "java.sql.Timestamp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String pass = request.getParameter("pass");
	BoardDAO dbPro = BoardDAO.getInstance();
	int check = dbPro.deleteArticle(num, pass);
	if(check == 1) {
%>
	<meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum %>">
<% }else { %>
	<script language="javascript">
	<!--
		alert("비밀번호를 확인해주세요.");
		history.go(-1);
	-->
	</script>
<% } %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>