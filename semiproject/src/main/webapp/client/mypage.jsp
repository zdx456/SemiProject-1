
<%@page import="ottes.beans.LikeGenreDao"%>
<%@page import="ottes.beans.LikeGenreDto"%>
<%@page import="ottes.beans.ClientDto"%>
<%@page import="ottes.beans.ClientDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String clientId = (String) session.getAttribute("login");
ClientDao clientDao = new ClientDao();
ClientDto clientDto = clientDao.selectOne(clientId);

// like genre table 추가
LikeGenreDao likeGenreDao = new LikeGenreDao();
LikeGenreDto likeGenreDto = likeGenreDao.selectOne(clientId);

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
	<div class="row left">
		<label>나의 선호장르</label>
		<div class="row left">
			<input type="text" class="form form-input input-round fill"
				value="<%=likeGenreDto.getGenreName()%>" disabled>

		</div>
	</div>

</div>

<div class="row center">
	<button  type="button"  class="form-input full input-round btn_css1" onclick="location.href = 'password.jsp';" >비밀번호 변경</button>
	<button type="button" class="form-input full input-round btn_css1"  onclick="location.href = 'information.jsp';">회원정보 변경</button>
	<button type="button" class="form-input full input-round btn-black" onclick="location.href = 'exit.jsp';">탈퇴하기</button>	
</div>
<!--//container w400 m50 page -->
 




<jsp:include page="/template/footer.jsp"></jsp:include>

