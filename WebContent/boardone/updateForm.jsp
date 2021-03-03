<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "boardone.BoardDAO"  %>
<%@ page import = "boardone.BoardVO"  %>
<%@ include file="view/color.jsp" %>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language = "javascript" src="script1.js"></script>
</head>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	try{
		BoardDAO dbPro = BoardDAO.getInstance();
		BoardVO article = dbPro.updateGetArticle(num);
%>
<body bgcolor="<%=bodyback_c %>">
<center><b>글수정</b>
<br>
<form method="post" name="writeform" action="updateProc.jsp?pageNum=<%=pageNum %>" onsubmit="return writeSave()">
<table width="400" border="1" cellspacing="0" cellpadding="0" bgcolor="<%=bodyback_c%>" align="center">
	<tr>
		<td width="70" bgcolor="<%=value_c %>" align="center">이   름</td>
		<td align="left" width="330">
		<input type="text" size="10" maxlength="10" name="writer" value="<%=article.getWriter() %>">
		<input type="hidden" name="num" value="<%=article.getNum() %>"></td>
	</tr>
	<tr>
		<td width="70" bgcolor="<%=value_c %>" align="center">제   목</td>
		<td align="left" width="330">
		<input type="text" size="40" maxlength="30" name="subject" value="<%=article.getSubject() %>"></td>
	</tr>
	<tr>
		<td width="70" bgcolor="<%=value_c %>" align="center">Email</td>
		<td align="left" width="330">
		<input type="text" size="40" maxlength="30" name="email" value="<%=article.getEmail() %>"></td>
	</tr>
	<tr>
		<td width="70" bgcolor="<%=value_c %>" align="center">내   용</td>
		<td align="left" width="330">
		<textarea name="content" rows="13" cols="40">
			<%=article.getContent() %></textarea></td>
	</tr>
	<tr>
		<td width="70" bgcolor="<%=value_c %>" align="center">비밀번호</td>
		<td align="left" width="330">
		<input type="text" size="8" maxlength="12" name="pass"></td>
	</tr>
	<tr>
		<td colspan="2" bgcolor="<%=value_c %>" align="center">
			<input type="submit" value="글수정">
			<input type="submit" value="다시 작성">
			<input type="submit" value="목록 보기" onClick="document.location.href='list.jsp?pageNum=<%=pageNum %>'">
		</td>
	</tr>
</table>
</form>
</center>
<% }catch(Exception e) {} %>
</body>
</html>