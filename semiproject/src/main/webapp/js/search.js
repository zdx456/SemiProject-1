$(function(){
	
	// 검색 페이지 (포스터, 줄거리 출력되도록 리스트 구현)
	var query = window.location.search;
	var param = new URLSearchParams(query);
	var keyword = param.get("keyword");
	
	searchPage(keyword);
	
	// 정렬 버튼
	$(".all").click(function(){
		$('.search_list').empty();
	    searchPage(1, keyword);
	    $('.btn_searchmore').removeClass('hidden');
	});		
		
	$(".score").click(function(){
		$('.search_list').empty();
	    searchScoreFirstPage(keyword);
	    $('.score_more').removeClass('hidden');	    
	});	

	$(".like").click(function(){
		$('.search_list').empty();
	    searchLikeFirstPage(keyword);
	    $('.like_more').removeClass('hidden');	
	});	
	
	$(".genre").change(function(){
		$('.search_list').empty();
		if (keyword == null) {
			searchGenreFirstPage($(this).val());
			$('.genre_more_all').removeClass('hidden');				
		} else {
			searchGenreFirstPage(keyword, $(this).val());
			$('.genre_more').removeClass('hidden');	
		} 	
	    
	});
	
	$(".region").change(function(){
		$('.search_list').empty();
	    searchRegionFirstPage(keyword, $(this).val());	
	    $('.region_more').removeClass('hidden');  
	});
	
	
	// 더보기 버튼
	var page2 = 1;
		
	$(".btn_searchmore").click(function(){
	    page2++;
	    searchPage(page2, keyword);
	});	

	$(".score_more").click(function(){
		page2++;
	    searchScorePage(page2, keyword);
	});	

	$(".like_more").click(function(){
		page2++;
	    searchLikePage(page2, keyword);
	});			
	
	$(".genre_more").click(function(){
		page2++;
		searchGenrePage(page2, keyword, $(".genre").val()); 
	});			

	$(".genre_more_all").click(function(){
		page2++;
		searchGenrePage(page2, $(".genre").val()); 
	});	
	
	$(".region_more").click(function(){
		page2++;
	    searchRegionPage(page2, keyword, $(".region").val());
	});			
	        
	function searchPage(keyword) {
	    $.ajax({
	        url:"http://localhost:8080/semiproject/search/list.svt",
	        type:"post",
	        data:{
	            p : 1, 
	            keyword : keyword
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".btn_searchmore").remove();
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>");
	                var img = $("<img>").attr("src", "http://localhost:8080/semiproject/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", "http://localhost:8080/semiproject/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text(resp[i].avgScore);
	                var p4 = $("<p>").text(resp[i].countLike);
	
	                img.append(a);
	                div.append(img).append(p1).append(p2).append(p3).append(p4);
	                $(".search_list").append(div);
	            }
	        }
	    });
	}
	
	function searchGenrePage(page2, keyword, type) {
	    $.ajax({
	        url:"http://localhost:8080/semiproject/search/genre_sort.svt",
	        type:"post",
	        data:{
	            p : page2, 
	            keyword : keyword,
	            type : type
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".genre_more").remove();
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>");
	                var img = $("<img>").attr("src", "http://localhost:8080/semiproject/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", "http://localhost:8080/semiproject/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text(resp[i].avgScore);
	                var p4 = $("<p>").text(resp[i].countLike);
	
	                img.append(a);
	                div.append(img).append(p1).append(p2).append(p3).append(p4);
	                $(".search_list").append(div);
	            }
	        }
	    });
	}

	function searchGenrePage(page2, type) {
	    $.ajax({
	        url:"http://localhost:8080/semiproject/search/genre_sort2.svt",
	        type:"post",
	        data:{
	            p : page2, 
	            type : type
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".genre_more_all").remove();
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>");
	                var img = $("<img>").attr("src", "http://localhost:8080/semiproject/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", "http://localhost:8080/semiproject/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text(resp[i].avgScore);
	                var p4 = $("<p>").text(resp[i].countLike);
	
	                img.append(a);
	                div.append(img).append(p1).append(p2).append(p3).append(p4);
	                $(".search_list").append(div);
	            }
	        }
	    });
	}

	function searchGenreFirstPage(keyword, type) {
	    $.ajax({
	        url:"http://localhost:8080/semiproject/search/genre_sort.svt",
	        type:"post",
	        data:{
	            p : 1, 
	            keyword : keyword,
	            type : type
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".genre_more").remove();
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>");
	                var img = $("<img>").attr("src", "http://localhost:8080/semiproject/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", "http://localhost:8080/semiproject/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text(resp[i].avgScore);
	                var p4 = $("<p>").text(resp[i].countLike);
	
	                img.append(a);
	                div.append(img).append(p1).append(p2).append(p3).append(p4);
	                $(".search_list").append(div);
	            }
	        }
	    });
	}

	function searchGenreFirstPage(type) {
	    $.ajax({
	        url:"http://localhost:8080/semiproject/search/genre_sort2.svt",
	        type:"post",
	        data:{
	            p : 1, 
	            type : type
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".genre_more").remove();
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>");
	                var img = $("<img>").attr("src", "http://localhost:8080/semiproject/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", "http://localhost:8080/semiproject/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text(resp[i].avgScore);
	                var p4 = $("<p>").text(resp[i].countLike);
	
	                img.append(a);
	                div.append(img).append(p1).append(p2).append(p3).append(p4);
	                $(".search_list").append(div);
	            }
	        }
	    });
	}
	
	function searchRegionPage(page2, keyword, type) {
	    $.ajax({
	        url:"http://localhost:8080/semiproject/search/region_sort.svt",
	        type:"post",
	        data:{
	            p : page2, 
	            keyword : keyword,
	            type : type
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".region_more").remove();
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>");
	                var img = $("<img>").attr("src", "http://localhost:8080/semiproject/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", "http://localhost:8080/semiproject/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text(resp[i].avgScore);
	                var p4 = $("<p>").text(resp[i].countLike);
	
	                img.append(a);
	                div.append(img).append(p1).append(p2).append(p3).append(p4);
	                $(".search_list").append(div);
	            }
	        }
	    });
	}
	
	function searchRegionFirstPage(keyword, type) {
	    $.ajax({
	        url:"http://localhost:8080/semiproject/search/region_sort.svt",
	        type:"post",
	        data:{
	            p : 1, 
	            keyword : keyword,
	            type : type
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".region_more").remove();
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>");
	                var img = $("<img>").attr("src", "http://localhost:8080/semiproject/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", "http://localhost:8080/semiproject/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text(resp[i].avgScore);
	                var p4 = $("<p>").text(resp[i].countLike);
	
	                img.append(a);
	                div.append(img).append(p1).append(p2).append(p3).append(p4);
	                $(".search_list").append(div);
	            }
	        }
	    });
	}
	
	
	function searchScorePage(page2, keyword) {
	    $.ajax({
	        url:"http://localhost:8080/semiproject/search/score_sort.svt",
	        type:"post",
	        data:{
	            p : page2, 
	            keyword : keyword
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".score_more").remove();
	            }

	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>");
	                var img = $("<img>").attr("src", "http://localhost:8080/semiproject/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", "http://localhost:8080/semiproject/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text(resp[i].avgScore);
	                var p4 = $("<p>").text(resp[i].countLike);
	
	                img.append(a);
	                div.append(img).append(p1).append(p2).append(p3).append(p4);
	                $(".search_list").append(div);
	            }
	        }
	    });
	}
	
	function searchScoreFirstPage(keyword) {
	    $.ajax({
	        url:"http://localhost:8080/semiproject/search/score_sort.svt",
	        type:"post",
	        data:{
	            p : 1, 
	            keyword : keyword
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".score_more").remove();
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>");
	                var img = $("<img>").attr("src", "http://localhost:8080/semiproject/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", "http://localhost:8080/semiproject/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text(resp[i].avgScore);
	                var p4 = $("<p>").text(resp[i].countLike);
	
	                img.append(a);
	                div.append(img).append(p1).append(p2).append(p3).append(p4);
	                $(".search_list").append(div);
	            }
	        }
	    });
	}	
		
		
	
	function searchLikePage(page2, keyword) {
	    $.ajax({
	        url:"http://localhost:8080/semiproject/search/like_sort.svt",
	        type:"post",
	        data:{
	            p : page2, 
	            keyword : keyword
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".like").remove();
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>");
	                var img = $("<img>").attr("src", "http://localhost:8080/semiproject/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", "http://localhost:8080/semiproject/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text(resp[i].avgScore);
	                var p4 = $("<p>").text(resp[i].countLike);
	
	                img.append(a);
	                div.append(img).append(p1).append(p2).append(p3).append(p4);
	                $(".search_list").append(div);
	            }
	        }
	    });
	}
	
	function searchLikeFirstPage(keyword) {
	    $.ajax({
	        url:"http://localhost:8080/semiproject/search/score_sort.svt",
	        type:"post",
	        data:{
	            p : 1, 
	            keyword : keyword
	        },
	        success:function(resp){
	            if(resp.length < 7) {
	                $(".like_more").remove();
	            }
	             
	            for(var i=0; i < resp.length; i++) {
	                var div = $("<div>");
	                var img = $("<img>").attr("src", "http://localhost:8080/semiproject/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo).addClass("search_img");
	                var a = $("<a>").attr("href", "http://localhost:8080/semiproject/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
	                var p1 = $("<p>").text(resp[i].contentsTitle);
	                var p2 = $("<p>").text(resp[i].contentsSummary);
	                var p3 = $("<p>").text(resp[i].avgScore);
	                var p4 = $("<p>").text(resp[i].countLike);
	
	                img.append(a);
	                div.append(img).append(p1).append(p2).append(p3).append(p4);
	                $(".search_list").append(div);
	            }
	        }
	    });
	}			
});