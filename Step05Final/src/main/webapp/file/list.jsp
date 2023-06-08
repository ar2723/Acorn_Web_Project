<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("pageNum"));
	List<FileDto> list = FileDao.getInstance().getPagingList(num);
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/file/list.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<style>
	.wrapper{
		display: flex;
		justify-content: center;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>자료실 목록입니다.</h1>
		<div class ="text-end">
			<a href="${pageContext.request.contextPath}/file/private/upload_form.jsp">업로드하기</a>
			<br />
			<a href="${pageContext.request.contextPath}/file/private/upload_form2.jsp">ajax 업로드하기</a>
		</div>
		
		<table class="table table-striped table-hover">
			<thead class ="text-center">
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>등록일</th>
					<th></th>
				</tr>
			</thead>
			<tbody class ="text-center">
				<% for(FileDto tmp : list) {%>
					<tr>
						<td><%= tmp.getNum()%></td>
						<td><%= tmp.getWriter()%></td>
						<td><%= tmp.getTitle()%></td>
						<td>
							<a href="download.jsp?num=<%=tmp.getNum()%>"><%=tmp.getSaveFileName()%></a>
						</td>
						<td><%= tmp.getRegdate()%></td>
						<td>
							<!-- 글 작성자와 로그인된 아이디와 같을 때만 삭제 링크 출력하기 -->
							<%if(tmp.getWriter().equals(id)) {%>
								<a href="delete.jsp?num=<%=tmp.getNum()%>">삭제</a>
							<%} else %>
						</td>	
					</tr>
				<%} %>
			</tbody>
		</table>
		<div class="wrapper">
			<ul class="pagination">
				<%for(int i =1; i<=10; i++) {%>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a>
					</li>
				<%} %>
			</ul>
		</div>
	</div>
</body>
</html>