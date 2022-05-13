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
	
	// 고객센터 말머리 색 구분
	for(var i = 0; i < $('.notice_type').length; i++) {
		if($('.notice_type').eq(i).text() == '공지') {
			$('.notice_type').eq(i).css("color", "#FF003A");
		} else {
			$('.notice_type').eq(i).css("color", "#00ADB5");
		}
	}
	
	// 헤더 메뉴 하나 누르면 다른 하나는 사라지게 하는 스크립트 추가 했습니다.
	// @author:이기주
	$(function(){
	    $('input[type="checkbox"][name="headerchk"]').click(function(){
	        if($(this).prop('checked')){
	            $('input[type="checkbox"][name="headerchk"]').prop('checked', false);
	            $(this).prop('checked', true);
	        }
	    });
	});
});