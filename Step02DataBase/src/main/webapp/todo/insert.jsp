<%@page import="test.member.dto.TodoDto"%>
<%@page import="test.member.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 	
	int num = Integer.parseInt(request.getParameter("num"));
	String list = request.getParameter("list");
	String impo = request.getParameter("impo");
	String due = request.getParameter("due");
	TodoDto dto = new TodoDto();
	dto.setNum(num);
	dto.setList(list);
	dto.setImpo(impo);
	dto.setDue(due);
	
	boolean isSuccess = TodoDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>알림</h1>
		<%if(isSuccess){ %>
		<p>
			할일이 성공적으로 추가 되었습니다! <a href="list.jsp">확인하기</a>
		</p>
		<%} else {%>
		<p>
			할일 목록 추가 실패! <a href="inserttodo.jsp">다시 작성하기</a>
		</p>
		<%} %>
	</div>
</body>
</html>