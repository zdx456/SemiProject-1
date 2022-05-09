<%@page import="ottes.beans.ClientDao"%>
<%@page import="ottes.beans.ClientDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String clientId = request.getParameter("clientId");
ClientDao clientDao = new ClientDao();
ClientDto clientDto = clientDao.selectOne(clientId);

%> 


    
<jsp:include page="/template/header.jsp"></jsp:include>

<div>
	<h1>회원 강제 탈퇴</h1>
</div>
	<p style="color: red ">※ (주의) 삭제된 아이디는 복구 하실 수 없습니다.</p>
	<p style="color: red ">※ 삭제하시려면 하단의 아이디를 입력하세요.</p>
<div>
<form action="delete.svt" method="post">
	<input type="text" name="clientId" placeholder="<%=clientDto.getClientId()%>" required>
	<input type="submit" value="탈퇴하기">
</form>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>