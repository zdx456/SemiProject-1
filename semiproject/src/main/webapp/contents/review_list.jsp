<%@page import="ottes.beans.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="ottes.beans.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	 <script src = "https://code.jquery.com/jquery-3.6.0.js"></script>
     <!-- <script src = "https://code.jquery.com/jquery-3.6.0.min.js"></script>  경량형!--> 

    <script type="text/javascript">
        $(function(){
           
	//수정 부분 숨기기 등록
            $(".edit-btn").click(function(){
                $(this).parents(".show-row").hide();
			    $(this).parents(".show-row").next().show();
            });

            $(".cancel-btn").click(function(){
			$(this).parents(".edit-row").hide();
			$(this).parents(".edit-row").prev().show();
		});
		

            $(".edit-row").hide(); 

            
        });
      </script>
    
<%
	//내가 쓴 리뷰를 위한 reviewWriter 파라미터
	String reviewWriter = request.getParameter("reviewWriter");

	//컨텐츠 별 댓글을 보기위한 contentsNo 파라미터
	
	// 사망연산자
	// request.getParameter("contentsNo")가 null이 아니라면  Integer.valueOf(request.getParameter("contentsNo")) 를 리턴, 아니면 -1로 리턴
	Integer contentsNo = request.getParameter("contentsNo") != null ? Integer.valueOf(request.getParameter("contentsNo")) : -1;
	/* String contentsNoParam = request.getParameter("contentsNo");
	Integer contentsNo = 0;
	
	if(contentsNoParam != null) {
		contentsNo = Integer.valueOf(contentsNoParam);
	} */
	
	// int contentsNo = Integer.parseInt(request.getParameter("contentsNo"));
	
	//목록에서 작성 하기 위한 작성자 세션!
	String clientId = (String)session.getAttribute("login");

	boolean searchWriter = reviewWriter != null && !reviewWriter.equals("");
	 // contentsNo가 없고 reviewWriter만 있으면

	ReviewDao reviewDao = new ReviewDao();

	List<ReviewDto> list;
	
	if(searchWriter){
		list = reviewDao.selectList(reviewWriter);
	} else{
		list = reviewDao.selectList(contentsNo);
	}
 
%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container">
	<div class="row center">
		<h1>리뷰 목록</h1>
		<hr>
	</div>
	<%if(!searchWriter){ //내가 쓴 글에서 오면 등록은 불가능하게 만듬%>
	<div class="row center">
		<form action="review_insert.svt" method="post">
			<input type="hidden" name="contentsNo" value="<%=contentsNo%>" > <!-- contentsNo 파라미터 -->
			<input type="hidden" name="reviewWriter" value="<%=clientId%>"> <!-- 로그인한 세션 아이디 hidden으로 작성자 보내기 -->
			<textarea class="input-round" name="reviewsContent" rows="4" cols="60" placeholder="리뷰내용"></textarea>
			<select name="reviewScore" class="form-input input-round">
				<option value="1">★</option>
				<option value="2">★★</option>
				<option value="3">★★★</option>
				<option value="4">★★★★</option>
				<option value="5">★★★★★</option>
			</select>
			<button type="submit" class="btn">등록</button>
		</form>
	</div>
	<%} %>
	<div class="row">
	<form action="review_edit.svt" method="post">
		<table class="table table-border">
			<tr>
				<th>작성자</th>
				<th>작성일</th>
				<th>내용</th>
				<th>평점</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		<%for(ReviewDto reviewDto : list){ %>
			<tr class="show-row">
				<td><%=reviewDto.getReviewWriter() %></td>
				<td><%=reviewDto.getReviewTime()%></td>
				<td><%=reviewDto.getReviewContent()%></td>
				<td>
						<%
						String starScore = String.valueOf(reviewDto.getReviewScore());
						if(reviewDto.getReviewScore() == 1){ %>
						<% starScore = "★"; %>
						<%=starScore %>
						<%} %>
						<%if(reviewDto.getReviewScore() == 2){ %>
						<% starScore = "★★"; %>
						<%=starScore %>
						<%} %>
						<%if(reviewDto.getReviewScore() == 3){ %>
						<% starScore = "★★★"; %>
						<%=starScore %>
						<%} %>
						<%if(reviewDto.getReviewScore() == 4){ %>
						<% starScore = "★★★★"; %>
						<%=starScore %>
						<%} %>
						<%if(reviewDto.getReviewScore() == 5){ %>
						<% starScore = "★★★★★"; %>
						<%=starScore %>
						<%} %>
				</td>
				<td><a href="#" class="link link-btn edit-btn">수정</a></td>
				<td><a href="review_delete.svt?reviewNo=<%=reviewDto.getReviewNo()%>&contentsNo=<%=reviewDto.getContentsNo()%>" class="link link-btn">삭제</a></td>
			</tr>
				<!-- 평소에는 hide 수정 버튼을 누르면 나오게 설계 예정 -->
			<tr class="edit-row">
				<td>			
						<input type="hidden" name="reviewNo" value="<%=reviewDto.getReviewNo()%>">
						<input type="hidden" name="contentsNo" value="<%=reviewDto.getContentsNo()%>">
						<input type="text" name="reviewWriter" value="<%=reviewDto.getReviewWriter() %>" disabled class="form-input input-round">
				</td>
				<td colspan="2">
						<textarea class=" input-round" name="reviewContent" rows="3" cols="60"><%=reviewDto.getReviewContent()%></textarea>
				</td>
				<td>
						<%if(reviewDto.getReviewScore() == 1){ %>
						<select name="reviewScore" class="form-input input-round">
							<option value="1" selected>★</option>
							<option value="2">★★</option>
							<option value="3">★★★</option>
							<option value="4">★★★★</option>
							<option value="5">★★★★★</option>
						</select>
						<%} %>
						<%if(reviewDto.getReviewScore() == 2){ %>
						<select name="reviewScore" class="form-input input-round">
							<option value="1">★</option>
							<option value="2" selected>★★</option>
							<option value="3">★★★</option>
							<option value="4">★★★★</option>
							<option value="5">★★★★★</option>
						</select>
						<%} %>
						<%if(reviewDto.getReviewScore() == 3){ %>
						<select name="reviewScore" class="form-input input-round">
							<option value="1">★</option>
							<option value="2">★★</option>
							<option value="3" selected>★★★</option>
							<option value="4">★★★★</option>
							<option value="5">★★★★★</option>
						</select>
						<%} %>
						<%if(reviewDto.getReviewScore() == 4){ %>
						<select name="reviewScore" class="form-input input-round">
							<option value="1">★</option>
							<option value="2">★★</option>
							<option value="3">★★★</option>
							<option value="4" selected >★★★★</option>
							<option value="5">★★★★★</option>
						</select>
						<%} %>
						<%if(reviewDto.getReviewScore() == 5){ %>
						<select name="reviewScore" class="form-input input-round">
							<option value="1">★</option>
							<option value="2">★★</option>
							<option value="3">★★★</option>
							<option value="4">★★★★</option>
							<option value="5" selected>★★★★★</option>
						</select>
						<%} %>
					</td>
					<td>
						<button type="submit" class="btn">수정</button>
					</td>
					<td>
						<button class="btn cancel-btn">취소</button>
					</td>
			</tr>
		<%} %>
		</table>
		</form>
	</div>
</div>




<jsp:include page="/template/footer.jsp"></jsp:include>