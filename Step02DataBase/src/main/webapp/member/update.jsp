<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//1. 폼 전송되는 수정할 회원의 정보를 얻어온다.
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	//2. DB에 수정 반영한다.
	MemberDto dto = new MemberDto();
	dto.setNum(num);
	dto.setName(name);
	dto.setAddr(addr);
	boolean isSuccess = MemberDao.getInstance().update(dto);
	//3. 결과를 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/member/update.jsp</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<!-- mt-5 : margin-top level 5 -->
	<div class="container mt-5">
		<h1>알림</h1>
		<%if(isSuccess){ %>
		<p class="alert alert-success">
			<strong><%=num %></strong> 번 회원의 정보를 수정했습니다! <a class="alert-Link"
				href="list.jsp">목록보기</a>
		</p>
		<%} else {%>
		<p class="alert alert-danger">
			회원정보 수정에 실패했습니다. <a class="alert-Link"
				href="updateform.jsp?num=<%= num %>">다시 수정</a>
		</p>

		<%} %>
	</div>
</body>
</html>