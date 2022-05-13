
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
		//LikeGenreDto likeGenreDto = likeGenreDao.selectOne(clientId);
		
		//임시 (송현도)
		LikeGenreDto likeGenreDto = likeGenreDao.selectOne("admin");
%>    
	
<jsp:include page="/template/header.jsp"></jsp:include>
<style>

        .table>thead>tr,
        .table>tbody>tr {
            font-weight: bold;
            /* background-color: #929292; */
            border-bottom: 1px solid white;
            color: white;
        }

        .table tbody a:hover,
        .table tbody tr:hover {
            color: #EDC948 !important;
            background-color: #222831;
        }
</style>
<div class="row center">
<h1>회원 정보</h1>
</div>
<table class="table table_line row center" style="margin-left: auto; margin-right: auto;">

	<tr>
		<th class="row right" width="30%">아이디</th>
		<td class="line_under"><%=clientDto.getClientId()%></td>
	</tr>
	<tr>
		<th class="row right">닉네임</th>
		<td ><%=clientDto.getClientNick()%></td>
	</tr>
	<tr>
		<th class="row right">생년월일</th>
		<td><%=clientDto.getClientBirth()%></td>
	</tr>
	<tr>
		<th class="row right">이메일</th>
		<td ><%=clientDto.getClientEmail()%></td>
	</tr>
	<tr>
		<th class="row right">등급</th>
		<td><%=clientDto.getClientGrade()%></td>
	</tr>
	<tr>
		<th class="row right">가입일</th>
		<td><%=clientDto.getClientJoindate()%></td>
	</tr>
	<tr>
		<th class="row right">선호하는 장르</th>
		<td><%=likeGenreDto.getGenreName() %></td>
	</tr>
	
	
</table>
<div class="row center">
            <input type="submit" value="비밀번호 변경" id="button" class="form-input full input-round btn_css1" onclick="location.href = 'password.jsp';">
        </div>
<div class="row center">
            <input  type="submit" value="구독 ott 변경" id="button" class="form-input full input-round btn_css1" onclick="location.href = 'select_ott.jsp';">
        </div>
      
<div class="row center">
            <input type="submit" value="개인정보 변경" id="button" class="form-input full input-round btn_css1"  onclick="location.href = 'information.jsp';">
        </div>
<div class="row center">
            <input type="submit" value="탈퇴하기" id="button" class="form-input full input-round btn_css1" onclick="location.href = 'exit.jsp';">
        </div>
        <div class="row center">
            <input type="submit" value="나의 리뷰보기" id="button" class="form-input full input-round btn_css1" onclick="location.href='/semiproject/contents/review_list.jsp?reviewWriter=<%=clientId %>'" />
        </div>


<jsp:include page="/template/footer.jsp"></jsp:include>

