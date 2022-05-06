<%@page import="java.util.List"%>
<%@page import="ottes.beans.NoticeDao"%>
<%@page import="ottes.beans.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// noticeNo로 해당 게시글 불러오기
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	NoticeDao noticeDao = new NoticeDao();
	NoticeDto noticeDto = noticeDao.selectOne(noticeNo);
%>    
    
<jsp:include page="/template/header.jsp"></jsp:include>
<table>
	<tr>
		<td><%=noticeDto.getNoticeType()%></td>
	</tr>
	<tr>
		<td><%=noticeDto.getNoticeTitle()%></td>
	</tr>
	<tr>
		<td><%=noticeDto.getNoticeDate()%></td>
	</tr>	
	<tr>
		<td><%=noticeDto.getNoticeContent()%></td>
	</tr>
</table>
<div><a href="list.jsp">목록</a></div>
<jsp:include page="/template/footer.jsp"></jsp:include>