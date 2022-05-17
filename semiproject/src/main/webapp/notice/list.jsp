<%@page import="java.util.List"%>
<%@page import="ottes.beans.NoticeDao"%>
<%@page import="ottes.beans.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	// 로그인 판정
	String clientId = (String) session.getAttribute("login");
	boolean login = clientId != null;

	// 검색 및 정렬 파라미터 
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
	
	// 게시글 조회 및 정렬
	boolean search = keyword != null;
	boolean sort = type != null;
	NoticeDao noticeDao = new NoticeDao();
	List<NoticeDto> list;
	if(search){
		list = noticeDao.selectListByPaging(p, s, keyword); 
	} else if (sort) {
		list = noticeDao.selectListSortByPaging(p, s, type); 
	} else {
		list = noticeDao.selectListByPaging(p, s);
	}
	
	// 페이지 수 카운팅
	int count;
	if(search){
		count = noticeDao.countByPaging(keyword);
	} else if (sort) {
		count = noticeDao.countSortByPaging(type);
	} else{
		count = noticeDao.countByPaging();
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
<div class="notice_bg"></div>
<div class="top_wrap">
	<div class="inquiry_write">
		<%if(login) {%>
		<p>찾으시는 내용이 없다면 1:1 문의를 이용해주세요.</p>
		<div><a href="<%=request.getContextPath()%>/inquiry/write.jsp">1:1 문의 접수</a></div>
		<%} else { %>
		<p>로그인 하시면 1:1 문의를 이용하실 수 있습니다.</p>
		<div><a href="<%=request.getContextPath()%>/client/login.jsp">로그인</a></div>		
		<%} %>
		<p>- 고객센터 운영 시간 : 평일 09시 ~ 18시 (공휴일 휴무) </p>
		<p>- 답변까지 최대 3영업일이 소요될 수 있습니다. </p>
	</div>
	<div class="search">
		<h2><a href="<%=request.getContextPath()%>/notice/list.jsp">고객센터</a></h2>
		<form action="<%=request.getContextPath()%>/notice/list.jsp" method="get">
			<%if(search) {%>	
			<input type="search" name="keyword" value="<%=keyword%>" required autocomplete="off">		
			<%} else {%>
			<input type="search" name="keyword" placeholder="어떤 도움이 필요하세요?" required autocomplete="off">
			<%} %>
			<button type="submit" class="hidden"></button>
		</form>
		<div class="faq_example">
			자주 묻는 질문 : 
			<a href="<%=request.getContextPath()%>/notice/list.jsp?keyword=비밀번호+분실">비밀번호 분실</a>
			, <a href="<%=request.getContextPath()%>/notice/list.jsp?keyword=콘텐츠+요청">콘텐츠 요청</a>
			, <a href="<%=request.getContextPath()%>/notice/list.jsp?keyword=내+OTT+관리">내 OTT 관리</a>
		</div>
	</div>
	<div class="notice_sort" >
		<form action="<%=request.getContextPath()%>/notice/list.jsp" method="get">		
			<input type="text" class="hidden">		
			<input type="submit" value="전체보기">
		</form>
		<form action="<%=request.getContextPath()%>/notice/list.jsp" method="get">		
			<input type="text" class="hidden" name="type" value="공지">		
			<input type="submit" value="공지">
		</form>	
		<form action="<%=request.getContextPath()%>/notice/list.jsp" method="get">		
			<input type="text" class="hidden" name="type" value="FAQ">		
			<input type="submit" value="FAQ">
		</form>					
	</div>
	<div class="notice">
		<table>
			<thead>
				<tr>
					<th class="center">분류</th>
					<th><a>제목</a></th>
					<th class="center">작성일</th>
				</tr>
			</thead>
			<tbody>
				<%for(NoticeDto noticeDto : list){ %>
					<tr>
						<td class="notice_type center"><%=noticeDto.getNoticeType()%></td>
						<td>
							<a href="<%=request.getContextPath()%>/notice/detail.jsp?noticeNo=<%=noticeDto.getNoticeNo()%>">
								<%=noticeDto.getNoticeTitle()%>
							</a>
						</td>
						<td class="center"><%=noticeDto.getNoticeDate()%></td>
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	<div class="pagination">
		<%if(p > 1){ %>
			<%if(search){ %>
			<a href="<%=request.getContextPath()%>/notice/list.jsp?p=1&s=<%=s%>&keyword=<%=keyword%>">&laquo;</a>
			<%} else if(sort){ %>
			<a href="<%=request.getContextPath()%>/notice/list.jsp?p=1&s=<%=s%>&type=<%=type%>">&laquo;</a>
			<%} else { %>
			<a href="<%=request.getContextPath()%>/notice/list.jsp?p=1&s=<%=s%>">&laquo;</a>
			<%} %>
		<%} %>
		
		<%if(startBlock > 1){ %>
			<%if(search){ %>
			<a href="<%=request.getContextPath()%>/notice/list.jsp?p=<%=startBlock-1%>&s=<%=s%>&keyword=<%=keyword%>">&lt;</a>
			<%} else if(sort){ %>
			<a href="<%=request.getContextPath()%>/notice/list.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>">&lt;</a>
			<%} else { %>
			<a href="<%=request.getContextPath()%>/notice/list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
			<%} %>
		<%} %>

		<%for(int i=startBlock; i <= endBlock; i++){ %>
			<%if(search){ %>
				<%if(i == p){ %>
				<a class="active" href="<%=request.getContextPath()%>/notice/list.jsp?p=<%=i%>&s=<%=s%>&keyword=<%=keyword%>"><%=i%></a>	
				<%} else { %>
				<a href="<%=request.getContextPath()%>/notice/list.jsp?p=<%=i%>&s=<%=s%>&keyword=<%=keyword%>"><%=i%></a>
				<%} %>
			<%} else if(sort){ %>
				<%if(i == p){ %>
				<a class="active" href="<%=request.getContextPath()%>/notice/list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>"><%=i%></a>	
				<%} else { %>
				<a href="<%=request.getContextPath()%>/notice/list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>"><%=i%></a>
				<%} %>
			<%} else { %>
				<%if(i == p){ %>
				<a class="active" href="<%=request.getContextPath()%>/notice/list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
				<%} else { %>
				<a href="<%=request.getContextPath()%>/notice/list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
				<%} %>
			<%} %>
		<%} %>

		<%if(endBlock < lastPage){ %>
			<%if(search){ %>
			<a href="<%=request.getContextPath()%>/notice/list.jsp?p=<%=endBlock+1%>&s=<%=s%>&keyword=<%=keyword%>">&gt;</a>
			<%} else if(sort){ %>
			<a href="<%=request.getContextPath()%>/notice/list.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>">&gt;</a>
			<%} else { %>
			<a href="<%=request.getContextPath()%>/notice/list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
			<%} %>
		<%} %>
		
		<%if(p < lastPage){ %>
			<%if(search){ %>
			<a href="<%=request.getContextPath()%>/notice/list.jsp?p=<%=lastPage%>&s=<%=s%>&keyword=<%=keyword%>">&raquo;</a>
			<%} else if(sort){ %>
			<a href="<%=request.getContextPath()%>/notice/list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>">&raquo;</a>
			<%} else { %>
			<a href="<%=request.getContextPath()%>/notice/list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
			<%} %>
		<%} %>		
	</div>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>