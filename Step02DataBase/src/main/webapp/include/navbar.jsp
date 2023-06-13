<!-- 이곳은 navbar에 관련된 문자열만 응답하면 된다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 어두운색 계열의 navbar 배경색이면 data-bs-theme="dark" 속성을 추가한다 -->
<!-- navbar-expand-md 는 md 영역 이상에서만 navbar-collapse가 펼쳐지도록 한다. -->
<!-- nav 요소는 div 요소와 거의 동일하며 semantic markup이라는 점에서 차이가 있다. -->
<nav class="navbar bg-primary navbar-expand-md" data-bs-theme="dark">
	<div class="container-fluid">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/index.jsp"> <img
			src="https://www.acornacademy.co.kr/img/logo_gn.png" alt="Logo"
			width="140" height="24" class="d-inline-block align-text-top">
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarText">
			<span class="navbar-toggler-icon"></span>
		</button>
		<%
       			//어느 페이지에 포함되었는지 정보를 얻어오기
       			String current = request.getParameter("current"); //"index" or "member" or "todo" or "guest"
       		%>
		<div class="collapse navbar-collapse" id="navbarText">
			<ul class="navbar-nav me-auto">
				<li class="nav-item"><a id="member"
					class="nav-link <%= current.equals("member") ? "active" : "" %>"
					href="${pageContext.request.contextPath}/member/list.jsp">회원목록</a>
				</li>
				<li class="nav-item"><a id="todo"
					class="nav-link <%= current.equals("todo") ? "active" : "" %>"
					href="${pageContext.request.contextPath}/todo/list.jsp">Todo
						리스트</a></li>
				<li class="nav-item"><a id="guest"
					class="nav-link <%= current.equals("guest") ? "active" : "" %>"
					href="${pageContext.request.contextPath}/guest/list.jsp">방명록</a></li>
			</ul>
			<form class="d-flex">
				<input class="form-control me-2" type="search" placeholder="Search" />
				<button class="btn btn-info" type="submit">Search</button>
			</form>
			<span class="navbar-text ms-2" data-bs-theme="dark">Made by
				Jeong Se-yeong</span>
		</div>
	</div>
</nav>