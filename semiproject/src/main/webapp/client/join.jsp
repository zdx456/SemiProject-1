
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
	<style>
	#button{  
	 background: #00ADB5;
    box-shadow: 0px 7px 4px rgba(0, 0, 0, 0.25);
    border-radius: 10px;
    color: #EDC948;}
	</style>
	
<%-- CDN 형태 : 네트워크가 연결이 안될 시 문제가 생길 수 있다.--%>
<script 
  src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

        $(function(){
            $(".regex-input").blur(function(){
                var regex = new RegExp($(this).data("regex"));
                var value = $(this).val();
                var judge = regex.test(value);

                if(judge){
                    $(this).next().css("color", "green");
                    $(this).next().text($(this).data("success-msg"));
                }
                else {
                    $(this).next().css("color", "red");
                    $(this).next().text($(this).data("fail-msg"));
                }
            });

            $("#password-check").blur(function(){
                var judge1 = $("input[name=clientPw]").val().length > 0;
                var judge2 = $("input[name=clientPw]").val() == $(this).val();

                if(judge1){
                    if(judge2){
                        $(this).next().css("color", "green");
                        $(this).next().text("비밀번호가 일치합니다");
                    }
                    else {
                        $(this).next().css("color", "red");
                        $(this).next().text("비밀번호가 일치하지 않습니다");
                    }
                }
                else {
                    $(this).next().css("color", "red");
                        $(this).next().text("비밀번호를 입력하세요");
                }
            });
        });
    </script>

</head>

    <form method="post" action="join.kh">
        <div class="container w500 m30">
            <div class="row center m30">
                <h1>회원가입</h1>
            </div>
            <div class="row">               
                <input type="text" name="clientId" placeholder="아이디" autocomplete="off" class="form-input fill input-round regex-input id_input" data-regex="^[a-z][a-z0-9]{0,14}$" data-success-msg="사용가능한 아이디 입니다." data-fail-msg="영어,숫자 15자이내로 작성하세요">
                <span></span>
            </div>
            <div class="row">
         
                <input type="password" name="clientPw" placeholder="비밀번호" class="form-input fill input-round regex-input" data-regex="^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[a-zA-Z0-9!@#$]{8,16}$" data-success-msg="" data-fail-msg="영어,숫자,특수문자(!@#$)를 모두 포함한 8~16자로 작성하세요">
                <span></span>
            </div>
            <div class="row">           
                <input type="password" id="password-check" placeholder="비밀번호 확인" class="form-input fill input-round">
                <span></span>
            </div>
            <div class="row">           
                <input type="text" name="clientNick" placeholder="닉네임" class="form-input fill input-round regex-input" autocomplete="off" data-regex="^[가-힣0-9]{2,10}$" data-success-msg="멋진 닉네임이에요!" data-fail-msg="한글,영어,숫자 2~10 내외로 작성하세요">
                <span></span>
	        <br>
	        <input type="date" name="clientBirth" required placeholder="생년월일" class="form-input input-round" autocomplete="off">
	    </div>
	    <div class="row">
	        <br>
	        <input type="radio" name="clientGender" required
				value="남성">남성
				<input type="radio" name="clientGender" required
				value="여성">여성
	    </div>
	    <div class="row">	      
	        <input type="email" name="clientEmail" required placeholder="이메일" class="form-input fill input-round" autocomplete="off">
	    </div>	    
	    <div class="row">
            </div>
            <div class="row">
                <button type="submit" class="form-input fill input-round"  id = button >회원가입</button>
            </div>
        </div>
    </form>




