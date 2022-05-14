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
<div class="top_wrap">
	<div class="admin_notice_detail">
		<div class="admin_notice">
			<h2><a href="<%=request.getContextPath()%>/adminClient/inquiry_list.jsp">1:1 문의 관리</a></h2>
		</div>
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
		<div class="notice notice_detail inquiry_detail">
			<!-- 문의 내용 -->
			<table>
				<thead>
					<tr>
						<th class="center inquiry_type"><%=inquiryDto.getInquiryType()%></th>
						<th><a><%=inquiryDto.getInquiryTitle()%></a></th>
						<th class="center"><%=inquiryDto.getInquiryWriter()%></th>
						<th class="center"><%=inquiryDto.getInquiryDate()%></th>
					</tr>	
				</thead>
				<tbody>
					<tr>
						<td colspan="4"><pre><%=inquiryDto.getInquiryContent()%></pre></td>
					</tr>
				</tbody>
			</table>
			<!-- 댓글 목록 -->
			<%for(ReplyDto replyDto : replyList){ %>
			<div class="reply">
				<h4>Ottes 운영팀</h4>
				<div class="reply_edit_btn">수정</div>
				<div class="reply_delete_btn"><a href="<%=request.getContextPath()%>/adminClient/reply_delete.svt?replyNo=<%=replyDto.getReplyNo()%>&replyTarget=<%=replyDto.getReplyTarget()%>">삭제</a></div>			
				<p><%=replyDto.getReplyDate()%></p>			
				<pre><%=replyDto.getReplyContent()%></pre>								
				<!-- 댓글 수정 -->
				<div class="reply_edit hidden">
					<form action="reply_edit.svt" method="post">
						<input type="hidden" name="replyNo" value="<%=replyDto.getReplyNo()%>">
						<input type="hidden" name="replyTarget" value="<%=replyDto.getReplyTarget()%>">
						<textarea name="replyContent" required><%=replyDto.getReplyContent()%></textarea>
						<input type="submit" value="수정">
					</form>				
				</div>
			</div>			
			<%} %>
			<!-- 댓글 작성 -->
			<div class="reply reply_write">
				<h3>답변 작성</h3>
				<form action="reply_write.svt" method="post">
					<input type="hidden" name="replyTarget" value="<%=inquiryDto.getInquiryNo()%>">
					<textarea name="replyContent" required rows="4" cols="100"></textarea>
					<input class="reply_write_btn" type="submit" value="등록">
				</form>
			</div>		
		</div>
	</div>						
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>