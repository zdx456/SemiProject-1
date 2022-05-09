<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<h1>비밀번호 확인</h1>

<form action="exit.kh" method="post">
<input type="password" name="clientPw" required>
<input type="submit" value="탈퇴하기">
<% if(request.getParameter("error") != null) { %>
		<div class="row center">
			<h3 style="color:red;">비밀번호가 일치하지 않습니다</h3>	
		</div>
		<% } %>        
    
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>