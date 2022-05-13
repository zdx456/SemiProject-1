<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%
	String clientId = (String) session.getAttribute("login");
	boolean login = clientId != null;
	
	//관리자 검사
	String auth = (String)session.getAttribute("auth");
	boolean admin = auth != null && auth.equals("관리자");
%>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Ottes</title>

	<!-- 파비콘 -->
	<link rel="icon" href="<%=request.getContextPath()%>/image/logo_favicon.png">

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/semi-style.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/semi-style2.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/burger.css" >
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/genre.css">
	<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />

	<!-- 폰트 CDN -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display">

	<!-- jquery cdn -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->

	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/script.js"></script>

    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/script.js"></script>

  </head>

<body>
	<main>
		<header>
			<div class="header_left">
				<div class="logo">
					<a href="#"><img src="<%=request.getContextPath()%>/image/logo.png" alt="#"></a>
				</div>
			</div>
			<div class="header_right">
				<nav>
					<ul class="main_menu">
						<li><a href="<%=request.getContextPath()%>">홈</a></li>
						<li>
							<!-- 장르 메뉴 HTML 코드 -->
							<input type="checkbox" class="hideChkbox genre" id="genre" name="headerchk">
							<label for="genre">장르</label>
							<div class="genre-menu">
								<!-- 메뉴 -->
								<ul>
									<li><a href="#">영화</a></li>
									<li><a href="#">드라마</a></li>
									<li><a href="#">버라이어티</a></li>
									<li><a href="#">다큐멘터리</a></li>
									<li><a href="#">애니메이션</a></li>
								</ul>
							</div>
						</li>
						<%if(admin){ %>
						<li><a href="<%=request.getContextPath()%>/client/logout.svt">로그아웃</a></li>
						<li><a href="#"><%=auth %>님</a></li>
						<li>
							<!-- 햄버거 메뉴 HTML 코드 -->
							<input type="checkbox" class="hideChkbox burger" id="burger" name="headerchk">
							<label for="burger">
								<!--햄버거 아이콘 -->
								<span></span>
								<span></span>
								<span></span>
							</label>
							<div class="burger-menu">
								<!-- 메뉴 -->
								<ul>
									<li class="menu-list"><a href="<%=request.getContextPath()%>/client/mypage.jsp">마이페이지</a></li>
						            <li><a href="<%=request.getContextPath()%>/notice/list.jsp">고객센터</a></li>
						            <li class="hr"><hr></li>
									<li><a href="<%=request.getContextPath()%>/adminClient/client_list.jsp">회원목록</a></li>
						            <li><a href="<%=request.getContextPath()%>/adminContents/list.jsp">콘텐츠 관리</a></li>
						            <li><a href="<%=request.getContextPath()%>/adminClient/notice_list.jsp">공지사항 관리</a></li>
						            <li><a href="<%=request.getContextPath()%>/adminClient/inquiry_list.jsp">문의사항 관리</a></li>
								</ul>
							</div>
						</li>
						
						<%} else if(login) { %>
						<li><a href="<%=request.getContextPath()%>/client/logout.svt">로그아웃</a></li>
						<li><a href="#"><%=clientId %>님</a></li>
						<li>
							<!-- 햄버거 메뉴 HTML 코드 -->
							<input type="checkbox" class="hideChkbox burger" id="burger" name="headerchk">
							<label for="burger">
								<!--햄버거 아이콘 -->
								<span></span>
								<span></span>
								<span></span>
							</label>
							<div class="burger-menu">
								<!-- 메뉴 -->
								<ul>
									<li class="menu-list"><a href="<%=request.getContextPath()%>/client/mypage.jsp">마이페이지</a></li>
						            <li><a href="<%=request.getContextPath()%>/notice/list.jsp">고객센터</a></li>
								</ul>
							</div>
						</li>
						
						
						<% }else{ %>
						<li><a href="<%=request.getContextPath()%>/client/join.jsp">회원가입</a></li>
						<li><a href="<%=request.getContextPath()%>/client/login.jsp">로그인</a></li>
						<%} %>
						
					</ul>



				</nav>
			</div>
		</header>
		<!-- 여기가 메인 영역 -->
		<article class="clear">