<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/users/private/profile_uploadform.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<form class="form" action="upload.jsp" method="post" enctype="multipart/form-data">
		<label class="form-lable" for="image">이미지</label>
		<input class="form-control" type="file" name="image" id="image" accept=".jsp, .jpeg, .png, .gif, .JPG, .JPEG"/>
		<button class="btn btn-primary" type="submit">업로드</button>
	</form>
</body>
</html>