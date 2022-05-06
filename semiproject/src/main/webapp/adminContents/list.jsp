<%@page import="ottes.beans.ContentsDto"%>
<%@page import="java.util.List"%>
<%@page import="ottes.beans.ContentsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
	//검색 파라미터 수신
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	
	//페이징 파라미터 수신
	int p;
	try {
		p = Integer.parseInt(request.getParameter("p"));
		if(p <= 0) throw new Exception();
	}
	catch(Exception e){
		p = 1;
	}
	
	int s;
	try {
		s = Integer.parseInt(request.getParameter("s"));
		if(s <= 0) throw new Exception();
	}
	catch(Exception e){
		s = 10;
	}
	
	/////////////////////////////////////////////////////////////
	
	boolean search = type != null && keyword != null;
	ContentsDao contentsDao = new ContentsDao();
	List<ContentsDto> list;
	
	if(search){ //검색
		list = contentsDao.selectListByPaging(p, s, type, keyword);
	}
	else{ //전체 목록
		list = contentsDao.selectListByPaging(p, s);
	}
	
	/////////////////////////////////////////////////////////////

	//게시글 숫자 카운트
	int count;
	if(search){
		count = contentsDao.countByPaging(type, keyword);
	}
	else {
		count = contentsDao.countByPaging();
	}
	
	int lastPage = (count + s - 1) / s;
	
	int blockSize = 10;
	
	int endBlock = (p+blockSize-1) / blockSize * blockSize;
	int startBlock = endBlock - (blockSize - 1);
	
	if(endBlock > lastPage){
		endBlock = lastPage;
	}
	
%>
   
<jsp:include page="/template/header.jsp"></jsp:include>

	<div class="container w800 m30">
	
		<div class="row center">
			<h1>컨텐츠 목록</h1>
		</div>
		
	<!-- 검색창 -->
	<div class="row center">
	
		<form action="list.jsp" method="get">
		
		<%if(keyword == null){ //검색어가 없으면 %> 
			<select name="type">
				<option value="none" selected>선택</option>
				<option value="contents_title">제목</option>
				<option value="contents_grade">등급</option>
				<option value="contents_director">감독</option>
				<option value="genre_name">장르</option>
				<option value="region_name">국가</option>
			</select>
			
			<input type="text" name="keyword" placeholder="검색어">
			<%} else {%>
					
				<%if(type == null) { %>
					<select name="type">
						<option value="none" selected>선택</option>
						<option value="contents_title">제목</option>
						<option value="contents_grade">등급</option>
						<option value="contents_director">감독</option>
						<option value="genre_name">장르</option>
						<option value="region_name">국가</option>
					</select>
					<%} else if(type.equals("contents_title")) {%>
						<select name="type">
							<option value="none">선택</option>
							<option value="contents_title" selected>제목</option>
							<option value="contents_grade">등급</option>
							<option value="contents_director">감독</option>
							<option value="genre_name">장르</option>
							<option value="region_name">국가</option>
						</select>
					<%} else if(type.equals("contents_grade")) {%>
						<select name="type">
							<option value="none">선택</option>
							<option value="contents_title">제목</option>
							<option value="contents_grade" selected>등급</option>
							<option value="contents_director">감독</option>
							<option value="genre_name">장르</option>
							<option value="region_name">국가</option>
						</select>
					<%} else if(type.equals("contents_director")) {%>
						<select name="type">
							<option value="none">선택</option>
							<option value="contents_title">제목</option>
							<option value="contents_grade">등급</option>
							<option value="contents_director" selected>감독</option>
							<option value="genre_name">장르</option>
							<option value="region_name">국가</option>
						</select>
					<%} else if(type.equals("genre_name")) {%>
						<select name="type">
							<option value="none">선택</option>
							<option value="contents_title">제목</option>
							<option value="contents_grade">등급</option>
							<option value="contents_director">감독</option>
							<option value="genre_name" selected>장르</option>
							<option value="region_name">국가</option>
						</select>
					<%} else { %>
						<select name="type">
							<option value="none">선택</option>
							<option value="contents_title">제목</option>
							<option value="contents_grade">등급</option>
							<option value="contents_director">감독</option>
							<option value="genre_name">장르</option>
							<option value="region_name" selected>국가</option>
						</select>
					<%} %>
					
				<input type="text" name="keyword" placeholder="검색어" value="<%=keyword %>">
			<%} %>
			
			<input type="submit" value="검색">
			
		</form>
		
	</div>
	
	<%if(list.isEmpty()){ %>
		<h3>검색 결과가 존재하지 않습니다.</h3>
		<br>
		<br>
		<a href="list.jsp">목록으로 이동</a>
		<%} else { %>
	
			<div class="row">
				<table class="table">
				
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>등급</th>
							<th>감독</th>
							<th>장르</th>
							<th>국가</th>
						</tr>
					</thead>
					
					<tbody>
					<%for(ContentsDto contentsDto : list) {%>
						<tr>
							<td><a href="detail.jsp?contentsNo=<%=contentsDto.getContentsNo() %>"><%=contentsDto.getContentsNo() %></a></td>
							<td><%=contentsDto.getContentsTitle() %></td>
							<td><%=contentsDto.getContentsGrade() %></td>
							<td><%=contentsDto.getContentsDirector() %></td>
							<td><%=contentsDto.getGenreName() %></td>
							<td><%=contentsDto.getRegionName() %></td>
						</tr>
						<%} %>
					</tbody>
					
				</table>
			</div>
			<%} %>
			
			<!----------- 페이지 네이션 !! ------------->
			
		<%if(p > 1){ %>
			<%if(search){ %>
			<a href="list.jsp?p=1&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&laquo;</a>
			<%} else { %>
			<a href="list.jsp?p=1&s=<%=s%>">&laquo;</a>
			<%} %>
		<%} %>
		
		<%if(startBlock > 1){ %>
			<%if(search){ %>
			<a href="list.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a>
			<%} else { %>
			<a href="list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
			<%} %>
		<%} %>
		
		<!-- 숫자 링크 영역 -->
		<%for(int i=startBlock; i <= endBlock; i++){ %>
			<%if(search){ %>
				<%if(i == p){ %>
				<a class="active" href="list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>	
				<%} else { %>
				<a href="list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
				<%} %>
			<%} else { %>
				<%if(i == p){ %>
				<a class="active" href="list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
				<%} else { %>
				<a href="list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
				<%} %>
			<%} %>
		<%} %>
		
		<!-- 다음 버튼 영역 -->
		<%if(endBlock < lastPage){ %>
			<%if(search){ %>
			<a href="list.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a>
			<%} else { %>
			<a href="list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
			<%} %>
		<%} %>
		
		<%if(p < lastPage){ %>
			<%if(search){ %>
			<a href="list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&raquo;</a>
			<%} else { %>
			<a href="list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
			<%} %>
		<%} %>
				
			
			<!-- 컨텐츠 등록 링크 -->
			<br>
			<br>
			<a href="insert.jsp">등록</a>
			
	</div>

<jsp:include page="/template/footer.jsp"></jsp:include>