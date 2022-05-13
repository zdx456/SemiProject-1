<%@page import="ottes.beans.OttAttachmentDto"%>
<%@page import="ottes.beans.OttAttachmentDao"%>
<%@page import="ottes.beans.OttDto"%>
<%@page import="ottes.beans.OttDao"%>
<%@page import="ottes.beans.ClientOttDto"%>
<%@page import="java.util.List"%>
<%@page import="ottes.beans.ClientDao"%>
<%@page import="ottes.beans.ClientOttDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
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
</style>



<%
String clientId = (String) session.getAttribute("login");

boolean isLogin = clientId != null && !clientId.equals("");

ClientOttDao clientOttDao = new ClientOttDao();
List<ClientOttDto> list = clientOttDao.selectList(clientId);

OttAttachmentDao ottAttachmentDao = new OttAttachmentDao();
int OAcount = ottAttachmentDao.count();
List<OttAttachmentDto> listOtt = ottAttachmentDao.selectOttList();
%>
<jsp:include page="/template/header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/javascript">
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
</script>


<form action="client_ott_insert.svt" method="post">
	<div class="container">
		<div class="row center">
			<h2>구독중인 서비스를 선택 하세요</h2><br><br>
		</div>
		<div class="row flex-container centerFlex">

			<%
			for (OttAttachmentDto ottAttachmentDto : listOtt) {
			%>
			<%
			boolean isSearch = false;
			for (ClientOttDto clientOttDto : list) {
				if (clientOttDto.getOttNo() == ottAttachmentDto.getOttNo()) {
					isSearch = true;
				}
			}%>
			<%
			if (isSearch) {
			%>
			<input type="checkbox" name="ottNo"
				id="ottCheck<%=ottAttachmentDto.getOttNo()%>"
				value="<%=ottAttachmentDto.getOttNo()%>" class="ott" checked>
			<%
			} else {
			%>
			<input type="checkbox" name="ottNo"
				id="ottCheck<%=ottAttachmentDto.getOttNo()%>"
				value="<%=ottAttachmentDto.getOttNo()%>" class="ott">
			<%
			}
			%>
			<label for="ottCheck<%=ottAttachmentDto.getOttNo()%>"
				class="ottLogo"> 
				<img src="../adminContents/file_down.svt?attachmentNo=<%=ottAttachmentDto.getAttachmentNo()%>"
				 class="changing img img-round ottSize">
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
			<button type="submit" class="btn-mint btn-size">등록</button><br><br>
		</div>
		<div class="row center">
			<a href="<%=request.getContextPath() %>/client/mypage.jsp" class="btn-black btn-link">뒤로</a>
		</div>
	</div>

</form>







<jsp:include page="/template/footer.jsp"></jsp:include>