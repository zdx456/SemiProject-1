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
int contentsNo = Integer.parseInt(request.getParameter("contentsNo"));

ContentsDao contentsDao = new ContentsDao();
ContentsDto contentsDto = contentsDao.selectOne(contentsNo);

// 현재 글에 대한 댓글 목록을 조회
ReviewDao reviewDao = new ReviewDao();
List<ReviewDto> reviewList = reviewDao.selectList();

// 현재 로그인한 사용자가 댓글 작성자인지 확인하는 코드
// 세션에 있는 사용자의 아이디와 댓글의 작성자를 비교
String clientId = (String) session.getAttribute("login");
boolean isLogin = clientId != null;

// 관리자인지 판정
  String memberGrade = (String)session.getAttribute("auth");
  boolean isAdmin = clientId != null && memberGrade.equals("관리자");
  
//포스터 가져오기
AttachmentDao attachmentDao = new AttachmentDao();
AttachmentDto attachmentDto = attachmentDao.selectAttachment(contentsNo);
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컨텐츠 상세보기</title>
</head>
<body>

	<jsp:include page="/template/header.jsp"></jsp:include>

	<div class="row float-container m50 center ">

		<div class="float-left layer-2">
		
			<label>영화 이미지</label> <br>

			
			<table class="table center">
			<thead>
				<tr>
					<td>
					<img src="<%=request.getContextPath() %>/image/netflix.png" width="30">
					</td>
				</tr>
				<tr>
					<td>ott 가격</td>
				</tr>
				<tr>
					<td>♥<label><%=contentsDto.getContentsViews()%></label> 
					</td>
				</tr>
				</thead>
			</table>

		</div>

		<div class="float-left layer-2">

			<table class="table m50">
				<tr>
				<tr>
					<td>제목 <%=contentsDto.getContentsTitle()%>
					</td>
				</tr>
				<tr>
					<td>등급 <%=contentsDto.getContentsGrade()%>
					</td>
				</tr>

				<tr>
					<td>러닝타임 <%=contentsDto.getContentsTime()%>
					</td>
				</tr>

				<tr>
					<td>장르 <%=contentsDto.getGenreName()%>
					</td>
				</tr>

				<tr>
					<td>줄거리 <%=contentsDto.getContentsSummary()%>
					</td>
				</tr>

				<tr>
					<td>감독 <%=contentsDto.getContentsDirector()%>
					</td>
				</tr>

			</table>

		</div>


		<!-- 댓글 작성 영역 -->

	
		<% if(isLogin){ %>
		<form action="review_insert.svt" method="post">
			<input type="hidden" name="contentsNo" value="<%=contentsDto.getContentsNo()%>">
			<textarea name="reviewContent" rows="4" cols="70"></textarea>
				<label>평점</label>
				<select name="reviewScore">
					<option value="1">★</option>
					<option value="2">★★</option>
					<option value="3">★★★</option>
					<option value="4">★★★★</option>
					<option value="5">★★★★★</option>
				</select> <input type="submit" value="리뷰 등록">
		</form>

	
		<% } else {%>
		<textarea name="reviewContent" rows="4" cols="70" placeholder="로그인 후 댓글 작성 가능" disabled></textarea>
				<label>평점</label>
				<input type="submit" value="리뷰 등록">		
		<% } %>
				
		<!--  댓글 목록 영역 -->
		
				<table class="table">
					<%for(ReviewDto reviewDto : reviewList) { %>
					
					<% boolean isReplyOwner = clientId != null && clientId.equals(reviewDto.getReviewWriter()); %>

					<tr>
						<th width="10%"><%=reviewDto.getReviewWriter() %></th>
						<td width="20%"><%=reviewDto.getReviewTime() %></td>
						<td width="30%"><!--  댓글 내용 --> <%=reviewDto.getReviewContent() %> </td>
												<%
												String reviewScore = Integer.toString(reviewDto.getReviewScore());
													
													if(reviewScore.equals("1")) {
														reviewScore = reviewScore.replaceAll("1", "★");
													}
													else if (reviewScore.equals("2")) {
														reviewScore = reviewScore.replaceAll("2", "★★");
													}
													else if (reviewScore.equals("3")) {
														reviewScore = reviewScore.replaceAll("3", "★★★");
													}
													else if (reviewScore.equals("4")) {
														reviewScore = reviewScore.replaceAll("4", "★★★★");
													}
													else if (reviewScore.equals("5")) {
														reviewScore = reviewScore.replaceAll("5", "★★★★★");
													}
													
												%>
						<td width="10%">
						<%=reviewScore%>
						</td>
						</tr>
						
					<%} %>
						</table>
						<form action="review_list.jsp?contentsNo="+<%=contentsDto.getContentsNo() %> method="post">
						<input type="submit" value="리뷰 전체 보기"></input>
						</form>
				
		</div>
	</body>
</html>
<jsp:include page="/template/footer.jsp"></jsp:include>

