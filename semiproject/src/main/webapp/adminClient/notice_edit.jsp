<%@page import="ottes.beans.NoticeDao"%>
<%@page import="ottes.beans.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));

	NoticeDao noticeDao = new NoticeDao();
	NoticeDto noticeDto = noticeDao.selectOne(noticeNo);
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<form action="notice_edit.svt" method="post">
	<div>
	    <div>
	        <h1>공지사항 수정</h1>
	    </div>
	    <div>
	    	<input type="hidden" name="noticeNo" value="<%=noticeDto.getNoticeNo()%>">
	        <label>말머리</label>
	        <%if(noticeDto.getNoticeType() == null){ %>
			<select name="noticeType">
				<option value=""  selected>선택</option>
				<option>공지</option>
				<option>FAQ</option>
			</select>
			<%} else if(noticeDto.getNoticeType().equals("공지")){ %>
			<select name="noticeType">
				<option value="">선택</option>
				<option selected>공지</option>
				<option>FAQ</option>
			</select>
			<%} else if(noticeDto.getNoticeType().equals("FAQ")){ %>
			<select name="noticeType">
				<option value="">선택</option>
				<option>공지</option>
				<option selected>FAQ</option>
			</select>
			<%} %>
	    </div>
	    <div>
	        <label>제목</label>
	        <input type="text" name="noticeTitle" autocomplete="off" required value="<%=noticeDto.getNoticeTitle()%>">
	    </div>
	    <div>
	        <label>내용</label>
	        <textarea name="noticeContent" required rows="12"><%=noticeDto.getNoticeContent()%></textarea>
	    </div>
	    <div>
	        <button type="submit">수정하기</button>
	    </div>
	    <div>
	        <a href="notice_list.jsp">목록으로</a>
	    </div>
	</div>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>