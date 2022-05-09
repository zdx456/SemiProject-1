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
<form action="/adminClient/update.svt" method="post">
	<div>
		<label>
			<input type="text">
		</label>
	</div>
			clientDto.setClientNick(req.getParameter("clinetNick"));
			clientDto.setClientGender(req.getParameter("clientGender"));
			clientDto.setClientGrade(req.getParameter("clientGrade"));
			clientDto.setClientBirth(req.getParameter("clientBirth")); 
			clientDto.setClientEmail(req.getParameter("clientEmail"));
</form>
<div><a href="list.jsp">목록</a></div>
<jsp:include page="/template/footer.jsp"></jsp:include>