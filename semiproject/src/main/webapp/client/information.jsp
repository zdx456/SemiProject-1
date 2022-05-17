
<%@page import="ottes.beans.GenreDao"%>
<%@page import="ottes.beans.GenreDto"%>
<%@page import="java.util.List"%>
<%@page import="ottes.beans.LikeGenreDto"%>
<%@page import="ottes.beans.LikeGenreDao"%>
<%@page import="ottes.beans.ClientDto"%>
<%@page import="ottes.beans.ClientDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String clientId = (String) session.getAttribute("login");
%>    

<%
	ClientDao clientDao = new ClientDao();
	ClientDto clientDto = clientDao.selectOne(clientId);
	
// 	선호장르 출력 준비 구문 추가
//  @author: 이기주
	LikeGenreDao likeGenreDao = new LikeGenreDao();
	List<LikeGenreDto> likeGenreList = likeGenreDao.selectLikeGenreList(clientId);
	
	GenreDao genreDao = new GenreDao();
	List<GenreDto> genreList = genreDao.selectListNoOrder();
	
	

%>    
     <style>
     
	#button{  
	width:300px;
	 background: #00ADB5;
    box-shadow: 0px 7px 4px rgba(0, 0, 0, 0.25);
    border-radius: 5px;
    color: #EDC948;}
	</style>
 
<jsp:include page="/template/header.jsp"></jsp:include>

<script type="text/javascript">
$(function () {
    var status = {
      
        nick: false
    };

   
    //닉네임 중복체크 버튼
    $("#btnCheckNick").click(function () {
            var Nickregex = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,15}$/;
            var clientNick = $("#clientNick").val();

            var Nickjudge = Nickregex.test(clientNick);
            if (!Nickjudge) {
                alert("한글,영어,숫자 2~10자이내로 작성해주세요");
                status.nick = false;
                return;
            }

            $.ajax({
                url: context+ "/checkNick.kh?clientNick=" +
                    clientNick,
                type: "get",

                success: function (resp) {
                    if (resp === "yes") {
                        alert("사용 가능한 닉네임입니다");
                        status.nick = true;

                    } else if (resp === "no") {
                        alert("중복된 닉네임입니다");
                        status.nick = false;

                    }
                }


            });
        });
    });
	</script>
	
<form action="information.kh" method="post" >
	<div class="container w450 m30">
	    <div class="row center">
	        <h1>회원 정보 변경</h1>
	    </div>
	    <div class="row left">
				<label>닉네임</label>
				<div class="row">
					<input type="text"
						class="form form-input input-round fill regex-input"
							autocomplete="off"/
						name="clientNick" required placeholder="닉네임" id="clientNick" style="width:310px; " value="<%=clientDto.getClientNick()%>"/>
					<button type="button" id="btnCheckNick" class="btn">중복체크</button>

				</div>
			</div>

	    <div class="row">
	        <label>생년월일</label><br>
	        <input type="date" name="clientBirth" autocomplete="off" required class="form-input input-round fill" value="<%=clientDto.getClientBirth()%>">
	    </div>	   
	    <div class="row">
	        <label>이메일</label>
	        <input type="email" name="clientEmail" autocomplete="off" class="form-input fill input-round" value="<%=clientDto.getClientEmail()%>">	   
		</div>
	     <div class="row">
	        <br>
	        <input type="radio" name="clientGender" required
				value="남성" checked>남성
				<input type="radio" name="clientGender" required
				value="여성">여성
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
					<input type="checkbox" name="genreName"	value="<%=genreDto.getGenreName()%>" checked>
					<%=genreDto.getGenreName()%> <!-- 장르 이름 출력 -->
					<br><br>
					<%
					} else if(!isMatch && !genreDto.getGenreName().equals("없음")) {
					%>
					<input type="hidden" name="clientId" value="<%=clientId%>"> 
					<input type="checkbox" name="genreName"	value="<%=genreDto.getGenreName()%>">
					<%=genreDto.getGenreName()%> <!-- 장르 이름 출력 -->
				<br><br>
				<%}	%>
			<%}	%>
			<hr>
		</div>
	    <br><br>
	    
	    
	    <div class="row">
	        <label>비밀번호 확인</label>
	        <input type="password" name="clientPw" required class="form-input fill input-round">
	    </div>
	    <div class="row center">
	        <button type="submit" class="form-input fill input-round"  id = button >정보 변경하기</button>        
	    </div>
	    
		<% if(request.getParameter("error") != null){ %>
		<div class="row center">
			<h3 style="color:red;">비밀번호가 일치하지 않습니다</h3>		
		</div>	    
		<%} %>
	</div>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>