<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/fetch/test06.jsp</title>
</head>
<body>
	<button id="moreBtn">더보기</button>
	<ul id="msgList">
		<li>하나</li>
		<li>두울</li>
		<li>세엣</li>
	</ul>
	<script>
		document.querySelector("#moreBtn").addEventListener("click", 
			() => {
													//서버에서 응답한 문자열에 json 형식이면 res.json() 으로 바꿔준다.
													//즉, JSON.parse를 따로 해줄 필요가 없다는 것이다.
				fetch("get_msg2.jsp").then((res) => res.json())
				.then((data) => {
					//data는 ["어쩌구", "저쩌구", "이렇쿵"] 형식의 '실제 배열'이다.
					console.log(data);
					//반복문 돌면서
					for(let i = 0; i < data.length; i++){
						//backtick을 활용해서 li 안에 메세지를 출력하고
						let li = `<li>\${data[i]}</li>`;
						//ul 요소가 끝나기 직전에 HTML로 평가해서 추가하기
						document.querySelector("#msgList").insertAdjacentHTML("beforeend", li);
					}
				})
				.catch((err)=>{
					console.log(err);
				});
			})
	</script>
</body>
</html>