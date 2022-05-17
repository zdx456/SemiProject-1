$(function(){
	// 검색 페이지 (포스터, 줄거리 출력되도록 리스트 구현)
	var query = window.location.search;
	var param = new URLSearchParams(query);
	var keyword = param.get("keyword");
	var type = param.get("type");
	
	// 검색어를 입력할 시
	if (keyword != null) {
		searchFirstPage(keyword);
		$('.btn_searchmore').removeClass('hidden');
	}
	
	// 상단 메뉴의 장르 카테고리로 들어갈 시
	if (type != null) {
		$('.search_result_sort').addClass('hidden');
		$('.search_position').addClass('hidden');
		$('.ott_filter').addClass('hidden');
		searchGenreFirstSortPage(type);
		$('.genre_more_all').removeClass('hidden');
	};

	var page1 = 1;
	var page2 = 1;
	var page3 = 1;
	var page4 = 1;
	var page5 = 1;
	var page6 = 1;
	var page7 = 1;
	
	// 정렬 버튼
	$(".all").click(function(){
		// 결과 출력란 비우기
		$('.search_list').empty();
		
		// 페이지 초기화
		page1 = 1;
		
		// 검색 함수 실행
	    searchFirstPage(keyword);
	    
	    // 해당하는 더보기 버튼만 표시 활성화	    
	    $('.btn_searchmore').removeClass('hidden');
	    $('.score_more').addClass('hidden');
	    $('.like_more').addClass('hidden');
	    $('.genre_more').addClass('hidden');
	    $('.region_more').addClass('hidden');
	    $('.ott_more').addClass('hidden');
	    
	    // 해당하는 정렬 버튼만 스타일 활성화 & 셀렉트 초기화
	    $('.all').addClass('sort_active');
	    $('.score').removeClass('sort_active');
	    $('.like').removeClass('sort_active');
	    $('.genre_wrap').removeClass('sort_active');
	    $('.region_wrap').removeClass('sort_active');
	    $(".genre").find("option:eq(0)").prop("selected", true);
	    $(".region").find("option:eq(0)").prop("selected", true);	
	    $('.ott_filter').addClass('ott_active');  	    
	});		
		
	$(".score").click(function(){
		$('.search_list').empty();
		
		page2 = 1;
		
	    searchScoreFirstPage(keyword);
	    
		$('.btn_searchmore').addClass('hidden');
		$('.score_more').removeClass('hidden');
		$('.like_more').addClass('hidden');
		$('.genre_more').addClass('hidden');
		$('.region_more').addClass('hidden');
		$('.ott_more').addClass('hidden'); 
		
	    $('.all').removeClass('sort_active');
	    $('.score').addClass('sort_active');
	    $('.like').removeClass('sort_active');
	    $('.genre_wrap').removeClass('sort_active');
	    $('.region_wrap').removeClass('sort_active');
	    $(".genre").find("option:eq(0)").prop("selected", true);
	    $(".region").find("option:eq(0)").prop("selected", true);	
	    $('.ott_filter').addClass('ott_active');			  
	});	

	$(".like").click(function(){
		$('.search_list').empty();
		
		page3 = 1;
		
	    searchLikeFirstPage(keyword);
	    
		$('.btn_searchmore').addClass('hidden');
		$('.score_more').addClass('hidden');
		$('.like_more').removeClass('hidden');
		$('.genre_more').addClass('hidden');
		$('.region_more').addClass('hidden');
		$('.ott_more').addClass('hidden');
	    
	    $('.all').removeClass('sort_active');
	    $('.score').removeClass('sort_active');
	    $('.like').addClass('sort_active');
	    $('.genre_wrap').removeClass('sort_active');
	    $('.region_wrap').removeClass('sort_active');
	    $(".genre").find("option:eq(0)").prop("selected", true);
	    $(".region").find("option:eq(0)").prop("selected", true);	    	    
	    $('.ott_filter').addClass('ott_active');    
	});	
	
	$(".genre").change(function(){
		$('.search_list').empty();
		 if ($(this).val() == "장르") {
			searchFirstPage(keyword);
			
			page1 = 1;
			
			$('.btn_searchmore').removeClass('hidden');
			$('.score_more').addClass('hidden');
			$('.like_more').addClass('hidden');
			$('.genre_more').addClass('hidden');
			$('.region_more').addClass('hidden');
			$('.ott_more').addClass('hidden');
			
		    $('.all').addClass('sort_active');
		    $('.score').removeClass('sort_active');
		    $('.like').removeClass('sort_active');
		    $('.genre_wrap').removeClass('sort_active');
		    $('.region_wrap').removeClass('sort_active');
		    $(".genre").find("option:eq(0)").prop("selected", true);
		    $(".region").find("option:eq(0)").prop("selected", true);	
		    $('.ott_filter').addClass('ott_active');			
		} else {
			searchGenreFirstPage(keyword, $(this).val());
			
			page4 = 1;
			
			$('.btn_searchmore').addClass('hidden');
			$('.score_more').addClass('hidden');
			$('.like_more').addClass('hidden');
			$('.genre_more').removeClass('hidden');
			$('.region_more').addClass('hidden');
			$('.ott_more').addClass('hidden');

			$('.all').removeClass('sort_active');
			$('.score').removeClass('sort_active');
			$('.like').removeClass('sort_active');
			$('.genre_wrap').addClass('sort_active');
			$('.region_wrap').removeClass('sort_active');
			$(".region").find("option:eq(0)").prop("selected", true);
			$('.ott_filter').addClass('ott_active');
		} 	
	});
	
	$(".region").change(function(){
		$('.search_list').empty();
		 if ($(this).val() == "국가") {
			searchFirstPage(keyword);
			
			page1 = 1;
			
			$('.btn_searchmore').removeClass('hidden');
			$('.score_more').addClass('hidden');
			$('.like_more').addClass('hidden');
			$('.genre_more').addClass('hidden');
			$('.region_more').addClass('hidden');
			$('.ott_more').addClass('hidden');
			   
		    $('.all').addClass('sort_active');
		    $('.score').removeClass('sort_active');
		    $('.like').removeClass('sort_active');
		    $('.genre_wrap').removeClass('sort_active');
		    $('.region_wrap').removeClass('sort_active');
		    $(".genre").find("option:eq(0)").prop("selected", true);
		    $(".region").find("option:eq(0)").prop("selected", true);	
		    $('.ott_filter').addClass('ott_active');			   
		} else {
			searchRegionFirstPage(keyword, $(this).val());
			
			page6 = 1;
			
			$('.btn_searchmore').addClass('hidden');
			$('.score_more').addClass('hidden');
			$('.like_more').addClass('hidden');
			$('.genre_more').addClass('hidden');
			$('.region_more').removeClass('hidden');
			$('.ott_more').addClass('hidden');

		    $('.all').removeClass('sort_active');
		    $('.score').removeClass('sort_active');
		    $('.like').removeClass('sort_active');
		    $('.genre_wrap').removeClass('sort_active');
		    $('.region_wrap').addClass('sort_active');
			$(".genre").find("option:eq(0)").prop("selected", true);
		    $('.ott_filter').addClass('ott_active');		
		} 		
	});	

	$(".ott_filter").click(function(){
		$('.search_list').empty();
		
		page7 = 1;
		
		var id = $(this).attr('id');
		var ottNo = id.replace('ott_filter_', '');
	    searchOttFirstPage(keyword, ottNo);	
	        
	    $('.btn_searchmore').addClass('hidden');
	    $('.score_more').addClass('hidden');
	    $('.like_more').addClass('hidden');
	    $('.genre_more').addClass('hidden');
	    $('.region_more').addClass('hidden');
	    $('.ott_more').removeClass('hidden');
	    
	    $('.all').removeClass('sort_active');
	    $('.score').removeClass('sort_active');
	    $('.like').removeClass('sort_active');
	    $('.genre_wrap').removeClass('sort_active');
	    $('.region_wrap').removeClass('sort_active');
  		$(".genre").find("option:eq(0)").prop("selected", true);
	    $(".region").find("option:eq(0)").prop("selected", true);
	    $('.ott_filter').removeClass('ott_active'); 
	    $(this).addClass('ott_active');
	});				
	
	// 더보기 버튼
	$(".btn_searchmore").click(function(){
	    page1++;
	    searchPage(page1, keyword);
	});	

	$(".score_more").click(function(){
		page2++;	
	    searchScorePage(page2, keyword);
	});	

	$(".like_more").click(function(){
		page3++;
	    searchLikePage(page3, keyword);
	});			
	
	$(".genre_more").click(function(){
		page4++;
		searchGenrePage(page4, keyword, $(".genre_wrap>.genre").val()); 
	});			

	$(".genre_more_all").click(function(){
		page5++;
		searchGenreSortPage(page5, type); 
	});	
	
	$(".region_more").click(function(){
		page6++;
	    searchRegionPage(page6, keyword, $(".region_wrap>.region").val());
	});	
	
	$(".ott_more").click(function(){
		var id = $('.ott_active').attr('id');
		var ottNo = id.replace('ott_filter_', '');
		page7++;
	    searchOttPage(page7, keyword, ottNo);
	});				
	        
	function searchFirstPage(keyword) {
	    $.ajax({
	        url:context+"/search/list.svt",
	        type:"post",
	        data:{
	            p : 1, 
	            keyword : keyword
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".btn_searchmore").addClass('hidden');
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>").addClass("search_list_wrap");
	                var div2 = $("<div>").addClass("search_list_text_wrap");
	                var img = $("<img>").attr("src", context+"/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", context+"/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text('★ ' + resp[i].avgScore.toFixed(1));
	                var p4 = $("<p>").text('❤ ' + resp[i].countLike);
	
	                a.append(img);
	                div2.append(p1).append(p3).append(p4).append(p2);
	                div.append(a).append(div2)
	                $(".search_list").append(div);
	            }
	        }
	    });
	}

	function searchPage(page, keyword) {
	    $.ajax({
	        url:context+"/search/list.svt",
	        type:"post",
	        data:{
	            p : page, 
	            keyword : keyword
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".btn_searchmore").addClass('hidden');
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>").addClass("search_list_wrap");
	                var div2 = $("<div>").addClass("search_list_text_wrap");
	                var img = $("<img>").attr("src", context+"/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", context+"/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text('★ ' + resp[i].avgScore.toFixed(1));
	                var p4 = $("<p>").text('❤ ' + resp[i].countLike);
	
	                a.append(img);
	                div2.append(p1).append(p3).append(p4).append(p2);
	                div.append(a).append(div2)
	                $(".search_list").append(div);
	            }
	        }
	    });
	}
	
	function searchGenrePage(page, keyword, type) {
	    $.ajax({
	        url: context + "/search/genre_sort.svt",
	        type:"post",
	        data:{
	            p : page, 
	            keyword : keyword,
	            type : type
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".genre_more").addClass('hidden');
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>").addClass("search_list_wrap");
	                var div2 = $("<div>").addClass("search_list_text_wrap");	                
	                var img = $("<img>").attr("src", context+"/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", context+"/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text('★ ' + resp[i].avgScore.toFixed(1));
	                var p4 = $("<p>").text('❤ ' + resp[i].countLike);
	
	                a.append(img);
	                div2.append(p1).append(p3).append(p4).append(p2);
	                div.append(a).append(div2)
	                $(".search_list").append(div);
	            }
	        }
	    });
	}

	function searchGenreSortPage(page, type) {
	    $.ajax({
	        url:context+"/search/genre_sort2.svt",
	        type:"post",
	        data:{
	            p : page, 
	            type : type
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".genre_more_all").addClass('hidden');
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>").addClass("search_list_wrap");
	                var div2 = $("<div>").addClass("search_list_text_wrap");
	                var img = $("<img>").attr("src", context+"/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", context+"/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text('★ ' + resp[i].avgScore.toFixed(1));
	                var p4 = $("<p>").text('❤ ' + resp[i].countLike);
	
	                a.append(img);
	                div2.append(p1).append(p3).append(p4).append(p2);
	                div.append(a).append(div2)
	                $(".search_list").append(div);
	            }
	        }
	    });
	}

	function searchGenreFirstPage(keyword, type) {
	    $.ajax({
	        url:context+"/search/genre_sort.svt",
	        type:"post",
	        data:{
	            p : 1, 
	            keyword : keyword,
	            type : type
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".genre_more").addClass('hidden');
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>").addClass("search_list_wrap");
	                var div2 = $("<div>").addClass("search_list_text_wrap");
	                var img = $("<img>").attr("src", context+"/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", context+"/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text('★ ' + resp[i].avgScore.toFixed(1));
	                var p4 = $("<p>").text('❤ ' + resp[i].countLike);
	
	                a.append(img);
	                div2.append(p1).append(p3).append(p4).append(p2);
	                div.append(a).append(div2)
	                $(".search_list").append(div);
	            }
	        }
	    });
	}

	function searchGenreFirstSortPage(type) {
	    $.ajax({
	        url:context+"/search/genre_sort2.svt",
	        type:"post",
	        data:{
	            p : 1, 
	            type : type
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".genre_more_all").addClass('hidden');
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>").addClass("search_list_wrap");
	                var div2 = $("<div>").addClass("search_list_text_wrap");
	                var img = $("<img>").attr("src", context+"/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", context+"/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text('★ ' + resp[i].avgScore.toFixed(1));
	                var p4 = $("<p>").text('❤ ' + resp[i].countLike);
	
	                a.append(img);
	                div2.append(p1).append(p3).append(p4).append(p2);
	                div.append(a).append(div2)
	                $(".search_list").append(div);
	            }
	        }
	    });
	}
	
	function searchRegionPage(page, keyword, type) {
	    $.ajax({
	        url:context+"/search/region_sort.svt",
	        type:"post",
	        data:{
	            p : page, 
	            keyword : keyword,
	            type : type
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".region_more").addClass('hidden');
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>").addClass("search_list_wrap");
	                var div2 = $("<div>").addClass("search_list_text_wrap");
	                var img = $("<img>").attr("src", context+"/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", context+"/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text('★ ' + resp[i].avgScore.toFixed(1));
	                var p4 = $("<p>").text('❤ ' + resp[i].countLike);
	
	                a.append(img);
	                div2.append(p1).append(p3).append(p4).append(p2);
	                div.append(a).append(div2)
	                $(".search_list").append(div);
	            }
	        }
	    });
	}
	
	function searchRegionFirstPage(keyword, type) {
	    $.ajax({
	        url:context+"/search/region_sort.svt",
	        type:"post",
	        data:{
	            p : 1, 
	            keyword : keyword,
	            type : type
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".region_more").addClass('hidden');
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>").addClass("search_list_wrap");
	                var div2 = $("<div>").addClass("search_list_text_wrap");
	                var img = $("<img>").attr("src", context+"/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", context+"/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text('★ ' + resp[i].avgScore.toFixed(1));
	                var p4 = $("<p>").text('❤ ' + resp[i].countLike);
	
	                a.append(img);
	                div2.append(p1).append(p3).append(p4).append(p2);
	                div.append(a).append(div2)
	                $(".search_list").append(div);
	            }
	        }
	    });
	}
	
	
	function searchScorePage(page, keyword) {
	    $.ajax({
	        url:context+"/search/score_sort.svt",
	        type:"post",
	        data:{
	            p : page, 
	            keyword : keyword
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".score_more").addClass('hidden');
	            }

	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>").addClass("search_list_wrap");
	                var div2 = $("<div>").addClass("search_list_text_wrap");
	                var img = $("<img>").attr("src", context+"/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", context+"/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text('★ ' + resp[i].avgScore.toFixed(1));
	                var p4 = $("<p>").text('❤ ' + resp[i].countLike);
	
	                a.append(img);
	                div2.append(p1).append(p3).append(p4).append(p2);
	                div.append(a).append(div2)
	                $(".search_list").append(div);
	            }
	        }
	    });
	}
	
	function searchScoreFirstPage(keyword) {
	    $.ajax({
	        url:context+"/search/score_sort.svt",
	        type:"post",
	        data:{
	            p : 1, 
	            keyword : keyword
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".score_more").addClass('hidden');
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>").addClass("search_list_wrap");
	                var div2 = $("<div>").addClass("search_list_text_wrap");
	                var img = $("<img>").attr("src", context+"/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", context+"/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text('★ ' + resp[i].avgScore.toFixed(1));
	                var p4 = $("<p>").text('❤ ' + resp[i].countLike);
	
	                a.append(img);
	                div2.append(p1).append(p3).append(p4).append(p2);
	                div.append(a).append(div2)
	                $(".search_list").append(div);
	            }
	        }
	    });
	}		
	
	function searchLikePage(page, keyword) {
	    $.ajax({
	        url:context+"/search/like_sort.svt",
	        type:"post",
	        data:{
	            p : page, 
	            keyword : keyword
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".like_more").addClass('hidden');
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>").addClass("search_list_wrap");
	                var div2 = $("<div>").addClass("search_list_text_wrap");
	                var img = $("<img>").attr("src", context+"/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", context+"/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text('★ ' + resp[i].avgScore.toFixed(1));
	                var p4 = $("<p>").text('❤ ' + resp[i].countLike);
	
	                a.append(img);
	                div2.append(p1).append(p3).append(p4).append(p2);
	                div.append(a).append(div2)
	                $(".search_list").append(div);
	            }
	        }
	    });
	}
	
	function searchLikeFirstPage(keyword) {
	    $.ajax({
	        url:context+"/search/like_sort.svt",
	        type:"post",
	        data:{
	            p : 1, 
	            keyword : keyword
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".like_more").addClass('hidden');
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>").addClass("search_list_wrap");
	                var div2 = $("<div>").addClass("search_list_text_wrap");
	                var img = $("<img>").attr("src", context+"/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", context+"/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text('★ ' + resp[i].avgScore.toFixed(1));
	                var p4 = $("<p>").text('❤ ' + resp[i].countLike);
	
	                a.append(img);
	                div2.append(p1).append(p3).append(p4).append(p2);
	                div.append(a).append(div2)
	                $(".search_list").append(div);
	            }
	        }
	    });
	}

	function searchOttPage(page, keyword, ottNo) {
	    $.ajax({
	        url:context+"/search/ott_sort.svt",
	        type:"post",
	        data:{
	            p : page, 
	            keyword : keyword,
	            ottNo : ottNo
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".ott_more").addClass('hidden');
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>").addClass("search_list_wrap");
	                var div2 = $("<div>").addClass("search_list_text_wrap");
	                var img = $("<img>").attr("src", context+"/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", context+"/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text('★ ' + resp[i].avgScore.toFixed(1));
	                var p4 = $("<p>").text('❤ ' + resp[i].countLike);
	
	                a.append(img);
	                div2.append(p1).append(p3).append(p4).append(p2);
	                div.append(a).append(div2)
	                $(".search_list").append(div);
	            }
	        }
	    });
	}
	
	function searchOttFirstPage(keyword, ottNo) {
	    $.ajax({
	        url:context+"/search/ott_sort.svt",
	        type:"post",
	        data:{
	            p : 1, 
	            keyword : keyword,
	            ottNo : ottNo
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".ott_more").addClass('hidden');
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>").addClass("search_list_wrap");
	                var div2 = $("<div>").addClass("search_list_text_wrap");
	                var img = $("<img>").attr("src", context+"/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", context+"/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text('★ ' + resp[i].avgScore.toFixed(1));
	                var p4 = $("<p>").text('❤ ' + resp[i].countLike);
	
	                a.append(img);
	                div2.append(p1).append(p3).append(p4).append(p2);
	                div.append(a).append(div2)
	                $(".search_list").append(div);
	            }
	        }
	    });
	}											
});