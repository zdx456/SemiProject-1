<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
	<div class="admin_notice">
		<div class="inquiry container w900">
		    <div class="notice_edit_wrap">
		        <h2>새 공지사항 작성</h2>
				<div class="notice_sort">
					<form action="<%=request.getContextPath()%>/adminClient/notice_list.jsp" method="get">		
						<input type="text" class="hidden">		
						<input type="submit" value="전체보기">
					</form>
					<form action="<%=request.getContextPath()%>/adminClient/notice_list.jsp" method="get">		
						<input type="text" class="hidden" name="type" value="공지">		
						<input type="submit" value="공지">
					</form>	
					<form action="<%=request.getContextPath()%>/adminClient/notice_list.jsp" method="get">		
						<input type="text" class="hidden" name="type" value="FAQ">		
						<input type="submit" value="FAQ">
					</form>					
				</div>		        
		    </div>
			<form action="<%=request.getContextPath()%>/adminClient/notice_write.svt" method="post">
			    <div>
					<input type="radio" name="noticeType" value="공지" id="radio_notice" checked>
					<label for="radio_notice">공지</label>
				</div>
				<div>	
					<input type="radio" name="noticeType" value="FAQ" id="radio_faq">
					<label for="radio_faq">FAQ</label>
				</div>
			    <div class="input-inquiry">
			        <label for="input_inquiry_title">제목 <span>&#42;</span></label>
			        <input type="text" name="noticeTitle" class="form-input fill" id="input_inquiry_title" autocomplete="off" required maxlength="100">	
			    </div>
			    <div>
			        <label for="input_inquiry_content">내용 <span>&#42;</span></label>
			        <textarea name="noticeContent" class="form-input fill" id="input_inquiry_content" required rows="12" maxlength="1300"></textarea>
			    </div>
			    <div>
			        <button type="submit" class="fill btn-mint">등록하기</button>
			    </div>
		    </form>
	    </div>	
	</div>	
<jsp:include page="/template/footer.jsp"></jsp:include>