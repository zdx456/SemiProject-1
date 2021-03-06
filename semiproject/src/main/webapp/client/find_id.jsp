<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    	<style>
	#button{  
	 background: #00ADB5;
    box-shadow: 0px 7px 4px rgba(0, 0, 0, 0.25);
    border-radius: 10px;
    color: #EDC948;}
	</style>
        <jsp:include page="/template/header.jsp"></jsp:include>

    
<form action="find_id.kh" method="post">
   <div class="container w400 m30">
       <div class="row center">
           <h1>아이디 찾기</h1>
       </div>
       <div class="row">	        
	        <input type="text" name="clientNick" autocomplete="off" required class="form-input fill input-round" placeholder="닉네임">
	    </div>
         <div class="row">
                 <input type="email" name="clientEmail" required  placeholder="이메일"  class="form-input fill input-round" autocomplete="off">
       </div>
       <div class="row">
           <input type="date" name="clientBirth" autocomplete="off" required  class="form-input input-round fill">
       </div>
       <div class="row">


           <button type="submit" id= "button"  class="form-input fill input-round">아이디 찾기</button>

       </div>
      <%if(request.getParameter("error") != null){ %>
      <div class="row center">
         <h3 style="color:red;">일치하는 아이디가 존재하지 않습니다</h3>
      </div>
      <%} %>
   </div>
</form>
    <jsp:include page="/template/footer.jsp"></jsp:include>
    