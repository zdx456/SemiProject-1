<%@page import="ottes.beans.OttAttachmentDto"%>
<%@page import="ottes.beans.OttAttachmentDao"%>
<%@page import="ottes.beans.ClientOttDto"%>
<%@page import="java.util.List"%>
<%@page import="ottes.beans.ClientOttDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<style>
.percent {
	background: #00adb5;
	height: 10px;
	width: 0%;
	transition: width 0.25s ease-in-out;
}

.btn-join {
	padding-top: 0.5em;
	padding-bottom: 0.5em;
}

.fontSizeUp {
	font-size: 17px;
}

.join {
	color: black;
}

.row {
	margin: 15px 0px;
	text-align: right;
}

.ott {
	display: none;
}

.ottChoice {
	border-radius: 30px;
	border: 4px solid #0984e3;
}

.ottSize {
	width: 150px;
	height: 150px;
}

.ottLogo {
	margin: 10px;
}

.btn-mint.btn-size {
	padding-top: 5px;
	padding-bottom: 5px;
	padding-left: 40px;
	padding-right: 40px;
	font-size: 17px;
}

.btn-black.btn-link {
	padding-top: 5px;
	padding-bottom: 5px;
	padding-left: 40px;
	padding-right: 40px;
	font-size: 17px;
}

.centerFlex {
	justify-content: center;
	align-items: center;
}

.form-input:focus {
	border-color: #EDC948;
}
</style>

<%

OttAttachmentDao ottAttachmentDao = new OttAttachmentDao();
int OAcount = ottAttachmentDao.count();
List<OttAttachmentDto> listOtt = ottAttachmentDao.selectOttList();
%>

<script type="text/javascript">




$(function(){
	var status ={
			id : false,			
			nick : false
	};
	

    var index = 0;
	move(index);
	
	//닉네임 중복체크 버튼
	$("#btnCheckNick").click(function(){
		var Nickregex =/^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,15}$/;
		var clientNick = $("#clientNick").val();
	
		var Nickjudge = Nickregex.test(clientNick);
		if(!Nickjudge){
			alert("한글,영어,숫자 2~10자이내로 작성해주세요");
			status.nick=false;
			return;
		}
		
		$.ajax({
			url:"http://localhost:8080/semiproject/checkNick.kh?clientNick="+clientNick,
			type:"get",
			
			success:function(resp){
				if(resp === "yes"){
					alert("사용 가능한 닉네임입니다");
					status.nick = true;
					
				}
				else if(resp ==="no"){
					alert("중복된 닉네임입니다");
					status.nick = false;
		
				}
			}	
		})
		
	});
	
	//아이디 중복체크 버튼
	$("#btnCheckId").click(function(){
		var regex =/^[a-zA-Z0-9]{1,15}$/;//영문 숫자 15자 이내
		var clientId = $("#clientId").val();
	
		var judge = regex.test(clientId);
		if(!judge){
			alert("영어,숫자 15자이하로 작성해주세요");
			status.id=false;
			return;
		}
		
		$.ajax({
			url:"http://localhost:8080/semiproject/checkId.kh?clientId="+clientId,
			type:"get",
			
			success:function(resp){
				if(resp === "yes"){
					alert("사용 가능한 아이디입니다");
					status.id = true;
				}
				else if(resp ==="no"){
					alert("중복된 아이디입니다");
					status.id = false;
		
				}
			}	
		})
		
	});
	
    $(".select-all").on("input", function(){
        // this == 체크변화가 발생한 체크박스
        var checked = $(this).prop("checked");
        $(".select-item").prop("checked", checked);
    });

	
	$(".btn-next").not(":last").click(function(){
		
		if(index == 0){ //첫번째 버튼 
		
			if($("#clientId").val() == ""){
				alert("아이디를 입력하세요");
				$("#clientId").focus();
				return;
				
			}
			
			if(status.id == false){ //중복체크를 하지 않거나 통과하지 못한경우
				alert("아이디 중복체크하세요");
				return;
				
			}
			
			if($("#clientPw").val() == ""){
				alert("비밀번호를 입력하세요");
				$("#clientPw").focus();
				return;
			}

			//비밀번호 형식체크  
			var psRegex =/^[a-zA-Z\\d`~!@#$%^&*()-_=+]{8,16}$/;  //영어,숫자,특수문자 8~16
			var clientPw = $("#clientPw").val();
			var psJudge = psRegex.test(clientPw);
			if(!psJudge){
				alert("비밀번호를 영어,숫자,특수문자 8~16자로 입력해주세요");
				$("input[name='clientPw']").focus();		
				return;
			}
			
			//비밀번호 일치확인
			var passwordCheck =$("#password-check").val();
			if(clientPw!=passwordCheck){
				alert("비밀번호가 같은지 확인해주세요");
				$("#password-check").focus();		
				return;
			}
			
			
			if($("#clientNick").val() == ""){
				alert("닉네임을 입력하세요");
				$("#clientNick").focus();
				return;
			} 
			
			if($("#clientNick").val() == ""){
				alert("닉네임을 입력하세요");
				$("#clientNick").focus();
				return;
				
			}
			
			if(status.nick == false){ //중복체크를 하지 않거나 통과하지 못한경우
				alert("닉네임을 중복체크하세요");
				return;
				
			}
			
			if($("#clientBirth").val() == ""){
				alert("생년월일을 입력하세요");
				$("#clientBirth").focus();
				return;
			} 
			if($("#clientEmail").val() == ""){
				alert("이메일을 입력하세요");
				$("#clientEmail").focus();
				return;
			} 
			
		}else if(index == 1){ //2번째 다음버튼
			
		}
		
		index++;
		move(index);
	});
 
	$(".btn-prev").not(":first").click(function(){
		//to-do 진짜 이동할꺼냐 ? 
		index--;
		move(index);
		
	});
	
	function move(index){
		$(".page").hide();
		$(".page").eq(index).show();
	
	
		// 퍼센트 이동하는 사이즈
		var percent = (index+1) * 100 / 3;
        $(".percent").css("width", percent+"%");
    }
});


var unloadListener = function(e){
    e.returnValue = false;
};


$(function() {

	//초기 설정  - 선택 되어 있으면 img제거후 ottChoice 추가
	$(".ott").each(function(index, item) {
		if ($(this).prop("checked")) {

			$(this).next().children().removeClass("img");
			$(this).next().children().addClass("ottChoice");
		}
		;
	});

	//전체 선택 
	$("#selectAll").on("input", function() {

		$(".ott").prop("checked", $(this).prop("checked"));

		if ($(".ott").prop("checked")) {

			$(".changing").removeClass("img")
			$(".changing").addClass("ottChoice");
		}

		if (!$(".ott").prop("checked")) {
			$(".changing").removeClass("ottChoice");
			$(".changing").addClass("img")
		}

	});

	//체크박스 체크 될때
	$(".ott").on("input", function() {

		if ($(this).prop("checked")) {

			$(this).next().children().removeClass("img")
			$(this).next().children().addClass("ottChoice");
		}

		if (!$(this).prop("checked")) {
			$(this).next().children().removeClass("ottChoice");
			$(this).next().children().addClass("img")
		}
	});

});
//장르 체크박스 선택시 "없음:selected" 취소하는 기능!
//@author : 이기주
   
 $(function(){
 		$('input[type="checkbox"][id="skip-item"]').click(function () {
         if ($(this).prop('checked')) {
             $('input[type="checkbox"][id="select-skip"]').prop('checked', false);
             $(this).prop('checked', true);
         }
     });
     $('input[type="checkbox"][id="select-all"]').click(function () {
         if ($(this).prop('checked')) {
             $('input[type="checkbox"][id="select-skip"]').prop('checked', false);
             $(this).prop('checked', true);
         }
     });
 });
</script>

<div class="container w500">
	<form action="join.kh" method="post">

		<!--  페이지 상단 퍼센트 바 -->
		<div class="container w400 m30">
			<label class="center"><h2>회원가입</h2></label>
			<div class="row center ">
				<div class="percent"></div>
			</div>
		</div>

		<!--  기본 정보 등록 : 1페이지 -->
		<div class="container w400 m50 page">
			<div class="row left">
				<label>아이디</label>
				<div class="row left">
					<input type="text"
						class="form-input input-round regex-input id_input" value=""
						autocomplete="off"
						name="clientId" required placeholder="아이디" id="clientId" style="width:310px;"/>
					<button type="button" id="btnCheckId" class="btn" >중복체크</button>
				</div>
			</div>

			<div class="row left">
				<label>비밀번호</label>
				<div class="row">
					<input type="password"
						class="form form-input input-round fill regex-input" value=""
							autocomplete="off"
						name="clientPw" required placeholder="비밀번호" id="clientPw">
					<span></span>
				</div>
			</div>

			<div class="row">
				<input type="password" id="password-check" placeholder="비밀번호 확인"
					autocomplete="off"
					value="" class="form-input fill input-round"> <span></span>
			</div>
			<div class="row left">
				<label>닉네임</label>
				<div class="row">
					<input type="text"
						class="form form-input input-round fill regex-input"
							autocomplete="off"
						name="clientNick" required placeholder="닉네임" id="clientNick" style="width:310px;"
						value=""/>
					<button type="button" id="btnCheckNick" class="btn">중복체크</button>

				</div>
			</div>

			<div class="row left">
				<label>생년월일</label>
				<div class="row">
					<input type="date" class="form form-input input-round fill"
						name="clientBirth" required placeholder="생년월일" id="clientBirth"
						value="">
				</div>
			</div>

			<div class="row left">
				<label>성별</label>
				<div class="row left">
					<input type="radio" name="clientGender" required value="남성" checked>남성
					<input type="radio" name="clientGender" required value="여성">여성
				</div>
			</div>

			<div class="row left">
				<label>이메일</label>
				<div class="row">
					<input type="email" class="form form-input input-round fill"
						autocomplete="off"
						name="clientEmail" required placeholder="이메일" id="clientEmail">
				</div>
			</div>



			<div class="row center">
				<button type="button" class="btn btn-prev" id="btnPrev1">이전</button>
				<button type="button" class="btn btn-next" id="btnNext1">다음</button>
			</div>
		</div>


		<!-- 2페이지 : ott 선택 -->

		<div class="container w400 m50 page">
			<div class="row center">
				<label> 선호하는 OTT를 선택하세요. </label>
			</div>
			<br>

			<div class="container">
				<div class="row center"></div>
				<div class="row flex-container centerFlex">

					<%
							for (OttAttachmentDto ottAttachmentDto : listOtt) {
						%>

					<input type="checkbox" name="ottNo"
						id="ottCheck<%=ottAttachmentDto.getOttNo()%>"
						value="<%=ottAttachmentDto.getOttNo()%>" class="ott"> <label
						for="ottCheck<%=ottAttachmentDto.getOttNo()%>" class="ottLogo">
						<img
						src="../adminContents/file_down.svt?attachmentNo=<%=ottAttachmentDto.getAttachmentNo()%>"
						class="changing img img-round" width="100px" height="100px">
					</label>
					<%
			}
			%>

				</div>
				<br> <br> <br> <br>
				<div class="row center">
					<input type="checkbox" id="selectAll"> <label
						for="selectAll">전체선택 </label>
				</div>
				
			</div>


			<div class="row center">
				<button type="button" class="btn btn-prev">이전</button>
				<button type="button" class="btn btn-next">다음</button>
			</div>
		</div>

		<!------- 3페이지 : 선호 장르 선택 ----- -->
		<div class="container w400 m50 page">
         <div class="row center">
            <label> 선호하는 장르를 선택하세요. </label>
         </div>
         <br>
         <div class="row center">
            <label> <input type="checkbox" name="genreName" value="영화"
               class="select-item" id="skip-item"> 영화
            </label> <label> <input type="checkbox" name="genreName" value="드라마"
               class="select-item" id="skip-item"> 드라마
            </label>
         </div>
         <div class="row center">
            <label> <input type="checkbox" name="genreName" value="다큐"
               class="select-item" id="skip-item"> 다큐
            </label> <label> <input type="checkbox" name="genreName"
               value="애니메이션" class="select-item" id="skip-item"> 애니메이션
            </label> <label> <input type="checkbox" name="genreName"
               value="버라이어티" class="select-item" id="skip-item"> 버라이어티
            </label>
           
            
			</div>

			<br> <br>
			<div class="row m10">
				<button type="submit"
					class="fill btn-yellow btn-join fontSizeUp pass-form" >회원가입</button>
			</div>


			<div class="row center">
				<button type="button" class="btn btn-prev">이전</button>
				<button type="button" class="btn btn-next">다음</button>
			</div>
		</div>

	</form>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>