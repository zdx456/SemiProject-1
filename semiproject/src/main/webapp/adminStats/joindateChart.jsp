<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
    .years{
    
    background-color: transparent;
    color:#EDC948;
    }
    
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
    </style>
    
<jsp:include page="/template/header.jsp"></jsp:include>

 <script src = "https://code.jquery.com/jquery-3.6.0.js"></script>
     <!-- <script src = "https://code.jquery.com/jquery-3.6.0.min.js"></script>  경량형!--> 

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script type="text/javascript">
        $(function(){

            $.ajax({
                url: context+"/ajax/joindateYearChart.svt",
                type: "post",
                success: function (resp) {
                    console.log(resp);

                    var labels = [];

                    for (var i = 0; i < resp.length; i++) {
                        labels.push(resp[i].year+"년");
                    }

                    var cnt = [];
                    for (var i = 0; i < resp.length; i++) {
                        cnt.push(resp[i].cnt);
                    }
                    var data = {
                        labels: labels,
                        datasets: [{
                            label: '가입인원 수', 
                            backgroundColor: '#00ADB5', 
                            borderColor: '#00ADB5', 
                            data: cnt, 
                        }]
                    };

                    var config = {
                        type: 'line', 
                        data: data, 
                        options: {}
                    };

                    var myChart = new Chart(
                        document.querySelector('.joindateYearChart'), 
                        config 
                    );
                }
            });


            //선택에 따른 year값 변동
              $(".selectYear").on("input", function(){
                $('.joindateMonthChart').remove(); 
                $('.showchart').append('<canvas class="joindateMonthChart"></canvas>');
                  var year = $(this).val();
                  loadYearMonth(year);
                  
              })

              //초기 2022년 값
              var year = 2022;
              loadYearMonth(year);

            function loadYearMonth(year){
            $.ajax({
                url: context+"/ajax/joindateMonthChart.svt?year="+year,
                type: "post",
                success: function (resp) {
                    console.log(resp);

                    var labels = [];

                    for (var i = 0; i < resp.length; i++) {
                        labels.push(resp[i].month+"월");
                    }

                    var cnt = [];
                    for (var i = 0; i < resp.length; i++) {
                        cnt.push(resp[i].cnt);
                    }
                    var data = {
                        labels: labels,
                        datasets: [{
                            label: year+"년 가입인원", 
                            backgroundColor: '#00ADB5', 
                            borderColor: '#00ADB5', 
                            data: cnt, 
                        }]
                    };

                    var config = {
                        type: 'line', 
                        data: data, 
                        options: {}
                    };

                    var myChart = new Chart(
                        document.querySelector(".joindateMonthChart"), 
                        config 
                    );

                }
            });

        }
        });
    </script>
  <div class="container w500 m30">
        <div class="row center">
        	<h2>연도별 가입자 수</h2><br><br>
            <canvas class="joindateYearChart"></canvas>
        </div>
        <div><br><br></div>
        <div class="row center">
        	<h2>월별 가입자 수</h2><br><br>
	            <select class="selectYear years">
	                <option  value="2022" class="years">2022</option>
	                <option  value="2023" class="years">2023</option>
	                <option  value="2024" class="years">2024</option>
	                <option  value="2025" class="years">2025</option>
	            </select>
        </div>
        <div class="row showchart center">
            <canvas class="joindateMonthChart"></canvas><br><br>
        </div>
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

<jsp:include page="/template/footer.jsp"></jsp:include>