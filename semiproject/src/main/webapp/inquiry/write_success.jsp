<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
	<div class="inquiry_success container w900 center">
		<h2>1:1 문의가 접수되었습니다!</h2>
		<p class="emoji">&#129303;</p>
		<p>접수하신 문의 및 답변 내용은 </p>
		<p>[ 마이페이지 ] > [ 내 문의 ] 에서 확인하실 수 있습니다.</p>
		<div class="my_inquiry_btn"><a href="<%=request.getContextPath()%>/mypage/inquiry_list.jsp">내 문의 확인하기</a></div>
	</div>
<jsp:include page="/template/footer.jsp"></jsp:include>