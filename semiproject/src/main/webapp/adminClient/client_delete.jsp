<%@page import="ottes.beans.ClientDao"%>
<%@page import="ottes.beans.ClientDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String clientId = request.getParameter("clientId");
ClientDao clientDao = new ClientDao();
ClientDto clientDto = clientDao.selectOne(clientId);

%> 


    
<jsp:include page="/template/header.jsp"></jsp:include>

<style>
        .title {
            color: #00ADB5;
            text-align: center;
            margin: 50px;
            margin-bottom: 50px;
        }

        .btn-mint {
            background: #00ADB5;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 10px;
            color: #EDC948;
            display: block;
        }

        .btn-black {
            background: #222831;
            border: 2px solid #EDC948;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 10px;
            color: #EDC948;
            display: block;
            font-size: 13px;
        }
        
        .btn-black:hover {
            background: #EDC948;
            border: 2px solid #EDC948;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 10px;
            color: #222831;
            display: block;
            font-size: 13px;
        }
        
        .red:hover {
            background: #EDC948;
            border: 2px solid #EDC948;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 10px;
            color: red;
            display: block;
            font-size: 13px;
        }

        .btn-yellow {
            /* yellow */
            background: #EDC948;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 10px;
            border-radius: 10px;
            color: #00ADB5;
            display: block;
        }

        .btn:hover {
            color: black;
            border-color: black;
        }

        .btn-p3 {
            padding-left: 2em;
            padding-right: 2em;
            padding-top: 0.5em;
            padding-bottom: 0.5em;
        }

        table {
            margin-left: auto;
            margin-right: auto;
        }

        table th,
        table td {
            width: 50%;
        }

        table,
        table th,
        table td,
        table tr {
            border-bottom: 1px solid #bcbcbc;
        }

        .div-container {
            margin-left: 30%;
            margin-right: 30%;
        }

        .form-style {
            color: black;
        }

        .input-black {
            background-color: black;
        }

        .warning {
            color: red;
            margin: 15px;
        }
    </style>

<div class="container container w500 m30">
        <div class="row ">
            <h1 class="title">회원 강제 탈퇴</h1>
        </div>
        <h3 class="warning">※ (주의) 삭제된 아이디는 복구 하실 수 없습니다.</h3>
        <h3 class="warning">※ 삭제하시려면 하단의 아이디를 입력하세요.</h3>
        <div class="row center">
            <form action="delete.svt" method="post" >
                <input type="text" class="form form-input input-round fill" name="clientId" placeholder="<%=clientDto.getClientId()%>" required>
                <br><br>
                <input type="submit" class="btn-black fill btn-p3 red" value="회 원 탈 퇴">
            </form>
        </div>
        <div class="row center">
                <a href="<%=request.getContextPath()%>/adminClient/client_detail.jsp?clientId=<%=clientId%>" class="btn-black btn-p3 btn-primary fill">돌 아 가 기</a>
        </div>

    </div>

<jsp:include page="/template/footer.jsp"></jsp:include>