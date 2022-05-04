<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ottes layout Sample</title>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/commons.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/semi-style.css">


    <!-- 폰트 CDN -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display">

    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->

    <style>

    </style>

    <script type="text/javascript">

    </script>

</head>

<body>
    <main class="main-semi">
        <header class="header-semi">
            <a href="#" class="logo">Ottes</a>
        </header>
        <nav class="nav-semi">
            <ul class="menu-semi">
                <li><a href="#">홈</a></li>
                <li><a href="#">장르</a></li>
                <li><a href="#">로그인</a></li>
                <li><a href="#">닉네임님</a></li>

                <li>
                    <!-- 햄버거 가운데 정렬 필요합니다. 어떻게 하는지 모르겠어요.. -->
                    <div class="hamburger"></div>
                    <div class="hamburger"></div>
                    <div class="hamburger"></div>
                    <ul>
                        <li><a href="#">마이페이지</a></li>
                        <li><a href="#">고객센터</a></li>
                        <li><a href="#">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
        </nav>

        <article class="article-semi">
    