<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jquery/hell0.jsp</title>

</head>
<body>
	<div class="container">
		<input type="text" id="inputMsg" placeholder="문자열 입력..."/>
		<button id="sendBtn">전송</button>
		<p id="result"></p>
		
	</div>
	<div>div1</div>
	<div class="my-class">div2</div>
	<div class="my-class">div3</div>
	<div id="one">div4</div>
	<!-- source에 명시된 주소의 스크립트를 로딩 -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
		// 위의 input 요소에 문자열을 입력하고 전송버튼을 누르면 
		//입력한 문자열을 p 요소의 innerText에 출력되도록 프로그래밍 해보세요.
		/*
		document.querySelector("#sendBtn").addEventListener("click", ()=>{
			document.querySelector("#result").innerText = 
			document.querySelector("#inputMsg").value;
		})
		*/
		
		// $() 함수는 위에서 로딩한 외부 스크립트에 미리 선언되어 있다.
		// = function $() {}, 함수의 이름의 $라고 이해하면 편하다.
		// $() 함수를 호출하면 jQuery의 고유한 기능이 포함된 배열이 리턴된다.
		// 그래서 원래 배열에는 .on() 이나 .val() 같은 메소드가 없음에도 불구하고 
		// jQuery에 의해 포함된 기능으로 사용할 수 있게 되는 것이다.
		$("#sendBtn").on("click", ()=>{
			const msg = $("#inputMsg").val();
			// jQuery에서 선언된 배열 메소드는 선택된 객체들에 대해 일괄작동 한다.
			// .text() 메소드를 호출한 뒤에 리턴되는 데이터는 메소드의 동작이 적용된 동일한 참조값의 배열이다.
			// 따라서 리턴되는 배열에 대한 또다른 메소드를 사용할 수 있고, 이렇게 chain 형태로 메소드를 사용하는 것이 가능하다.
			$("#result").text(msg);
		});
	</script>
</body>
</html>