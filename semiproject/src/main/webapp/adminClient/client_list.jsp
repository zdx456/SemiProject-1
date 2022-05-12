<%@page import="java.util.List"%>
<%@page import="ottes.beans.ClientDao"%>
<%@page import="ottes.beans.ClientDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<h1>관리자 페이지</h1>
<aside>
	<!-- 좌측 사이드 메뉴 -->
	<!-- a링크 수정할 것 -->
	<a href="<%=request.getContextPath()%>/adminClient/client_list.jsp">회원관리</a> <br><br>		
	<a href="#">컨텐츠관리</a> <br><br>
	<a href="#">통계</a> <br><br>
</aside>
<section>
<div>
	<div>
		<form action="client_list.jsp" method="get">
			<select name="type">
				<option value="client_id">아이디</option>
				<option value="client_nick">닉네임</option>
			</select>			
			<input type="search" name="keyword" required autocomplete="off" >		
			<input type="submit" value="검색">
		</form>
	</div>
	
	<div>
		<table>
			<thead>
				<tr>
					<th>아이디</th>
					<th>닉네임</th>
					<th>성별</th>
					<th>등급</th>
					<th>수정</th>
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
						<a href="client_detail.jsp?clientId=<%=clientDto.getClientId()%>">수정</a>
					</td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	<div>
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