<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인된 아이디
	String id = (String)session.getAttribute("id");
	
	String realPath = application.getRealPath("/upload");
	MultipartRequest mr = new MultipartRequest( 
			request, // 내부적으로 필요한 HttpServletRequest 객체 전달
			realPath, //업로드된 파일을 저장할 경로
			1024*1023*100, //최대 업로드 사이즈 제한
			"utf-8", //한글 파일명 깨지지 않도록
			new DefaultFileRenamePolicy());
	//3. MultipartRequest 객체의 메소드를 이용해서 폼전송된 내용을 추출해야한다.
	String saveFileName = mr.getFilesystemName("image"); //저장된 파일명
	
	//4. DB에 저장할 이미지 경로 구성하기
	String imagePath = "/upload/"+saveFileName;
	//DB에 수정반영하고
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setProfile(imagePath);
	UsersDao.getInstance().updateProfile(dto);
	//리다이렉트 응답하기
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/users/private/info.jsp");
%>