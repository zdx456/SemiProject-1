<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- 원인 : 위와 같은 에러가 난다면, dbpool이 가득차서 그렇다
db pool을 확인해 보면 active가 가득차 있는걸 알 수있다.
[Pool=db1,Active=0,Idle=5][Pool=db2,Active=0,Idle=5]
해결 : db를 사용하고 close하지 않은 곳이 있는지 확인하고 닫아준다.
db.close();  -->

   
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
  
  .w50{
  width: 50%;
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
	

</style>

  <script>
    $(function () {
      $.ajax({
        url: "http://localhost:8080/semiproject/ajax/genreSexChart.svt",
        type: "post",
        //data: {},
        success: function (resp) {
          //차트 생성
          //console.log(resp);

          //label : X축에 표시될 항목들
          var labels = [];

          for (var i = 0; i < resp.length; i++) {
            labels.push(resp[i].genreName);
          }

          var cntTotalGenre = [];

          for (var i = 0; i < resp.length; i++) {
            cntTotalGenre.push(resp[i].cntTotalGenre);
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
              data: cntTotalGenre, //데이터
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
        url: "http://localhost:8080/semiproject/ajax/genreSexChart.svt",
        type: "post",
        //data: {},
        success: function (resp) {
          //차트 생성
          //console.log(resp);

          //label : X축에 표시될 항목들
          var labels = [];

          for (var i = 0; i < resp.length; i++) {
            labels.push(resp[i].genreName);
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
        url: "http://localhost:8080/semiproject/ajax/genreSexChart.svt",
        type: "post",
        //data: {},
        success: function (resp) {
          //차트 생성
          //console.log(resp);

          //label : X축에 표시될 항목들
          var labels = [];

          for (var i = 0; i < resp.length; i++) {
            labels.push(resp[i].genreName);
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
          url: "http://localhost:8080/semiproject/ajax/genreAgeChart.svt",
          type: "post",
          //data: {},
          success: function (resp) {
            //차트 생성
            //console.log(resp);

            //label : X축에 표시될 항목들
            
            var labels = [];

            for (var i = 0; i < resp.length; i++) {
              labels.push(resp[i].genreName);
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
    
  </script>



  <div class="container w1000 m30">
  
  	
		    <div class="row center m30">
		      <h1 class="title">선호 장르(전체)</h1>
		    </div>
		    <div class="row">
		      <canvas id="myChart1"></canvas>
		    </div>
		<div class="row m100"></div>	   
	
	<div class="back">
	
		<div class="flex-container">
			<div class="w50">
		    <div class="row center m30">
		      <span class="title fsize">남성 선호 장르</span>
		    </div>
		    <div class="row">
		      <canvas id="myChart2"></canvas>
		    </div>
	   	</div>
	
			<div class="w50">
		    <div class="row center m30">
		      <span class="title fsize">여성 선호 장르</span>
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
	      <h1 class="title">연령별 선호 장르</h1>
	    </div>
	
	    <div class="row">
	      <canvas id="myChart4"></canvas>
	    </div>
	   </div>
	 
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