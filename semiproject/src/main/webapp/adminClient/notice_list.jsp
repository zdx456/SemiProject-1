<%-- <%@page import="java.util.List"%>
<%@page import="ottes.beans.NoticeDao"%>
<%@page import="ottes.beans.NoticeDto"%>
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
	NoticeDao noticeDao = new NoticeDao();
	List<NoticeDto> list;
	if(search){
		list = noticeDao.selectListByPaging(p, s, type, keyword); 
	}
	else {
		list = noticeDao.selectListByPaging(p, s);
	}
	
	// 페이지 수 카운팅
	int count;
	if(search){
		count = noticeDao.countByPaging(type, keyword);
	}
	else{
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
<div>
	<div>
		<h1>공지사항 관리</h1>
		<form action="notice_list.jsp" method="get">
			<select name="type">
				<option value="notice_title">제목</option>
				<option value="notice_content">내용</option>
			</select>			
			<input type="search" name="keyword" required autocomplete="off" >		
			<input type="submit" value="검색">
		</form>
	</div>
	<div><a href="notice_write.jsp">새 공지 등록</a></div>
	<div>
		<table>
			<thead>
				<tr>
					<th>분류</th>
					<th>제목</th>
					<th>작성일</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%for(NoticeDto noticeDto : list){ %>
					<tr>
						<td><%=noticeDto.getNoticeType()%></td>
						<td><%=noticeDto.getNoticeTitle()%></td>
						<td><%=noticeDto.getNoticeDate()%></td>
						<td><a href="notice_edit.jsp?noticeNo=<%=noticeDto.getNoticeNo()%>">수정</a></td>
						<td><a href="notice_delete.svt?noticeNo=<%=noticeDto.getNoticeNo()%>">삭제</a></td>
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	<div>
		<%if(p > 1){ %>
			<%if(search){ %>
			<a href="notice_list.jsp?p=1&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&laquo;</a>
			<%} else { %>
			<a href="notice_list.jsp?p=1&s=<%=s%>">&laquo;</a>
			<%} %>
		<%} %>
		
		<%if(startBlock > 1){ %>
			<%if(search){ %>
			<a href="notice_list.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a>
			<%} else { %>
			<a href="notice_list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
			<%} %>
		<%} %>

		<%for(int i=startBlock; i <= endBlock; i++){ %>
			<%if(search){ %>
				<%if(i == p){ %>
				<a href="notice_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>	
				<%} else { %>
				<a href="notice_list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
				<%} %>
			<%} else { %>
				<%if(i == p){ %>
				<a href="notice_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
				<%} else { %>
				<a href="notice_list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
				<%} %>
			<%} %>
		<%} %>

		<%if(endBlock < lastPage){ %>
			<%if(search){ %>
			<a href="notice_list.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a>
			<%} else { %>
			<a href="notice_list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
			<%} %>
		<%} %>
		
		<%if(p < lastPage){ %>
			<%if(search){ %>
			<a href="notice_list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&raquo;</a>
			<%} else { %>
			<a href="notice_list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
			<%} %>
		<%} %>		
	</div>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include> --%>