<%@page import="java.util.List"%>
<%@page import="ottes.beans.NoticeDao"%>
<%@page import="ottes.beans.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인 판정
	String clientId = (String) session.getAttribute("login");
	boolean login = clientId != null;
	
	// noticeNo로 해당 게시글 불러오기
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	NoticeDao noticeDao = new NoticeDao();
	NoticeDto noticeDto = noticeDao.selectOne(noticeNo);
%>    
    
<jsp:include page="/template/header.jsp"></jsp:include>
<div class="notice_bg"></div>
<div class="top_wrap">
	<div class="inquiry_write">
		<%if(login) {%>
		<p>찾으시는 내용이 없다면 1:1 문의를 이용해주세요.</p>
		<div><a href="<%=request.getContextPath()%>/inquiry/write.jsp">1:1 문의 접수</a></div>
		<%} else {%>
		<p>로그인 하시면 1:1 문의를 이용하실 수 있습니다.</p>
		<div><a href="<%=request.getContextPath()%>/client/login.jsp">로그인</a></div>		
		<%} %>
		<p>- 고객센터 운영 시간 : 평일 09시 ~ 18시 (공휴일 휴무) </p>
		<p>- 답변까지 최대 3영업일이 소요될 수 있습니다. </p>
	</div>
	<div class="search">
		<h2><a href="<%=request.getContextPath()%>/notice/list.jsp">고객센터</a></h2>
		<form action="list.jsp" method="get">
			<input type="search" name="keyword" placeholder="어떤 도움이 필요하세요?" required autocomplete="off">
			<button type="submit" class="hidden"></button>
		</form>
		<div class="faq_example">
			자주 묻는 질문 : 
			<a href="<%=request.getContextPath()%>/notice/list.jsp?keyword=비밀번호">비밀번호 분실</a>
			, <a href="<%=request.getContextPath()%>/notice/list.jsp?keyword=콘텐츠">콘텐츠 요청</a>
			, <a href="<%=request.getContextPath()%>/notice/list.jsp?keyword=OTT">내 OTT 관리</a>
		</div>
	</div>
	<div class="notice_sort">
		<form action="list.jsp" method="get">		
			<input type="text" class="hidden">		
			<input type="submit" value="전체보기">
		</form>
		<form action="list.jsp" method="get">		
			<input type="text" class="hidden" name="type" value="공지">		
			<input type="submit" value="공지">
		</form>	
		<form action="list.jsp" method="get">		
			<input type="text" class="hidden" name="type" value="FAQ">		
			<input type="submit" value="FAQ">
		</form>					
	</div>
	<div class="notice notice_detail">
		<table>
			<thead>
				<tr>
					<th class="center notice_type"><%=noticeDto.getNoticeType()%></th>
					<th><a><%=noticeDto.getNoticeTitle()%></a></th>
					<th class="center"><%=noticeDto.getNoticeDate()%></th>
				</tr>	
			</thead>
			<tbody>
				<tr>
					<td colspan="3"><pre><%=noticeDto.getNoticeContent()%></pre></td>
				</tr>
				<tr>
					<td class="center">다음</td>
					<%if(noticeDto.getNoticeTitleNext() == null) {%>
					<td><a>다음 글이 없습니다</a></td>
					<td class="center"></td>
					<%} else {%>
					<td><a href="<%=request.getContextPath()%>/notice/detail.jsp?noticeNo=<%=noticeDto.getNoticeNoNext()%>"><%=noticeDto.getNoticeTitleNext()%></a></td>
					<td class="center"><%=noticeDto.getNoticeDateNext()%></td>					
					<%} %>
				</tr>
				<tr>
					<td class="center">이전</td>
					<%if(noticeDto.getNoticeTitlePrev() == null) {%>
					<td><a>이전 글이 없습니다</a></td>
					<td class="center"></td>
					<%} else {%>										
					<td><a href="<%=request.getContextPath()%>/notice/detail.jsp?noticeNo=<%=noticeDto.getNoticeNoPrev()%>"><%=noticeDto.getNoticeTitlePrev()%></a></td>
					<td class="center"><%=noticeDto.getNoticeDatePrev()%></td>
					<%} %>
				</tr>											
			</tbody>
		</table>
	</div>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>