<%@page import="ottes.beans.OttDto"%>
<%@page import="java.util.List"%>
<%@page import="ottes.beans.OttDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	OttDao ottDao = new OttDao();
	List<OttDto> list = ottDao.selectList();
%>
<%-- Ott 목록 (등록 수정 삭제)페이지 초안  --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container">
<div class="row center">
	<h1>OTT관리 페이지</h1>
</div>
<div class="row">
<table class="table table-border">
		<tr>
			<th>Ott 번호</th>
			<th>Ott 이름</th>
			<th>Ott 가격(월별)</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
	<%for(OttDto ottDto : list){ %>
		<tr>
			<td><%=ottDto.getOttNo()%></td>
			<td><%=ottDto.getOttName()%></td>
			<td><%=ottDto.getOttPrice()%></td>
			<td><a href="#" class="link link-btn">수정</a></td>
			<td><a href="delete.svt?ottNo=<%=ottDto.getOttNo()%>" class="link link-btn">삭제</a></td> 
		</tr>
		<%-- 수정 버튼 클릭이 수정화면 나옴 그전엔 hide   예정--%>
		<tr>
			<td>
		
				<form action="update.svt" method="post">
					<input type="hidden" name ="ottNo" value="<%=ottDto.getOttNo()%>">
					<input type="text" name="ottName" value="<%=ottDto.getOttName()%>" class="form-input input-round">
					<input type="number" name="ottPrice" value="<%=ottDto.getOttPrice() %>" min="0" step="100" class="form-input input-round">
					<button type="submit" class="btn">수정</button>
					<%-- 취소 버튼 클릭시 수정 input 안보이게 설정 예정 --%>
					<button class="btn">취소</button>
				</form>
			</td>
		</tr>
	<%} %>
		<tr>
			<td>
				<button class="insert">등록</button>
				<%-- 버튼 클릭시 등록 input 나오게 설정 jquery 이용해서 hide 할 예정 --%>
			</td>
		</tr>
		<tr>
			<td>
			<!-- 등록 이상 무  잘됨 -->
				<form action="insert.svt" method="post">
					<input type="text" name="ottName" placeholder="Ott 이름" class="form-input input-round">
					<input type="number"  name="ottPrice" placeholder="Ott월별가격(basic)" min="0" step="100"  class="form-input input-round">
					<button type="submit" class="btn">등록</button>
				</form>
			</td>
		</tr>
</table>
</div>
</div>





<jsp:include page="/template/footer.jsp"></jsp:include>