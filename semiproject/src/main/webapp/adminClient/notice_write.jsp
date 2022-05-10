<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<form action="notice_write.svt" method="post">
	<div>
	    <div>
	        <h1>공지사항 작성</h1>
	    </div>
	    <div>
	        <label>분류</label>
	        <select name="noticeType">
	            <option value="">선택</option>
	            <option>공지</option>
	            <option>FAQ</option>
	        </select>
	    </div>
	    <div>
	        <label>제목</label>
	        <input type="text" name="noticeTitle" autocomplete="off" required>
	    </div>
	    <div>
	        <label>내용</label>
	        <textarea name="noticeContent" required rows="12"></textarea>
	    </div>
	    <div>
	        <button type="submit">등록하기</button>
	    </div>
	</div>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>