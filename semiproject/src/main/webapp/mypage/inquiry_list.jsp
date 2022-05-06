<%@page import="java.util.List"%>
<%@page import="ottes.beans.InquiryDao"%>
<%@page import="ottes.beans.InquiryDto"%>
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
	
	// 회원 ID 받기
	String clientId = (String)session.getAttribute("login");
	
	// 내 문의글 조회
	boolean search = type != null && keyword != null;
	InquiryDao inquiryDao = new InquiryDao();
	List<InquiryDto> list;
	if(search){
		list = inquiryDao.selectMyListByPaging(p, s, type, keyword, clientId); 
	}
	else {
		list = inquiryDao.selectMyListByPaging(p, s, clientId);
	}
	
	// 페이지 수 카운팅
	int count;
	if(search){
		count = inquiryDao.countByPaging(type, keyword);
	}
	else{
		count = inquiryDao.countByPaging();
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
<div>
	<div>
		<h1>내 1:1 문의 & 답변</h1>
		<form action="inquiry_list.jsp" method="get">
			<select name="type">
				<option value="inquiry_title">제목</option>
				<option value="inquiry_content">내용</option>
			</select>			
			<input type="search" name="keyword" required autocomplete="off">		
			<input type="submit" value="검색">
		</form>
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<th>분류</th>
					<th>제목</th>
					<th>작성일</th>
					<th>처리 상태</th>
				</tr>
			</thead>
			<tbody>
				<%for(InquiryDto inquiryDto : list){ %>
					<tr>
						<td><%=inquiryDto.getInquiryType()%></td>
						<td>
							<a href="inquiry_detail.jsp?inquiryNo=<%=inquiryDto.getInquiryNo()%>">
								<%=inquiryDto.getInquiryTitle()%>
							</a>
						</td>
						<td><%=inquiryDto.getInquiryDate()%></td>
						<!-- 댓글 개수로 문의 처리 여부 판단 -->
						<%if(inquiryDto.getInquiryReplycount() > 0){ %>
							<td>답변 완료</td>
						<%} else { %>
							<td>확인 중</td>
						<%} %>
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	<div>
		<%if(p > 1){ %>
			<%if(search){ %>
			<a href="inquiry_list.jsp?p=1&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&laquo;</a>
			<%} else { %>
			<a href="inquiry_list.jsp?p=1&s=<%=s%>">&laquo;</a>
			<%} %>
		<%} %>
		
		<%if(startBlock > 1){ %>
			<%if(search){ %>
			<a href="inquiry_list.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a>
			<%} else { %>
			<a href="inquiry_list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
			<%} %>
		<%} %>

		<%for(int i=startBlock; i <= endBlock; i++){ %>
			<%if(search){ %>
				<%if(i == p){ %>
				<a href="inquiry_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>	
				<%} else { %>
				<a href="inquiry_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
				<%} %>
			<%} else { %>
				<%if(i == p){ %>
				<a href="inquiry_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
				<%} else { %>
				<a href="inquiry_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
				<%} %>
			<%} %>
		<%} %>

		<%if(endBlock < lastPage){ %>
			<%if(search){ %>
			<a href="inquiry_list.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a>
			<%} else { %>
			<a href="inquiry_list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
			<%} %>
		<%} %>
		
		<%if(p < lastPage){ %>
			<%if(search){ %>
			<a href="inquiry_list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&raquo;</a>
			<%} else { %>
			<a href="inquiry_list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
			<%} %>
		<%} %>		
	</div>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>