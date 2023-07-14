<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jquery/signup_form.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="signup" name="current"/>
	</jsp:include>
	<div class="container" id="app">
		<h3>회원 가입 폼 입니다.</h3>
		<form action="signup.jsp" method="post" id="signupForm">
         <div class="mb-2">
            <label class="control-label" for="id">아이디</label>
            <input class="form-control" type="text" name="id" id="id"/>
            <small class="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요</small>
            <div class="valid-feedback">사용 가능한 아이디 입니다.</div>
            <div class="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
         </div>
         
         <div class="mb-2">
            <label class="control-label" for="pwd">비밀번호</label>
            <input class="form-control" type="password" name="pwd" id="pwd"/>
            <small class="form-text text-muted">특수 문자를 하나 이상 조합하세요.</small>
            <div class="invalid-feedback">비밀 번호를 확인 하세요</div>
         </div>
         <div class="mb-2">
            <label class="control-label" for="pwd2">비밀번호 확인</label>
            <input class="form-control" type="password" name="pwd2" id="pwd2"/>
         </div>
      
         <div class="mb-2">
            <label class="control-label" for="email">이메일</label>
            <input class="form-control" type="text" name="email" id="email"/>
            <div class="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
         </div>
         <button class="btn btn-outline-primary" type="submit" disabled>가입</button>
      </form>
   </div>
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
   <script>
   
   		let isIdValid = false;
   		let isEmailValid = false;
   		let isPwdValid = false;
   		
   		function checkFormState(){
   			if(isIdValid && isEmailValid && isPwdValid){
   				$("button[type=submit]").removeAttr("disabled");
   			} else {
   				$("button[type=submit]").setAttr("disabled");
   			}
   		}
   		
   		// id 입력란에 입력을 했을 때 실행할 함수 등록
   		$("#id").on("input", (e)=>{
		   //입력한 아이디 읽어오기
		   const inputId = e.target.value;
		   //정규표현식
		   const reg = /^[a-z].{4,9}$/;
		   //정규표현식 통과 여부를 모델에 반영하기
		   isIdValid = reg.test(inputId);
		   //만일 유효하다면
		   if(isIdValid){
			   $(e.target).removeClass("is-invalid").addClass("is-valid");
		   } else { //유효하지 않다면
			   $(e.target).removeClass("is-valid").addClass("is-invalid")
		   }
		   checkFormState();
   		});
   		
   		$("#email").on("input", (e)=>{
   			//입력한 이메일 읽어오기
   			const inputEmail = $(e.target).val();
   			//정규표현식
			const reg = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
			//정규표현식 통과 여부를 모델에 반영하기
			isEmailValid = reg.test(inputEmail);
			//만일 유효하다면
			if(isEmailValid){
			   	$(e.target).removeClass("is-invalid").addClass("is-valid");
		   	} else { //유효하지 않다면
			   	$(e.target).removeClass("is-valid").addClass("is-invalid")
		   	}
			checkFormState();
   		});
   		
   		//비밀번호 입력란과 비밀번호 확인란에 입력했을 때 실행할 함수 등록(다중선택)
   		$("#pwd, #pwd2").on("input", ()=>{
   			//비밀번호 입력란과 비밀번호 확인란에 입력한 비밀번호를 모두 읽어온다.
   			const inputPwd = $("#pwd").val();
   			const inputPwd2 = $("#pwd2").val();
   			//특수문자가 포함되었는지 여부를 검증할 정규 표현식
			const reg = /[\W]/;
			//정규표현식도 통과하고 비밀번호 입력란과 확인란도 같은지 확인해서 비밀번호 유효성 여부에 반영
			isPwdValid = reg.test(inputPwd) && (inputPwd == inputPwd2);
			//만일 유효하다면
			if(isPwdValid){
			   	$("#pwd").removeClass("is-invalid").addClass("is-valid");
		   	} else { //유효하지 않다면
			   	$("#pwd").removeClass("is-valid").addClass("is-invalid")
		   	}
			checkFormState();
   		});
   		
   		/*
	   new Vue({
		   el:"#app",
		   data:{
			   isIdValid:false,
			   //아이디 입력란에 한번이라도 입력되었는지를 관리
			   isIdDirty:false,
			   isEmailValid: false,
			   isEmailDirty:false,
			   isPwdValid:false,
			   isPwdDirty:false,
			   pwd: "",
			   pwd2: ""
		   },
		   methods:{
			   onIdInput(e){
				   //아이디를 입력란에 한번이라도 입력하면 isDirty 값을 true로 바꿔준다.
				   this.isIdDirty=true;
				   //입력한 아이디 읽어오기
				   const inputId = e.target.value;
				   //정규표현식
				   const reg = /^[a-z].{4,9}$/;
				   //정규표현식 통과 여부를 모델에 반영하기
				   this.isIdValid = reg.test(inputId);
			   },
			   onEmailInput(e){
				   this.isEmailDirty=true;
				   const inputEmail = e.target.value;
				   const reg = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
				   this.isEmailValid = reg.test(inputEmail);
			   },
			   onPwdInput(){
				   this.isPwdDirty=true;
				   //특수문자가 포함되었는지 여부를 검증할 정규 표현식
				   const reg = /[\W]/;
				   //정규표현식도 통과하고 비밀번호 입력란과 확인란도 같은지 확인해서 비밀번호 유효성 여부에 반영
				   this.isPwdValid = reg.test(this.pwd) && (this.pwd == this.pwd2);
			   }
		   },
		   computed:{
			   
		   }
	   });
   		*/
   		
   </script>
</body>
</html>