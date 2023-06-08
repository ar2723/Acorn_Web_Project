<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//1. 삭제할 파일의 번호
	int num = Integer.parseInt(request.getParameter("num"));
	//2.삭제할 파일의 정보를 DB에서 읽어오기	
	FileDto dto=FileDao.getInstance().getData(num);
	
	//로그인된 아이디와 글의 작성자가 일치하는지 확인하기
	String id = (String)session.getAttribute("id");
	if(!dto.getWriter().equals(id)){
		//에러 응답하기
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "다른 사람의 파일을 지울 수 없습니다!");
		//메소드를 여기서 끝내기
		return;
	}
	//3. 파일 시스템에서 삭제한다. (web/upload 폴더에서 해당 파일을 삭제)
	String saveFileName = dto.getSaveFileName();
    String path=application.getRealPath("/upload") + File.separator + saveFileName;
    File file = new File(path);
    boolean deleteSuccess = file.delete();
    
    //4. DB에서 해당 파일의 정보를 삭제한다.
    boolean isSuccess = false;
    if(deleteSuccess){
    	isSuccess = FileDao.getInstance().delete(num);
    }
    
    //5. 응답한다.
    String cPath=request.getContextPath();
    response.sendRedirect(cPath+"/file/list.jsp"); // 파일 목록보기로 다시 리다이렉트 이동시킨다.
%>