<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jquery/Step03_effect3.jsp</title>
<style>
	.box{
		width: 100px;
		height: 100px;
		background-color: yellow;
		border: 1px solid red;
	}
	.box2{
		width: 100px;
		height: 100px;
		background-color: yellow;
		border: 1px solid red;
		/* transition 효과를 줄 수 있는 모든(all) css 속성에 대해서 1초(1s) 동안 
		   일정한 비율(linear)로 적용을 시키라는 의미
		*/
		transition: all 1s linear;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
</head>
<body>
	<button id="hideBtn">숨기기</button>
	<button id="showBtn">보이기</button>
	<button id="toggleBtn">토글</button>
	<button id="moveBtn">움직이기</button>
	<button id="moveBtn2">움직이기2</button>
	<button id="moveBtn3">움직이기3</button>
	<div class="box"></div>
	<div class="box2"></div>
	<script>
		$("#moveBtn").on("click", ()=>{
			let mleft = 0;
			// 10/1000초마다 한번식 호출되는 함수 안에서 .box를 움직이기
			let seq = setInterval(()=>{
				mleft += 100/100;
				$(".box").css("margin-left", mleft + "px")
				if(mleft == 100){
					//인터벌의 순서값(sequence) 값을 이용해서 취소한다.
					clearInterval(seq);
				}
			}, 10);
		});
		
		//위의 스크립트를 아래와 같이 간단하게 작성할 수 있다.
		$("#moveBtn2").on("click", ()=>{
				$(".box").animate({
					"margin-left": "+=100px"
				}, 1000)
		});
		
		$("#moveBtn3").on("click", ()=>{
			//$(".box2").css("margin-left", "100px")
			document.querySelector(".box2").style.marginLeft = "100px";
		});
		
		$("#hideBtn").on("click", ()=>{
			$(".box").fadeOut(1000, function(){
				alert("짜잔");
			});
		})
		$("#showBtn").on("click", ()=>{
			$(".box").fadeIn({
				duration:2000,
				complete:function(){
					alert("짜잔");
				}
			});
		})
		$("#toggleBtn").on("click", ()=>{
			$(".box").fadeToggle();
		})
	</script>
</body>
</html>