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
        
/*         .btn-black:hover { */
/*             background: #EDC948; */
/*             border: 2px solid #EDC948; */
/*             box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25); */
/*             border-radius: 10px; */
/*             color: #222831; */
/*             display: block; */
/*             font-size: 13px; */

/*         } */

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
    
    <script type="text/javascript">
    	$(function(){
    		
    	});

	</script>

<div class="container w500 m30">
        <form action="edit.svt" method="post">
            <div class="row center">
                <h1 class="title">?????? ?????? ?????? ??????</h1>
            </div>
            <div class="row">
                <label>?????????</label>
                <input type="text" name="clientNick" autocomplete="off" class="form-input fill input-round "
                    value="<%=clientDto.getClientNick()%>">
            </div>
            <div class="row">
                <label>??????</label><br>
                <select name="clientGender" class="form-input fill input-round" style="background-color: #222831;">
                    <%if(clientDto.getClientGender().equals("??????")){ %>
                    <option selected>??????</option>
                    <%} else { %>
                    <option>??????</option>
                    <%} %>

                    <%if(clientDto.getClientGender().equals("??????")){ %>
                    <option selected>??????</option>
                    <%} else { %>
                    <option>??????</option>
                    <%} %>
                </select>
            </div>
            <div class="row">
                <label>??????</label>
                <select name="clientGrade" class="form-input fill input-round" style="background-color: #222831"> 
                    <%if(clientDto.getClientGrade().equals("????????????")){ %>
                    <option selected>????????????</option>
                    <%} else { %>
                    <option>????????????</option>
                    <%} %>

                    <%if(clientDto.getClientGrade().equals("?????????")){ %>
                    <option selected>?????????</option>
                    <%} else { %>
                    <option>?????????</option>
                    <%} %>
                </select>
            </div>
            <div class="row">
                <label>?????????</label>
                <input type="email" name="clientEmail" autocomplete="off" class="form-input fill input-round"
                    value="<%=clientDto.getClientEmail()%>">
            </div>
            <div class="row">
                <label>????????????</label>
                <input type="date" name="clientBirth" autocomplete="off" class="form-input fill input-round"
                    value="<%=clientDto.getClientBirth()%>">
            </div>
            <div>
                <input type="hidden" name="clientId" value="<%=clientId%>">
            </div>

            <div class="row">
                <button type="submit" class="btn-yellow btn-p3 btn-primary fill">??? ??? ??? ???</button>
            </div>
            <div class="row center">
                <a href="<%=request.getContextPath()%>/adminClient/client_detail.jsp?clientId=<%=clientId%>" class="btn-black btn-p3 btn-primary fill">??? ??? ??? ???</a>
            </div>

        </form>
    </div>

<jsp:include page="/template/footer.jsp"></jsp:include>