<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<form action="write.svt" method="post">
	<div>
	    <div>
	        <h1>1:1 문의 접수</h1>
	    </div>
	    <div>
	        <label>분류</label>
	        <select name="inquiryType">
	            <option value="">선택</option>
	            <option>문의사항</option>
	            <option>오류제보</option>
	        </select>
	    </div>
	    <div>
	        <label>제목</label>
	        <input type="text" name="inquiryTitle" autocomplete="off" required>
	    </div>
	    <div>
	        <label>내용</label>
	        <textarea name="inquiryContent" required rows="12"></textarea>
	    </div>
	    <div>
	        <button type="submit">접수하기</button>
	    </div>
	</div>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>