<%@page import="ottes.beans.HrefVO"%>
<%@page import="ottes.beans.OttHrefDao"%>
<%@page import="ottes.beans.OttHrefDto"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="ottes.beans.ContentsAttachmentDao"%>
<%@page import="ottes.beans.ContentsAttachmentDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ottes.beans.OttAttachmentDto"%>
<%@page import="ottes.beans.OttAttachmentDao"%>
<%@page import="ottes.beans.OttContentsDto"%>
<%@page import="ottes.beans.OttContentsDao"%>
<%@page import="ottes.beans.OttDto"%>
<%@page import="ottes.beans.OttDao"%>
<%@page import="ottes.beans.LikeContentsDto"%>
<%@page import="ottes.beans.LikeContentsDao"%>
<%@page import="ottes.beans.ActorDto"%>
<%@page import="ottes.beans.ActorDao"%>
<%@page import="ottes.beans.AttachmentDto"%>
<%@page import="ottes.beans.AttachmentDao"%>
<%@page import="ottes.beans.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="ottes.beans.ReviewDao"%>
<%@page import="ottes.beans.ContentsDto"%>
<%@page import="ottes.beans.ContentsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Integer contentsNo = Integer.valueOf(request.getParameter("contentsNo"));
// int contentsNo = Integer.parseInt(request.getParameter("contentsNo"));
String reviewWriter = request.getParameter("reviewWriter");


ContentsDao contentsDao = new ContentsDao();
ContentsDto contentsDto = contentsDao.selectOne(contentsNo);

ActorDao actorDao = new ActorDao();
ActorDto actorDto = actorDao.selectName(contentsNo);

// 현재 글에 대한 댓글 목록을 조회
ReviewDao reviewDao = new ReviewDao();
List<ReviewDto> reviewList = reviewDao.selectList(contentsNo);


// 현재 로그인한 사용자가 댓글 작성자인지 확인하는 코드
// 세션에 있는 사용자의 아이디와 댓글의 작성자를 비교
String clientId = (String) session.getAttribute("login");
boolean isLogin = clientId != null && !clientId.equals("");

//작성자 확인하기
boolean searchWriter = reviewWriter != null && !reviewWriter.equals("");
boolean isWrite = reviewDao.checkWriter(contentsNo, clientId);

//좋아요 출력할 likeContents 불러오기
LikeContentsDao likeContentsDao = new LikeContentsDao();

LikeContentsDto likecontentsDto = likeContentsDao.find(clientId, contentsNo);//find는 좋아요 이력을 찾는 기능(단일조회와 비슷)

// ott 정보 불러오기
OttContentsDao ottContentsDao = new OttContentsDao();
OttContentsDto ottContentsDto = ottContentsDao.selectOne(contentsNo);

OttAttachmentDao ottAttachmentDao = new OttAttachmentDao();
List<OttAttachmentDto> list = ottAttachmentDao.selectList( contentsNo);

OttDao ottDao = new OttDao();
List<OttDto> ottlist = ottDao.findPrice(contentsNo);

// ott 로고에 링크 걸기
OttHrefDao ottHrefDao = new OttHrefDao();
List<HrefVO> hrefList = ottHrefDao.selectList(contentsNo);
System.out.println("ottNo :" + ottContentsDto.getOttNo());

// 관리자인지 판정
String memberGrade = (String) session.getAttribute("auth");
boolean isAdmin = clientId != null && memberGrade.equals("관리자");

//포스터 가져오기
AttachmentDao attachmentDao = new AttachmentDao();
AttachmentDto attachmentDto = attachmentDao.selectAttachment(contentsNo);
%>
<style>


main{
	margin: 0 auto; /* auto 알아서 중앙으로 맞춰줌 */
	padding: 30px 0 30px 0; 
}

#box0 {
 	background-color : white;
 	width: 700px;
	height: 120px;
 	
}

#box1{
	
	display: inline-table;
	width: 300px;
	height: 120px;
	float: left;
	padding: 10px 0 50px 0px; 
}
#box2{
	display: inline-table;
	width: 400px;
	height: 120px;
	float: left;
	padding: 10px 0 30px 0; 
}

#box3{
	display: inline-table;
	width: 500px;
	height: 400px;
	height: 120px;
	float: left;
	padding: 0 0 0 40px; 
}
.writereview{
	padding : 2em;
}
.content {
    vertical-align: middle;
    justify-content: center;
	align-items: center;
	height: 400px;
	border-radius: 20px;
	padding : 1em;
	line-height : 20px;
	font-size : 13px;
}
.summary {
	line-height : 30px;
}
.review {
	color: #00ADB5;
	paddint : 0.5em;
	background-color: #313842;
	border: transparent;
	border-radius : 10px;
}
textarea {
	padding : 10px;
}

.contentsTitle {
	color : white;
	font-size : 18px;
	font-weight : bold;
}

.price {
	color : white;
	font-size : 12px;
	line-height : 1px;
}

.button {
	padding: 0.3em;
	font-size : 14px;
	border-radius: 30px;

}
.review.review-score {
	color : #EDC948;
}

.review.review-list {
	font-size : 12px;
}

.like {
	border-color: red;
	color: red;
}

.img.img-logo {
    border-radius: 10px;
}

textarea::placeholder {
	padding : 0.3em;
	color : #00ADB5;
}

textarea {
	resize:none;
}

.flex-container {
	background: rgb(54,60,70);
	background: linear-gradient(180deg, rgba(54,60,70,0.7936216723017332) 1%, rgba(98,105,113,0.4630894594165791) 74%);
	padding : 1em;
	margin : 20px;
	display:flex;
	justify-content: center;
	align-items: center;
	width : 100%;
	border-radius: 20px;
	
}
.score-show{
    cursor: default !important;
    }

</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">



$(function(){
	
	// 리뷰 글자수 카운트
	
	$(".reviewC").on("input", function(){
		
		var size = $(this).val().length;
		
		var target = $(this).next().children(".leg").children(".count2");
		target.text(size);
		
		if(size > 100){
			target.css("color", "red");
			$(".reviewbutton").off('click');
			
		}
		else {
			target.css("color", "white");
		}
		
		if (size>100) {
			$(".reviewbutton").click(function(e){
				e.preventDefault();
			});
		}
		
	});
});

function isEmpty(value){

    if(value == null || value.length === 0) {

           return "";

     } else{

            return value;
     }
}

// 좋아요 기능 

$(function () {
	
	 <%-- var login = <%=(String)session.getAttribute("login")%>; --%>
	  
	 <%-- if(login) { --%>

    $(".heart").click(function (){
    	
        $.ajax({
            url: "<%=request.getContextPath()%>/likecontents/likecontents_insert.svt",
            type: "post",
            data: {
                contentsNo: <%=contentsNo%>
            },
            
            success: function (resp) {
                console.log(resp);
                
	            if (resp.like == false) {
	                $(".heart").removeClass("like");
        	    }
	            else {
	            	$(".heart").addClass("like");
	            }
	            $(".count").text(resp.count);
	            
         	   }
	        });
	    });
	 <%-- } --%> 
});



    </script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컨텐츠 상세보기</title>
</head>
<body>

	<jsp:include page="/template/header.jsp"></jsp:include>
	
	<script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@0.0.5/score.js"></script>
	 <script>
	 
	 
	 // 별점 플러그인
	 
        $(function(){
        	$(".score-show").score({
        		starColor: "gold", 
        	    backgroundColor: "transparent"
        	});
        	$(".score-select").score({
        		starColor: "gold", 
        	    backgroundColor: "transparent", 
                editable:true,
                integerOnly:true,
                zeroAvailable:false,
                send: {
                    sendable:true,
                    name:"reviewScore",
                },
                display:{
                    showNumber:false,
                    placeLimit:0,
                }
            });
        });
    </script>


<main>

	<div class="row flex-container center">
	<div id="box1" class="content center">
	<br>
			<div>
			<img
				src="<%=request.getContextPath()%>/adminContents/file_down.svt?attachmentNo=<%=attachmentDto.getAttachmentNo()%>"
				width="200" height="250" alt="포스터">
			</div>	
		<br>
		<div style="line-height:150%;">
			<%for(HrefVO hrefVO : hrefList) {%>
				<a href="<%=hrefVO.getOttHref()%>" >
				<img src="<%=request.getContextPath()%>/adminContents/file_down.svt?attachmentNo=<%=hrefVO.getAttachmentNo()%>"
               width="40" height="40" class="img img-logo ottlogo" alt="ott" >
			</a>
			<%} %>
		</div>			
						<div>
						<%for(OttDto ottDto : ottlist) { %>
					<label class="ottname"  hidden><%=ottDto.getOttName() %></label>

			<%} %>
						

						<div style="line-height:150%;">
						<span style="line-height:200%;">
						<%if(reviewDao.avg(contentsNo) == 1){ %>
						<label class="score-show" data-max="5" data-rate="1"></label>
						<%} %>
						<%if(reviewDao.avg(contentsNo) == 2){ %>
						<label class="score-show" data-max="5" data-rate="2"></label>
						<%} %>
						<%if(reviewDao.avg(contentsNo) == 3){ %>
						<label class="score-show" data-max="5" data-rate="3"></label>
						<%} %>
						<%if(reviewDao.avg(contentsNo) == 4){ %>
						<label class="score-show" data-max="5" data-rate="4"></label>
						<%} %>
						<%if(reviewDao.avg(contentsNo) == 5){ %>
						<label class="score-show" data-max="5" data-rate="5"></label>
						<%} %>
						</span>
						</div>
						

						<span class="count"><%=likeContentsDao.count(contentsNo)%></span>  
							<%if(isLogin){ %>
							<% if (likecontentsDto != null) { %> 
							<label class="heart like">♥</label> 
							<% } else { %> 
							<label class="heart">♥</label> 
							<% } %>

						<%}else{ %>
							<label>♥</label> 
						<%} %>
					</div>
		
	</div>
	
	<div id="box2" class="m0">
			<div>
			<label class="contentsTitle">
			<%=contentsDto.getContentsTitle()%>
			</label>
			</div>
			<br>	
			<div class="review content">
				<div class="row">
					<label>등급 : <%=contentsDto.getContentsGrade()%></label>
				</div>
				<div class="row">
					<label>러닝타임 : <%=contentsDto.getContentsTime()%> 분</label>
				</div>
				<div class="row">
					<label>장르 : <%=contentsDto.getGenreName()%></label>
				</div>
				<div class="row summary">
					<label>줄거리 : <%=contentsDto.getContentsSummary()%></label>
				</div>
				<div class="row">
					<label>감독 : <%=contentsDto.getContentsDirector()%></label>
				</div>
				<div class="row">
					<label>배우 : 
							<%if(actorDto.getActorName1() != null) { %>
							<%=actorDto.getActorName1() %> 
							<%} %>
							<%if(actorDto.getActorName2() !=null) { %>
							<%=actorDto.getActorName2() %>
							<%} %>
							<%if(actorDto.getActorName3() != null) { %>
							<%=actorDto.getActorName3() %> 
							<%} %>
							<%if(actorDto.getActorName4() !=null) { %>
							<%=actorDto.getActorName4() %>
							<%} %>
					</label>
				</div>
			</div>
	</div>
	
	
	<div id="box3" class="right m20">
		
		<!-- 댓글 작성 영역 -->
	
		<form action="<%=request.getContextPath()%>/contents/review_insert.svt" method="post">


		<%
		if(!searchWriter && isLogin && !isWrite ){ 
		%>
		<div>
			<input type="hidden" name="contentsNo"
				value="<%=contentsDto.getContentsNo()%>"> <input
				type="hidden" name="reviewWriter" value="<%=reviewWriter%>">

			<textarea name="reviewContent" class="write review reviewC" rows="7" cols="65"
				placeholder="리뷰 작성하기"></textarea>
		
				<div class="row right" >
					<span class="leg">
						<span class="count2">0</span>
						/
						<span class="total">100</span>
					</span>
				</div>
					
			<br>
				
			<span class="score-select" data-max="5" data-rate="3"></span>
			<span class="reviewbutton"><input type="submit" class="btn-mint button" value="리뷰 등록"></span>
		</form>
		</div>	
	
	
		<% } else { %>
		<textarea name="reviewContent"  class="review" rows="4" cols="65"
			placeholder="로그인 후 댓글 작성 가능" disabled></textarea>
		 <input type="submit" class="btn-mint button" value="리뷰 등록">
		<%
		}
		%>

	
		<!--  댓글 목록 영역 -->
		
			<br> <br>
		<table class="table review review-list ">

			<%
			for (ReviewDto reviewDto : reviewList) {
			%>

			<tr>
				<th width="10%"><%=reviewDto.getClientNick()%></th>
				<td width="20%"><%=reviewDto.getReviewTime()%></td>
				<td width="30%" class="rs">
					<!--  댓글 내용 --> <%=reviewDto.getReviewContent()%>
				</td>
				<td width="10%" class="rs">
						<%if(reviewDto.getReviewScore() == 1){ %>
						<label class="score-show" data-max="5" data-rate="1"></label>
						<%} %>
						<%if(reviewDto.getReviewScore() == 2){ %>
						<label class="score-show" data-max="5" data-rate="2"></label>
						<%} %>
						<%if(reviewDto.getReviewScore() == 3){ %>
						<label class="score-show" data-max="5" data-rate="3"></label>
						<%} %>
						<%if(reviewDto.getReviewScore() == 4){ %>
						<label class="score-show" data-max="5" data-rate="4"></label>
						<%} %>
						<%if(reviewDto.getReviewScore() == 5){ %>
						<label class="score-show" data-max="5" data-rate="5"></label>
						<%} %>
						</td>
			</tr>

			<%
			}
			%>
		</table>
		<br>
		<a href="<%=request.getContextPath()%>/contents/review_list.jsp?contentsNo=<%=contentsNo%>">
			<input type="button" class="button btn-yellow" id="rb2" value="리뷰 전체 보기"></input>
		</a>
		
	</div>
	
	</div>
</main>




</html>
<jsp:include page="/template/footer.jsp"></jsp:include>

