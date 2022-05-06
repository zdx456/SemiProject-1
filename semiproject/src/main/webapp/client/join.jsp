<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<form action="join.ott" method="post" >
   <div class="container w450 m30">
       <div class="row center">
           <h1>회원가입</h1>
       </div>
       <div class="row">
           <input type="text" name="clientId" autocomplete="off" placeholder="아이디" required class="form-input fill input-round">
       </div>
       <div class="row">
           <input type="password" name="clientPw" required placeholder="비밀번호" class="form-input fill input-round">
       </div>
         <div class="row">
           <input type="password" name="clientPw2" required placeholder="비밀번호확인" class="form-input fill input-round">
       </div>
       <div class="row">
            <input type="text" name="clientNick" required placeholder="닉네임" autocomplete="off" class="form-input fill input-round">
               </div>
       <div class="row">
                     <input type="date" name="clientBirth" required  placeholder="생년월일" class="form-input input-round" autocomplete="off">
       </div>
         <div class="row">
                 <input type="email" name="clientEmail "required  placeholder="이메일"  class="form-input fill input-round" autocomplete="off">
       </div>
       <div class="row">
           <button type="submit" class="btn btn-primary fill">회원가입</button>
       </div>
   </div>
</form>


<jsp:include page="/template/footer.jsp"></jsp:include>


