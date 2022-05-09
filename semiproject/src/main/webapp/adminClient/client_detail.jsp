<%@page import="java.util.List"%>
<%@page import="ottes.beans.ClientDao"%>
<%@page import="ottes.beans.ClientDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
	// clientId로 해당 게시글 불러오기
	String clientId = request.getParameter("clientId");
	ClientDao clientDao = new ClientDao();
	ClientDto clientDto = clientDao.selectOneAdmin(clientId);
%>    
    
<jsp:include page="/template/header.jsp"></jsp:include>

	<table border="1" width="400">
		<tr>
			<th width="30%">아이디</th>
			<td><%=clientId%></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><%=clientDto.getClientNick()%></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=clientDto.getClientGender()%></td>
		</tr>
		<tr>
			<th>등급</th>
			<td><%=clientDto.getClientGrade()%></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=clientDto.getClientEmail()%></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><%=clientDto.getClientBirth()%></td>
		</tr>
		<tr>
			<th>마지막 접속일</th>
			<td><%=clientDto.getClientJoindate()%></td>
		</tr>
	</table>
	<div class="row center">
		<a href="client_list.jsp" class="link link-btn fill">목록으로</a>
		<a href="client_chgInfo.jsp?clientId=<%=clientDto.getClientId()%>" class="link link-btn fill">회원 일반 정보 수정</a>
		<a href="client_chgPw.jsp?clientId=<%=clientDto.getClientId()%>" class="link link-btn fill">회원 비밀번호 수정</a>
		<a href="client_delete.jsp?clientId=<%=clientDto.getClientId()%>" class="link link-btn fill">회원 강제 탈퇴</a>
	</div>

<jsp:include page="/template/footer.jsp"></jsp:include>



















