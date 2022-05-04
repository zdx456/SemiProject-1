<%@page import="ottes.beans.GenreDto"%>
<%@page import="ottes.beans.RegionDto"%>
<%@page import="java.util.List"%>
<%@page import="ottes.beans.ContentsActorDto"%>
<%@page import="ottes.beans.ContentsActorDao"%>
<%@page import="ottes.beans.ContentsDto"%>
<%@page import="ottes.beans.ContentsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int contentsNo = Integer.parseInt(request.getParameter("contentsNo"));

	//컨텐츠 정보 가져오기
	ContentsDao contentsDao = new ContentsDao();
	ContentsDto contentsDto = contentsDao.selectOne(contentsNo);
	
	//배우 정보 가져오기
	ContentsActorDao contentsActorDao = new ContentsActorDao();
	List<ContentsActorDto> list = contentsActorDao.selectList(contentsNo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
</head>
<body>
	<div class="container w800 m30">
	
		<div class="row center">
			<h1>상세 페이지</h1>
		</div>
	
		<table class="table">
			
			<tr>
				<td>번호</td>
				<td><%=contentsDto.getContentsNo() %></td>
			</tr>
			
			<tr>
				<td>제목</td>
				<td><%=contentsDto.getContentsTitle() %></td>
			</tr>
			
			<tr>
				<td>등급</td>
				<td><%=contentsDto.getContentsGrade() %></td>
			</tr>
			
			<tr>
				<td>국가</td>
				<td><%=contentsDto.getRegionName() %></td>
			</tr>
			
			<tr>
				<td>장르</td>
				<td><%=contentsDto.getGenreName() %></td>
			</tr>
			
			<tr>
				<td>러닝타임</td>
				<td><%=contentsDto.getContentsTime() %></td>
			</tr>
			
			<tr>
				<td>감독</td>
				<td><%=contentsDto.getContentsDirector() %></td>
			</tr>
			
				
			<%for(ContentsActorDto contentsActorDto : list) {%>
				<tr>
					<td>배우</td>
					<td><%=contentsActorDto.getActorNo() %></td>
				</tr>
			<%} %>
			
			<tr>
				<td>줄거리</td>
				<td><%=contentsDto.getContentsSummary() %></td>
			</tr>
			
		<!-- 버튼 영역 -->
			<tr>
				<td><a href="edit.jsp?contentsNo=<%=contentsDto.getContentsNo() %>">수정</a></td>
				<td><a href="delete.svt?contentsNo=<%=contentsDto.getContentsNo() %>">삭제</a></td>
			</tr>
		</table>
		
		<a href="list.jsp">목록</a>
		
	</div>
</body>
</html>









