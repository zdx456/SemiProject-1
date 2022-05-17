<%@page import="java.util.List"%>
<%@page import="ottes.beans.ClientDao"%>
<%@page import="ottes.beans.ClientDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
	// clientId로 해당 게시글 불러오기
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
/*         .btn-yellow:hover { */
/*             /* yellow */ */
/*             background: #00ADB5; */
/*             box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25); */
/*             border-radius: 10px; */
/*             border-radius: 10px; */
/*             color: #EDC948; */
/*             display: block; */
/*         } */

/*         .btn-mint:hover { */
/*             background: #EDC948; */
/*             box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25); */
/*             border-radius: 10px; */
/*             color: #00ADB5; */
/*             display: block; */
/*         } */
        
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
    </style>
    <div class="row center div-container">
        <h1 class="title">회원 상세 정보</h1>
        <div>
            <table class="table">
                <tr>
                    <th>아이디</th>
                    <td><%=clientId%></td>
                </tr>
                <tr>
                    <th>닉네임</th>
                    <td><%=clientDto.getClientNick()%></td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td><%=clientDto.getClientGender()%></td>
                </tr>
                <tr>
                    <th>등급</th>
                    <td><%=clientDto.getClientGrade()%></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><%=clientDto.getClientEmail()%></td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td><%=clientDto.getClientBirth()%></td>
                </tr>
            </table>
        </div>

        <div class="row center">
            <a href="client_list.jsp" class="btn-mint btn btn-p3 fill">목록으로</a>
        </div>
        <div class="row center">
            <a href="<%=request.getContextPath()%>/adminClient/client_chgInfo.jsp?clientId=<%=clientDto.getClientId()%>" class="btn-yellow btn btn-p3 fill">정보 수정</a>
        </div>
        <div class="row center">
            <a href="<%=request.getContextPath()%>/adminClient/client_delete.jsp?clientId=<%=clientDto.getClientId()%>" class="btn-black btn btn-p3 fill">강제 탈퇴</a>
        </div>
    </div>

<jsp:include page="/template/footer.jsp"></jsp:include>



















