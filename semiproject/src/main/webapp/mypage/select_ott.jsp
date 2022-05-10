<%@page import="ottes.beans.OttDto"%>
<%@page import="ottes.beans.OttDao"%>
<%@page import="ottes.beans.ClientOttDto"%>
<%@page import="java.util.List"%>
<%@page import="ottes.beans.ClientDao"%>
<%@page import="ottes.beans.ClientOttDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <style>

        .ott{
        }
         .ottChoice{
         	border-radius: 30px;
             border: 4px solid #0984e3;

         }
         .ottSize{
            width: 150px;
            height: 150px;
         }
     </style>
    
     <!-- jquery cdn -->
     <script src = "https://code.jquery.com/jquery-3.6.0.js"></script>

    <script type="text/javascript">
    $(function () {
    	
	
       $("#selectAll").on("input",function(){
             
        $(".ott").prop("checked",$(this).prop("checked"));
              
	      	  if ($(".ott").prop("checked")) {
	
	        	$(".changing").removeClass("img")
	            $(".changing").addClass("ottChoice");
	        }
	
	        if(!$(".ott").prop("checked")){
	            $(".changing").removeClass("ottChoice");
	            $(".changing").addClass("img")
	        }
              
      	 });
       
        $(".ott").on("input", function () {

        	
            if ($(this).prop("checked")) {

            	$(this).next().children().removeClass("img")
                $(this).next().children().addClass("ottChoice");
            }

            if(!$(this).prop("checked")){
            	$(this).next().children().removeClass("ottChoice");
            	$(this).next().children().addClass("img")
            }
        });

     

    });

    </script>    
    
<% 

String clientId = (String)session.getAttribute("login");


%>
<jsp:include page="/template/header.jsp"></jsp:include>

<form action="client_ott_insert.svt" method="post">
<div class="container">
	<div class ="row center">
		<h2>구독중인 서비스를 선택 하세요</h2>
		<br><br>
	</div>
	<div class="row flex-container center">
	
		
		<input type="checkbox" name="ottNo" id="netflixCheck" value="1" class="ott" >
		<label for="netflixCheck">
    	<img src="<%=request.getContextPath()%>/image/netflixOtt.png" class="changing img img-round ottSize">
    	</label>
    	
    	
    	
		<input type="checkbox" name="ottNo" id="watchaCheck" value="2" class="ott">
		<label for="watchaCheck">
    	<img src="<%=request.getContextPath()%>/image/watcha.png" class="changing img img-round ottSize">
    	</label>
    	
    	
		<input type="checkbox" name="ottNo" id="waveCheck" value="3" class="ott">
		<label for="waveCheck" >
    	<img src="<%=request.getContextPath()%>/image/wave.png" class="changing img img-round ottSize">
    	</label>
		
	
		<input type="checkbox" name="ottNo" id="tvingCheck" value="4" class="ott">
		<label for="tvingCheck">
    	<img src="<%=request.getContextPath()%>/image/tving.jpg" class="changing img img-round ottSize">
    	</label>


	</div>
	<br><br><br><br>
	<div class="row center">
		<input type="checkbox" id="selectAll">
		<label for="selectAll">
		전체선택
		</label>
	</div>
	<div class="row center">
		<button type="submit" class="btn-mint">등록</button>
	</div>
	<div class="row center">
		<a href="#" class="btn-black">스킵</a>
	</div>
</div>

</form>







<jsp:include page="/template/footer.jsp"></jsp:include>