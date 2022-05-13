<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String clientId = request.getParameter("clientId");
%>
 
<!--  
	관리자가 회원의 비밀번호까지 변경하는 것은 월권인것 같아서 사용하지 않습니다.
	혹시 필요할지 몰라 삭제는 임시보류 중입니다.
	@author: 이기주
  -->
 
 
<jsp:include page="/template/header.jsp"></jsp:include>

<form action="chg_pw.svt" method="post">
	<input type="hidden" name="clientId" value="<%=clientId%>">
	<div class="container w400 m30">
	    <div class="row center">
	        <h1>비밀번호 재설정</h1>
	    </div>
	    <div class="row">
	        <input type="password" name="clientPw" required placeholder="재설정할 비밀번호 입력" class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <button type="submit" class="btn btn-primary fill">비밀번호 재설정</button>
	    </div>
	</div>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>