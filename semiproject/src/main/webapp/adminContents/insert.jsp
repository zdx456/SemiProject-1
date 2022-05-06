
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container w800 m30">
	
	<div class="row center">
		<h1>컨텐츠 등록</h1>
	</div>

	<form action="insert.svt" method="post" enctype="multipart/form-data">
	
		<div class="row">
			<label>제목
				<input type="text" name="contentsTitle" autocomplete="off" class="form-input input-round">
			</label>
		</div>
			
		<div class="row">
			<label>국가</label>
				<select name="regionName">
					<option value="none">선택</option>
					<option>한국</option>
					<option>아시아</option>
					<option>할리우드</option>
				</select>
		</div>
			
		<div class="row">	
			<label>장르</label>
				<select name="genreName">
					<option value="none">선택</option>
					<option>영화</option>
					<option>드라마</option>
					<option>버라이어티</option>
					<option>애니메이션</option>
					<option>다큐멘터리</option>
				</select>
		</div>
			
		<div class="row">
			<label>등급</label>
				<select name="contentsGrade">
					<option value="none">선택</option>
					<option>전체</option>
					<option>12세</option>
					<option>15세</option>
					<option>청불</option>
				</select>
		</div>
			
		<div class="row">	
			<label>러닝타임
				<input type="text" name="contentsTime" autocomplete="off" class="form-input input-round">
			</label>
		</div>
			
		<div class="row">
			<label>감독
				<input type="text" name="contentsDirector" autocomplete="off" class="form-input input-round">
			</label>
		</div>
			
		<div class="row">
			줄거리
			<textarea name="contentsSummary" rows="7" class="form-input fill input-round"></textarea>
		</div>
		
		<!-- 포스터 이미지 선택란 추가 -->
		<div class = "row">
			첨부파일 <input type="file" name="contentsAttachment" accept=".jpg, .png">
		</div>
		
		<!-- 배우 등록 -->
		<div class = "row">
			<label>배우1
				<input type="text" name="actorName1" autocomplete="off" class="form-input input-round">
			</label>
		</div>
		
		<div class = "row">
			<label>배우2
				<input type="text" name="actorName2" autocomplete="off" class="form-input input-round">
			</label>
		</div>
		
		<div class = "row">
			<label>배우3
				<input type="text" name="actorName3" autocomplete="off" class="form-input input-round">
			</label>
		</div>
		
		<div class = "row">
			<label>배우4
				<input type="text" name="actorName4" autocomplete="off" class="form-input input-round">
			</label>
		</div>
		
		<div class="row">
			<input type="submit" value="등록" class="form-input input-round fill">
		</div>
		
		<div class="row">
			<a href="list.jsp" class="form-input input-round fill">목록</a>
		</div>
	</form>
	
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>