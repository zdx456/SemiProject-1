<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

 <style>
	#button{  	
	 background: #222831;
    border: 2px solid #EDC948;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    border-radius: 10px;
    color: #EDC948;}
	</style>
	<div class = "row center">
<h1>비밀번호 확인</h1>
</div>
<form action="exit.kh" method="post">
<div class = "row center">
<input type="password" name="clientPw" required>
<input type="submit" id = "button" value="탈퇴하기">
</div>
<% if(request.getParameter("error") != null) { %>
		<div class="row center">
			<h3 style="color:red;">비밀번호가 일치하지 않습니다</h3>	
		</div>
		<% } %>        
    
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>