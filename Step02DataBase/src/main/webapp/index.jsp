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
<title>index.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<%-- 
		/include/navbar.jsp 페이지에게 이 부분만 응답하도록 한다.
		
	--%>
	<!-- 
		include 되는 jsp 페이지에 파라미터를 전달할수도 있다.
		navbar.jsp 입장에서는 ?current=index 형식의 파라미터가 전달된 것이나 마찬가지이다.
	-->
					  <!-- 여기서 주소는 절대경로가 아닌 상대경로로 적는다 -->
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="current"/>
	</jsp:include>
	<div class="container-fluid">
		<h1 class="text-center mt-4">인덱스 페이지 입니다.</h1>
		<!-- jsp 페이지는 서버에서 해석되고 해석된 결과가 클라이언트에게 응답이된다!! -->
		<!-- context 경로는 서버에서 절대 경로가 필요할 때 작성하지만 아래와 달리 하드코딩을 하는 것은 좋지 않다 -->
	</div>
</body>
</html>