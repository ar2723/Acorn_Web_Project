<%@page import="test.guest.dto.GuestDto"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 	
	//1. 수정할 회원의 번호를 얻어낸다
	int num = Integer.parseInt(request.getParameter("num"));
	//2. 번호를 이용해서 DB에 저장된 수정할 회원의 정보를 얻어낸다.
	GuestDto dto = GuestDao.getInstance().getData(num);
	//3. 수정할 양식을 클라이언트에게 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/updateform.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-3">
		<h2 class="text-center mt-4">작성 글 수정</h2>
		<form action="update.jsp" method="post">
			<div class="mb-1">
				<label class="form-label" for="num">글 번호</label>
				<input class="form-control-plaintext" type="text" id="num" name="num" value="<%= dto.getNum() %>" readonly/>
			</div>
			<div class="mb-1">
				<label class="form-label" for="writer">작성자</label>
				<input class="form-control" type="text" id="writer" name="writer" value="<%= dto.getWriter() %>"/>
			</div>
			<div class="mb-1">
				<label class="form-label" for="content">수정할 내용</label>
				<textarea class="form-control" id="content" name="content"><%= dto.getContent() %></textarea>
			</div>
			<div class="mb-1">
				<label class="form-label" for="pwd">비밀번호 입력</label>
				<input class="form-control" type="text" id="pwd" name="pwd"/>
			</div>
			<button class="btn btn-dark" type="submit">수정확인</button>
			<button class="btn btn-warning" type="reset">취소</button>
			<a href="list.jsp" class="btn btn-primary">돌아가기</a>
		</form>
	</div>
</body>
</html>