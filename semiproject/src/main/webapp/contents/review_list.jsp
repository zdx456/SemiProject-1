<%@page import="ottes.beans.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="ottes.beans.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
    
    .review {
	color: grey;
	background-color: #313842;
	border: transparent;
	border-radius : 10px;
	}
	 

	
    .star-select{
    background-color: transparent;
    color:#EDC948;
    }
    
    .reviewCont{
     resize: none;
     background-color: transparent;
     border-radius: 0.25em;
    }
    
    .review-table{
	border-bottom: 1px solid grey;
	width: 100%;
	}

	.review-table > tbody > tr > th,
	.review-table > tbody > tr > td
	{
    padding:0.5em;
    border-bottom: 1px solid grey;
	}
	
	.btn-insert{
         padding-top: 5px;
         padding-bottom:  5px;
         padding-left: 20px;
         padding-right: 20px;
         font-size: 17px;
         width: 25%
         }
         
       .btn-table{
         padding-top: 5px;
         padding-bottom:  5px;
         padding-left: 10px;
         padding-right: 10px;
         font-size: 10px;
         }
         .img-size{
          width: 25px;
          height : 25px;
         }
    </style>
   
<%

	// 페이지 파라미터
	int p; // = 현재 페이지
	try {
		p = Integer.parseInt(request.getParameter("p"));
		if(p <= 0)	throw new Exception();
	}
	catch(Exception e){
		p = 1;
	}
	
	int s; // = 게시글 수
	try {
		s = Integer.parseInt(request.getParameter("s"));
		if(s <= 0) throw new Exception();
	}
	catch(Exception e){
		s = 10;
	}
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
		list = reviewDao.selectListWriterByPasing(reviewWriter, p, s);
				
	} else{
		list = reviewDao.selectListContentsByPasing(contentsNo, p, s);
	}
	
	// 개수
	int count;
	if(searchWriter){
		count = reviewDao.countWriterByPasing(reviewWriter);
	}
	else{
		count = reviewDao.countContentsByPasing(contentsNo);
	}
	
	// 마지막 페이지 계산
	int lastPage = (count + s - 1) / s;
	
	// 블록 계산
	int blockSize = 5;
	int endBlock = (p + blockSize - 1) / blockSize * blockSize;
	int startBlock = endBlock - (blockSize - 1);
	
	// 범위 초과 문제 해결
	if(endBlock > lastPage){
		endBlock = lastPage;
	}
	
	//관리자인지 판정
	String memberGrade = (String)session.getAttribute("auth");
	boolean isAdmin = memberGrade != null && memberGrade.equals("관리자");
%>
<jsp:include page="/template/header.jsp"></jsp:include>

	 <script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@0.0.5/score.js"></script>
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
                    showNumber:true,
                    placeLimit:0,
                }
            });
        });
    </script>
    

		
<div class="container w700">
	<div class="row center ">
		<h2>리뷰 목록</h2>
		<hr>
	</div>
	<%if(!searchWriter){ //내가 쓴 글에서 오면 등록은 불가능하게 만듬%>
		<form action="review_insert.svt" method="post">
		<div class="row center review">
		<br>
			<h4>리뷰등록</h4><br><br>
			<input type="hidden" name="contentsNo" value="<%=contentsNo%>" > <!-- contentsNo 파라미터 -->
			<textarea rows="3" cols="50" class=" reviewCont" name="reviewContent"  placeholder="리뷰내용"></textarea>
			<label class="score-select" data-max="5"></label><br><br>
		</div>
		<div class="row center"><button type="submit" class="btn-mint btn-insert ">등록</button></div>
		</form>
	<%} %>
	<div class="row review">
	<form action="review_edit.svt" method="post">
		<table class="review-table ">
			<tr>
				<th>작성자</th>
				<th>작성일</th>
				<th>내용</th>
				<th>평점</th>
			</tr>
		<%for(ReviewDto reviewDto : list){ %>
			<tr class="show-row center">
				<td><%=reviewDto.getReviewWriter() %></td>
				<td><%=reviewDto.getReviewTime()%></td>
				<td class="left">
					<textarea rows="3" cols="35" class="reviewCont " disabled><%=reviewDto.getReviewContent()%></textarea>
				</td>
				<td>
						
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
			    <%
					//본인이 작성한 댓글인지 여부를 미리 파악
					boolean isReviewOwner = clientId != null && clientId.equals(reviewDto.getReviewWriter());
				%>
				<%if(isReviewOwner){ %>
				<td>
					<%-- <img src="<%=request.getContextPath()%>/image/edit_Icon.png" class="img-size edit-btn"> 이미지 조잡...함--%>
					<button type="button" class="btn-mint btn-table edit-btn ">수정</button>
				</td>
				<%} %>
				<%if(isReviewOwner || isAdmin) {%>
				<td>
					<a href="review_delete.svt?reviewNo=<%=reviewDto.getReviewNo()%>&contentsNo=<%=reviewDto.getContentsNo()%>" class="btn-black btn-table">
						<%-- <img src="<%=request.getContextPath()%>/image/delete_Icon.png" class="img-size">	 --%>
						삭제
					</a>
				</td>
				<%} %>
			</tr>
				<!-- 평소에는 hide 수정 버튼을 누르면 나오게 설계  -->
			<tr class="edit-row">
				<td>			
						<input type="hidden" name="reviewNo" value="<%=reviewDto.getReviewNo()%>">
						<input type="hidden" name="contentsNo" value="<%=reviewDto.getContentsNo()%>">
						<input type="hidden" name="reviewWriter" value="<%=reviewDto.getReviewWriter() %>" disabled class="form-input input-round">
						<%=reviewDto.getReviewWriter() %>
				</td>
				<td colspan="2">
						<textarea class=" reviewCont" name="reviewContent" rows="3" cols="50"><%=reviewDto.getReviewContent()%></textarea>
				</td>
				<td>
						<%if(reviewDto.getReviewScore() == 1){ %>
						<label class="score-select" data-max="5" data-rate="1"></label>
						<%} %>
						<%if(reviewDto.getReviewScore() == 2){ %>
						<label class="score-select" data-max="5" data-rate="2"></label>
						<%} %>
						<%if(reviewDto.getReviewScore() == 3){ %>
						<label class="score-select" data-max="5" data-rate="3"></label>
						<%} %>
						<%if(reviewDto.getReviewScore() == 4){ %>
						<label class="score-select" data-max="5" data-rate="4"></label>
						<%} %>
						<%if(reviewDto.getReviewScore() == 5){ %>
						<label class="score-select" data-max="5" data-rate="5"></label>
						<%} %>
					</td>
					<td>
						<button type="submit" class="btn-mint btn-size btn-table">수정</button>
					</td>
					<td>
						<button type="button" class="btn-black cancel-btn btn-table">취소</button>
					</td>
			</tr>
		<%} %>
		</table>
		</form>
	</div>
	
		<div class="row center pagination">
		<%if(p > 1){ %>
			<%if(searchWriter){ %>
			<a href="review_list.jsp?p=1&s=<%=s%>&reviewWriter=<%=reviewWriter%>">&laquo;</a>
			<%} else { %>
			<a href="review_list.jsp?p=1&s=<%=s%>&contentsNo=<%=contentsNo%>">&laquo;</a>
			<%} %>
		<%} %>
		
		<%if(startBlock > 1){ %>
			<%if(searchWriter){ %>
			<a href="review_list.jsp?p=<%=startBlock-1%>&s=<%=s%>&reviewWriter=<%=reviewWriter%>">&lt;</a>
			<%} else { %>
			<a href="review_list.jsp?p=<%=startBlock-1%>&s=<%=s%>&contentsNo=<%=contentsNo%>">&lt;</a>
			<%} %>
		<%} %>

		<%for(int i=startBlock; i <= endBlock; i++){ %>
			<%if(searchWriter){ %>
				<%if(i == p){ %>
				<a href="review_list.jsp?p=<%=i%>&s=<%=s%>&reviewWriter=<%=reviewWriter%>" class="active"><%=i%></a>	
				<%} else { %>
				<a href="review_list.jsp?p=<%=i%>&s=<%=s%>&reviewWriter=<%=reviewWriter%>"><%=i%></a>
				<%} %>
			<%} else { %>
				<%if(i == p){ %>
				<a href="review_list.jsp?p=<%=i%>&s=<%=s%>&contentsNo=<%=contentsNo%>" class="active"><%=i%></a>	
				<%} else { %>
				<a href="review_list.jsp?p=<%=i%>&s=<%=s%>&contentsNo=<%=contentsNo%>"><%=i%></a>
				<%} %>
			<%} %>
		<%} %>

		<%if(endBlock < lastPage){ %>
			<%if(searchWriter){ %>
			<a href="review_list.jsp?p=<%=endBlock+1%>&s=<%=s%>&reviewWriter=<%=reviewWriter%>">&gt;</a>
			<%} else { %>
			<a href="review_list.jsp?p=<%=endBlock+1%>&s=<%=s%>&contentsNo=<%=contentsNo%>">&gt;</a>
			<%} %>
		<%} %>
		
		<%if(p < lastPage){ %>
			<%if(searchWriter){ %>
			<a href="review_list.jsp?p=<%=lastPage%>&s=<%=s%>&reviewWriter=<%=reviewWriter%>">&raquo;</a>
			<%} else { %>
			<a href="review_list.jsp?p=<%=lastPage%>&s=<%=s%>&contentsNo=<%=contentsNo%>">&raquo;</a>
			<%} %>
		<%} %>		
	</div>
</div>




<jsp:include page="/template/footer.jsp"></jsp:include>