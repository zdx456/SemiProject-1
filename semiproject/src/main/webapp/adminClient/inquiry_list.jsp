<%@page import="java.util.List"%>
<%@page import="ottes.beans.InquiryDao"%>
<%@page import="ottes.beans.InquiryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	// 검색 및 정렬 파라미터 
	String option = request.getParameter("option");
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
	
	// 문의글 조회 및 정렬
	boolean searchAll = option != null && option.equals("all") && keyword != null;
	boolean search = option != null && keyword != null;
	boolean sort = type != null;
	InquiryDao inquiryDao = new InquiryDao();
	List<InquiryDto> list;

	if(searchAll){
		list = inquiryDao.selectListByPaging(p, s, keyword);
	} else if (search) {
		list = inquiryDao.selectListByPaging(p, s, option, keyword);
	} else if (sort) {
		list = inquiryDao.selectListSortByPaging(p, s, type); 
	} else {
		list = inquiryDao.selectListByPaging(p, s);
	}
	
	// 페이지 수 카운팅
	int count;
	if(searchAll){
		count = inquiryDao.countByPaging(keyword);
	} else if (search) {
		count = inquiryDao.countByPaging(option, keyword);
	} else if (sort) {
		count = inquiryDao.countSortByPaging(type);
	} else{
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
<div class="top_wrap">
	<div class="admin_notice admin_inquiry">
		<div>
			<h2><a href="<%=request.getContextPath()%>/adminClient/inquiry_list.jsp">1:1 문의 관리</a></h2>
		</div>
		<div class="wrap">
			<div class="notice_sort">
				<form action="inquiry_list.jsp" method="get">		
					<input type="text" class="hidden">		
					<input type="submit" value="전체보기">
				</form>
				<form action="inquiry_list.jsp" method="get">		
					<input type="text" class="hidden" name="type" value="오류제보">		
					<input type="submit" value="오류제보">
				</form>
				<form action="inquiry_list.jsp" method="get">		
					<input type="text" class="hidden" name="type" value="문의사항">		
					<input type="submit" value="문의사항">
				</form>	
				<form action="inquiry_list.jsp" method="get">		
					<input type="text" class="hidden" name="type" value="기타">		
					<input type="submit" value="기타">
				</form>					
			</div>
			<div class="admin_search">
				<form action="inquiry_list.jsp" method="get">
					<select name="option">
						<option value="all">전체</option>
						<option value="inquiry_title">제목</option>
						<option value="inquiry_content">내용</option>
						<option value="inquiry_writer">작성자 ID</option>					
					</select>	
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
						<th class="center">작성자 ID</th>					
						<th class="center">작성일</th>
						<th class="center">처리 상태</th>
					</tr>
				</thead>
				<tbody>
					<%for(InquiryDto inquiryDto : list){ %>
						<tr>
							<td class="inquiry_type center"><%=inquiryDto.getInquiryType()%></td>
							<td>
								<a href="<%=request.getContextPath()%>/adminClient/inquiry_detail.jsp?inquiryNo=<%=inquiryDto.getInquiryNo()%>">
									<%=inquiryDto.getInquiryTitle()%>
								</a>
							</td>
							<td class="center"><%=inquiryDto.getInquiryWriter()%></td>
							<td class="center"><%=inquiryDto.getInquiryDate()%></td>
							<!-- 댓글 개수로 문의 처리 여부 판단 -->
							<%if(inquiryDto.getInquiryReplycount() > 0){ %>
								<td class="center">답변 완료</td>
							<%} else { %>
								<td></td>
							<%} %>
						</tr>
					<%} %>			
				</tbody>
			</table>
		</div>
		<div class="pagination">
			<%if(p > 1){ %>
				<%if(searchAll){ %>
				<a href="inquiry_list.jsp?p=1&s=<%=s%>&option=<%=option%>&keyword=<%=keyword%>">&laquo;</a>
				<%} else if(sort){ %>
				<a href="inquiry_list.jsp?p=1&s=<%=s%>&type=<%=type%>">&laquo;</a>
				<%} else { %>
				<a href="inquiry_list.jsp?p=1&s=<%=s%>">&laquo;</a>
				<%} %>
			<%} %>
			
			<%if(startBlock > 1){ %>
				<%if(searchAll || search){ %>
				<a href="inquiry_list.jsp?p=<%=startBlock-1%>&s=<%=s%>&option=<%=option%>&keyword=<%=keyword%>">&lt;</a>
				<%} else if(sort){ %>
				<a href="inquiry_list.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>">&lt;</a>
				<%} else { %>
				<a href="inquiry_list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
				<%} %>
			<%} %>
	
			<%for(int i=startBlock; i <= endBlock; i++){ %>
				<%if(searchAll || search){ %>
					<%if(i == p){ %>
					<a class="active" href="inquiry_list.jsp?p=<%=i%>&s=<%=s%>&option=<%=option%>&keyword=<%=keyword%>"><%=i%></a>	
					<%} else { %>
					<a href="inquiry_list.jsp?p=<%=i%>&s=<%=s%>&option=<%=option%>&keyword=<%=keyword%>"><%=i%></a>
					<%} %>
				<%} else if(sort){ %>
					<%if(i == p){ %>
					<a class="active" href="inquiry_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>"><%=i%></a>	
					<%} else { %>
					<a href="inquiry_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>"><%=i%></a>
					<%} %>
				<%} else { %>
					<%if(i == p){ %>
					<a class="active" href="inquiry_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
					<%} else { %>
					<a href="inquiry_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
					<%} %>
				<%} %>
			<%} %>
	
			<%if(endBlock < lastPage){ %>
				<%if(searchAll || search){ %>
				<a href="inquiry_list.jsp?p=<%=endBlock+1%>&s=<%=s%>&option=<%=option%>&keyword=<%=keyword%>">&gt;</a>
				<%} else if(sort){ %>
				<a href="inquiry_list.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>">&gt;</a>
				<%} else { %>
				<a href="inquiry_list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
				<%} %>
			<%} %>
			
			<%if(p < lastPage){ %>
				<%if(searchAll || search){ %>
				<a href="inquiry_list.jsp?p=<%=lastPage%>&s=<%=s%>&option=<%=option%>&keyword=<%=keyword%>">&raquo;</a>
				<%} else if(sort){ %>
				<a href="inquiry_list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>">&raquo;</a>
				<%} else { %>
				<a href="inquiry_list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
				<%} %>
			<%} %>		
		</div>
	</div>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>