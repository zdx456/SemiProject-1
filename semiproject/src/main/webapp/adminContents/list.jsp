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

<style>

	.m-title {
		margin-bottom: 40px;
		margin-top: 20px;
	}

	.pagination > a {
    color: white;
    text-decoration: none;

    display: inline-block;
    min-width:2em;
    padding: 0.25em;

    text-align: center;

    border:1px solid white;
	}
	
	.pagination > a:hover,
	.pagination > a.active {
    color: #EDC948;
    border-color: #EDC948;
	}
	
	.table.table-border > thead > tr > th {
		font-weight: bold;
		background-color: #929292;
		color: black;
	}
	
	.table.table-hover > tbody > tr:hover a {
	  color: #EDC948 !important;
	}

	
	.btn-p3 {
		padding-left: 2em;
		padding-right: 2em;
		padding-top: 0.5em;
		padding-bottom: 0.5em;
	}
	
	.btn-search {
    background: #b2bec3;
    border: 2px solid #b2bec3;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    border-radius: 10px;
    color: white;
    padding-left: 0.8em;
		padding-right: 0.8em;
		padding-top: 0.8em;
		padding-bottom: 0.8em;
	}
	
	.btn-list {
		padding-left: 10em;
		padding-right: 10em;
		padding-top: 0.5em;
		padding-bottom: 0.5em;
	}
	
	.form-input {
    /* outline은 선택 시 자동으로 생기는 테두리이다 */
    background: #222831;
    border: 2px solid #b2bec3;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    border-radius: 10px;
    color: white;
    padding-left: 0.5em;
    padding-right: 1.5em;
}


	.form-input:focus {
	    border-color: #b2bec3;
	}

	
	/* 확장 스타일 : 밑줄만 있는 입력창 */
	.form-input.input-underline {
	    border-top: none;
	    border-left: none;
	    border-right:none;
	}
	
	/* 확장 스타일 : 배경이미지가 좌측에 삽입되는 입력창 */
	.form-input.input-image {
	    padding-left: 2.5em;
	    background-size: 1.5em;
	    background-repeat: no-repeat;
	    background-position: left 0.5em center;
	}
	
	/* 확장 스타일 : 모서리가 둥근 입력창 */
	.form-input.input-round {
	    border-radius: 10px;
	}
	
	.middle {
		vertical-align: middle;
	}
	
	/*a태그 영역 늘리기*/
	.list-box {
		color:inherit;
		display: block;
	}
	
	
	/****************** selectbox *******************/

	.selectbox {
    position: relative;
    width: 80px;  /* 너비설정 */
    border: 2px solid #b2bec3;  /* 테두리 설정 */
    border-radius: 10px;
    display: inline-block;
    z-index: 1;
	}
	
	/* 가상 선택자를 활용 화살표 대체 */
	.selectbox:before {
	    content: "";
	    position: absolute;
	    top: 50%;
	    right: 15px;
	    width: 0;
	    height: 0;
	    margin-top: -1px;
	    border-left: 5px solid transparent;
	    border-right: 5px solid transparent;
	    border-top: 5px solid #b2bec3;
	}
	
	.selectbox label {
	    position: absolute;
	    top: 1px;  /* 위치정렬 */
	    left: 5px;  /* 위치정렬 */
	    padding: .8em .5em;  /* select의 여백 크기 만큼 */
	    color: #999;
	    z-index: -1;  /* IE8에서 label이 위치한 곳이 클릭되지 않는 것 해결 */
	}
	
	.selectbox select {
	    width: 100%;
	    height: auto;  /* 높이 초기화 */
	    line-height: normal;  /* line-height 초기화 */
	    font-family: inherit;  /* 폰트 상속 */
	    padding: 0.8em 0.5em;  /* 여백과 높이 결정 */
	    opacity: 0;  /* 숨기기 */
	    filter:alpha(opacity=0);  /* IE8 숨기기 */
	    -webkit-appearance: none; /* 네이티브 외형 감추기 */
	    -moz-appearance: none;
	    appearance: none;
	    background-color: #222831;
	    border: 2px solid #b2bec3;
	}
	
	.table.table-border {
    	border-bottom:1px solid #929292;
	    border-left: none;
	    border-right: none;
	}
	
	.table.table-border > thead > tr > th,
	.table.table-border > thead > tr > td,
	.table.table-border > tbody > tr > th,
	.table.table-border > tbody > tr > td,
	.table.table-border > tfoot > tr > th,
	.table.table-border > tfoot > tr > td 
	{
	    border-bottom:1px solid #929292;
	    border-left: none;
	    border-right: none;
	}
	
	.btn-mint{
    background: transparent;
    border: 2px solid #00ADB5;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    border-radius: 10px;
    color: #00ADB5;
	}

</style>

<script type="text/javascript">

	$(function() {
	    var selectTarget = $('.selectbox select');
	
	    selectTarget.change(function(){
	        var select_name = $(this).children('option:selected').text();
	        $(this).siblings('label').text(select_name);
	    });
	    
	    $(".form-search").on("submit", function(e){
	    	if($("#select option:selected").val()== ""){
	    		e.preventDefault();
	    	}
	    	
	    });
	});

</script>


	<div class="container w800 m30">
	
		<div class="row center">
			<h1 class="title m-title">콘텐츠 목록(관리자용)</h1>
		</div>
		
		<!-- 콘텐츠 등록 & 검색 -->
		<div class="row m30">
			<div class="flex-container">
			
				<div class="layer-2">
					<div class="layer-2">
						<a href="insert.jsp" class="btn-mint btn-p3">콘텐츠 등록하기</a>
					</div>
					<div class="layer-2">					
						<a href="list.jsp" class="btn-black btn-p3">전체 목록</a>
					</div>
				</div>
				
				<div class="layer-2">
				<form action="list.jsp" method="get" class="form-search">
			
					<%if(keyword == null){ //검색어가 없으면 %> 
						<div class="selectbox">
							<label for="select">선택</label>
							<select name="type" id="select">
								<option value="" selected>선택</option>
								<option value="contents_title">제목</option>
								<option value="contents_grade">등급</option>
								<option value="contents_director">감독</option>
								<option value="genre_name">장르</option>
								<option value="region_name">국가</option>
							</select>
						</div>
						
							<input type="text" name="keyword" placeholder="검색어를 입력하세요" autocomplete="off" class="form-input input-round middle shake" >
							
						<%} else {%>
								
							<%if(type == null) { %>
							<div class="selectbox">
								<label for="select">선택</label>
								<select name="type" id="select">
									<option value="contents_title">제목</option>
									<option value="contents_grade">등급</option>
									<option value="contents_director">감독</option>
									<option value="genre_name">장르</option>
									<option value="region_name">국가</option>
								</select>
							</div>
								<%} else if(type.equals("contents_title")) {%>
								<div class="selectbox">
									<label for="select">제목</label>
									<select name="type" id="select">
										<option value="contents_title" selected>제목</option>
										<option value="contents_grade">등급</option>
										<option value="contents_director">감독</option>
										<option value="genre_name">장르</option>
										<option value="region_name">국가</option>
									</select>
								</div>
								<%} else if(type.equals("contents_grade")) {%>
								<div class="selectbox">
									<label for="select">등급</label>
									<select name="type" id="select">
										<option value="contents_title">제목</option>
										<option value="contents_grade" selected>등급</option>
										<option value="contents_director">감독</option>
										<option value="genre_name">장르</option>
										<option value="region_name">국가</option>
									</select>
								</div>
								<%} else if(type.equals("contents_director")) {%>
								<div class="selectbox">
									<label for="select">감독</label>
									<select name="type" id="select">
										<option value="contents_title">제목</option>
										<option value="contents_grade">등급</option>
										<option value="contents_director" selected>감독</option>
										<option value="genre_name">장르</option>
										<option value="region_name">국가</option>
									</select>
								</div>
								<%} else if(type.equals("genre_name")) {%>
								<div class="selectbox">
									<label for="select">장르</label>
									<select name="type" id="select">
										<option value="contents_title">제목</option>
										<option value="contents_grade">등급</option>
										<option value="contents_director">감독</option>
										<option value="genre_name" selected>장르</option>
										<option value="region_name">국가</option>
									</select>
								</div>
								<%} else { %>
								<div class="selectbox">
									<label for="select">국가</label>
									<select name="type" id="select">
										<option value="contents_title">제목</option>
										<option value="contents_grade">등급</option>
										<option value="contents_director">감독</option>
										<option value="genre_name">장르</option>
										<option value="region_name" selected>국가</option>
									</select>
								</div>
								<%} %>
							
							<!-- 검색 후, 검색 창 -->	
							<input type="text" name="keyword" value="<%=keyword %>" autocomplete="off" class="form-input input-round" >
						<%} %>
						
						<input type="submit" value="검색" class="btn-search">
						
					</form>
				</div>
			</div>
		</div>

	<%if(list.isEmpty()){ %>
	<div class="row center m100">
		<h2>검색 결과가 존재하지 않습니다.</h2>
	</div>
		
		<%} else { %>
	
			<div class="row">
				<table class="table table-border table-hover">
				
					<thead>
						<tr class="center">
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
						<tr class="center">
							<td><a class="list-box" href="detail.jsp?contentsNo=<%=contentsDto.getContentsNo() %>"><%=contentsDto.getContentsNo() %></a></td>
							<td><a class="left list-box" href="detail.jsp?contentsNo=<%=contentsDto.getContentsNo() %>"><%=contentsDto.getContentsTitle() %></a></td>
							<td><a class="list-box" href="detail.jsp?contentsNo=<%=contentsDto.getContentsNo() %>"><%=contentsDto.getContentsGrade() %></a></td>
							<td><a class="list-box" href="detail.jsp?contentsNo=<%=contentsDto.getContentsNo() %>"><%=contentsDto.getContentsDirector() %></a></td>
							<td><a class="list-box " href="detail.jsp?contentsNo=<%=contentsDto.getContentsNo() %>"><%=contentsDto.getGenreName() %></a></td>
							<td><a class="list-box" href="detail.jsp?contentsNo=<%=contentsDto.getContentsNo() %>"><%=contentsDto.getRegionName() %></a></td>
						</tr>
						<%} %>
					</tbody>
					
				</table>
			</div>
			<%} %>
			
			<!----------- 페이지 네이션 !! ------------->
			
		<div class="row m40">	
			<div class="pagination">
				
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
			
			</div>
		</div>
				
	</div>

<jsp:include page="/template/footer.jsp"></jsp:include>