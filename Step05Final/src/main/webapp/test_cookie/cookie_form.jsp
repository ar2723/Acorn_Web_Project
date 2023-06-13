<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/cookie_form.jsp</title>
</head>
<body>
<h1>쿠키 테스트</h1>
<p>
	클라이언트의 웹브라우저에 특정 key 값으로 문자열을 저장할수 있다.
	저장할수 있는 문자열은 Base64 인코딩 형식의 64가지 문자열을 저장할수 있다.
	웹브라우저에 저장되어 있는 쿠키 목록은 별도로 요청하지 않아도 자동으로 모두 전달하게 된다.
	이러한 쿠키 기능을 활용하면 쇼핑몰의 장바구니 같은 기능을 구현할 수 있다.
</p>
<form action="cookie_save.jsp" method="post">
	<label for="msg">웹브라우저(client side)에 저장할 문자열 </label>
	<input type="text" name="msg" id="msg"/>
	<button type="submit">저장</button>
</form>
</body>
</html>








