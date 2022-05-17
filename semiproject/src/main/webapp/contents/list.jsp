<%@page import="ottes.beans.OttAttachmentDto"%>
<%@page import="ottes.beans.OttAttachmentDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	OttAttachmentDao ottAttachmentDao = new OttAttachmentDao();
	List<OttAttachmentDto> listOtt = ottAttachmentDao.selectOttList();
	
	String keyword = request.getParameter("keyword");
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<script src="<%=request.getContextPath()%>/js/search.js"></script>
<div class="top_wrap">
	<div class="search_result">
		<div class="search search_position">
			<form method="get">
				<input type="search" name="keyword" required autocomplete="off" value="<%=keyword%>">	
				<input type="submit" class="hidden">
			</form>
		</div>	
		<!-- 검색 결과 OTT 필터 버튼 -->
			<%for(OttAttachmentDto ottAttachmentDto : listOtt){ %>	
				<img class="ott_filter ott_active" id="ott_filter_<%=ottAttachmentDto.getOttNo()%>" src="../adminContents/file_down.svt?attachmentNo=<%=ottAttachmentDto.getAttachmentNo()%>">
			<%} %>
		<!-- 검색 결과 정렬 버튼 -->
		<div class="search_result_sort">
			<div class="all sort_active">최신 순</div>			
			<div class="score">평점 높은 순</div>
			<div class="like">관심 수 많은 순</div>
			<div class="genre_wrap">
				<select name="type" class="genre">
					<option value="장르">장르 선택 </option>
					<option value="다큐멘터리">다큐멘터리</option>
					<option value="드라마">드라마</option>
					<option value="버라이어티">버라이어티</option>
					<option value="애니메이션">애니메이션</option>
					<option value="영화">영화</option>
				</select>
			</div>
			<div class="region_wrap">
				<select name="type" class="region">
					<option value="국가">국가 선택 </option>
					<option value="한국">한국</option>
					<option value="아시아">아시아</option>
					<option value="할리우드">할리우드</option>
				</select>
			</div>				
		</div>
		<!-- 결과 리스트 출력 -->
		<div class="search_list clear"></div>
		<!-- 더보기 버튼 -->
		<div class="btn_more_wrap search_result_more">
			<div class="btn_searchmore hidden">더 보기 &#8744;</div>
			<div class="score_more hidden">더 보기 &#8744;</div>
			<div class="like_more hidden">더 보기 &#8744;</div>
			<div class="genre_more hidden">더 보기 &#8744;</div>
			<div class="genre_more_all hidden">더 보기 &#8744;</div>
			<div class="region_more hidden">더 보기 &#8744;</div>
			<div class="ott_more hidden">더 보기 &#8744;</div>
		</div>
	</div>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>