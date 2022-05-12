<%@page import="ottes.beans.ClientDto"%>
<%@page import="ottes.beans.ClientDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String clientId = request.getParameter("clientId");

	ClientDao clientDao = new ClientDao();
	ClientDto clientDto = clientDao.selectOneAdmin(clientId);
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

        .div-style {
            margin: 2em;
            /* display: block; */
        }

        .div-container {
            margin-left: 30%;
            margin-right: 30%;
        }
        .form-style{
            color: black;
        }
    </style>

<div class="container w500 m30">
        <form action="edit.svt" method="post">
            <div class="row center">
                <h1 class="title">회원 일반 정보 수정</h1>
            </div>
            <div class="row">
                <label>닉네임</label>
                <input type="text" name="clientNick" autocomplete="off" class="form-input fill input-round "
                    value="<%=clientDto.getClientNick()%>">
            </div>
            <div class="row">
                <label>성별</label><br>
                <select name="clientGender" class="form-input fill input-round">
                    <%if(clientDto.getClientGender().equals("남성")){ %>
                    <option selected>남성</option>
                    <%} else { %>
                    <option>남성</option>
                    <%} %>

                    <%if(clientDto.getClientGender().equals("여성")){ %>
                    <option selected>여성</option>
                    <%} else { %>
                    <option>여성</option>
                    <%} %>
                </select>
            </div>
            <div class="row">
                <label>등급</label>
                <select name="clientGrade" class="form-input fill input-round">
                    <%if(clientDto.getClientGrade().equals("일반회원")){ %>
                    <option selected>일반회원</option>
                    <%} else { %>
                    <option>일반회원</option>
                    <%} %>

                    <%if(clientDto.getClientGrade().equals("관리자")){ %>
                    <option selected>관리자</option>
                    <%} else { %>
                    <option>관리자</option>
                    <%} %>
                </select>
            </div>
            <div class="row">
                <label>이메일</label>
                <input type="email" name="clientEmail" autocomplete="off" class="form-input fill input-round"
                    value="<%=clientDto.getClientEmail()%>">
            </div>
            <div class="row">
                <label>생년월일</label>
                <input type="date" name="clientBirth" autocomplete="off" class="form-input fill input-round"
                    value="<%=clientDto.getClientBirth()%>">
            </div>
            <div>
                <input type="hidden" name="clientId" value="<%=clientId%>">
            </div>

            <div class="row">
                <button type="submit" class="btn-black btn-p3 btn-primary fill">정 보 변 경</button>
            </div>
            <div class="row center">
                <a href="client_detail.jsp?clientId=<%=clientId%>" class="btn-black btn-p3 btn-primary fill">돌 아 가 기</a>
            </div>

        </form>
    </div>

<jsp:include page="/template/footer.jsp"></jsp:include>