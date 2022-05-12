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
boolean isLogin = clientId != null;

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
	height: 120px;
	float: left;
	padding: 0 0 0 40px; 
}

.content {
    vertical-align: middle;
}
.review {
	color: #00ADB5;
	paddint : 0.5em;
	background-color: #313842;
	border: transparent;
	border-radius : 10px;
}

.contentsTitle {
	color : white;
	font-size : 18px;
	font-weight : bold;
}

.price {
	color : white;
	font-size : 13px;
}
.content {
	padding :  0.3em;
	font-size : 15px;	
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
</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

$(function() {
	
});
function isEmpty(value){

    if(value == null || value.length === 0) {

           return "";

     } else{

            return value;

     }

}
      
      
$(function () {

    $(".heart").click(function (){
    	
        $.ajax({
            url: "http://localhost:8080/semiproject/likecontents/likecontents_insert.svt",
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
			
			<img
				src="../adminContents/file_down.svt?attachmentNo=<%=attachmentDto.getAttachmentNo()%>"
				width="200" height="250" alt="포스터">


			<table class="table center ">
				<thead>
					<tr>
						<td>
						<%for(OttAttachmentDto ottAttachmentDto : list) { %>
						 <%System.out.println("a");%>
						<img src="../adminContents/file_down.svt?attachmentNo=<%=ottAttachmentDto.getAttachmentNo()%>"
				width="40" height="40" class="img img-logo" alt="ott">
						<%} %>
						</td>
					
					</tr>
					<tr>
						<td>
						<%for(OttDto ottDto : ottlist) { %>
						<span class="price"><%=ottDto.getOttPrice() %></span>
						<%} %>
						</td>
					</tr>

						<tr>
						<td>
						<span>
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
						</td>
					</tr>

					<tr>
						<td> <span class="count"><%=likeContentsDao.count(contentsNo)%></span>  
						<% if (likecontentsDto != null) { %> 
						<label class="heart like">♥</label> 
						<% } else { %> 
						<label class="heart">♥</label> 
						<% } %>
						</td>
					</tr>
				
				</thead>
			</table>
		
	</div>
	
	<div id="box2" class="m0 content">
			
			<label class="contentsTitle">
			<%=contentsDto.getContentsTitle()%>
			</label>
		
		<table class="table m10 review content ">

				<tr>
					<td >등급 : 
					<%=contentsDto.getContentsGrade()%>
					</td>
				</tr>

				<tr>
					<td>러닝타임 : <%=contentsDto.getContentsTime()%> 분
					</td>
				</tr>

				<tr>
					<td>장르 : <%=contentsDto.getGenreName()%>
					</td>
				</tr>

				<tr>
					<td>줄거리 : <%=contentsDto.getContentsSummary()%>
					</td>
				</tr>

				<tr>
					<td>감독 : <%=contentsDto.getContentsDirector()%>
					</td>
				</tr>

				<tr>
					<td>배우 : 
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

					</td>
				</tr>

			</table>
		
	</div>
	
	
	<div id="box3" class="right m20">
		
		<!-- 댓글 작성 영역 -->
	
		<form action="review_insert.svt" method="post">


		<%
		if (isLogin) {
		%>
			<input type="hidden" name="contentsNo"
				value="<%=contentsDto.getContentsNo()%>"> <input
				type="hidden" name="reviewWriter" value="<%=reviewWriter%>">
				
			<textarea name="reviewContent" class="review" rows="4" cols="65"
				placeholder="리뷰 작성하기"></textarea>
				
			<br>
				
			<span class="score-select" data-max="5" data-rate="3"></span>
			<input type="submit" class="btn-yellow button" value="리뷰 등록">
		</form>
	
	
		<% } else { %>
		<textarea name="reviewContent"  class="review" rows="4" cols="65"
			placeholder="로그인 후 댓글 작성 가능" disabled></textarea>
		 <input type="submit" class="btn-yellow button" value="리뷰 등록">
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
				<th width="10%"><%=reviewDto.getReviewWriter()%></th>
				<td width="20%"><%=reviewDto.getReviewTime()%></td>
				<td width="30%">
					<!--  댓글 내용 --> <%=reviewDto.getReviewContent()%>
				</td>
				<td width="10%">
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
		<form action="review_list.jsp?contentsNo=<%=contentsNo%>" method="post">
			<input type="submit" class="button btn-mint" id="rb2" value="리뷰 전체 보기"></input>
		</form>
		
	</div>
	
	</div>
</main>




</html>
<jsp:include page="/template/footer.jsp"></jsp:include>

