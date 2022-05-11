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
	<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/semi-style.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/semi-style2.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/burger.css" >
		
    <!-- 폰트 CDN -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display">

    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->

    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/script.js"></script>
    
    <!-- 제발 하느님 -->
</head>
<body>
    <main>
        <header>
            <div class="logo"><a href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/image/logo.png" alt="#"></a></div>
            <nav>
                <ul class="main_menu">
                    <li><a href="<%=request.getContextPath()%>">홈</a></li>
                    <li>
						<a href="#" class="">장르</a>
						<ul>
							<li><a href="#">장르1</a></li>
							<li><a href="#">장르2</a></li>
							<li><a href="#">장르3</a></li>
						</ul>
                    </li>
                    <%if(admin){ %>
					<li><a href="<%=request.getContextPath()%>/client/logout.kh">로그아웃</a></li>
					<li><a href="#"><%=auth %>님</a></li>
					<li>
						<!-- 햄버거 메뉴 HTML 코드 -->
					    	<input type="checkbox" id="burger" class="hideChkbox">
						    <label for="burger">
						        <!--햄버거 아이콘 -->
						        <span></span>
						        <span></span>
						        <span></span>
						    </label>
						    <div id="burger-menu" >
						        <!-- 메뉴 -->
						        <ul>
						            <li><a href="<%=request.getContextPath()%>/adminClient/client_list.jsp">회원목록</a></li>
						            <li><a href="<%=request.getContextPath()%>/adminContents/list.jsp">컨텐츠 관리</a></li>
						            <li><a href="<%=request.getContextPath()%>/adminClient/notice_list.jsp">공지사항 관리</a></li>
						            <li><a href="<%=request.getContextPath()%>/adminClient/inquiry_list.jsp">문의사항 관리</a></li>
						        </ul>
						    </div>
					</li>
					
					<%} else if(login) { %>
					<li><a href="<%=request.getContextPath()%>/client/logout.kh">로그아웃</a></li>
					<li><a href="#"><%=clientId %>님</a></li>
					<li>
						<!-- 햄버거 메뉴 HTML 코드 -->
					    	<input type="checkbox" id="burger" class="hideChkbox">
						    <label for="burger">
						        <!--햄버거 아이콘 -->
						        <span></span>
						        <span></span>
						        <span></span>
						    </label>
						    <div id="burger-menu" >
						        <!-- 메뉴 -->
						        <ul class="menu-list">
						            <li class="menu-list"><a href="<%=request.getContextPath()%>/client/mypage.jsp"">마이페이지</a></li>
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
        </header>
        <article class="clear">
