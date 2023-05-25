<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//MemberDao 객체의 참조값 얻어오기
	MemberDao dao = MemberDao.getInstance();
	//회원 목록 얻어오기
	List<MemberDto> list = dao.getList();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/member/list.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="member" name="current"/>
	</jsp:include>
	<div class="container-fluid">
		<h1>회원 목록입니다.</h1>
		<div class="text-end"> 
			<a href="insertform.jsp">
				<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
  					<path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
  					<path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
				</svg>
				<span class="visually-hidden">회원추가</span>
			</a>
		</div>
		<table class="table table-dark table-striped">
			<thead>
				<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>수정</th>
				<th>삭제하기</th>
				</tr>
			</thead>
			<tbody>
				<% for(MemberDto tmp : list) {%>
					<tr>
						<td><%= tmp.getNum()%></td>
						<td><%= tmp.getName()%></td>
						<td><%= tmp.getAddr()%></td>
						<th>
							<a href="updateform.jsp?num=<%= tmp.getNum()%>">수정</a>
						</th>
						<td>
							<a href="delete.jsp?num=<%= tmp.getNum()%>">
								<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-x-fill" viewBox="0 0 16 16">
  								<path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6.146-2.854a.5.5 0 0 1 .708 0L14 6.293l1.146-1.147a.5.5 0 0 1 .708.708L14.707 7l1.147 1.146a.5.5 0 0 1-.708.708L14 7.707l-1.146 1.147a.5.5 0 0 1-.708-.708L13.293 7l-1.147-1.146a.5.5 0 0 1 0-.708z"/>
								</svg>
								<span class="visually-hidden">정보 삭제하기</span>
							</a>
						</td>
					</tr>
				<% }%>
			</tbody>
		</table>
		
	</div>
	
</body>
</html>