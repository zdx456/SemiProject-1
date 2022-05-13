
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

<form action="information.kh" method="post" >
	<div class="container w450 m30">
	    <div class="row center">
	        <h1>개인정보 변경</h1>
	    </div>
	    <div class="row">
	        <label>닉네임</label>
	        <input type="text" name="clientNick" autocomplete="off" required class="form-input fill input-round" value="<%=clientDto.getClientNick()%>">
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
				value="남성">남성
				<input type="radio" name="clientGender" required
				value="여성">여성
	    </div>
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