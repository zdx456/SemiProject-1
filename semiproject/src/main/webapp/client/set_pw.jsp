<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String clientId = (String) session.getAttribute("clientId");
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<form action="set_pw.kh" method="post">
	<input type="hidden" name="clientId" value="<%=clientId%>">
	<div class="container w400 m30">
		<div class="row center">
			<h1>비밀번호 재설정</h1>
		</div>
		<div class="row">
			<input type="password" name="clientPw" required
				placeholder="변경할 비밀번호 입력" class="form-input fill input-round">
		</div>
		<div class="row">
			<button type="submit" class="btn btn-primary fill">비밀번호 재설정</button>
		</div>
	</div>
</form>


<jsp:include page="/template/footer.jsp"></jsp:include>

