<%@page import="test.guest.dto.GuestDto"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String pwd = request.getParameter("pwd");
	//2. DB에서 삭제하고
	GuestDao dao = GuestDao.getInstance();
	GuestDto dto = dao.getData(num);
	boolean isSuccess;
	if(pwd.equals(dto.getPwd())){
		dao.delete(num);
		isSuccess = true;
	} else {
		isSuccess = false;
	}
	
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Document</title>
</head>
<body>
	<%if(isSuccess) {%>
	<% 
			//context 경로 얻어내기 (context 경로는 추후에 수정되거나 제거될 예정이기 때문에 메소드로 얻어낸다)
			String cPath = request.getContextPath();
			//리다이렉트 응답하기
			response.sendRedirect(cPath+"/guest/list.jsp");
		%>
	<%} else {%>
	<script>
			alert("비밀번호가 일치하지 않습니다");
			location.href="${pageContext.request.contextPath}/guest/deleteform.jsp?num=<%=dto.getNum()%>";
		</script>
	<%} %>
</body>
</html>