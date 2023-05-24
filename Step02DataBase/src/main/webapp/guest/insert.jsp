<%@page import="test.guest.dto.GuestDto"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//요청 인코딩 설정(한글 깨지지 않도록)
	request.setCharacterEncoding("utf-8");
	//요청 파라미터 추출
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	
	//MemberDao 객체의 참조값 얻어오기
	GuestDao dao = GuestDao.getInstance();
	GuestDto dto = new GuestDto();
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setPwd(pwd);

	boolean isSuccess = dao.insert(dto);
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
<div class="container mt-5">
		<h1>알림</h1>
		<%if(isSuccess){ %>
			<p class="alert alert-success">
			<strong><%=writer %></strong> 님의 글이 추가되었습니다.
			<a class="alert-Link" href="list.jsp">확인</a>
			</p>
		<%} else {%>
			<p class="alert alert-danger">
				글 작성 실패 ㅠㅠ
				<a class="alert-Link" href="insertform.jsp">다시 작성하기</a>
			</p>
		<%} %>
	</div>
</body>
</html>