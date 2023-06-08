<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-2">
		<h1 class="text-center">비밀번호 수정</h1>
		<form class="form" action="pwd_update.jsp" method="post" id="myForm">
			<div class="mb-3">
				<label class="form-lable" for="id">아이디</label>
				<input class="form-control" type="text" name="id" id="id" value=<%=id%> readonly/>
			</div>
			<div class="mb-3">
				<label class="form-lable" for="currentPwd">현재 비밀번호 입력</label>
				<input class="form-control" type="password" name="currentPwd" id="currentPwd"/>
			</div>
			<div class="mb-3">
				<label class="form-lable" for="changePwd">새 비밀번호 입력</label>
				<input class="form-control" type="password" name="changePwd" id="changePwd1"/>
			</div>
			<div class="mb-3">
				<label class="form-lable" for="changePwd">새 비밀번호 확인</label>
				<input class="form-control" type="password" name="changePwd" id="changePwd2"/>
			</div>
			<!-- form에 submit 버튼을 누르면  -->
			<button class="btn btn-outline-primary" type="submit">확인</button>
			<button class="btn btn-outline-secondary" type="reset">리셋</button>
		</form>
	</div>
	<script>
		//폼에 submit 이벤트가 일어났을때 실행할 함수를 등록하고
		document.querySelector("#myForm").addEventListener("submit", (e)=>{
			//입력한 새 비밀번호 2개를 읽어와서
			let pwd1 = document.querySelector("#changePwd1").value;
			let pwd2 = document.querySelector("#changePwd2").value;
			//만일 새 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
			if(pwd1 != pwd2){
				alert("새 비밀번호가 일치하지 않습니다!");
				e.preventDefault();
			}
		})
	</script>
</body>
</html>