<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>\
   <jsp:include page="/template/header.jsp"></jsp:include>
   
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript">

        $(function(){
            $(".select-all").on("input", function(){
                // this == 체크변화가 발생한 체크박스
                var checked = $(this).prop("checked");
                $(".select-item").prop("checked", checked);
            });

        });

        
    </script>
    
</head>
<body>
	<form action="genre_insert.svt" method="post">
    <div class="container w400 m50">
 			<div class="row center">
 				<label>
 					선호하는 장르를 선택하세요.
 				</label>
 			</div>
        <br>
            <div class="row center">
            <label>
            <input type="checkbox" name="genre" value="영화" class="select-item">
                영화
            </label>
                 <label>
            <input type="checkbox" name="genre" value="드라마" class="select-item">
            	드라마
            </label>
        </div>

	        <div class="row center">
	            <label>
	            <input type="checkbox" name="genre" value="다큐" class="select-item">
	        	    다큐
	            </label>
	            <label>
	            <input type="checkbox" name="genre" value="애니메이션" class="select-item">
	            	애니메이션
	      	  </label>
	            <label>
	            <input type="checkbox" name="genre"  value="버라이어티" class="select-item">
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
        	<input type="submit" class="btn" value="완료"> 
        	<br>
        	<br>
        	<td><a href="#" class="link link-btn">SKIP</a></td>
        </div>
	</form>
</body>
</html>

<jsp:include page="/template/footer.jsp"></jsp:include>