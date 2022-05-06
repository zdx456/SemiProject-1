<%@page import="ottes.beans.AttachmentDto"%>
<%@page import="ottes.beans.AttachmentDao"%>
<%@page import="ottes.beans.ActorDto"%>
<%@page import="ottes.beans.ActorDao"%>
<%@page import="ottes.beans.GenreDto"%>
<%@page import="ottes.beans.RegionDto"%>
<%@page import="java.util.List"%>
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
	ActorDao actorDao = new ActorDao();
	ActorDto actorDto = actorDao.selectName(contentsNo);
	
	//포스터 가져오기
	AttachmentDao attachmentDao = new AttachmentDao();
	AttachmentDto attachmentDto = attachmentDao.selectAttachment(contentsNo);
%>

<jsp:include page="/template/header.jsp"></jsp:include>

	<div class="container w800 m30">
	
		<div class="row center">
			<h1>상세 페이지</h1>
		</div>
	
		<table class="table">
		
		<!-- 포스터 보여주기 -->
			<tr>
				<td>
					<img src="file_down.svt?attachmentNo=<%=attachmentDto.getAttachmentNo() %>" width="150" height="150" alt="포스터">
				</td>
			</tr>
			
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
			
				<%if(actorDto.getActorName1() != null) {  //값이 null이 아니면 보여줘라(값이 null이면 안 보임) %>
				<tr>
					<td>배우1</td>
					<td><%=actorDto.getActorName1() %></td>
				</tr>
				<%} %>
				
				<%if(actorDto.getActorName2() != null) { //값이 null이 아니면 보여줘라(값이 null이면 안 보임) %>
				<tr>
					<td>배우2</td>
					<td><%=actorDto.getActorName2() %></td>
				</tr>
				<%} %>
				
				<%if(actorDto.getActorName3() != null) { //값이 null이 아니면 보여줘라(값이 null이면 안 보임) %>
				<tr>
					<td>배우3</td>
					<td><%=actorDto.getActorName3() %></td>
				</tr>
				<%} %>
				
				<%if(actorDto.getActorName4() != null) { //값이 null이 아니면 보여줘라(값이 null이면 안 보임) %>
				<tr>
					<td>배우4</td>
					<td><%=actorDto.getActorName4() %></td>
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
	
<jsp:include page="/template/footer.jsp"></jsp:include>









