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
List<OttAttachmentDto> list = ottAttachmentDao.selectList(ottContentsDto.getOttNo());

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

.review {
	color: grey;
	background-color: #313842;
	border: transparent;
	border-radius : 10px;
}
#r1 {
	position : absolute;
	right : 25%;
}	
.price {
	color : white;
	font-size : 13px;
}
.content {
	padding :  0.3em;
	font-size : 15px;	
}

.btn {
	padding: 0.3em;

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

textarea::placeholder {
	padding : 0.3em;
	color : #00ADB5;
}

</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
      
      
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

	<div class="row float-container m50 center">

		<div class="float-left layer-2">

			<label><h2><%=contentsDto.getContentsTitle()%></h2></label> <br>
			<img
				src="../adminContents/file_down.svt?attachmentNo=<%=attachmentDto.getAttachmentNo()%>"
				width="180" height="180" alt="포스터">


			<table class="table center">
				<thead>
					<tr>
						<td>
						<%for(OttAttachmentDto ottAttachmentDto : list) { %>
						<img src="../adminContents/file_down.svt?attachmentNo=<%=ottAttachmentDto.getAttachmentNo()%>"
				width="40" height="40" alt="ott">
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
						<td> <span class="count"><%=likeContentsDao.count()%></span>  
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

		<div class="float-left layer-4">

			<table class="table m50 review content">
				<tr>
				<tr>
					<td>제목 : <%=contentsDto.getContentsTitle()%>
					</td>
				</tr>
				<tr>
					<td>등급 : <%=contentsDto.getContentsGrade()%>
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
					<td>배우 : <%=actorDto.getActorName1()%>, <%=actorDto.getActorName2()%>,
						<%=actorDto.getActorName3()%>, <%=actorDto.getActorName4()%>
					</td>
				</tr>

			</table>

		</div>


		<!-- 댓글 작성 영역 -->
	
		<form action="review_insert.svt" method="post">
			<div class="container">

			<div class="row center">

		<%
		if (isLogin) {
		%>
			<input type="hidden" name="contentsNo"
				value="<%=contentsDto.getContentsNo()%>"> <input
				type="hidden" name="reviewWriter" value="<%=reviewWriter%>">
				
			<textarea name="reviewContent" class="review" rows="4" cols="80"
				placeholder="리뷰 작성하기"></textarea>
				<br>
				<br>
			<div id="r1">
			<select name="reviewScore" class="review review-score" id="rb2">
				<option value="1" class="review">★</option>
				<option value="2" class="review">★★</option>
				<option value="3" class="review">★★★</option>
				<option value="4" class="review">★★★★</option>
				<option value="5" class="review">★★★★★</option>
			</select> 
			<input type="submit" class="review btn btn-yellow" value="리뷰 등록">
			</div>
			</div>
			</div>
		</form>
	
	
		<div class="row" >
		<% } else { %>
		<textarea name="reviewContent"  class="review" rows="4" cols="80"
			placeholder="로그인 후 댓글 작성 가능" disabled></textarea>
		<div id="r1">
		 <input type="submit" class="review btn btn-yellow" value="리뷰 등록">
		 </div>
		<%
		}
		%>
		</div>
	</div>
	
	
		<!--  댓글 목록 영역 -->

		<br> <br>
		<table class="table review review-list w200">

			<%
			for (ReviewDto reviewDto : reviewList) {
			%>

			<tr>
				<th width="20%"><%=reviewDto.getReviewWriter()%></th>
				<td width="20%"><%=reviewDto.getReviewTime()%></td>
				<td width="30%">
					<!--  댓글 내용 --> <%=reviewDto.getReviewContent()%>
				</td>
				
				<% String reviewScore = Integer.toString(reviewDto.getReviewScore());

				if (reviewScore.equals("1")) {
					reviewScore = reviewScore.replaceAll("1", "★");
				} else if (reviewScore.equals("2")) {
					reviewScore = reviewScore.replaceAll("2", "★★");
				} else if (reviewScore.equals("3")) {
					reviewScore = reviewScore.replaceAll("3", "★★★");
				} else if (reviewScore.equals("4")) {
					reviewScore = reviewScore.replaceAll("4", "★★★★");
				} else if (reviewScore.equals("5")) {
					reviewScore = reviewScore.replaceAll("5", "★★★★★");
				}
				%>
				<td width="10%" class="review review-score"><%=reviewScore%></td>
			</tr>

			<%
			}
			%>
		</table>
		<br>
		<div class="row center">
		<form action="review_list.jsp?contentsNo=<%=contentsNo%>" method="post">
			<input type="submit" class="btn btn-mint" id="rb2" value="리뷰 전체 보기"></input>
		</form>
		</div>
</body>


</html>
<jsp:include page="/template/footer.jsp"></jsp:include>

