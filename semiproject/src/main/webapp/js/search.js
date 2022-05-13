$(function(){
	
	// 검색 페이지 (포스터, 줄거리 출력되도록 리스트 구현)
	var query = window.location.search;
	var param = new URLSearchParams(query);
	var keyword = param.get("keyword");
	
	searchPage(1, keyword);
		
	$(".btn_searchmore").click(function(){
	    page2++;
	    searchPage(page2, keyword);
	});	
	
	$(".all").click(function(){
	    page2++;
	    searchPage(page2, keyword);
	});
	
	$(".genre").click(function(){
	    page2++;
	    searchGenrePage(page2, keyword, type);
	});		

	$(".region").click(function(){
	    page2++;
	    searchRegionPage(page2, keyword, type);
	});	
		
	$(".score").click(function(){
	    page2++;
	    searchScorePage(page2, keyword);
	});	
	
	$(".like").click(function(){
	    page2++;
	    searchLikePage(page2, keyword);
	});	
			        
	function searchPage(page2, keyword) {
	    $.ajax({
	        url:"http://localhost:8080/semiproject/search/list.svt",
	        type:"post",
	        data:{
	            p : page2, 
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
	                $(".genre").remove();
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
	                $(".region").remove();
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
	                $(".score").remove();
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
});