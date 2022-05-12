<%@page import="java.util.List"%>
<%@page import="ottes.beans.ClientDao"%>
<%@page import="ottes.beans.ClientDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	// 검색 파라미터 
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	
	// 페이지 파라미터
	int p; // = 현재 페이지
	try {
		p = Integer.parseInt(request.getParameter("p"));
		if(p <= 0)	throw new Exception();
	}
	catch(Exception e){
		p = 1;
	}
	
	int s; // = 게시글 수
	try {
		s = Integer.parseInt(request.getParameter("s"));
		if(s <= 0) throw new Exception();
	}
	catch(Exception e){
		s = 10;
	}
	
	// 게시글 조회
	boolean search = type != null && keyword != null;
	ClientDao clientDao = new ClientDao();
	List<ClientDto> list;
	if(search){
		list = clientDao.selectListByPaging(p, s, type, keyword); 
	}
	else {
		list = clientDao.selectListByPaging(p, s);
	}
	
	// 페이지 수 카운팅
	int count;
	if(search){
		count = clientDao.countByPaging(type, keyword);
	}
	else{
		count = clientDao.countByPaging();
	}
	
	// 마지막 페이지 계산
	int lastPage = (count + s - 1) / s;
	
	// 블록 계산
	int blockSize = 10;
	int endBlock = (p + blockSize - 1) / blockSize * blockSize;
	int startBlock = endBlock - (blockSize - 1);
	
	// 범위 초과 문제 해결
	if(endBlock > lastPage){
		endBlock = lastPage;
	}
%>
    
<jsp:include page="/template/header.jsp"></jsp:include>

<style>
	.flexbox-section {
	    display: flex;
	    padding: none;
	}
	
	body {
	    background-color: #222831;
	    color: white
	}
	
	.title {
	    color: #00ADB5;
	    text-align: center;
	    margin: 50px;
	    margin-bottom: 50px;
	}
	
	.background-style {
	    background-color: #484848;
	    padding: 1em;
	    margin: 5px;
	    border-radius: 10px;
	}
	
	.inline-right-top {
	    background-color: #484848;
	    padding: 1em;
	    margin-bottom: 3em;
	    border-radius: 10px;
	    height: 10%;
	}
	
	.inline-right-bottom {
	    background-color: #484848;
	    padding: 1em;
	    border-radius: 10px;
	}
	
	.inline-right-pagination {
            background-color: #484848;
            padding: 1em;
            border-radius: 10px;
	}
	
	.aside-left {
	    margin-top: 0;
	    margin-right: 5%;
	    margin-bottom: 1%;
	    margin-left: 2%;
	    padding: 0.5em;
	    width: 10%;
	    height: 500px;
	    flex: 1;
	    /* box-sizing: border-box; */
	    border-radius: 10px;
	}
	
	.aside-left div {
	    margin: 1em;
	    background-color: #484848;
	    border-radius: 10px;
	    padding: 1.5em;
	    /* padding-bottom: 3em; */
	    text-decoration: none;
	    font-size: 20px;
	    text-align: left;
	}
	
	.aside-left div:hover {
	    margin: 1em;
	    background-color: #EDC948;
	    border-radius: 10px;
	    padding: 1.5em;
	    /* padding-bottom: 3em; */
	    text-decoration: none;
	    font-size: 20px;
	    text-align: left;
	}
	
	.aside-left a {
	    color: white
	}
	
	.section-right {
	    margin-right: 2%;
	    padding: 0;
	    width: 70%;
	    flex: 2 600px;
	    box-sizing: border-box;
	    border-radius: px;
	    height: 750px;
	}
	
	.pagination>a {
	    color: white;
	    text-decoration: none;
	
	    display: inline-block;
	    min-width: 2em;
	    padding: 0.25em;
	
	    text-align: center;
	
	    border: 1px solid white;
	}
	
	.pagination>a:hover,
	.pagination>a.active {
	    color: #EDC948;
	    border-color: #EDC948;
	}
	
	.table>thead>tr,
	.table>tbody>tr {
	    font-weight: bold;
	    /* background-color: #929292; */
	    border-bottom: 1px solid white;
	    color: white;
	}
	
	.table tbody a:hover,
	.table tbody tr:hover {
	    color: #EDC948 !important;
	    background-color: #222831;
	}
	
	.input-type {
	    background: #b2bec3;
	    border: 2px solid #b2bec3;
	    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	    border-radius: 10px;
	    color: white;
	    width: 80px;
	    height: 42px;
	    border-radius: 0.25em;
	
	}
	
	.input-keyword {
	    background: #b2bec3;
	    border: 2px solid #b2bec3;
	    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	    border-radius: 10px;
	    padding: 10px;
	    color: white;
	    width: 300px;
	    height: 42px;
	    border-radius: 0.25em;
	    font-size: 15px;
	    font-weight: bold;
	
	}
	
	.input-search {
	    background: #b2bec3;
	    border: 2px solid #b2bec3;
	    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	    border-radius: 10px;
	    color: white;
	    font-weight: bold;
	    padding-left: 0.8em;
	    padding-right: 0.8em;
	    padding-top: 0.8em;
	    padding-bottom: 0.8em;
	
	    width: 80px;
	    height: 42px;
	}
	
	.btn-list {
	    padding-left: 10em;
	    padding-right: 10em;
	    padding-top: 0.5em;
	    padding-bottom: 0.5em;
	}
	
	.form-input {
	    /* outline은 선택 시 자동으로 생기는 테두리이다 */
	    outline: none;
	    padding: 0.5em;
	    border: 1px solid #b2bec3;
	    color: black;
	}

	/*
    	:focus 는 해당 태그에 포커스가 맞춰진 경우 실행되는 조건부 선택자
		= 입력창은 커서가 위치하면 포커스가 맞춰졌다고 본다
	*/
	.form-input:focus {
	    border-color: black;
	}
	
	.fill {
	    width: 100%;
	}
	
	/* 확장 스타일 : 모서리가 둥근 입력창 */
	.form-input.input-round {
	    border-radius: 0.25em;
	}
	
	.form-mine {
	    float: right;
	    margin-right: 15px;
	    margin: auto;
	    padding: auto;
	
	}
	
	/* textarea 폭 조절 금지 */
	textarea.form-input {
	    resize: vertical;
	}
</style>

<h1 class="title">관리자 페이지</h1>

<section class="flexbox-section">
	<!-- 좌측 사이드 메뉴 -->
	<aside class="aside-left background-style">
	    <!-- 좌측 사이드 메뉴 -->
	    <div>
	        <a href="<%=request.getContextPath()%>/adminClient/client_list.jsp">회원관리</a>
	    </div>
	    <div>
	        <a href="<%=request.getContextPath()%>/adminContents/list.jsp">컨텐츠관리</a>
	    </div>
	    <div>
	    	<!-- 통계 완성시 주소 수정필요 -->
	        <a href="#">통계</a>
	    </div>
	</aside>

	<div class="section-right">
		<div class="inline-right-top">
		    <form action="#" method="get" class="form-mine">
		        <select name="type" class="input-type">
		            <option value="client_id" style="color:white">아이디</option>
		            <option value="client_nick" style="color:white">닉네임</option>
		        </select>
		        <input type="search" name="keyword" required autocomplete="off" class="input-keyword">
		        <input type="submit" value="검색" class="input-search">
		    </form>
		</div>
		<div class="row center inline-right-bottom">
			<table class="table">
			    <thead>
			        <tr>
			            <th>아이디</th>
			            <th>닉네임</th>
			            <th>성별</th>
			            <th>등급</th>
			        </tr>
			    </thead>
			    <tbody>
					<%for(ClientDto clientDto : list){%>
					<tr>
						<td><%=clientDto.getClientId()%></td>
						<td><%=clientDto.getClientNick()%></td>
						<td><%=clientDto.getClientGender()%></td>
						<td><%=clientDto.getClientGrade()%></td>
						<td>
							<a href="client_detail.jsp?clientId=<%=clientDto.getClientId()%>">상세보기</a>
						</td>
					</tr>
					<%} %>
				</tbody>
			</table>
		</div>
		<div class="row center inline-pagination pagination">
			<%if(p > 1){ %>
				<%if(search){ %>
				<a href="client_list.jsp?p=1&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&laquo;</a>
				<%} else { %>
				<a href="client_list.jsp?p=1&s=<%=s%>">&laquo;</a>
				<%} %>
			<%} %>
			
			<%if(startBlock > 1){ %>
				<%if(search){ %>
				<a href="client_list.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a>
				<%} else { %>
				<a href="client_list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
				<%} %>
			<%} %>
	
			<%for(int i=startBlock; i <= endBlock; i++){ %>
				<%if(search){ %>
					<%if(i == p){ %>
					<a href="client_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>	
					<%} else { %>
					<a href="client_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
					<%} %>
				<%} else { %>
					<%if(i == p){ %>
					<a href="client_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
					<%} else { %>
					<a href="client_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
					<%} %>
				<%} %>
			<%} %>
	
			<%if(endBlock < lastPage){ %>
				<%if(search){ %>
				<a href="client_list.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a>
				<%} else { %>
				<a href="client_list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
				<%} %>
			<%} %>
			
			<%if(p < lastPage){ %>
				<%if(search){ %>
				<a href="client_list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&raquo;</a>
				<%} else { %>
				<a href="client_list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
				<%} %>
			<%} %>
		</div>	
	</div>

</section>

<jsp:include page="/template/footer.jsp"></jsp:include>