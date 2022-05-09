<%@page import="ottes.beans.ClientDto"%>
<%@page import="ottes.beans.ClientDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String clientId = request.getParameter("clientId");

	ClientDao clientDao = new ClientDao();
	ClientDto clientDto = clientDao.selectOneAdmin(clientId);
%> 
    
<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container w500 m30">
	<form action="edit.svt" method="post">
		<div>
			<h1>회원 일반 정보 수정</h1>
		</div>
		<div>
			<label>닉네임</label>
			<input type="text" name="clientNick" autocomplete="off" class="form-input fill input-round" value="<%=clientDto.getClientNick()%>">
		</div>
		<div>
			<label>성별</label><br>
		        <select name="clientGender" class="form-input input-round">
			        	<%if(clientDto.getClientGender().equals("남성")){ %>
			        	<option selected>남성</option>
			        	<%} else { %>
			        	<option>남성</option>
			        	<%} %>
			        	
			        	<%if(clientDto.getClientGender().equals("여성")){ %>
			        	<option selected>여성</option>
			        	<%} else { %>
			        	<option>여성</option>
			        	<%} %>
		        </select>
		</div>
		<div>
			<label>등급</label>
				<select name="clientGrade" class="form-input input-round">
		        	<%if(clientDto.getClientGrade().equals("일반회원")){ %>
		        	<option selected>일반회원</option>
		        	<%} else { %>
		        	<option>일반회원</option>
		        	<%} %>
		        	
		        	<%if(clientDto.getClientGrade().equals("관리자")){ %>
		        	<option selected>관리자</option>
		        	<%} else { %>
		        	<option>관리자</option>
		        	<%} %>
		        </select>
		</div>
		<div>
			<label>이메일</label>
			<input type="email" name="clientEmail" autocomplete="off" class="form-input fill input-round" value="<%=clientDto.getClientEmail()%>">
		</div>
		<div>
			<label>생년월일</label>
			<input type="date" name="clientBirth" autocomplete="off" class="form-input fill input-round" value="<%=clientDto.getClientBirth()%>">
		</div>
		<div>
			<input type="hidden" name="clientId" value="<%=clientId%>">
		</div>
		
		<div class="row">
			<button type="submit" class="btn btn-primary fill">정보 변경하기</button>
		</div>
		<div class="row">
			<a href="client_detail.jsp?clientId=<%=clientId%>" class="link link-btn fill">돌아가기</a>
		</div>
	
	</form>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>