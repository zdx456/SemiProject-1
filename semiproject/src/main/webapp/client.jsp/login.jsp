<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/template/header.jsp"></jsp:include>
    
 <form action="login.kh" method="post">
    <div class="container w400 m30">
        <div class="row center">
            <h1>로그인</h1>
        </div>
        <div class="row">       
            <input type="text" name="clientId" required placeholder="아이디" class="form-input fill input-round" autocomplete="off">
        </div>
        <div class="row">
        
            <input type="password" name="clientPw" required placeholder="비밀번호" class="form-input fill input-round">
        </div>
        <div class="row">
            <input type="submit" value="로그인" class="btn btn-primary fill">
        </div>
        <div class="row center">
            <a href="find_id.jsp" class="link">아이디가 기억나지 않아요</a>
        </div>
        <div class="row center">
            <a href="find_pw.jsp" class="link">비밀번호가 기억나지 않아요</a>
        </div>
        
		<%-- 에러 표시가 있는 경우 메세지를 출력 --%>
		<% if(request.getParameter("error") != null) { %>
		<div class="row center">
			<h3 style="color:red;">로그인 정보가 일치하지 않습니다</h3>	
		</div>
		<% } %>        
    </div>
</form>


    
    
    
    
    
    
    
    
    
    
    
    
    
    <jsp:include page="/template/footer.jsp"></jsp:include>
    