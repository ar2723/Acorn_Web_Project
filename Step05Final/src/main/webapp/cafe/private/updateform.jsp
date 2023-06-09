<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	int num = Integer.parseInt(request.getParameter("num"));
	CafeDto dto = CafeDao.getInstance().getData(num);
	int viewCount = dto.getViewCount() + 1;
	CafeDao.getInstance().addViewCount(num, viewCount);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>cafe/private/updateform.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>글보기</h1>
		<form class="form" action="update.jsp" method="post">
			<div>
				<label class="form-label" for="title">제목</label>
				<input class="form-control" type="text" name="title" id="title" value="<%= dto.getTitle() %>" <%= dto.getWriter().equals(id) ? "" : "readonly"%>/>
			</div>
			<div class="mb-2">
				<label class="form-label" for="content">내용</label>
				<textarea class="form-control" name="content" id="content" rows="10" <%= dto.getWriter().equals(id) ? "" : "readonly"%>><%= dto.getContent() %></textarea>
			</div>
			<%if(dto.getWriter().equals(id)) {%>
				<div>
					<button class="btn btn-primary" type="submit">수정(저장)</button>
					<button class="btn btn-secondary" type="reset">리셋</button>
					<a class="btn btn-danger" href="delete.jsp?num=<%= num%>">삭제</a>
				</div>
			<%} %>
		</form>
	</div>
</body>
</html>