<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	String error = request.getParameter("error");
	boolean type1 = error != null && error.equals("1");
	boolean type2 = error != null && error.equals("2");
%>
 
    <style>
	#button{  
	width:300px;
	height : 35px;
	 background: #00ADB5;
    box-shadow: 0px 7px 4px rgba(0, 0, 0, 0.25);
    border-radius: 10px;
    color: #EDC948;}
	</style>
  <jsp:include page="/template/header.jsp"></jsp:include>
  
<script type="text/javascript">
$(function(){


	//비밀번호 형식체크  
	$(".btn-next").click(function(){
		var psRegex =/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{7,16}$/;  //영어,숫자,특수문자 8~16
		var changePw = $("#changePw").val();
		var psJudge = psRegex.test(changePw);
		if(!psJudge){
			alert("비밀번호를 영어,숫자,특수문자 8~16자로 입력해주세요");
			$("input[name='changePw']").focus();		
		
			return false;
		}
	});

});
  
</script>
<form action="password.kh" method="post">
	<div class="container w400 m30">
	    <div class="row center">
	        <h1>비밀번호 변경</h1>
	    </div>
	    <div class="row">
	        <label>현재 비밀번호</label>
	        <input type="password" name="currentPw" required class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <label>변경할 비밀번호</label>
	        <input type="password" name="changePw" required class="form-input fill input-round"
	        	 value=""  id="changePw">
	    </div>
	    <div class="row center">
	        <button type="submit" id = "button" class="btn btn-primary fil btn-next" >비밀번호 변경하기</button>
	    </div>
	    
	    <%if(type1){ %>
	    <div class="row center">
			<h3 style="color:red;">현재 비밀번호와 같은 비밀번호로 변경할 수 없습니다</h3>
		</div>
		<%} %>
		
		<%if(type2){ %>
		<div class="row center">
			<h3 style="color:red;">현재 비밀번호가 일치하지 않습니다</h3>
		</div>
		<%} %>
	</div>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>





