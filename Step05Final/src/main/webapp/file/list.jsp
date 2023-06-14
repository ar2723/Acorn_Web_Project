<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT = 5;

	//하단페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT = 2;
	
	//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	int pageNum = 1;
			
	//페이지 번호를 파라미터로 전달되는지 읽어와보고, 숫자 타입으로 바꿔서 보여줄 페이지 번호로 지정
	String strNum = request.getParameter("pageNum");
			
	if(strNum != null){
		pageNum = Integer.parseInt(strNum);
	}

		//하단 시작 페이지 번호
		int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
		//전체 글의 갯수
		int totalRow = FileDao.getInstance().getCount();
		//전체 페이지의 갯수 구하기
		int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
		if(endPageNum > totalPageCount){
			endPageNum = totalPageCount; //보정해준다.
		}
	
	//보여줄 페이지의 시작
	int startRowNum = (pageNum-1) * PAGE_ROW_COUNT + 1;
	//보여줄 페이지의 끝
	int endRowNum = pageNum * PAGE_ROW_COUNT;
		
	//FileDto에 startRowNum과 endRowNum을 담아서
	FileDto dto = new FileDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	List<FileDto> list = FileDao.getInstance().getList(dto);
	
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/file/list.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<style>
	.wrapper{
		display: flex;
		justify-content: center;
	}
</style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="file_list" name="current"/>
	</jsp:include>
	<div class="container">
		<h1>자료실 목록입니다.</h1>
		<div class ="text-end">
			<a href="${pageContext.request.contextPath}/file/private/upload_form.jsp">업로드하기</a>
			<a href="${pageContext.request.contextPath}/file/private/upload_form2.jsp">ajax 업로드하기</a>
		</div>
		
		<table class="table table-striped">
			<thead class ="text-center table-dark">
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>파일크기</th>
					<th>등록일</th>
					<th></th>
				</tr>
			</thead>
			<tbody class ="text-center">
				<% for(FileDto tmp : list) {%>
					<tr>
						<td><%= tmp.getNum()%></td>
						<td><%= tmp.getWriter()%></td>
						<td><%= tmp.getTitle()%></td>
						<td>
							<a href="download.jsp?num=<%=tmp.getNum()%>"><%=tmp.getSaveFileName()%></a>
						</td>
						<td><%= tmp.getFileSize() %> byte</td>
						<td><%= tmp.getRegdate()%></td>
						<td>
							<!-- 글 작성자와 로그인된 아이디와 같을 때만 삭제 링크 출력하기 -->
							<%if(tmp.getWriter().equals(id)) {%>
								<a href="delete.jsp?num=<%=tmp.getNum()%>">삭제</a>
							<%} else %>
						</td>	
					</tr>
				<%} %>
			</tbody>
		</table>
		<div class="wrapper">
			<ul class="pagination">
				<%-- 
					startPageNum이 1이 아닌 경우에만 Prev 링크를 제공한다.
				--%>
				<%if(startPageNum != 1) {%>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=startPageNum - 1%>">Prev</a>
					</li>
				<%} %>
				<%for(int i = startPageNum; i<=endPageNum; i++) {%>
					<li class="page-item <%= pageNum == i ? "active": ""%>">
						<a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a>
					</li>
				<%} %>
				<%if(endPageNum < totalPageCount) {%>
				<li class="page-item">
					<a class="page-link" href="list.jsp?pageNum=<%= endPageNum + 1%>">Next</a>
				</li>
				<%} %>
			</ul>
		</div>
	</div>
</body>
</html>