<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jquery/Step04_fotorama.jsp/title></title>
<!-- 플러그인 css -->
<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
</head>
<body>
	<div class="container">
	<h1>fotorama를 이용한 이미지 슬라이더 만들기</h1>
		<div class="fotorama"
			data-allowfullscreen="true"
			data-nav="thumbs"
			data-autoplay="true">
			<img data-caption="상품1" src="${pageContext.request.contextPath}/vue2/images/top01.jpg"/>
			<img data-caption="상품2" src="${pageContext.request.contextPath}/vue2/images/top02.jpg"/>
			<img data-caption="상품3" src="${pageContext.request.contextPath}/vue2/images/top03.jpg"/>
			<img data-caption="상품4" src="${pageContext.request.contextPath}/vue2/images/top04.jpg"/>
			<img data-caption="상품5" src="${pageContext.request.contextPath}/vue2/images/top05.jpg"/>
		</div>
	</div>
	<!-- jquery 로딩 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<!-- 플러그인 javascript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
</body>
</html>