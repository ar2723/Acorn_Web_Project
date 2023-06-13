<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>할일 추가하기</h1>
		<form action="insert.jsp" method="get">
			<div class="mb-1">
				<label for="num" class="form-label">번호</label> <input type="text"
					name="num" class="form-control" id="num" />
			</div>
			<div class="mb-1">
				<label for="list" class="form-label">할일</label> <input type="text"
					name="list" class="form-control" id="list" />
			</div>
			<div class="mb-1">
				<label for="impo" class="form-label">중요도</label> <input type="text"
					name="impo" class="form-control" id="impo" />
			</div>
			<div class="mb-1">
				<label for="due" class="form-label">마감기간</label> <input type="text"
					name="due" class="form-control" id="due" />
			</div>
			<button type="submit" class="btn btn-success">추가</button>
		</form>
	</div>
</body>
</html>