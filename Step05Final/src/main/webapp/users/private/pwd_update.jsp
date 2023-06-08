<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope에서 수정할 회원의 아이디를 읽어온다.
	String id = (String)session.getAttribute("id");
	//폼 전송되는 구 비밀번호, 새 비밀번호 읽어오기
	String Pwd = request.getParameter("currentPwd");
	String changePwd = request.getParameter("changePwd");
	
	//작업의 성공여부
	boolean isSuccess = false;
	
	//현재 비밀번호 얻어오기
	String currentPwd = UsersDao.getInstance().getData(id).getPwd();
	//만일 현재 비밀번호하고 입력한 비밀번호와 같으면
	if(currentPwd.equals(Pwd)){
		//수정작업을 수행하고 
		isSuccess = UsersDao.getInstance().updatePwd(id, changePwd);
	} 
	if(isSuccess){
		//로그아웃을 한다.
		session.removeAttribute("id");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/users/private/pwd_update.jsp</title>
</head>
<body>
	<%if(isSuccess) {%>
		<p>
			비밀번호를 수정하고 로그아웃 되었습니다.
			<a href="${pageContext.request.contextPath}/users/loginform.jsp">다시 로그인</a>
		</p>
	<%} else {%>
		<p>
			기존 비밀번호가 일치하지 않습니다.
			<a href="${pageContext.request.contextPath}/users/private/pwd_updateform.jsp">다시 시도</a>
		</p>
	<%} %>
</body>
</html>