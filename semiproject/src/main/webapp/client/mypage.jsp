
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
%>    
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
</table>

<h2><a href="password.jsp">비밀번호 변경</a></h2>
<h2><a href="information.jsp">개인정보 변경</a></h2>
<h2><a href="exit.jsp">탈퇴하기</a></h2>

<jsp:include page="/template/footer.jsp"></jsp:include>

