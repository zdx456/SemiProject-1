
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/template/header.jsp"></jsp:include>

<style>

	.m-title {
		margin-bottom: 40px;
		margin-top: 20px;
	}
	
	.btn-list {
		padding-left: 10em;
		padding-right: 10em;
		padding-top: 0.5em;
		padding-bottom: 0.5em;
	}
	
	.row {
    margin: 15px 0px;
    text-align: left;
	}
	
	.row-label {
    margin: 5px 0px;
    text-align: left;
	}

	textarea.form-input {
    resize: none;
	}
	
	/********** selectbox  **********/
	
	/*** 실제 외형 ***/
	.selectbox {
    position: relative;
    width: 40%;  /* 너비설정 */
    border: 1px solid #b2bec3;  /* 테두리 설정 */
    border-radius: 0.25em;
    z-index: 1;
	}

	/* 가상 선택자를 활용 화살표 대체 */
	.selectbox:before {
    content: "";
    position: absolute;
    top: 50%;
    right: 15px;
    width: 0;
    height: 0;
    margin-top: -1px;
    border-left: 5px solid transparent;
    border-right: 5px solid transparent;
    border-top: 5px solid #b2bec3;
	}

	.selectbox label {
    position: absolute;
    top: 1px;  /* 위치정렬 */
    left: 5px;  /* 위치정렬 */
    padding: .8em .5em;  /* select의 여백 크기 만큼 */
    color: white;
    z-index: -1;  /* IE8에서 label이 위치한 곳이 클릭되지 않는 것 해결 */
	}

	.selectbox select {
    width: 100%;
    height: auto;  /* 높이 초기화 */
    line-height: normal;  /* line-height 초기화 */
    font-family: inherit;  /* 폰트 상속 */
    padding: .8em .5em;  /* 여백과 높이 결정 */
    border: 0;
    opacity: 0;  /* 숨기기 */
    filter:alpha(opacity=0);  /* IE8 숨기기 */
    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
    background-color: #222831;
	  border: 2px solid #b2bec3;

	}

	select:focus {
  border-color: black;
	}
	
	/* padding 수정하고 싶어서.. */
	.form-input {
    /* outline은 선택 시 자동으로 생기는 테두리이다 */
    outline: none;
    padding: 0.7em;
    border: 1px solid #b2bec3;
    font:inherit;
    background-color: transparent;
	}

	.borderOtt {
		border: 2px solid #b2bec3;
		border-radius: 0.25em;
		padding-left: 1em;
		padding-top: 0.3em;
		padding-bottom: 0.3em;
		width: 50%;
	}
	
	.m-bottom {
		margin-bottom: 1.5em;
	}
	
	.fontSizeUp {
		font-size: 17px;
	}
	


</style>

<script type="text/javascript">

	$(function(){
		
		$(".select-all").change(function(){
			if($(this).is(":checked")){
				$(".select-item").prop("checked", true);
				$(".check-label").css("color", "#EDC948").css("font-weight", "bold");
				
			}
			else {
				$(".select-item").prop("checked", false);
				$(".check-label").css("color", "white").css("font-weight", "normal");
			}
		});
		
		$(".select-item").change(function(){
			var total = $("input:checkbox[name=ottName]").length;
			var checked = $("input:checkbox[name=ottName]:checked").length;
			//console.log(total);
			//console.log(checked);
			
			if(total != checked){
				$(".select-all").prop("checked", false);
				$(".check-labelAll").css("color", "white").css("font-weight", "normal");
			}
			else{
				$(".select-all").prop("checked", true);
				$(".check-labelAll").css("color", "#EDC948").css("font-weight", "bold");
			}
		});
	});
		
		//페이지
		$(function(){
			
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
			}
			
		});
		
		//selectbox
		$(function() {
		    var selectTarget = $('.selectbox select');

		    selectTarget.change(function(){
		        var select_name = $(this).children('option:selected').text();
		        $(this).siblings('label').text(select_name);
		    });
		});
		
		$(function(){
			$(".check1").change(function(){
				if($(this).is(":checked")){
					$(".check-label1").css("color", "#EDC948").css("font-weight", "bold");
				}
				else {
					$(".check-label1").css("color", "white").css("font-weight", "normal");
				}
			});
			
			$(".check2").change(function(){
				if($(this).is(":checked")){
					$(".check-label2").css("color", "#EDC948").css("font-weight", "bold");
				}
				else {
					$(".check-label2").css("color", "white").css("font-weight", "normal");
				}
			});
			
			$(".check3").change(function(){
				if($(this).is(":checked")){
					$(".check-label3").css("color", "#EDC948").css("font-weight", "bold");
				}
				else {
					$(".check-label3").css("color", "white").css("font-weight", "normal");
				}
			});
			
			$(".check4").change(function(){
				if($(this).is(":checked")){
					$(".check-label4").css("color", "#EDC948").css("font-weight", "bold");
				}
				else {
					$(".check-label4").css("color", "white").css("font-weight", "normal");
				}
			});
			
		});
		
		//러닝타임에 숫자 이외 입력 방지
		$(function(){
			$("input[name=contentsTime]").on("keyup", function() {
			    $(this).val($(this).val().replace(/[^0-9]/g,""));
			});

		});
		
		
		//줄거리 글자 수 카운트
		$(function(){
			$(".summary").on("input", function(){
				
				var size = $(this).val().length;
				
				var target = $(this).next().children(".length").children(".count");
				target.text(size);
				
				if(size > 1300){
					target.css("clor", "red");
				}
				else {
					target.css("color", "white");
				}
				
			});
		});
		
		//필수입력 항목 검사
		$(function() {
		    
		    $(".form-submit").on("submit", function(e){
		    	 
		    	var title = $("input[name=contentsTitle]").val() == "";
		    	var time = $("input[name=contentsTime]").val() == "";
		    	var director = $("input[name=contentsDirector]").val() == "";
		    	var summary = $("input[name=contentsSummary]").val() == "";
		    	var attach = $("input[name=contentsAttachment]").val() == "";
		    	var region = $("select[name=regionName]").val() == "";
		    	var genre = $("select[name=genreName]").val() == "";
		    	var grade = $("select[name=contentsGrade]").val() == "";
		    	
		    	if($("input:checkbox[name=ottName]:checked").length == 0 || title || time || director || summary || attach ||region || genre || grade){
		    		e.preventDefault();
		    		
		    	}
		    	
		    });
		});
		
		//이미지 미리보기
		$(function(){
			
			
			$("input[name=contentsAttachment]").change(function(){
				$("#preview").empty();
				setImageFromFile(this, '#preview');
		
			});
			
			function setImageFromFile(input, expression){
				if(input.files && input.files[0])
					var reader = new FileReader();
					reader.onload = function(e) {
						$(expression).attr('src', e.target.result);
					}
					reader.readAsDataURL(input.files[0]);
					$("#preview").show();
			}
			
		});
		

</script>

<div class="container w800 m30">

	<form action="insert.svt" method="post" enctype="multipart/form-data" class="form-submit">
	
	<!-- 1페이지 시작 -->
		<div class="container w500 m30 page">
			<div class="row center m30">
				<h1 class="title m-title">콘텐츠 등록(1/3)</h1>
			</div>
		
		
			<div class="row">
				<label>제목 (*필수)</label>
				<div class="row-label"></div>
					<input type="text" name="contentsTitle" autocomplete="off" class="form-input input-round fill">
			</div>
				
			<div class="row">
				<label>국가 (*필수)</label>
				<div class="row-label"></div>
				
				<div class="selectbox">
					<label for="select">선택</label>
					<select name="regionName" id="select">
						<option value="" hidden selected>선택</option>
						<option>한국</option>
						<option>아시아</option>
						<option>할리우드</option>
					</select>
				</div>
			</div>
			
			<div class="row">
				<label>장르 (*필수)</label>
				<div class="row-label"></div>
				
				<div class="selectbox">
					<label for="select">선택</label>
					<select name="genreName" id="select">
						<option value="" hidden selected>선택</option>
						<option>영화</option>
						<option>드라마</option>
						<option>버라이어티</option>
						<option>애니메이션</option>
						<option>다큐멘터리</option>
					</select>
				</div>
			</div>
			
			<div class="row">
				<label>등급 (*필수)</label>
				<div class="row-label"></div>
				
				<div class="selectbox">
					<label for="select">선택</label>
					<select name="contentsGrade" id="select">
						<option value="" hidden selected>선택</option>
						<option>전체</option>
						<option>12세</option>
						<option>15세</option>
						<option>청불</option>
					</select>
				</div>
			</div>
				
				
			<div class="row">	
				<label>러닝타임(분)(숫자만 입력) (*필수)</label>
				<div class="row-label"></div>
					<input type="text" name="contentsTime" autocomplete="off" class="form-input input-round fill">
			</div>
				
			<div class="row">
				<label>감독 (*필수)</label>
				<div class="row-label"></div>
					<input type="text" name="contentsDirector" autocomplete="off" class="form-input input-round fill">
			</div>
				
			<div class="row">
				줄거리 (*필수)
				<div class="row-label"></div>
				<textarea name="contentsSummary" rows="7" class="form-input fill input-round summary"></textarea>
				
				<div class="row right">
					<span class="length">
						<span class="count">0</span>
						/
						<span class="total">1300</span>
					</span>
				</div>
			</div>
			
			
			
			<!------------ 포스터 이미지 선택란 추가 ------------>
			<div class = "row">
				<label>이미지(.jpg/ .png) (*필수)</label>
				<div class="row-label"></div>
				<div class="form-input input-round fill">
					<input type="file" name="contentsAttachment" accept=".jpg, .png" class=" required-check">
					<br><br>
					<img src ="" id="preview" width="150" height="150" alt="포스터" hidden>
				</div>
			</div>
			
			<!-- 이전, 다음 버튼 -->
		<div class="row center">
			<button type="button" class="btn btn-prev">이전</button>
			<button type="button" class="btn btn-next">다음</button>
		</div>
		
		</div>	
		
		<!-- 1페이지 끝 -->
		
		
		<!-- 2페이지 시작 -->
		<div class="container w500 m30 page">
			<div class="row center m30">
				<h1 class="title m-title">콘텐츠 등록(2/3)</h1>
			</div>
		
			<!------------ 배우 등록 ------------>
			<div class = "row">
				<label>배우1</label>
				<div class="row-label"></div>
					<input type="text" name="actorName1" autocomplete="off" class="form-input input-round fill">
			</div>
			
			<div class = "row">
				<label>배우2</label>
				<div class="row-label"></div>
					<input type="text" name="actorName2" autocomplete="off" class="form-input input-round fill">
			</div>
			
			<div class = "row">
				<label>배우3</label>
				<div class="row-label"></div>
					<input type="text" name="actorName3" autocomplete="off" class="form-input input-round fill">
			</div>
			
			<div class = "row">
				<label>배우4</label>
				<div class="row-label"></div>
					<input type="text" name="actorName4" autocomplete="off" class="form-input input-round fill">
			</div>
			
			<!-- 이전, 다음 버튼 -->
		<div class="row center">
			<button type="button" class="btn btn-prev">이전</button>
			<button type="button" class="btn btn-next">다음</button>
		</div>
		
		</div>
		
		<!-- 2페이지 끝 -->
		
		
		<!-- 3페이지 시작 -->
		
		<div class="container w500 m30 page">
			<div class="row center m30">
				<h1 class="title m-title">콘텐츠 등록(3/3)</h1>
			</div>
			
		<!------------ OTT 등록 ------------>
		<div class = "row">
			<div>서비스 중인 OTT (*필수)</div>
		</div>
		
			<div class="row m60 borderOtt">
				
				<div class="row m-bottom">
					<label class="check-label check-labelAll">
						<input type="checkbox" class="select-all">
					전체 선택</label>
				</div>
				
			
			<div class="row">
				<label class="check-label1 check-label">
					<input type="checkbox" name="ottName" value="넷플릭스" class="select-item check1">
				넷플릭스</label>
			</div>
			
			<div class="row">
				<label class="check-label2 check-label">
					<input type="checkbox" name="ottName" value="왓차" class="select-item check2">
				왓차</label>
			</div>
			
			<div class="row">
				<label class="check-label3 check-label"> 
					<input type="checkbox" name="ottName" value="웨이브" class="select-item check3">
				웨이브</label>
			</div>
			
			<div class="row">
				<label class="check-label4 check-label">
					<input type="checkbox" name="ottName" value="티빙" class="select-item check4">
				티빙</label>
			</div>
			
		
		</div>
		
		<div class="row m10">
			<button type="submit" class="fill btn-black btn-list fontSizeUp">콘텐츠 등록하기</button>
			
		</div>
		
		<div class="row">
			<button type="button" onclick="location.href='list.jsp'"class="fill btn-mint btn-list fontSizeUp">목록으로 돌아가기</button>
		</div>
		
		<!-- 이전, 다음 버튼 -->
		<div class="row center">
			<button type="button" class="btn btn-prev">이전</button>
			<button type="button" class="btn btn-next">다음</button>
		</div>
		
		</div>
	
	</form>
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>
