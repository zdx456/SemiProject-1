<%@page import="java.util.List"%>
<%@page import="ottes.beans.ContentsAttachmentDao"%>
<%@page import="ottes.beans.ContentsAttachmentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String clientId = (String) session.getAttribute("login");
	boolean login = clientId != null;
	
	// 평점순 랭킹 뽑기
	ContentsAttachmentDao contentsAttachmentDao = new ContentsAttachmentDao();
	List<ContentsAttachmentDto> scoreList = contentsAttachmentDao.selectScoreList(); 
	int rank = 0; // 평점 랭킹 카운팅
	
	// 관심순 랭킹 뽑기
	List<ContentsAttachmentDto> likeList = contentsAttachmentDao.selectLikeList(); 

	// 내 장르 리스트 뽑기
	List<ContentsAttachmentDto> myGenreList = contentsAttachmentDao.selectMyGenreList(clientId); 
	
	// 내 관심 리스트 뽑기
	List<ContentsAttachmentDto> myLikeList = contentsAttachmentDao.selectMyLikeList(clientId); 	
%>
    
<jsp:include page="/template/header.jsp"></jsp:include>
			<div class="bg_img"></div>
        	<div class="bg_gradient"></div>
        	<div class=content>
	            <div class="search">
	                <h2>내가 찾는 콘텐츠, OTT에 있을까?</h2>
	                <p>영화, 드라마, 버라이어티 등</p>
	                <p>최신 콘텐츠들의 OTT 정보 뿐만 아니라</p>
	                <p>각종 맞춤 추천까지 제공해주는 서비스, <span>Ottes</span> !</p>
	                <form action="contents/list.jsp" method="get">
	                	<input type="search" name="keyword" required autocomplete="off" placeholder="제목, 감독, 배우, 줄거리 등을 입력해주세요">	
						<input type="submit" class="hidden">
	                </form>
	            </div>
	            <%if(login) {%>
		            <div class="my_genre_list">
		                <h3># 내 좋아하는 장르 콘텐츠 ✨</h3>
				        <div class="swiper">
				            <div class="swiper-wrapper">
							<%for(ContentsAttachmentDto contentsAttachmentDto : myGenreList){ %>
								<div class="swiper-slide"><a href="<%=request.getContextPath()%>/contents/detail.jsp?contentsNo=<%=contentsAttachmentDto.getContentsNo()%>"><img src="<%=request.getContextPath()%>/adminContents/file_down.svt?attachmentNo=<%=contentsAttachmentDto.getAttachmentNo()%>"></a></div>
							<%} %>                                                                                                                                                  
				            </div>
				            <div class="swiper-button-prev"></div>
			             	<div class="swiper-button-next"></div>
				        </div>
			        </div>
		            <div class="my_like_list">
		                <h3># 내 관심 콘텐츠 💖</h3>
				        <div class="swiper">
				            <div class="swiper-wrapper">
							<%for(ContentsAttachmentDto contentsAttachmentDto : myLikeList){ %>
								<div class="swiper-slide"><a href="<%=request.getContextPath()%>/contents/detail.jsp?contentsNo=<%=contentsAttachmentDto.getContentsNo()%>"><img src="<%=request.getContextPath()%>/adminContents/file_down.svt?attachmentNo=<%=contentsAttachmentDto.getAttachmentNo()%>"></a></div>
							<%} %>                                                                                                                                                  
				            </div>
				            <div class="swiper-button-prev"></div>
			             	<div class="swiper-button-next"></div>
				        </div>
			        </div>			        	            	
	            <%} else {%>
		            <div class="score_list">
		                <h3># 가장 높은 평점의 콘텐츠 ✨</h3>
				        <div class="swiper">
				            <div class="swiper-wrapper">
							<%for(ContentsAttachmentDto contentsAttachmentDto : scoreList){ %>
								<%rank++;%>
								<div class="swiper-slide"><a href="<%=request.getContextPath()%>/contents/detail.jsp?contentsNo=<%=contentsAttachmentDto.getContentsNo()%>"><span><%=rank%></span><img src="<%=request.getContextPath()%>/adminContents/file_down.svt?attachmentNo=<%=contentsAttachmentDto.getAttachmentNo()%>"></a></div>
							<%} %>                                                                                                                                                  
				            </div>
				            <div class="swiper-button-prev"></div>
			             	<div class="swiper-button-next"></div>
				        </div>
			        </div>	
		            <div class="like_list">
		                <h3># 관심 집중 콘텐츠! 💖</h3>
				        <div class="swiper">
				            <div class="swiper-wrapper">
							<%for(ContentsAttachmentDto contentsAttachmentDto : likeList){ %>
								<div class="swiper-slide"><a href="<%=request.getContextPath()%>/contents/detail.jsp?contentsNo=<%=contentsAttachmentDto.getContentsNo()%>"><img src="<%=request.getContextPath()%>/adminContents/file_down.svt?attachmentNo=<%=contentsAttachmentDto.getAttachmentNo()%>"></a></div>
							<%} %>                                                                                                                                                  
				            </div>
				            <div class="swiper-button-prev"></div>
			             	<div class="swiper-button-next"></div>
				        </div>
			        </div>
	            <%} %>			        
		            <div class="recent_list">
		                <h3># 지금 HOT한 최신 콘텐츠 🔥</h3>
			        </div>
			        <div class="btn_more_wrap">
			        	<div class="btn_more">더 보기 &#8744</div>	
			        </div>            	        
	        </div>	 	                	            
<jsp:include page="/template/footer.jsp"></jsp:include>