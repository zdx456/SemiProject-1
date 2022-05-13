<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
 <style>
	#button{  
	width:300px;
	 background: #00ADB5;
    box-shadow: 0px 7px 4px rgba(0, 0, 0, 0.25);
    border-radius: 5px;
    color: #EDC948;}
	</style>
<form action="find_pw.kh" method="post">
	<div class="container w400 m30">
	    <div class="row center">
	        <h1>비밀번호 찾기</h1>
	    </div>
	    <div class="row">
	        <label>아이디</label>
	        <input type="text" name="clientId" autocomplete="off" required class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <label>닉네임</label>
	        <input type="text" name="clientNick" autocomplete="off" required class="form-input fill input-round">
	    </div>
	    <div class="row">
           <input type="date" name="clientBirth" autocomplete="off" required   placeholder="생일"  class="form-input input-round">
       </div>
	    <div class="row">
	        <label>이메일</label>
	        <input type="email" name="clientEmail" autocomplete="off" required class="form-input fill input-round">
	    </div>
	    
	    <div class="row center">
	        <button type="submit" id= "button" class="form-input fill input-round">비밀번호 찾기</button>
	    </div>
		<%-- 에러 표시가 있는 경우 메세지를 출력 --%>
		<% if(request.getParameter("error") != null) { %>
		<div class="row center">
			<h3 style="color:red;">정보와 일치하는 데이터가 없습니다</h3>
		</div>
		<% } %>
	</div>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>