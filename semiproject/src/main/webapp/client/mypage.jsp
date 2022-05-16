
<%@page import="ottes.beans.GenreDto"%>
<%@page import="ottes.beans.GenreDao"%>
<%@page import="ottes.beans.OttAttachmentDto"%>
<%@page import="ottes.beans.ClientOttDto"%>
<%@page import="ottes.beans.OttAttachmentDao"%>
<%@page import="java.util.List"%>
<%@page import="ottes.beans.ClientOttDao"%>
<%@page import="ottes.beans.LikeGenreDao"%>
<%@page import="ottes.beans.LikeGenreDto"%>
<%@page import="ottes.beans.ClientDto"%>
<%@page import="ottes.beans.ClientDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<style>
	.ottSize {
	width: 60px;
	height: 60px;
}
	</style>
<%
String clientId = (String) session.getAttribute("login");
ClientDao clientDao = new ClientDao();
ClientDto clientDto = clientDao.selectOne(clientId);

ClientOttDao clientOttDao = new ClientOttDao();
List<ClientOttDto> list = clientOttDao.selectList(clientId);

OttAttachmentDao ottAttachmentDao = new OttAttachmentDao();
int OAcount = ottAttachmentDao.count();
List<OttAttachmentDto> listOtt = ottAttachmentDao.selectOttList();

//	선호장르 출력 준비 구문 추가
//@author: 이기주
LikeGenreDao likeGenreDao = new LikeGenreDao();
List<LikeGenreDto> likeGenreList = likeGenreDao.selectLikeGenreList(clientId);

GenreDao genreDao = new GenreDao();
List<GenreDto> genreList = genreDao.selectListNoOrder();


//임시 (송현도) 
//LikeGenreDto likeGenreDto = likeGenreDao.selectOne("admin");
%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="row center">
	<h1>MY PAGE</h1>
</div>
<div class="container w400 m50 page">
	<div class="row left">
		<label>아이디</label>
		<div class="row left">
			<input type="text" class="form form-input input-round fill"
				value="<%=clientDto.getClientId()%>" disabled>
		</div>
	</div>
	<div class="row left">
		<label>닉네임</label>
		<div class="row left">
			<input type="text" class="form form-input input-round fill"
				value="<%=clientDto.getClientNick()%>" disabled>
		</div>
	</div>
	<div class="row left">
		<label>생년월일</label>
		<div class="row left">
				<input type="date" class="form form-input input-round fill"
				value="<%=clientDto.getClientBirth()%>" disabled>
		</div>
	</div>
	<div class="row left">
		<label>이메일</label>
		<div class="row left">
			<input type="email" class="form form-input input-round fill"
				value="<%=clientDto.getClientEmail()%>" disabled>
		</div>
	</div>
	<div class="row left">
		<label>가입일</label>
		<div class="row left">
			<input type="date" class="form form-input input-round fill"
				value="<%=clientDto.getClientJoindate()%>" disabled>
		</div>
	</div>
	<div class="row left">
		<label>등급</label>
		<div class="row left">
			<input type="text" class="form form-input input-round fill"
				value="<%=clientDto.getClientGrade()%>" disabled>

		</div>
	</div>
	
	<br><br>
	    <!-- 
			나의 선호 장르 추가했습니다.
			@author: 이기주
	 	-->
		<div class="float-container">
			<label>나의 선호장르</label><br><br>
			<hr>
			<br><br>
			<%
			for (GenreDto genreDto : genreList) {
			%>
			<%
				boolean isMatch = false;
				for (LikeGenreDto likeGenreDto : likeGenreList) {
					if (genreDto.getGenreName().equals(likeGenreDto.getGenreName())) {
						isMatch = true;
					}
					}%>
					<%
					if (isMatch && !genreDto.getGenreName().equals("없음")) {
					%>
					<input type="hidden" name="clientId" value="<%=clientId%>"> 
					<input type="checkbox" name="genreName"	value="<%=genreDto.getGenreName()%>" checked disabled>
					<%=genreDto.getGenreName()%> <!-- 장르 이름 출력 -->
					<br><br>
					<%
					} else if(!isMatch && !genreDto.getGenreName().equals("없음")) {
					%>
					<input type="hidden" name="clientId" value="<%=clientId%>"> 
					<input type="checkbox" name="genreName"	value="<%=genreDto.getGenreName()%>" disabled>
					<%=genreDto.getGenreName()%> <!-- 장르 이름 출력 -->
				<br><br>
				<%}	%>
			<%}	%>
			<hr>
		</div>
	    <br><br>
	
	<div class="row left">
		<label>가입한 ott</label>
		<div class="row left">
			<%
			for (OttAttachmentDto ottAttachmentDto : listOtt) {
			%>
			<%
			boolean isSearch = false;
			for (ClientOttDto clientOttDto : list) {
				if (clientOttDto.getOttNo() == ottAttachmentDto.getOttNo()) {
					isSearch = true;
				}
			}%>
			<%
			if (isSearch) {
			%> 
			<img src="../adminContents/file_down.svt?attachmentNo=<%=ottAttachmentDto.getAttachmentNo()%>"
				 class="img img-round ottSize">
			<%} %>
			<%} %>

		</div>
	</div>

</div>

<div class="row center">
	<button  type="button"  class="form-input full  btn_css1" onclick="location.href = 'password.jsp';" >비밀번호 변경</button>
	<button type="button" class="form-input full  btn_css1"  onclick="location.href = 'information.jsp';">회원정보 변경</button>
	<button type="button" class="form-input full  btn-black" onclick="location.href = 'exit.jsp';">회원 탈퇴하기</button>	
	
</div>
<!--//container w400 m50 page -->
 




<jsp:include page="/template/footer.jsp"></jsp:include>

