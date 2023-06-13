<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//글 작성자 얻어내기
	String id = (String)session.getAttribute("id");

	//폼 전송되는 title, content 읽어내기
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//CafeDto에 담기
	CafeDto dto = new CafeDto();
	dto.setWriter(id);
	dto.setTitle(title);
	dto.setContent(content);
	
	//DB에 저장하기
	boolean isSuccess = CafeDao.getInstance().insert(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/cafe/private/insert.jsp</title>
</head>
<body>
	<script>
		<%if(isSuccess){ %>
			//알림창 띄우기
			alert("글을 성공적으로 등록 했습니다.");
			//javscript로 페이지 이동
			location.href ="${pageContext.request.contextPath}/cafe/list.jsp";
		<%} else {%>
			alert("등록 실패!");
			location.href ="${pageContext.request.contextPath}/cafe/private/insertform.jsp";
		<%} %>
	</script>
</body>
</html>