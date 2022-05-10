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
                	var a = $("<a>").attr("href", "http://localhost:8080/semiproject/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
                	var img = $("<img>").attr("src", "http://localhost:8080/semiproject/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo);

                	a.append(img);
					div3.append(a);
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
});