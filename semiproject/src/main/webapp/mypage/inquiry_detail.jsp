<%@page import="java.util.List"%>
<%@page import="ottes.beans.InquiryDao"%>
<%@page import="ottes.beans.InquiryDto"%>
<%@page import="ottes.beans.ReplyDao"%>
<%@page import="ottes.beans.ReplyDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// inquiryNo로 해당 문의 불러오기
	int inquiryNo = Integer.parseInt(request.getParameter("inquiryNo"));
	InquiryDao inquiryDao = new InquiryDao();
	InquiryDto inquiryDto = inquiryDao.selectOne(inquiryNo);
	
	// 현재 문의 댓글 목록 조회
	ReplyDao replyDao = new ReplyDao();
	List<ReplyDto> replyList = replyDao.selectList(inquiryDto.getInquiryNo()); 
%>    
    
<jsp:include page="/template/header.jsp"></jsp:include>
<table>
	<!-- 문의 내용 -->
	<tr>
		<td><%=inquiryDto.getInquiryType()%></td>
	</tr>
	<tr>
		<td><%=inquiryDto.getInquiryTitle()%></td>
	</tr>
	<tr>
		<td><%=inquiryDto.getInquiryDate()%></td>
	</tr>	
	<tr>
		<td><%=inquiryDto.getInquiryContent()%></td>
	</tr>
	<!-- 댓글 목록 -->
	<tr>
		<td>
			<table>
			<%for(ReplyDto replyDto : replyList){ %>
				<tr>
					<td>Ottes</td>
					<td><%=replyDto.getReplyDate()%></td>
				</tr>
				<tr>
					<td>
						<pre><%=replyDto.getReplyContent()%></pre>
					</td>
				</tr>
			<%} %>	
			</table>
		</td>
	</tr>
</table>
<div><a href="inquiry_list.jsp">목록</a></div>
<jsp:include page="/template/footer.jsp"></jsp:include>