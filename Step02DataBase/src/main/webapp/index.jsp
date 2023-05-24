<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//DB 연동 가능한지 테스트
	//new DbcpBean(); //객체 생성했을 때 예외가 발생하지 않고, "Connection 얻어오기 성공!"이 뜨면 DB가 연동이 된 것이다.
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
	<div class="container">
		<h1>인덱스 페이지 입니다.</h1>
		<ul class="list-group">
			<li class="list-group-item list-group-item-action"><a href="member/list.jsp">회원 목록보기</a></li>
			<li class="list-group-item list-group-item-action"><a href="todo/list.jsp">할일 목록보기</a></li>
			<li class="list-group-item list-group-item-action"><a href="guest/list.jsp">방명록 보기</a></li>
		</ul>
	</div>
</body>
</html>