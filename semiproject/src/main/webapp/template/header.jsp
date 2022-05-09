<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%
	String clientId = (String) session.getAttribute("login");
	boolean login = clientId != null;
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ottes</title>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/semi-style.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">	
	<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
	
    <!-- 폰트 CDN -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display">

    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/script.js"></script>
</head>
<body>
<<<<<<< HEAD
    <main>
        <header>
            <div class="logo"><a href="#"><img src="<%=request.getContextPath()%>/image/logo.png" alt="#"></a></div>
            <nav>
                <ul class="main_menu">
                    <li><a href="<%=request.getContextPath()%>">홈</a></li>
                    <li><a href="#">장르</a></li>
					<%if(login){ %>
					<li><a href="<%=request.getContextPath()%>/client/logout.kh">로그아웃</a></li>
					<li><a href="#">닉네임님</a></li>
					<li>
						<div class="hamburger"></div>
						<div class="hamburger"></div>
						<div class="hamburger"></div>
						<ul>
							<li><a href="<%=request.getContextPath()%>/client/mypage.jsp">마이페이지</a></li>
							<li><a href="#">고객센터</a></li>
						</ul>
					</li>
					<%}else{ %>
					<li><a href="<%=request.getContextPath()%>/client/join.jsp">회원가입</a></li>
					<li><a href="<%=request.getContextPath()%>/client/login.jsp">로그인</a></li>
					<%} %>
                </ul>
            </nav>
        </header>
        <article class="clear">
