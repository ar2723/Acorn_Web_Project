<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>cafe/private/insertform.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>새글 작성 양식</h1>
		<form class="form" action="insert.jsp" method="post">
			<div>
				<label class="form-label" for="title">제목</label>
				<input class="form-control" type="text" name="title" id="title"/>
			</div>
			<div class="mb-2">
				<label class="form-label" for="contetn">내용</label>
				<textarea class="form-control" name="content" id="content" rows="10"></textarea>
			</div>
			<button class="btn btn-primary" type="submit">저장</button>
		</form>
	</div>
</body>
</html>