<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. GET 방식 파라미터로 전달하는 삭제할 파일의 글번호 읽어오기
	int num = Integer.parseInt(request.getParameter("num"));
	String id = (String)session.getAttribute("id");
	
	CafeDto dto = CafeDao.getInstance().getData(num);
	if(!dto.getWriter().equals(id)){
		//에러 응답하기
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "다른 사람의 게시물을 지울 수 없습니다!");
		//메소드를 여기서 끝내기
		return;
	}
	//2. DB에서 삭제하기
	CafeDao.getInstance().delete(num);
	//응답
	String cPath=request.getContextPath();
    response.sendRedirect(cPath+"/cafe/list.jsp");
%>