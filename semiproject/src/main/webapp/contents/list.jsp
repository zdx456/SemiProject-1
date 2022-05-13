<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<%


%>

<jsp:include page="/template/header.jsp"></jsp:include>
<script src="<%=request.getContextPath()%>/js/search.js"></script>

<div class="all">전체</div>
<div class="genre">
<form>
	<select name="type">
		<option value="다큐멘터리">다큐멘터리</option>
		<option value="드라마">드라마</option>
		<option value="버라이어티">버라이어티</option>
		<option value="애니메이션">애니메이션</option>
		<option value="영화">영화</option>
	</select>
</form>
</div>
<div class="region">
	<select name="type">
		<option value="한국">한국</option>
		<option value="아시아">아시아</option>
		<option value="할리우드">할리우드</option>
	</select>
</div>
<div class="score">평균 평점</div>
<div class="like">관심 수</div>
<div class="search_list"></div>
<div class="btn_searchmore"></div>

<jsp:include page="/template/footer.jsp"></jsp:include>