<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/template/header.jsp"></jsp:include>
			<div class="bg_img"></div>
        	<div class="bg_gradient"></div>
            <div class="search">
                <h2>내가 찾는 콘텐츠, OTT에 있을까?</h2>
                <p>영화, 드라마, 버라이어티 등</p>
                <p>최신 콘텐츠들의 OTT 정보 뿐만 아니라</p>
                <p>각종 맞춤 추천까지 제공해주는 서비스, <span>Ottes</span>!</p>
                <input type="text">
            </div>
            <div class="content">
                <h3># 지금 가장 HOT한 컨텐츠</h3>
		        <div class="swiper">
		                <div class="swiper-wrapper">
		                    <div class="swiper-slide">
		                        <img src="<%=request.getContextPath()%>/image/test.jpg">
		                    </div>
		                    <div class="swiper-slide">
		                        <img src="<%=request.getContextPath()%>/image/test.jpg">
		                    </div>
		                    <div class="swiper-slide">
		                        <img src="<%=request.getContextPath()%>/image/test.jpg">
		                    </div>
		                    <div class="swiper-slide">
		                        <img src="<%=request.getContextPath()%>/image/test.jpg">
		                    </div>
		                    <div class="swiper-slide">
		                        <img src="<%=request.getContextPath()%>/image/test.jpg">
		                    </div>
		                    <div class="swiper-slide">
		                        <img src="<%=request.getContextPath()%>/image/test.jpg">
		                    </div>
		                    <div class="swiper-slide">
		                        <img src="<%=request.getContextPath()%>/image/test.jpg">
		                    </div>
		                    <div class="swiper-slide">
		                        <img src="<%=request.getContextPath()%>/image/test.jpg">
		                    </div>
		                    <div class="swiper-slide">
		                        <img src="<%=request.getContextPath()%>/image/test.jpg">
		                    </div>
		                    <div class="swiper-slide">
		                        <img src="<%=request.getContextPath()%>/image/test.jpg">
		                    </div>
		                    <div class="swiper-slide">
		                        <img src="<%=request.getContextPath()%>/image/test.jpg">
		                    </div>
		                    <div class="swiper-slide">
		                        <img src="<%=request.getContextPath()%>/image/test.jpg">
		                    </div>                                                                                                                                                      
		                </div>
		             <div class="swiper-button-prev"></div>
	             	 <div class="swiper-button-next"></div>
		             </div>
	             </div>
<jsp:include page="/template/footer.jsp"></jsp:include>