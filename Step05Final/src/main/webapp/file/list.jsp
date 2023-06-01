<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<FileDto> list = FileDao.getInstance().getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/file/list.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>자료실 목록입니다.</h1>
		<div class ="text-end">
			<a href="${pageContext.request.contextPath}/file/private/upload_form.jsp">업로드하기</a>
		</div>
		
		<table class="table table-striped table-hover">
			<thead class ="text-center">
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody class ="text-center">
				<% for(FileDto tmp : list) {%>
					<tr>
						<td><%= tmp.getNum()%></td>
						<td><%= tmp.getWriter()%></td>
						<td><%= tmp.getTitle()%></td>
						<td><%= tmp.getSaveFileName()%></td>
						<td><%= tmp.getRegdate()%></td>
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>