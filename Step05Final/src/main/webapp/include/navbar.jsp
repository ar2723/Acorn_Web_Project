<!-- 이곳은 navbar에 관련된 문자열만 응답하면 된다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- 어두운색 계열의 navbar 배경색이면 data-bs-theme="dark" 속성을 추가한다 -->
	<!-- navbar-expand-md 는 md 영역 이상에서만 navbar-collapse가 펼쳐지도록 한다. -->
	<nav class="navbar bg-secondary navbar-expand-md" data-bs-theme="dark">
		<div class="container-fluid">
       		<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
         		<img src="https://www.acornacademy.co.kr/img/logo_gn.png" alt="Logo" width="140" height="24" class="d-inline-block align-text-top">
       		</a>
       		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText">
            	<span class="navbar-toggler-icon"></span>
       		</button>
       		<div class="collapse navbar-collapse" id="navbarText">
	            <ul class="navbar-nav ms-auto">
	              <li class="nav-item">
	                   <a id="signup" class="nav-link" href="${pageContext.request.contextPath}/users/signup_form.jsp">회원가입</a>
	              </li>
	              <li class="nav-item">
	                   <a id="login" class="nav-link" href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>
	              </li>
	            </ul>
       		</div>
     	</div>
   	</nav>