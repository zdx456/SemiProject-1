<%@page import="ottes.beans.OttDto"%>
<%@page import="java.util.List"%>
<%@page import="ottes.beans.OttDao"%>
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
            
            //등록 버튼
            $(".insert-btn").click(function(){
            	$(this).parents().next().show();
            });
            $(".insert-row").hide();
            
        });
      </script>

	
<%
	OttDao ottDao = new OttDao();
	List<OttDto> list = ottDao.selectList();
%>
<%-- Ott 목록 (등록 수정 삭제)페이지 초안  --%>
<jsp:include page="/template/header.jsp"></jsp:include>
 
<div class="container ">
<div class="row center">
	<h1>OTT관리 페이지</h1>
</div>
<div class="row">
<form action="update.svt" method="post">
<table class="table table-border">
		<tr>
			<th>Ott 번호</th>
			<th>Ott 이름</th>
			<th>Ott 가격(월별)</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
	<%for(OttDto ottDto : list){ %>
		<tr class="show-row">
			<td><%=ottDto.getOttNo()%></td>
			<td><%=ottDto.getOttName()%></td>
			<td><%=ottDto.getOttPrice()%></td>
			<td><a href="#" class="btn-mint edit-btn">수정</a></td>
			<td><a href="delete.svt?ottNo=<%=ottDto.getOttNo()%>" class="btn-black">삭제</a></td> 
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
					<button type="submit" class="btn-mint">수정</button>
			</td>
			<td>
					<%-- 취소 버튼 클릭시 수정 input 안보이게 설정 예정 --%>
					<button class="btn-black cancel-btn">취소</button>
			</td>
		</tr>
	<%} %>
</table>
</form>
</div>
<div class = "row center">
	<button class=" btn-mint  insert-btn">등록하기</button>
	<%-- 버튼 클릭시 등록 input 나오게 설정 jquery 이용해서 hide 할 예정 --%>
</div>
<div class="row center insert-row">


	<form action="insert.svt" method="post" enctype="multipart/form-data">
	<input type="text" name="ottName" placeholder="Ott 이름" class="form-input input-round">
	<input type="number"  name="ottPrice" placeholder="Ott월별가격(basic)" min="0" step="100"  class="form-input input-round">
	<input type="file" name="ottLogo" accept=".jpg,.png">
	<button type="submit" class="btn-mint">등록</button>
	</form>
</div>
</div>





<jsp:include page="/template/footer.jsp"></jsp:include>