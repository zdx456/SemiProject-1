<%@page import="ottes.beans.OttDto"%>
<%@page import="java.util.List"%>
<%@page import="ottes.beans.OttDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style>
	
	.review-table{
	border-bottom: 1px solid grey;
	width:100%;
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
       width: 100%
       }
       .btn-size{
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
	</style>
	

	
<%
	OttDao ottDao = new OttDao();
	List<OttDto> list = ottDao.selectList();
	

%>

<jsp:include page="/template/header.jsp"></jsp:include>

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
            
            //등록 버튼
            $(".insert-btn").click(function(){
            	$(this).parents().next().show();
            	$(this).hide();
            	$(".retract-btn").show();
            });
            $(".retract-btn").click(function(){
            	$(".insert-row").hide();
            	$(this).hide();
            	$(".insert-btn").show();
            });
            $(".insert-row").hide();
            $(".retract-btn").hide();
            
        });
      </script>

 
<div class="container w700 ">
<div class="row center">
	<h1>OTT관리 페이지</h1>
</div>
<div class="row center">
<form action="update.svt" method="post">
<table class="review-table">
		<tr>
			<th>Ott 번호</th>
			<th>Ott 이름</th>
			<th>Ott 가격(월별)</th>
			
		</tr>
	<%for(OttDto ottDto : list){ %>
		<tr class="show-row center">
			<td><%=ottDto.getOttNo()%></td>
			<td><%=ottDto.getOttName()%></td>
			<td><%=ottDto.getOttPrice()%></td>
			<td><button type="button" class="btn-mint edit-btn btn-table">수정</button></td>
			<td><a href="delete.svt?ottNo=<%=ottDto.getOttNo()%>" class="btn-black btn-table">삭제</a></td> 
		</tr>
		
		<%-- 수정 버튼 클릭이 수정화면 나옴 그전엔 hide   예정--%>
		<tr class="edit-row">
			<td>
					<input type="hidden" name ="ottNo" value="<%=ottDto.getOttNo()%>">
			</td>
			<td>
					<input type="text" name="ottName" value="<%=ottDto.getOttName()%>" class="form-input input-round">
			</td>
			<td>
					<input type="number" name="ottPrice" value="<%=ottDto.getOttPrice() %>" min="0" step="100" class="form-input input-round">
			</td>
			<td>
					<button type="submit" class="btn-mint btn-table">수정</button>
			</td>
			<td>
					<%-- 취소 버튼 클릭시 수정 input 안보이게  예정 --%>
					<button class="btn-black cancel-btn btn-table">취소</button>
			</td>
		</tr>
	<%} %>
</table>
</form>
</div>
<div class = "row center">
	<button type="button" class=" btn-mint btn-size insert-btn">등록하기</button><br>
	<button type="button" class="btn-black btn-size retract-btn ">취소</button>
	<%-- 버튼 클릭시 등록 input 나오게 설정 jquery 이용해서 hide `--%>
</div>
<div class="row center insert-row">


	<form action="insert.svt" method="post" enctype="multipart/form-data">
	<input type="text" name="ottName" placeholder="Ott 이름" class="form-input input-round">
	<input type="number"  name="ottPrice" placeholder="Ott월별가격(basic)" min="0" step="100"  class="form-input input-round">
	<input type="file" name="ottLogo" accept=".jpg,.png"><br><br>
	<button type="submit" class="btn-mint btn-insert">등록</button>
	</form>
</div>
</div>





<jsp:include page="/template/footer.jsp"></jsp:include>