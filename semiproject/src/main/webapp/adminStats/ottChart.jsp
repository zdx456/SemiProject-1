<%@page import="ottes.beans.StatsDto"%>
<%@page import="java.util.List"%>
<%@page import="ottes.beans.StatsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	StatsDao statsDao = new StatsDao();
	List<StatsDto> list = statsDao.contentsCount();
	
%>
   

   
<jsp:include page="/template/header.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>

	.btn-size{
   padding-top: 5px;
   padding-bottom:  5px;
   padding-left: 20px;
   padding-right: 20px;
   font-size: 17px;
   width: 80%;
   }
    
  .m33{
  width: 33%;
  }
  
  .w20{
  width: 20%;
  }
  
  .w50{
  width: 50%;
  }
  
  .w60 {
  width: 60%;
  }
  
  .w40 {
  width: 40%;
  }
  
  .back{
  
  border-radius: 10px;
  border: 1px solid #929292;
  
  }
  
  .title{
  color: white;
  }
  
  .fsize{
  font-size: 25px;
  }
  
  .table.table-border {
   	border-bottom:1px solid #929292;
	}
	
	.table.table-border.total-border {
		
    border: 10px double white;
 
	}
	
	.ver-center{
		vertical-align: middle;
	}
	
	.table.table-border > thead > tr > th {
		font-weight: bold;
		background-color: #929292;
		color: black;
		border-color: white;
	}
	


</style>

  <script>
    $(function () {
      $.ajax({
    	  url: "http://localhost:8080/semiproject/ajax/ottSexChart.svt",
        type: "post",
        //data: {},
        success: function (resp) {
          //차트 생성
          //console.log(resp);

          //label : X축에 표시될 항목들
          var labels = [];

          for (var i = 0; i < resp.length; i++) {
            labels.push(resp[i].ottName);
          }

          var cntTotalOtt = [];

          for (var i = 0; i < resp.length; i++) {
        	  cntTotalOtt.push(resp[i].cntTotalOtt);
          }

          //data : 차트에 표시될 데이터
          var data = {
            labels: labels,
            datasets: [{
              label: '전체',  //차트 범례
              backgroundColor: [
                
                '#00ADB5'
                
              ], //배경색
              borderColor: 'white', //테두리색
              data: cntTotalOtt, //데이터
            }]
          };

          //차트의 형태 등을 설정(옵션, 환경설정)
          var config = {
            type: 'bar', //차트의 모양
            data: data, //차트의 데이터
            options: {
							legend: {
				        display: false
				    	}
            }

          };

          //차트 생성 구문
          var myChart = new Chart(
            document.querySelector('#myChart1'), //차트 적용 대상
            config //차트 옵션
            );
        }
      });
    
      $.ajax({
        url: "http://localhost:8080/semiproject/ajax/ottSexChart.svt",
        type: "post",
        //data: {},
        success: function (resp) {
          //차트 생성
          //console.log(resp);

          //label : X축에 표시될 항목들
          var labels = [];

          for (var i = 0; i < resp.length; i++) {
            labels.push(resp[i].ottName);
          }

          var cntMan = [];

          for (var i = 0; i < resp.length; i++) {
            cntMan.push(resp[i].cntMan);
          }

          //data : 차트에 표시될 데이터
          var data = {
            labels: labels,
            datasets: [{
              label: '남성',  //차트 범례
              backgroundColor: [
            	  	'#eb3b5a',
                  '#fa8231',
                  '#f7b731',
                  '#20bf6b',
                  '#4b7bec',
                  '#a55eea'
              ], //배경색
              borderColor: 'white', //테두리색
              data: cntMan, //데이터
            }]
          };

          //차트의 형태 등을 설정(옵션, 환경설정)
          var config = {
            type: 'pie', //차트의 모양
            data: data, //차트의 데이터
            options: {}

          };

          //차트 생성 구문
          var myChart = new Chart(
            document.querySelector('#myChart2'), //차트 적용 대상
            config //차트 옵션
            );
        }
      });
    });

    $.ajax({
    	url: "http://localhost:8080/semiproject/ajax/ottSexChart.svt",
        type: "post",
        //data: {},
        success: function (resp) {
          //차트 생성
          console.log(resp);

          //label : X축에 표시될 항목들
          var labels = [];

          for (var i = 0; i < resp.length; i++) {
            labels.push(resp[i].ottName);
          }

          var cntWoman = [];

          for (var i = 0; i < resp.length; i++) {
            cntWoman.push(resp[i].cntWoman);
          }

          //data : 차트에 표시될 데이터
          var data = {
            labels: labels,
            datasets: [{
              label: '여성',  //차트 범례
              backgroundColor: [
            	  	'#eb3b5a',
                  '#fa8231',
                  '#f7b731',
                  '#20bf6b',
                  '#4b7bec',
                  '#a55eea'
              ], //배경색
              borderColor: 'white', //테두리색
              data: cntWoman, //데이터
            }]
          };

          //차트의 형태 등을 설정(옵션, 환경설정)
          var config = {
            type: 'pie', //차트의 모양
            data: data, //차트의 데이터
            options: {}

          };

          //차트 생성 구문
          var myChart = new Chart(
            document.querySelector('#myChart3'), //차트 적용 대상
            config //차트 옵션
            );
        }
      });
    
    $(function () {
        $.ajax({
        	url: "http://localhost:8080/semiproject/ajax/ottAgeChart.svt",
          type: "post",
          //data: {},
          success: function (resp) {
            //차트 생성
            //console.log(resp);

            //label : X축에 표시될 항목들
            
            var labels = [];

            for (var i = 0; i < resp.length; i++) {
              labels.push(resp[i].ottName);
            }

            //데이터 불러오기
            var cntTen = [];
            var cntTwenty = [];
            var cntThirty = [];
            var cntForty = [];
            var cntFifty = [];
            var cntSixty = [];

            for (var i = 0; i < resp.length; i++) {
              cntTen.push(resp[i].cntTen);
              cntTwenty.push(resp[i].cntTwenty);
              cntThirty.push(resp[i].cntThirty);
              cntForty.push(resp[i].cntForty);
              cntFifty.push(resp[i].cntFifty);
              cntSixty.push(resp[i].cntSixty);
            }

            //data : 차트에 표시될 데이터
            var data = {
              labels: labels,
              datasets: [
                {
                  label: '10대 이하',  //차트 범례
                  backgroundColor: '#eb3b5a', //배경색
                  borderColor: 'white', //테두리색
                  data: cntTen, //데이터
                },

                {
                  label: '20대',  //차트 범례
                  backgroundColor: '#fa8231', //배경색
                  borderColor: 'white', //테두리색
                  data: cntTwenty, //데이터
                },

                {
                  label: '30대',  //차트 범례
                  backgroundColor: '#f7b731', //배경색
                  borderColor: 'white', //테두리색
                  data: cntThirty, //데이터
                },

                {
                  label: '40대',  //차트 범례
                  fontColor: 'white',
                  backgroundColor: '#20bf6b', //배경색
                  borderColor: 'white', //테두리색
                  data: cntForty, //데이터
                },

                {
                  label: '50대',  //차트 범례
                  backgroundColor: '#4b7bec', //배경색
                  borderColor: 'white', //테두리색
                  data: cntFifty, //데이터
                },

                {
                  label: '60대 이상',  //차트 범례
                  backgroundColor: '#a55eea', //배경색
                  borderColor: 'white', //테두리색
                  data: cntSixty, //데이터
                },
            
              ]
            };
            
          //차트의 형태 등을 설정(옵션, 환경설정)
            var config = {
            type: 'bar', //차트의 모양
            data: data, //차트의 데이터
            options: {
                legend: {
                    display: true,
                    labels: {
                        fontColor: '#fffff'
                    }
                }
            }

          };
          
          //차트 생성 구문
            var myChart = new Chart(
              document.querySelector('#myChart4'), //차트 적용 대상
              config //차트 옵션
              );
          }
        })
      });
    
    $(function () {
        //차트는 시작하자마자 화면에 표시되어야 한다.
        // -> 시작하자마자 서버에 비동기 통신 요청을 보내 데이터를 가져와야한다
        // -> 가져온 데이터에서 제목과 내용을 분리해서 설정한다.
        // -> (중요) 통신이 끝나야 차트가 나올 수 있다.

        $.ajax({
            url: "http://localhost:8080/semiproject/ajax/OttContentsChart.svt",
            type: "post",
            // data : {}
            success: function (resp) {
                //차트 생성
                console.log(resp);

                //laber : X축에 표시될 항목들
                var labels = [];

                for (var i = 0; i < resp.length; i++) {
                    labels.push(resp[i].ottName);
                }


                var cnt = [];
                for (var i = 0; i < resp.length; i++) {
                    cnt.push(resp[i].contentsNo);
                }
                var data = {
                    labels: labels,
                    datasets: [{
                        label: '가입인원 수', //범례
                        backgroundColor: [
                                    '#eb3b5a',
                                    '#20bf6b',
                                    '#4b7bec',
                                    '#a55eea',
                                    '#fa8231',
                                    '#f7b731'
                                ],
                        borderColor : "grey",
                                    hoverOffset: 4,
                        data: cnt, //데이터
                    }]
                };

                var config = {
                    type: 'doughnut', //차트의 모양 line,bar,pie
                    data: data, //차트 데이터
                    options: {
                    	
                    }
                }


                var myChart = new Chart(
                    document.querySelector('#ottContents'), //차드 적용 대상
                    config //차트의 옵션
                );
            }
        });

    });
    
  </script>



  <div class="container w1000 m30">
  
  	
		    <div class="row center m30">
		      <h1 class="title">가입한 OTT 종류 (전체)</h1>
		    </div>
		    <div class="row">
		      <canvas id="myChart1"></canvas>
		    </div>
		<div class="row m100"></div>	   
	
	<div class="back">
	
		<div class="flex-container">
			<div class="w50">
		    <div class="row center m30">
		      <span class="title fsize">남성 가입한 OTT 종류</span>
		    </div>
		    <div class="row">
		      <canvas id="myChart2"></canvas>
		    </div>
	   	</div>
	
			<div class="w50">
		    <div class="row center m30">
		      <span class="title fsize">여성 가입한 OTT 종류</span>
		    </div>
		    <div class="row">
		      <canvas id="myChart3"></canvas>
		    </div>
		   </div>
	   </div>
	   
	 </div>
	  
	  <div class="row m100"></div>
	    
	  <div class="back">
	    <div class="row center m30">
	      <h1 class="title">연령별 가입한 OTT 종류</h1>
	    </div>
	
	    <div class="row">
	      <canvas id="myChart4"></canvas>
	    </div>
	   </div>
	   
	   <div class="row m100"></div>
	   
	 <!-- ott/국가/장르별 콘텐츠 수 -->
	 <hr></hr>
	 
	<div class="row m100"></div>
	 
	
		<div class="row center m30">
		<div class="row center">
			<h1 class="title">OTT별/장르별/국가별 콘텐츠 수</h1>
		</div>
		 
			    
		 <table class="table table-border">
		 
		 	<thead>
		 		<tr>
		 			<th rowspan="2" class="center ver-center">구분</th>
		 			<th rowspan="2" class="center ver-center">전체</th>
		 			<th colspan="5" class="center">장르</th>
		 			<th colspan="3" class="center">국가</th>
		 		</tr>
		 
				<tr class="center">
					
					<th>다큐멘터리</th>
					<th>드라마</th>
					<th>버라이어티</th>
					<th>애니메이션</th>
					<th>영화</th>
					<th>아시아</th>
					<th>한국</th>
					<th>할리우드</th>
				</tr>
			</thead>
				
				<%for(StatsDto statsDto : list) {%>
				<tr class="center">
				<%if(statsDto.getOttName() == null) {%>
				<td class="total-border"><span>전체</span></td>
				<%} else {  %>
					<td><%=statsDto.getOttName() %></td>
				<%} %>
					<td><%=statsDto.getConTotal() %></td>
					<td><%=statsDto.getConDocumentary() %></td>
					<td><%=statsDto.getConDrama() %></td>
					<td><%=statsDto.getConVariety() %></td>
					<td><%=statsDto.getConAnimation() %></td>
					<td><%=statsDto.getConMovie() %></td>
					<td><%=statsDto.getConAsia() %></td>
					<td><%=statsDto.getConKorea() %></td>
					<td><%=statsDto.getConHollywood() %></td>
				</tr>
		<%} %>
			
			</table>
		</div>
					
				<div class="row m100"></div>	
				
					<div class="row center m30">
						<h1 class="title">OTT별 콘텐츠 수 (차트)</h1>
					</div>
			
			<div class="flex-container">
				
					<div class="row w20"></div>
				
					<div class="row w60">
		        <div class="row center">
		            <canvas id="ottContents"></canvas>
		        </div>
		      </div>
		      
		      <div class="row w20"></div>
		      
	    </div>
	   
	     </div>
    
	 
	 <!-- 버튼 -->
	  <div class="row m100"></div>
	  
	  <div class="w25">
	    <div class="row center">
	    
	      <div class="flex-container">
	        <div class="m33">
	          <a href="joindateChart.jsp" class="btn-black btn-size">가입자 수</a>
	        </div>
	        <div class="m33">
	          <a href="genreChart.jsp" class="btn-black btn-size">선호장르</a>
	        </div>
	        <div class="m33">
	          <a href="ottChart.jsp" class="btn-black btn-size">Ott</a>
	        </div>
	      </div>
	     </div>
	     </div>
	   </div>


<jsp:include page="/template/footer.jsp"></jsp:include>