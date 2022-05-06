<%@page import="ottes.beans.ContentsDto"%>
<%@page import="java.util.List"%>
<%@page import="ottes.beans.ContentsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    ContentsDao contentsDao = new ContentsDao();
    List<ContentsDto> list = contentsDao.selectList();
    
    %>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container w600 m50">
<div class="row center">
	<table class="table">

					<thead>
						<h2>컨텐츠 전체 목록</h2>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>등급</th>
							<th>감독</th>
							<th>장르</th>
							<th>국가</th>
						</tr>
					</thead>
					
						<tbody>
					<%for(ContentsDto contentsDto : list) {%>
						<tr>
							<td><a href="detail.jsp?contentsNo=<%=contentsDto.getContentsNo() %>"><%=contentsDto.getContentsNo() %></a></td>
							<td><%=contentsDto.getContentsTitle() %></td>
							<td><%=contentsDto.getContentsGrade() %></td>
							<td><%=contentsDto.getContentsDirector() %></td>
							<td><%=contentsDto.getGenreName() %></td>
							<td><%=contentsDto.getRegionName() %></td>
						</tr>
						<%} %>
					</tbody>
	
	</table>

</div>

</div>


<jsp:include page="/template/footer.jsp"></jsp:include>