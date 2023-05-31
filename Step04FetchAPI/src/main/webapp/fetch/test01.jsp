<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/fetch/test01.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<h1>fecth 함수 테스트</h1>
	<button id="myBtn">눌러보셈</button>
	<a href="${pageContext.request.contextPath}/index.jsp">눌러보셈</a>
	<script>
		document.querySelector("#myBtn").addEventListener("click", 
			()=>{
				//prompt 함수의 작업이 끝날 때까지 실행의 흐름이 여기에 멈추게 된다 - 리턴이 되지 않고 있다.
				//즉, 브라우저는 single thread 이기 때문에 여기에 흐름이 잡히게 되는 것이다.
				const msg = prompt("메세지 입력...");
				
				console.log("입력완료!");
				
				console.log("-----")
				
				//fetch 함수는 요청되는 페이지로의 전환없이 단순히 페이지에 대한 코드를 받아올 수 있다.
				//fetch 함수를 호출하면 promise 객체가 반환된다.
				//즉, 바로 아랫 줄의 함수를 호출하면 promise 타입 데이터가 리턴된다. (resolve() 함수가 내부적으로 호출된다.)
				fetch("${pageContext.request.contextPath}/index.jsp")
				.then(function(response){
					//아래의 리턴 값도 promise 타입이다. (resolve() 함수가 내부적으로 호출된다.)
					return response.text();
				})
				//여기서 data는 String type
				.then(function(data){
					console.log(data);
				})
				//fetch 함수의 경우에는 콜백함수를 호출하고 흐름을 잡지 않은 채로 바로 흐름이 다음으로 넘어가게 된다.
				//즉, 실행 순서를 보면 fetch 함수 호출 -> 콘솔 로그 호출 -> .then() 메소드들 처리 이렇게 넘어가며
				//이러한 실행의 흐름을 '비동기 처리'라고 한다.
				console.log("요청했습니다!")
		})
	</script>
</body>
</html>