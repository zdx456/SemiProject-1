<%@page import="java.util.List"%>
<%@page import="ottes.beans.InquiryDao"%>
<%@page import="ottes.beans.InquiryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	// 검색 및 정렬 파라미터 
	String clientId = (String)session.getAttribute("login");
	String keyword = request.getParameter("keyword");
	String type = request.getParameter("type");
	
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
	
	// 내 문의글 조회 및 정렬
	boolean search = keyword != null;
	boolean sort = type != null;
	InquiryDao inquiryDao = new InquiryDao();
	List<InquiryDto> list;
	if(search){
		list = inquiryDao.selectMyListByPaging(p, s, keyword, clientId); 
	} else if (sort) {
		list = inquiryDao.selectMyListSortByPaging(p, s, type, clientId); 
	} else {
		list = inquiryDao.selectMyListByPaging(p, s, clientId);
	}
	
	// 페이지 수 카운팅
	int count;
	if(search){
		count = inquiryDao.countMyListByPaging(keyword, clientId);
	} else if (sort) {
		count = inquiryDao.countMyListSortByPaging(type, clientId);
	} else{
		count = inquiryDao.countMyListByPaging(clientId);
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
<div class="top_wrap">
	<div class="admin_notice admin_inquiry my_inquiry">
		<div>
			<h2><a href="<%=request.getContextPath()%>/mypage/inquiry_list.jsp">내 1:1 문의 &#38; 답변</a></h2>
		</div>	
		<div class="wrap">
			<div class="notice_sort">
				<form action="<%=request.getContextPath()%>/mypage/inquiry_list.jsp" method="get">		
					<input type="text" class="hidden">		
					<input type="submit" value="전체보기">
				</form>
				<form action="<%=request.getContextPath()%>/mypage/inquiry_list.jsp" method="get">		
					<input type="text" class="hidden" name="type" value="오류제보">		
					<input type="submit" value="오류제보">
				</form>
				<form action="<%=request.getContextPath()%>/mypage/inquiry_list.jsp" method="get">		
					<input type="text" class="hidden" name="type" value="문의사항">		
					<input type="submit" value="문의사항">
				</form>	
				<form action="<%=request.getContextPath()%>/mypage/inquiry_list.jsp" method="get">		
					<input type="text" class="hidden" name="type" value="기타">		
					<input type="submit" value="기타">
				</form>					
			</div>
			<div class="admin_search">
				<form action="<%=request.getContextPath()%>/mypage/inquiry_list.jsp" method="get">
					<%if(search) {%>	
					<input type="search" name="keyword" value="<%=keyword%>" required autocomplete="off">		
					<%} else {%>
					<input type="search" name="keyword" placeholder="검색어를 입력하세요" required autocomplete="off">
					<%} %>
					<button type="submit" value="검색"></button>
				</form>
			</div>	
			<div class="my_inquiry_btn center">
				<a href="<%=request.getContextPath()%>/notice/list.jsp">고객센터</a>
			</div>	
		</div>		
		<div class="notice admin_notice">
			<table>
				<thead>
					<tr>
						<th class="center">분류</th>
						<th><a>제목</a></th>				
						<th class="center">작성일</th>
						<th class="center">처리 상태</th>
					</tr>
				</thead>		
				<tbody>
					<%for(InquiryDto inquiryDto : list){ %>
						<tr>
							<td class="inquiry_type center"><%=inquiryDto.getInquiryType()%></td>
							<td>
								<a href="<%=request.getContextPath()%>/mypage/inquiry_detail.jsp?inquiryNo=<%=inquiryDto.getInquiryNo()%>">
									<%=inquiryDto.getInquiryTitle()%>
								</a>
							</td>
							<td class="center"><%=inquiryDto.getInquiryDate()%></td>
							<!-- 댓글 개수로 문의 처리 여부 판단 -->
							<%if(inquiryDto.getInquiryReplycount() > 0){ %>
								<td class="center inquiry_state">답변 완료</td>
							<%} else { %>
								<td class="center">확인 중</td>
							<%} %>
						</tr>
					<%} %>			
				</tbody>
			</table>
		</div>		
		<div class="pagination">
			<%if(p > 1){ %>
				<%if(search){ %>
				<a href="<%=request.getContextPath()%>/mypage/inquiry_list.jsp?p=1&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&laquo;</a>
				<%} else { %>
				<a href="<%=request.getContextPath()%>/mypage/inquiry_list.jsp?p=1&s=<%=s%>">&laquo;</a>
				<%} %>
			<%} %>
			
			<%if(startBlock > 1){ %>
				<%if(search){ %>
				<a href="<%=request.getContextPath()%>/mypage/inquiry_list.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a>
				<%} else { %>
				<a href="<%=request.getContextPath()%>/mypage/inquiry_list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
				<%} %>
			<%} %>
	
			<%for(int i=startBlock; i <= endBlock; i++){ %>
				<%if(search){ %>
					<%if(i == p){ %>
					<a href="<%=request.getContextPath()%>/mypage/inquiry_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>	
					<%} else { %>
					<a href="<%=request.getContextPath()%>/mypage/inquiry_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
					<%} %>
				<%} else { %>
					<%if(i == p){ %>
					<a href="<%=request.getContextPath()%>/mypage/inquiry_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
					<%} else { %>
					<a href="<%=request.getContextPath()%>/mypage/inquiry_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
					<%} %>
				<%} %>
			<%} %>
	
			<%if(endBlock < lastPage){ %>
				<%if(search){ %>
				<a href="<%=request.getContextPath()%>/mypage/inquiry_list.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a>
				<%} else { %>
				<a href="<%=request.getContextPath()%>/mypage/inquiry_list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
				<%} %>
			<%} %>
			
			<%if(p < lastPage){ %>
				<%if(search){ %>
				<a href="<%=request.getContextPath()%>/mypage/inquiry_list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&raquo;</a>
				<%} else { %>
				<a href="<%=request.getContextPath()%>/mypage/inquiry_list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
				<%} %>
			<%} %>		
		</div>
	</div>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>