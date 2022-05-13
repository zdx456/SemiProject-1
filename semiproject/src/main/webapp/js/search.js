$(function(){
	
    // 검색 페이지 (포스터, 줄거리 출력되도록 리스트 구현)

var page2 = 1;
searchPage(page2);
console.log(page2);

$(".btn_searchmore").click(function(){
    page2++;
    searchPage(page2);
});
        
function searchPage(page2) {
    $.ajax({
        url:"http://localhost:8080/semiproject/search/list.svt",
        type:"post",
        data:{
            p : page2
        },
        success:function(resp){
            if(resp.length < 7) {
                $(".btn_searchmore").remove();
            }
            
             
            for(var i=0; i < resp.length; i++) {
                var div = $("<div>");
                var img = $("<img>").attr("src", "http://localhost:8080/semiproject/adminContents/file_down.svt?attachmentNo=" + resp[i].attachmentNo);
                var a = $("<a>").attr("href", "http://localhost:8080/semiproject/contents/detail.jsp?contentsNo=" + resp[i].contentsNo);
                var p1 = $("<p>").text(resp[i].contentsTitle);
                var p2 = $("<p>").text(resp[i].contentsSummary);
                

                img.append(a);
                div.append(img).append(p1).append(p2);
            }
            
            $(".search_list").append(div);
        }
    });


}

    
});