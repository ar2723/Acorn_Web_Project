<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	UsersDto dto = UsersDao.getInstance().getData(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/users/private/updateform.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<style>
	#profileImage{
		width:100px;
		height:100px;
		border: 1px soild #cecece;
		border-radius: 50%
	}
</style>
</head>
<body>
	<div class="container">
		<h1>회원 정보 수정 폼 입니다.</h1>
		<a id="profileLink" href="javascript:">
			<%if(dto.getProfile() == null){%>
	            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
	              <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
	              <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
	            </svg>
         	<%}else{ %>
            	<img id="profileImage" src="${pageContext.request.contextPath }<%=dto.getProfile()%>">
         	<%} %>
      	</a>
      
      	<form class="mb-2" action="update.jsp" method="post">
        <input type="hidden" name="profile" value="<%=dto.getProfile()==null ? "empty" : dto.getProfile()%>"/>
        <div>
           <label for="id">아이디</label>
           <input type="text" id="id" value="<%=dto.getId() %>" readonly/>
        </div>
        <div>
            <label for="email">이메일</label>
            <input type="text" id="email" name="email" value="<%=dto.getEmail()%>"/>
        </div>
        <button type="submit">수정확인</button>
        <button type="reset">취소</button>
      </form>   
      
      <form class="hidden" id="imageForm" action="profile_upload.jsp" method="post" enctype="multipart/form-data">
         프로필 사진
         <input type="file" id="image" name="image" accept=".jpg, .png, .gif, .JPG, .JPEG, .jpeg"/>
         <button type="submit">업로드</button>
      </form>
	</div>
	<script src="${pageContext.request.contextPath}/js/gura_util.js"></script>
	<script>
		//프로필 이미지 링크를 클릭하면
		document.querySelector("#profileLink").addEventListener("click", ()=>{
			// input type = "file" 요소를 강제 클릭해서 파일을 선택할 수 있는 창이 뜨게 한다.
			document.querySelector("#image").click()
		})
		//프로필 이미지를 선택하면(바뀌면) 실행할 함수 등록
		document.querySelector("#image").addEventListener("change", ()=>{
			//ajax 전송할 폼의 참조값 얻어오기
			const form = document.querySelector("#imageForm");
			ajaxFormPromise(form)
			.then(res => res.json())
			.then((data)=>{
				console.log(data);
				document.querySelector("input[name=profile]").value = data.imagePath;
				
				let img = `<img id="profileImage"
					src = "${pageContext.request.contextPath}\${data.imagePath}">`;
					document.querySelector("#profileLink").innerHTML= img;
			})
		});
	</script>
</body>
</html>