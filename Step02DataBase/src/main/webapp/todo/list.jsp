<%@page import="java.util.List"%>
<%@page import="test.member.dao.TodoDao"%>
<%@page import="test.member.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	List<TodoDto> list = TodoDao.getInstance().getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<p>
		<a href="/Step02DataBase/index.jsp">
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="green" class="bi bi-house-fill" viewBox="0 0 16 16">
  				<path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
  				<path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z"/>
			</svg>
		</a>
	</p>
	<div class="container">
		<h1>오늘 할일 목록</h1>
		<div class="text-end"> 
			<a href="inserttodo.jsp">
				<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="black" class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
  					<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
				</svg>
				<span class="visually-hidden">할일 추가하기</span>
			</a>
		</div>
		<table class="table table-dark table-striped">
			<thead>
				<tr>
				<th>번호</th>
				<th>할일</th>
				<th>중요도</th>
				<th>마감기간</th>
				<th>수정하기</th>
				<th>완료</th>
				</tr>
			</thead>
			<tbody>
				<% for(TodoDto tmp : list) {%>
					<tr>
						<td><%= tmp.getNum()%></td>
						<td><%= tmp.getList()%></td>
						<td><%= tmp.getImpo()%></td>
						<td><%= tmp.getDue()%></td>
						<td>
							<a href="updateform.jsp?=<%=tmp.getNum()%>">수정</a>
						</td>
						<td>
							<a href="delete.jsp?num=<%= tmp.getNum()%>">
								<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="white" class="bi bi-check-square-fill" viewBox="0 0 16 16">
  								<path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 1 .011 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.75.75 0 0 1 1.08-.022z"/>
								</svg>
								<span class="visually-hidden">할일 삭제하기</span>
							</a>
						</td>
					</tr>
				<% }%>
			</tbody>
		</table>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>