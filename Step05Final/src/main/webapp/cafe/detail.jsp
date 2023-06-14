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
		<nav>
		  	<ol class="breadcrumb">
			    <li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
			    <li class="breadcrumb-item"><a href="list.jsp">Cafe</a></li>
			    <li class="breadcrumb-item active">Detail</li>
		  	</ol>
		</nav>
		<h3>글 상세보기</h3>
		<table class="table table-bordered table-striped">
			<tr>
				<th>글번호</th>
				<td><%=num%></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getWriter() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=dto.getTitle() %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=dto.getViewCount() %></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><%=dto.getRegdate() %></td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="content">
						<%=dto.getContent() %>
					</div>
				</td>
			</tr>
		</table>
		<%if(dto.getWriter().equals(id)) {%>
			<a class="btn btn-primary" href="private/updateform.jsp?num=<%=num%>">수정</a>
			<a class="btn btn-danger" href="javascript:" onclick="deleteConfirm()">삭제</a>
			<script>
				function deleteConfirm(){
					const isDelete = confirm("이 글을 삭제 하시겠습니까?");
					if(isDelete){
						location.href="private/delete.jsp?num=<%= num%>";
					}
				}
			</script>
		<%} %>
	</div>
</body>
</html>