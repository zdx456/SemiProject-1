
<%@page import="ottes.beans.LikeGenreDto"%>
<%@page import="ottes.beans.LikeGenreDao"%>
<%@page import="ottes.beans.ClientDto"%>
<%@page import="ottes.beans.ClientDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 준비 : 로그인된 사용자의 ID --%>
<%
	String clientId = (String) session.getAttribute("login");
%>    

<%-- 처리 --%>
<%
	ClientDao clientDao = new ClientDao();
	ClientDto clientDto = clientDao.selectOne(clientId);
	
	// like genre table 추가
	LikeGenreDao likeGenreDao = new LikeGenreDao();
	LikeGenreDto likeGenreDto = likeGenreDao.selectOne(clientId);
%>    
 
<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>


<h1>회원 정보</h1>

<table border="1" width="400">
	<tr>
		<th width="30%">아이디</th>
		<td><%=clientDto.getClientId()%></td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td><%=clientDto.getClientNick()%></td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td><%=clientDto.getClientBirth()%></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><%=clientDto.getClientEmail()%></td>
	</tr>
	<tr>
		<th>등급</th>
		<td><%=clientDto.getClientGrade()%></td>
	</tr>
	<tr>
		<th>가입일</th>
		<td><%=clientDto.getClientJoindate()%></td>
	</tr>
	<tr>
		<th>선호하는 장르</th>
		<td><%=likeGenreDto.getGenreName() %></td>
	</tr>
</table>

<h2><a href="password.jsp">비밀번호 변경</a></h2>
<h2><a href="information.jsp">개인정보 변경</a></h2>
<h2><a href="exit.jsp">탈퇴하기</a></h2>

<jsp:include page="/template/footer.jsp"></jsp:include>

