
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
<style>
	#button{  
	width:300px;
	 background: #00ADB5;
    box-shadow: 0px 7px 4px rgba(0, 0, 0, 0.25);
    border-radius: 5px;
    color: #EDC948;}
	</style>

	
<jsp:include page="/template/header.jsp"></jsp:include>
<div class="row center">
<h1>회원 정보</h1>
</div>
<table class="table" style="margin-left: auto; margin-right: auto;" >

	<tr>
		<th width="30%">아이디</th>
		<td><%=clientDto.getClientId()%></td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td ><%=clientDto.getClientNick()%></td>
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
<div class="row center">
            <input type="submit" value="비밀번호 변경" id="button" class="form-input full input-round" onclick="location.href = 'password.jsp';">
        </div>
<div class="row center">
            <input  type="submit" value="구독 ott 변경" id="button" class="form-input full input-round" onclick="location.href = 'select_ott.jsp';">
        </div>
      
<div class="row center">
            <input type="submit" value="개인정보 변경" id="button" class="form-input full input-round" onclick="location.href = 'information.jsp';">
        </div>
<div class="row center">
            <input type="submit" value="탈퇴하기" id="button" class="form-input full input-round" onclick="location.href = 'exit.jsp';">
        </div>


<jsp:include page="/template/footer.jsp"></jsp:include>

