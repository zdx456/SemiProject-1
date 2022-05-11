<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1>회원 가입 완료!</h1>
</div>
<div class="row center">
            <input type="submit" value="로그인 하러가기" id="button" class="form-input full input-round" onclick="location.href = 'login.jsp';">
        </div>
       
<jsp:include page="/template/footer.jsp"></jsp:include>