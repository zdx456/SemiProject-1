$(function(){
	// 메인 페이지 최신 콘텐츠 더보기 (7개씩)
	var page = 1;
    loadPage(page);

    $(".btn_more").click(function(){
    	page++;
        loadPage(page);
    });
            
    function loadPage(page) {
    	$.ajax({
        	url:"http://localhost:8080/semiproject/main/list.svt",
            type:"post",
            data:{
            	p : page
            },
            success:function(resp){
            	if(resp.length < 7) {
                	$(".btn_more").remove();
                }
                
                var div1 = $("<div>").addClass("swiper");
                var div2 = $("<div>").addClass("swiper-wrapper");
                 
                for(var i=0; i < resp.length; i++) {
                	var div3 = $("<div>").addClass("swiper-slide").addClass("recent_list_style");
                	var img = $("<img>").attr("src", "http://localhost:8080/semiproject/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo);
                	var a = $("<a>").attr("href", "http://localhost:8080/semiproject/contents/detail.jsp?contentsNo=" + resp[i].contentsNo).addClass("cover").addClass("hidden");
                	var span1 = $("<span>").addClass("cover_text");
                	var span2 = $("<span>").text(resp[i].contentsTitle);
                	
                	span1.append(span2);
                	a.append(span1);
					div3.append(img).append(a);
					div2.append(div3)
                }

                div1.append(div2);
					
				$(".recent_list").append(div1);
            }
		});
	}
	
	// 슬라이더(swiper) 옵션
	var swiper = new Swiper('.swiper', {
        spaceBetween: 20,
		slidesPerView : 7,
		loop : false,
		loopAdditionalSlides : 1,
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
	});
	
	// 배경 이미지 페이드(swiper) 옵션
	var swiperFade = new Swiper('.swiper_fade', {
		effect : 'fade',
		loop : true,
		pagination : false,
		allowTouchMove : false,
		autoplay : {
  			delay : 5000
		},
	});
	
	// 호버 시 슬라이드 정보 출력 
	$(document).on('mouseenter', '.swiper-slide', (function(){
    	$(this).find('.cover').fadeIn(120);
	}));
	$(document).on('mouseleave', '.swiper-slide', (function(){
    	$(this).find('.cover').fadeOut(120);
	}));
	
	// 호버 시 테이블 행 강조 효과 (고객센터)
	$(document).on('mouseenter', '.notice > table > tbody > tr', (function(){
    	$(this).find('a').addClass('table_active');
	}));
	$(document).on('mouseleave', '.notice > table > tbody > tr', (function(){
    	$(this).find('a').removeClass('table_active');
	}));
	
	// 공지 말머리 색 구분
	for(var i = 0; i < $('.notice_type').length; i++) {
		if($('.notice_type').eq(i).text() == '공지') {
			$('.notice_type').eq(i).css("color", "#FF003A");
		} else {
			$('.notice_type').eq(i).css("color", "#00ADB5");
		}
	}
	
	// 문의 말머리 색 구분
	for(var i = 0; i < $('.inquiry_type').length; i++) {
		if($('.inquiry_type').eq(i).text() == '오류제보') {
			$('.inquiry_type').eq(i).css("color", "#FF003A");
		} else if ($('.inquiry_type').eq(i).text() == '문의사항') {
			$('.inquiry_type').eq(i).css("color", "#00ADB5");
		} else {
			$('.inquiry_type').eq(i).css("color", "#865DBB");
		}
	}
	
	// 고객센터 활성화 정렬 색 표시
	if (decodeURI(location.search) == "") {
		$('.notice_sort input[value=전체보기]').css("color", "#EDC948");
	} 
	if (decodeURI(location.search) == "?type=공지") {
		$('.notice_sort input[value=공지]').css("color", "#EDC948");
	} 
	if (decodeURI(location.search) == "?type=FAQ") {
		$('.notice_sort input[value=FAQ]').css("color", "#EDC948");
	}
	if (decodeURI(location.search) == "?type=오류제보") {
		$('.notice_sort input[value=오류제보]').css("color", "#EDC948");
	}
	if (decodeURI(location.search) == "?type=문의사항") {
		$('.notice_sort input[value=문의사항]').css("color", "#EDC948");
	}
	if (decodeURI(location.search) == "?type=기타") {
		$('.notice_sort input[value=기타]').css("color", "#EDC948");
	}	
	
	// 댓글 수정 영역 표시 토글
	$('.reply_edit_btn').click(function(){
        $(this).siblings('.reply_edit').toggle();
    });		
});