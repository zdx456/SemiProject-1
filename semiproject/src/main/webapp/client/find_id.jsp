<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <jsp:include page="/template/header.jsp"></jsp:include>
    
    
    
    
    
<form action="find_id.kh" method="post">
   <div class="container w400 m30">
       <div class="row center">
           <h1>아이디 찾기</h1>
       </div>
         <div class="row">
                 <input type="email" name="clientEmail "required  placeholder="이메일"  class="form-input fill input-round" autocomplete="off">
       </div>
       <div class="row">
           <input type="date" name="memberBirth" autocomplete="off" required   placeholder="이메일"  class="form-input input-round">
       </div>
       <div class="row">


           <button type="submit" class="btn btn-primary fill">아이디 찾기</button>

       </div>
      <%if(request.getParameter("error") != null){ %>
      <div class="row center">
         <h3 style="color:red;">정보가 일치하는 아이디가 존재하지 않습니다</h3>
      </div>
      <%} %>
   </div>
</form>
    <jsp:include page="/template/footer.jsp"></jsp:include>
    