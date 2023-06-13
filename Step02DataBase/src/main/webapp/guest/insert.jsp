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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<!-- 이 주석은 웹브라우저에게 출력되지만 웹브라우저가 무시하는 주석 -->
	<%-- 이 주석은 jsp 페이지가 무시하는 주석(웹브라우저에 출력도지 않는다) --%>
	<%-- 
		javascript 응답하기 
		여기 출력된 문자열은 클라이언트가 javascript로 해석을 하기 때문에
		javascript 문법에 어긋나면 안된다.
	--%>
	<script>
		<%if(isSuccess){ %>
			//알림창 띄우기
			alert("글을 성공적으로 등록 했습니다.");
			//javscript로 페이지 이동
			location.href ="${pageContext.request.contextPath}/guest/list.jsp";
		<%} else {%>
			alert("등록 실패!");
			location.href ="${pageContext.request.contextPath}/guest/insertform.jsp";
		<%} %>
	</script>
</body>
</html>