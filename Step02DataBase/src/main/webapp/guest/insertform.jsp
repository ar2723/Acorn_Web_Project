<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/insertform.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1 class="text-center mt-4">방명록 작성하기</h1>
		<form action="insert.jsp" method ="post">
			<div class="mb-1">
				<label for="writer" class="form-label">작성자</label>
				<input type="text" name ="writer" class="form-control" id ="writer"/>
			</div>
			<div class="mb-1">
				<label for="content" class="form-label">내용</label>
				<textarea class="form-control" id="content" name="content" cols="30" rows="5"></textarea>
			</div>
			<div class="mb-1">
				<label for="pwd" class="form-label">비밀번호</label>
				<input type="text" name ="pwd" class="form-control" id ="pwd"/>
			</div>
			<button type="submit" class="btn btn-success">등록</button>
			<a href="list.jsp" class="btn btn-primary">돌아가기</a>
		</form>
	</div>
</body>
</html>