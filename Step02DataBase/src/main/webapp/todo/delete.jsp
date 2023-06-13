<%@page import="test.member.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	boolean isSuccess = TodoDao.getInstance().delete(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>알림</h1>
		<% if(isSuccess){ %>
		<p>
			<strong><%= num %></strong> 번 할일을 완료했습니다!. <a href="list.jsp">목록보기</a>
		</p>

		<% } else {%>
		<p>
			<strong><%= num %></strong> 번 목록 삭제에 실패했습니다. <a href="list.jsp">목록보기</a>
		</p>
		<% }%>
	</div>
</body>
</html>