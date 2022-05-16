<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
	<div class="inquiry container w900">
	    <div>
	        <h2>1:1 문의 접수 &#9997;</h2>
	    </div>
		<form action="inquiry_write.svt" method="post">
		    <div>
				<input type="radio" name="inquiryType" value="오류제보" id="radio_error" checked>
				<label for="radio_error">수정이 필요하거나 없는 작품을 제보하고 싶어요</label>
			</div>
			<div>	
				<input type="radio" name="inquiryType" value="문의사항" id="radio_question">
				<label for="radio_question">서비스 이용에 대해 궁금한 점이 있어요</label>
			</div>	
			<div>	
				<input type="radio" name="inquiryType" value="기타" id="radio_etc">
				<label for="radio_etc">다른 궁금한 점이 있어요</label>			
		    </div>
		    <div class="input-inquiry">
		        <label for="input_inquiry_title">제목 <span>&#42;</span></label>
		        <input type="text" name="inquiryTitle" class="form-input fill" id="input_inquiry_title" autocomplete="off" required maxlength="100">	
		    </div>
		    <div>
		        <label for="input_inquiry_content">내용 <span>&#42;</span></label>
		        <textarea name="inquiryContent" class="form-input fill" id="input_inquiry_content" required rows="12" maxlength="1300"></textarea>
		    </div>
		    <div>
		        <button type="submit" class="fill btn-mint">접수하기</button>
		    </div>
	    </form>
	</div>
<jsp:include page="/template/footer.jsp"></jsp:include>