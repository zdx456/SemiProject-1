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

.centerFlex{
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
	
		<div class="row left" >
			<label>아이디</label>
			<div class="row">
					<input type="text"  class="form form-input input-round fill " name="clientId" required
					placeholder="아이디">
			</div>
		</div>
			
		<div class="row left">
			<label>비밀번호</label>
			<div class="row">
				<input type="password" class="form form-input input-round fill"  name="clientPw" required
					placeholder="비밀번호">
			</div>
		</div>
		
		<div class="row left">
			<label>닉네임</label>
			<div class="row">
				<input type="password" class="form form-input input-round fill"  name="clientPw" required
					placeholder="비밀번호">
			</div>
		</div>
		
		<div class="row left">
			<label>생년월일</label>
			<div class="row">
				<input type="date" class="form form-input input-round fill"  name="clientBirth" required
					placeholder="생년월일">
			</div>
		</div>
		
		<div class="row left">
			<label>성별</label>
			<div class="row">
				<input type="text" class="form form-input input-round fill"  name="clientGender" required
					placeholder="남성/여성">
			</div>
		</div>
			
		<div class="row left">
			<label>이메일</label>
			<div class="row">
				<input type="email" class="form form-input input-round fill" name="clientEmail" required
					placeholder="이메일">
			</div>
		</div>
			
			
		
		<div class="row center">
			<button type="button" class="btn btn-prev">이전</button>
			<button type="button" class="btn btn-next">다음</button>
		</div>
		</div>
		
		
		
		<!-- 2페이지 : ott 선택 -->
		
		 <div class="container w400 m50 page">
 			<div class="row center">
 				<label>
 					선호하는 OTT를 선택하세요.
 				</label>
 			</div>
 			<br>
 			
	<div class="container">
		<div class="row center">
		</div>
		<div class="row flex-container centerFlex">

			<%
			for (OttAttachmentDto ottAttachmentDto : listOtt) {
			%>

			<input type="checkbox" name="ottNo"
				id="ottCheck<%=ottAttachmentDto.getOttNo()%>"
				value="<%=ottAttachmentDto.getOttNo()%>" class="ott">
			<label for="ottCheck<%=ottAttachmentDto.getOttNo()%>"
				class="ottLogo"> 
				<img src="../adminContents/file_down.svt?attachmentNo=<%=ottAttachmentDto.getAttachmentNo()%>"
				 class="changing img img-round" width="100px" height="100px">
			</label>
			<%
			}
			%>

		</div>
		<br><br><br><br>
		<div class="row center">
			<input type="checkbox" id="selectAll"> 
			<label for="selectAll">전체선택 </label>
		</div>
		<div class="row center">
			<a href="#" class="btn-black btn-link">SKIP</a>
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
        
        
        </div>
</form>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>


