<%@page import="java.text.SimpleDateFormat"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
List<GuestDto> list = GuestDao.getInstance().getList();

SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");

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
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="black" class="bi bi-house-fill" viewBox="0 0 16 16">
  				<path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
  				<path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z"/>
			</svg>
		</a>
	</p>
	<div class="container">
		<h1 class="text-center">방명록</h1>
		<div class="text-end"> 
			<a href="insertform.jsp">
				<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="black" class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
  					<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
				</svg>
				<span class="visually-hidden">글쓰기</span>
			</a>
		</div>
		<table class="table table-striped table-hover">
			<thead class ="text-center">
				<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>내용</th>
				<th>작성날짜</th>
				<th>수정하기</th>
				<th>삭제하기</th>
				</tr>
			</thead>
			<tbody class ="text-center">
				<% for(GuestDto tmp : list) {%>
					<tr>
						<td><%= tmp.getNum()%></td>
						<td><%= tmp.getWriter()%></td>
						<td><%= tmp.getContent()%></td>
						<td><%= tmp.getDate()%></td>
						<td>
							<a href="updateform.jsp?num=<%=tmp.getNum()%>">수정</a>
						</td>
						<td>
							<a href="deleteform.jsp?num=<%= tmp.getNum()%>">
								<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="black" class="bi bi-x-square-fill" viewBox="0 0 16 16">
  									<path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm3.354 4.646L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 1 1 .708-.708z"/>
								</svg>
								<span class="visually-hidden">삭제하기</span>
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