<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<% 

String clientId = (String)session.getAttribute("login");

%>
<jsp:include page="/template/header.jsp"></jsp:include>

<form action="client_ott_insert.svt" method="post">
<div class="container">
	<div class ="row center">
		<h1>구독중인 서비스를 선택 하세요</h1>
	</div>
	<div class="row">
		<input type="checkbox" name="ott" id="netflixCheck" value="넷플릭스">
		<label for="netflixCheck">
		<img src ="<%=request.getContextPath()%>/image/netflix.png" class="img img-round" width="150" height="150">
		</label>
	</div>
	<div class="row">
		<input type="checkbox" name="ott" id="tvingCheck" value="티빙">
		<label for="tvingCheck">
		<img src ="<%=request.getContextPath()%>/image/tving.jpg" class="img img-round" width="150" height="150">
		</label>
	</div>
	<div class="row">
		<input type="checkbox" name="ott" id="watchaCheck" value="왓챠">
		<label for="watchaCheck">
		<img src ="<%=request.getContextPath()%>/image/watcha.png" class="img img-round" width="150" height="150">
		</label>
	</div>
	<div class="row ">
		<input type="checkbox" name="ott" id="waveCheck" value="웨이브">
		<label for="waveCheck">
		<img src ="<%=request.getContextPath()%>/image/wave.png" class="img img-round" width="150" height="150">
		</label>
	</div>
		<button type="submit">등록</button>
	</div>
	</div>
		<button type="submit">스킵</button>
	</div>

</form>







<jsp:include page="/template/footer.jsp"></jsp:include>