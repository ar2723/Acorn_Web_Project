<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="java.util.List"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT = 5;

	//하단페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT = 3;
	
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
		int totalRow = CafeDao.getInstance().getCount();
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
	CafeDto dto = new CafeDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	List<CafeDto> list = CafeDao.getInstance().getList(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/cafe/list.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<style>
	.wrapper {
		display:flex;
		justify-content: center;
	}
	
	.contentLink {
		color: inherit;
  		text-decoration: none;
	}
	.contentLink:hover{
		text-decoration: underline;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>게시글 목록 입니다</h1>
		<div class="text-end">
		<a href="private/insertform.jsp">새글 작성</a>
		</div>
		<table class="table table-striped">
			<thead class ="table-dark text-center">
				<tr>
					<th>글번호</th>
					<th>글작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody class ="text-center">
				<% for(CafeDto tmp : list) {%>
					<tr>
						<td><%= tmp.getNum()%></td>
						<td><%= tmp.getWriter()%></td>
						<td>
							<a class="contentLink" href="detail.jsp?num=<%= tmp.getNum()%>"><%= tmp.getTitle() %></a>
						</td>
						<td><%= tmp.getViewCount()%></td>
						<td><%= tmp.getRegdate() %></td>
					</tr>
				<% }%>
			</tbody>
		</table>
		<nav class="wrapper">
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
		</nav>
	</div>
</body>
</html>