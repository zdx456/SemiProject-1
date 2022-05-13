<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<%


%>

<jsp:include page="/template/header.jsp"></jsp:include>
<script src="<%=request.getContextPath()%>/js/search.js"></script>
<div class="search_result">
	<div class="search_result_sort">
		<div class="all">전체</div>
		<div class="genre_wrap">
			<select name="type" class="genre">
				<option value="">장르선택</option>
				<option value="다큐멘터리">다큐멘터리</option>
				<option value="드라마">드라마</option>
				<option value="버라이어티">버라이어티</option>
				<option value="애니메이션">애니메이션</option>
				<option value="영화">영화</option>
			</select>
		</div>
		<div class="region_wrap">
			<select name="type" class="region">
				<option value="">국가선택</option>
				<option value="한국">한국</option>
				<option value="아시아">아시아</option>
				<option value="할리우드">할리우드</option>
			</select>
		</div>
		
		<div class="score">평균 평점</div>
		<div class="like">관심 수</div>	
	</div>
	
	<div class="search_list"></div>
	
	<div class="search_result_more">
		<div class="btn_searchmore hidden">전체 더보기</div>
		<div class="score_more hidden">평점순 더보기</div>
		<div class="like_more hidden">좋아요순 더보기</div>
		<div class="genre_more hidden">장르 더보기</div>
		<div class="region_more hidden">국가 더보기</div>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>