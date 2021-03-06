<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String clientId = (String) session.getAttribute("clientId");
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

<script type="text/javascript">
$(function(){


	//비밀번호 형식체크  
	$(".btn-next").click(function(){
		var psRegex =/^[a-zA-Z\\d`~!@#$%^&*()-_=+]{8,16}$/;  //영어,숫자,특수문자 8~16이내
		var clientPw = $("#clientPw").val();
		var psJudge = psRegex.test(clientPw);
		if(!psJudge){
			alert("비밀번호를 영어,숫자,특수문자 8~16자로 입력해주세요");
			$("input[name='clientPw']").focus();		
		
			return false;
		}
	});

});

</script>
<form action="set_pw.kh" method="post">
	<input type="hidden" name="clientId" value="<%=clientId%>">
	<div class="container w400 m30">
		<div class="row center">
			<h1>비밀번호 재설정</h1>
		</div>
		<div class="row">
			<input type="password" name="clientPw" required id="clientPw"
				placeholder="변경할 비밀번호 입력" class="form-input fill input-round">
		</div>
		<div class="row center">
			<button type="submit" id = "button" class="form-input full input-round btn-next">비밀번호 재설정</button>
		</div>
	</div>
</form>


<jsp:include page="/template/footer.jsp"></jsp:include>

