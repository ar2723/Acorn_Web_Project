<%@page import="test.guest.dto.GuestDto"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	//2. DB에서 삭제하고
	GuestDao dao = GuestDao.getInstance();
	GuestDto dto = dao.getData(num);
	dto.setWriter(writer);
	dto.setContent(content);
	boolean isSuccess;
	if(pwd.equals(dto.getPwd())){
		dao.update(dto);
		isSuccess = true;
	} else {
		isSuccess = false;
	}
	//context 경로 얻어내기 (context 경로는 추후에 수정되거나 제거될 예정이기 때문에 메소드로 얻어낸다)
	String cPath = request.getContextPath();
	//리다이렉트 응답하기
	response.sendRedirect(cPath+"/guest/list.jsp");
%>