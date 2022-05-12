<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<style>
 .percent {
            background : #00adb5;
            height: 10px;
            width:0%;

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
	color : black;
}

.row {
    margin: 15px 0px;
    text-align: right;
	}
</style>
<script type="text/javascript">


$(function(){
	
    $(".select-all").on("input", function(){
        // this == 체크변화가 발생한 체크박스
        var checked = $(this).prop("checked");
        $(".select-item").prop("checked", checked);
    });
    
    var index = 0;
	move(index);
	
	$(".btn-next").not(":last").click(function(){
		index++;
		move(index);
	});
	
	$(".btn-prev").not(":first").click(function(){
		index--;
		move(index);
		
	});
	
	function move(index){
		$(".page").hide();
		$(".page").eq(index).show();
	
		// 퍼센트 이동하는 사이즈
		var percent = (index+1) * 100 / 2;
        $(".percent").css("width", percent+"%");
    }
});


var unloadListener = function(e){
    e.returnValue = false;
};

// beforeunload 이벤트 추가

window.addEventListener("beforeunload", unloadListener);
window.addEventListener("load", function(){
    var forms = document.querySelectorAll(".pass-form");

    for(var i = 0; i<forms.length; i++) {
        forms[i].addEventListener("submit", function(){
            window.removeEventListener("beforeunload", unloadListener);
        });
    }

});


</script>

<div class="container w800">
<form action="join.kh" method="post">

<!--  페이지 상단 퍼센트 바 -->
    <div class="container w500 m30">
			<h1>회원가입</h1>
        <div class="row">
            <div class="percent"></div>
        </div>
    </div>
    
<!--  기본 정보 등록 : 1페이지 -->
	<div class="container w500 m30 page">
	
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text"  class="join" name="clientId" required
					placeholder="아이디"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" class="join"  name="clientPw" required
					placeholder="비밀번호"></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" class="join"  name="clientNick" required
					placeholder="닉네임"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" class="join"  name="clientBirth" required
					placeholder="생일"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="text" class="join"  name="clientGender" required
					placeholder="남성/여성"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" class="join" name="clientEmail" required
					placeholder="이메일"></td>
			</tr>

	

		</table>
		
		<div class="row center">
			<button type="button" class="btn btn-prev">이전</button>
			<button type="button" class="btn btn-next">다음</button>
		</div>
		</div>
		
		<!------- 2페이지 : 선호 장르 선택 ----- -->
		 <div class="container w400 m50 page">
 			<div class="row center">
 				<label>
 					선호하는 장르를 선택하세요.
 				</label>
 			</div>
 			
        <br>
        
        
            <div class="row center">
            <label>
            <input type="checkbox" name="genreName" value="영화" class="select-item">
                영화
            </label>
                 <label>
            <input type="checkbox" name="genreName" value="드라마" class="select-item">
            	드라마
            </label>
        </div>

	        <div class="row center">
	            <label>
	            <input type="checkbox" name="genreName" value="다큐" class="select-item">
	        	    다큐
	            </label>
	            <label>
	            <input type="checkbox" name="genreName" value="애니메이션" class="select-item">
	            	애니메이션
	      	  </label>
	            <label>
	            <input type="checkbox" name="genreName"  value="버라이어티" class="select-item">
	          	  버라이어티
	  	      </label>
	    	    </div>
			<br>
			<br>
			
               <div class="row center">
            <label>
            <input type="checkbox" class="select-all select-item">
            전체 선택
        </label>
        </div>
        
        	<br>
        	<br>
        <div class="row m10">
			<input type="submit" class="fill btn-yellow btn-join fontSizeUp pass-form"  value="회원가입">
		</div>
		
		
        <div class="row center">
			<button type="button" class="btn btn-prev">이전</button>
			<button type="button" class="btn btn-next">다음</button>
		</div>
        </div>
</form>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>


