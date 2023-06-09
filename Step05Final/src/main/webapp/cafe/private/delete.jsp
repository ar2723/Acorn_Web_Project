<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String id = (String)session.getAttribute("id");

	CafeDto dto = CafeDao.getInstance().getData(num);
	if(!dto.getWriter().equals(id)){
		//에러 응답하기
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "다른 사람의 게시물을 지울 수 없습니다!");
		//메소드를 여기서 끝내기
		return;
	}

	CafeDao.getInstance().delete(num);
	
	String cPath=request.getContextPath();
    response.sendRedirect(cPath+"/cafe/list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>