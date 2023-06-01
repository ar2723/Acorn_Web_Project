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
		<!-- 
			파일 업로드 폼 작성법
			1. method = "post"
			2. enctype = "multipart/form-data"
			3. <input type = "file" />
			- enctype = "multipart/form-data" 가 설정한 폼을 전송하면
			폼전송된 내용을 추출할 때 HttpServletRequest 객체로 추출을 할 수 없다.
			MultipartRequest 객체를 이용해서 추출해야 한다. 
		 -->
		 <form action="upload.jsp" method="post" enctype="multipart/form-data">
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
</body>
</html>