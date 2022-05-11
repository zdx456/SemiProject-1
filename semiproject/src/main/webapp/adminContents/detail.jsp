<%@page import="ottes.beans.OttDto"%>
<%@page import="ottes.beans.OttDao"%>
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
	
	//OTT 가져오기
	OttDao ottDao = new OttDao();
	List<OttDto> list = ottDao.selectList(contentsNo);
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<style>

	.m-title {
		margin-bottom: 40px;
		margin-top: 20px;
	}
	
	.layer-6 {
		width: 60%;
	}
	
	.btn-ed-de {
		padding-left: 6em;
		padding-right: 6em;
		padding-top: 0.5em;
		padding-bottom: 0.5em;
	}
	
	.btn-list {
		padding-left: 10em;
		padding-right: 10em;
		padding-top: 0.5em;
		padding-bottom: 0.5em;
	}
	
	.layer-10pro {
		width: 10%;
	}
	
	div {
    border: 1px dotted transparent;
	}
	
</style>


	<div class="container w800 m30">
	
		<div class="row center">
			<h1 class="title m-title">상세 페이지(관리자용)</h1>
		</div>
	
		<div class="float-container">
		
		<!-- 포스터 보여주기 -->
			<div class="float-left layer-2 center m40">
				<img src="file_down.svt?attachmentNo=<%=attachmentDto.getAttachmentNo() %>" width="250" height="350" alt="포스터">
			</div>
			
			<div class="float-right layer-2">
			
				<div class="row m15">
						<div class="float-container">
						
							<div class="float-left layer-5 center">
									<label>콘텐츠 No</label>
							</div>
							
							<div class="float-left layer-5 center">
								<span>:</span>
							</div>
							
							<div class="float-left layer-6 left">
								<span class="m15"> <%=contentsDto.getContentsNo() %></span>
							</div>
							
						</div>
					</div>
					
					<div class="row m15">
						<div class="float-container">
						
							<div class="float-left layer-5 center">
									<label>제목</label>
							</div>
							
							<div class="float-left layer-5 center">
								<span>:</span>
							</div>
							
							<div class="float-left layer-6 left">
								<span class="m15"> <%=contentsDto.getContentsTitle() %></span>
							</div>
							
						</div>
					</div>
					
					<div class="row m15">
						<div class="float-container">
						
							<div class="float-left layer-5 center">
									<label>등급</label>
							</div>
							
							<div class="float-left layer-5 center">
								<span>:</span>
							</div>
							
							<div class="float-left layer-6 left">
								<span class="m15"> <%=contentsDto.getContentsGrade() %></span>
							</div>
							
						</div>
					</div>
					
					<div class="row m15">
						<div class="float-container">
						
							<div class="float-left layer-5 center">
									<label>국가</label>
							</div>
							
							<div class="float-left layer-5 center">
								<span>:</span>
							</div>
							
							<div class="float-left layer-6 left">
								<span class="m15"> <%=contentsDto.getRegionName() %></span>
							</div>
							
						</div>
					</div>
					
					<div class="row m15">
						<div class="float-container">
						
							<div class="float-left layer-5 center">
									<label>장르</label>
							</div>
							
							<div class="float-left layer-5 center">
								<span>:</span>
							</div>
							
							<div class="float-left layer-6 left">
								<span class="m15"> <%=contentsDto.getGenreName() %></span>
							</div>
							
						</div>
					</div>
					
					<div class="row m15">
						<div class="float-container">
						
							<div class="float-left layer-5 center">
									<label>러닝타임</label>
							</div>
							
							<div class="float-left layer-5 center">
								<span>:</span>
							</div>
							
							<div class="float-left layer-6 left">
								<span class="m15"> <%=contentsDto.getContentsTime() %></span>
							</div>
							
						</div>
					</div>
					
					
					<div class="row m15">
						<div class="float-container">
						
							<div class="float-left layer-5 center">
									<label>감독</label>
							</div>
							
							<div class="float-left layer-5 center">
								<span>:</span>
							</div>
							
							<div class="float-left layer-6 left">
								<span class="m15"> <%=contentsDto.getContentsDirector() %></span>
							</div>
							
						</div>
					</div>
					
					<%if(actorDto.getActorName1() != null) {  //값이 null이 아니면 보여줘라(값이 null이면 안 보임) %>
					<div class="row m15">
						<div class="float-container">
						
							<div class="float-left layer-5 center">
									<label>배우1</label>
							</div>
							
							<div class="float-left layer-5 center">
								<span>:</span>
							</div>
							
							<div class="float-left layer-6 left">
								<span class="m15"> <%=actorDto.getActorName1() %></span>
							</div>
							
						</div>
					</div>
					<%} %>
					
					<%if(actorDto.getActorName2() != null) {  //값이 null이 아니면 보여줘라(값이 null이면 안 보임) %>
					<div class="row m15">
						<div class="float-container">
						
							<div class="float-left layer-5 center">
									<label>배우2</label>
							</div>
							
							<div class="float-left layer-5 center">
								<span>:</span>
							</div>
							
							<div class="float-left layer-6 left">
								<span class="m15"> <%=actorDto.getActorName2() %></span>
							</div>
							
						</div>
					</div>
					<%} %>
				

				<%if(actorDto.getActorName3() != null) {  //값이 null이 아니면 보여줘라(값이 null이면 안 보임) %>
					<div class="row m15">
						<div class="float-container">
						
							<div class="float-left layer-5 center">
									<label>배우3</label>
							</div>
							
							<div class="float-left layer-5 center">
								<span>:</span>
							</div>
							
							<div class="float-left layer-6 left">
								<span class="m15"> <%=actorDto.getActorName3() %></span>
							</div>
							
						</div>
					</div>
					<%} %>
				
				<%if(actorDto.getActorName4() != null) {  //값이 null이 아니면 보여줘라(값이 null이면 안 보임) %>
					<div class="row m15">
						<div class="float-container">
						
							<div class="float-left layer-5 center">
									<label>배우4</label>
							</div>
							
							<div class="float-left layer-5 center">
								<span>:</span>
							</div>
							
							<div class="float-left layer-6 left">
								<span class="m15"> <%=actorDto.getActorName4() %></span>
							</div>
							
						</div>
					</div>
					<%} %>
					
					<div class="row m15">
						<div class="float-container">
						
							<div class="float-left layer-5 center">
									<label>줄거리</label>
							</div>
							
							<div class="float-left layer-5 center">
								<span>:</span>
							</div>
							
							<div class="float-left layer-6 left">
								<span class="m15"> <%=contentsDto.getContentsSummary() %></span>
							</div>
							
						</div>
					</div>
					
					<div class="row m15">
						<div class="float-container">
						
							<div class="float-left layer-5 center">
									<label>OTT</label>
							</div>
							
							<div class="float-left layer-5 center">
								<span>:</span>
							</div>
							
							<div class="float-left layer-6 left">
								<span class="m15">
									<%for(OttDto ottDto : list) {%>
									 <%=ottDto.getOttName() %>
									 <%} %>
								</span>
						</div>
						
						</div>
					</div>
			</div>
		</div>
	</div>
			
			
		<!-- 버튼 영역 -->
			<div class="row m30">
				<div class="float-container">
				
					<div class="float-left layer-5"></div>
					
					<div class="float-left layer-4 center">
						<a href="edit.jsp?contentsNo=<%=contentsDto.getContentsNo() %>" class="btn-black btn-ed-de">수정하기</a>
					</div>
					
					<div class="float-left layer-10pro"></div>
					
					<div class="float-left layer-4 center">
						<a href="delete.svt?contentsNo=<%=contentsDto.getContentsNo() %>" class="btn-black btn-ed-de">삭제하기</a>
					</div>
					
					<div class="float-left layer-5"></div>
			</div>
		
		<div class="row m50">
			<div class="float-container">
			
				<div class="float-left layer-4"></div>
				
				<div class="float-left layer-2 center">
					<a href="list.jsp" class="btn-mint btn-list center">목록으로 이동하기</a>
				</div>
				
				<div class="float-left layer-4"></div>
				
			</div>
		</div>
		
	</div>
	
	
<jsp:include page="/template/footer.jsp"></jsp:include>









