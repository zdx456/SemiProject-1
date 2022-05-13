<%@page import="ottes.beans.StatsDto"%>
<%@page import="ottes.beans.StatsDao"%>
<%@page import="ottes.beans.ContentsDto"%>
<%@page import="java.util.List"%>
<%@page import="ottes.beans.ContentsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
	StatsDao statsDao = new StatsDao();
	List<StatsDto> list = statsDao.contentsCount();
	
%>
   
<jsp:include page="/template/header.jsp"></jsp:include>


<table>
	
	<tr>
		<th>OTT</th>
		<th>전체</th>
		<th>다큐</th>
		<th>드라마</th>
		<th>버라</th>
		<th>애니</th>
		<th>영화</th>
		<th>아시아</th>
		<th>한국</th>
		<th>할리우드</th>
	</tr>
	
	
	<%for(StatsDto statsDto : list) {%>
	<tr>
	<%if(statsDto.getOttName() == null) {%>
	<td><span>전체</span></td>
	<%} else {  %>
		<td><%=statsDto.getOttName() %></td>
	<%} %>
		<td><%=statsDto.getConTotal() %></td>
		<td><%=statsDto.getConDocumentary() %></td>
		<td><%=statsDto.getConDrama() %></td>
		<td><%=statsDto.getConVariety() %></td>
		<td><%=statsDto.getConAnimation() %></td>
		<td><%=statsDto.getConMovie() %></td>
		<td><%=statsDto.getConAsia() %></td>
		<td><%=statsDto.getConKorea() %></td>
		<td><%=statsDto.getConHollywood() %></td>
	</tr>
	<%} %>
</table>








