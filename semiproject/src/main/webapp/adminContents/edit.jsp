
<%@page import="ottes.beans.AttachmentDto"%>
<%@page import="ottes.beans.AttachmentDao"%>
<%@page import="ottes.beans.ActorDto"%>
<%@page import="ottes.beans.ActorDao"%>
<%@page import="ottes.beans.ContentsDto"%>
<%@page import="ottes.beans.ContentsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int contentsNo = Integer.parseInt(request.getParameter("contentsNo"));

	ContentsDao contentsDao = new ContentsDao();
	ContentsDto contentsDto = contentsDao.selectOne(contentsNo);
	
	ActorDao actorDao = new ActorDao();
	ActorDto actorDto = actorDao.selectName(contentsNo);
	
	AttachmentDao attachmentDao = new AttachmentDao();
	AttachmentDto attachmentDto = attachmentDao.selectAttachment(contentsNo);

%>
    
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container w800 m30">
	
	<div class="row center">
		<h1>컨텐츠 수정</h1>
	</div>

	<form action="edit.svt" method="post" enctype="multipart/form-data">
		
		<input type="hidden" name="contentsNo" value="<%=contentsDto.getContentsNo() %>">
	
		<div class="row">
			<label>제목
				<input type="text" name="contentsTitle" value="<%=contentsDto.getContentsTitle() %>" autocomplete="off" class="form-input input-round">
			</label>
		</div>
			
		<div class="row">
			<label>국가</label>
			<%if(contentsDto.getRegionName().equals("한국")){%>
				<select name="regionName">
					<option selected>한국</option>
					<option>아시아</option>
					<option>할리우드</option>
				</select>
				<%} else if(contentsDto.getRegionName().equals("아시아")) { %>
				<select name="regionName">
					<option>한국</option>
					<option selected>아시아</option>
					<option>할리우드</option>
				</select>
				<%} else if(contentsDto.getRegionName().equals("할리우드")) { %>
				<select name="regionName">
					<option>한국</option>
					<option>아시아</option>
					<option selected>할리우드</option>
				</select>
				<%} %>
		</div>
			
		<div class="row">	
			<label>장르</label>
			<%if(contentsDto.getGenreName().equals("영화")){%>
				<select name="genreName">
					<option selected>영화</option>
					<option>드라마</option>
					<option>버라이어티</option>
					<option>애니메이션</option>
					<option>다큐멘터리</option>
				</select>
			<%} else if(contentsDto.getGenreName().equals("드라마")) { %>
				<select name="genreName">
					<option>영화</option>
					<option selected>드라마</option>
					<option>버라이어티</option>
					<option>애니메이션</option>
					<option>다큐멘터리</option>
				</select>
			<%} else if(contentsDto.getGenreName().equals("버라이어티")) { %>
				<select name="genreName">
					<option>영화</option>
					<option>드라마</option>
					<option selected>버라이어티</option>
					<option>애니메이션</option>
					<option>다큐멘터리</option>
				</select>
			<%} else if(contentsDto.getGenreName().equals("애니메이션")) { %>
				<select name="genreName">
					<option>영화</option>
					<option>드라마</option>
					<option>버라이어티</option>
					<option selected>애니메이션</option>
					<option>다큐멘터리</option>
				</select>
			<%} else if(contentsDto.getGenreName().equals("다큐멘터리")) { %>
				<select name="genreName">
					<option>영화</option>
					<option>드라마</option>
					<option>버라이어티</option>
					<option>애니메이션</option>
					<option selected>다큐멘터리</option>
				</select>
			<%} %>
		</div>
			
		<div class="row">
			<label>등급</label>
			<%if(contentsDto.getContentsGrade().equals("전체")){%>
				<select name="contentsGrade">
					<option selected>전체</option>
					<option>12세</option>
					<option>15세</option>
					<option>청불</option>
				</select>
			<%} else if(contentsDto.getContentsGrade().equals("12세")) { %>
				<select name="contentsGrade">
					<option>전체</option>
					<option selected>12세</option>
					<option>15세</option>
					<option>청불</option>
				</select>
			<%} else if(contentsDto.getContentsGrade().equals("15세")) { %>
				<select name="contentsGrade">
					<option>전체</option>
					<option>12세</option>
					<option selected>15세</option>
					<option>청불</option>
				</select>
			<%} else if(contentsDto.getContentsGrade().equals("청불")) { %>
				<select name="contentsGrade">
					<option>전체</option>
					<option>12세</option>
					<option>15세</option>
					<option selected>청불</option>
				</select>
			<%} %>
		</div>
			
		<div class="row">	
			<label>러닝타임
				<input type="text" name="contentsTime" value="<%=contentsDto.getContentsTime() %>" autocomplete="off" class="form-input input-round">
			</label>
		</div>
			
		<div class="row">
			<label>감독
				<input type="text" name="contentsDirector" value="<%=contentsDto.getContentsDirector() %>" autocomplete="off" class="form-input input-round">
			</label>
		</div>
			
		<div class="row">
			줄거리
			<textarea name="contentsSummary" rows="7" class="form-input fill input-round"><%=contentsDto.getContentsSummary() %></textarea>
		</div>

		<!-- 배우 등록 -->
		<div class = "row">
			<label>배우1
				<input type="text" name="actorName1" value="<%=actorDto.getActorName1() %>" autocomplete="off" class="form-input input-round">
			</label>
		</div>
		
		<div class = "row">
			<label>배우2
				<input type="text" name="actorName2" value="<%=actorDto.getActorName2() %>" autocomplete="off" class="form-input input-round">
			</label>
		</div>
		
		<div class = "row">
			<label>배우3
				<input type="text" name="actorName3" value="<%=actorDto.getActorName3() %>" autocomplete="off" class="form-input input-round">
			</label>
		</div>
		
		<div class = "row">
			<label>배우4
				<input type="text" name="actorName4" value="<%=actorDto.getActorName4() %>" autocomplete="off" class="form-input input-round">
			</label>
		</div>
		
		<!-- 포스터 이미지 선택란 추가 -->
		<div class = "row">
			첨부파일 <input type="file" name="contentsAttachment" accept=".jpg, .png"><span><%=attachmentDto.getAttachmentUploadname() %></span>
		</div>
		
		<div class="row">
			<input type="submit" value="수정" class="form-input input-round fill">
		</div>
		
		<div class="row">
			<a href="detail.jsp?contentsNo=<%=contentsDto.getContentsNo() %>" class="form-input input-round fill">돌아가기</a>
		</div>
	</form>
	
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>