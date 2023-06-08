<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/file/private/upload_form.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h3>파일 업로드 폼입니다.</h3>
		 <form action="upload2.jsp" method="post" enctype="multipart/form-data" id="myForm">
		 	<div class="mb-2">
		 		<label class= "form-lable" for="title">제목</label>
		 		<input class= "form-control" type="text" name="title" id="title"/>
		 	</div>
		 	<div class="mb-2">
		 		<label class= "form-lable" for="myFile"> 첨부파일</label>
		 		<input class= "form-control" type="file" name="myFile" id="myFile"/>
		 	</div>
		 	<button class="btn btn-primary" type="submit">업로드</button>
		 </form>
	</div>
	<script src="${pageContext.request.contextPath}/js/gura_util.js"></script>
	<script>
		//폼에 "submit 이벤트가 일어났을 때 실행할 함수 등록
		document.querySelector("#myForm").addEventListener("submit", (e)=>{
			//폼 전송 막기
			e.preventDefault();
			//폼에 입력하거나 선택한 정보를 자바스크립트로 직접 전송하기
			//폼에 입력한 데이터를 FormData에 담고
			let data = new FormData(e.target); //e.target은 form의 참조값이다.
			//fetch() 함수가 리턴하는 Promise 객체
			/*
				fetch("upload2.jsp", {
				method:"post",
				body:data
			})
						 //text -> json = 자동으로 JSON.parse() 처리를 해준다.
			.then(res => res.json())
			.then((data) => {
				//data는 upload2.jsp 페이지가 응답한 JSON 형식의 문자열이다.
				console.log(data);
				//JSON.parse() 함수를 이용해서 문자열을 실제 object or array로 변환할 수 있다.
				//const result = JSON.parse(data);
				//result는 object
			})
			*/
			
			//gura.util.js
			ajaxFormPromise(e.target)
			.then(res => res.json())
			.then((data) => {
				//data object이다
				console.log(data)
			})
		})
	</script>
</body>
</html>