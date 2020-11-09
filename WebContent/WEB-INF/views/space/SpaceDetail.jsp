<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SpaceDetail.jsp</title>
 <!-- Bootstrap core CSS -->
<link href="<%=cp %>/assets/css/space/space-detail.css"  rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="shortcut icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<link rel="icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">

<link rel="stylesheet" href="<%=cp %>/assets/css/space/spafeedback.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet"><style type="text/css">
body{font-family: 'Noto Sans KR', sans-serif;}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	/* 그래프 */
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawVisualization);
	
	var list = new Array();
	list.push("${TotData.facility}");
	list.push("${TotData.kindness}");
	list.push("${TotData.price}");
	list.push("${TotData.location}");
	list.push("${TotData.noise}");
	list.push("${TotData.count}");

	function drawVisualization() { 
		
		for ( var i = 0; i < list.length; i++) {
		    var facility= list[0];
		    var kindness= list[1];
		    var price= list[2];
		    var location= list[3];
		    var noise= list[4];
		    var count=list[5];
		}
		//alert(facility);
		//alert(kindness);
		//alert(price);
		//alert(location);
		//alert(noise);
		
		var data = google.visualization.arrayToDataTable([
				['년도', {label: '시설', type: 'number'},{label: '친절', type: 'number'}, {label: '가격', type: 'number'},
					{label: '위치', type: 'number'} , {label: '소음', type: 'number'}],
				['2020',  facility/count, kindness/count, price/count, location/count, noise/count],
			]);
		var options = {
				title : '업체명',
				vAxis: {title: '점수'},
				hAxis: {title: '년도'}, 
				seriesType: 'bars',
				series: {
		            0: { color: '#68aae3' },
		            1: { color: '#5683aa' },
		            2: { color: '#4b92cf' },
		            3: { color: '#2d6ca4' },
		            4: { color: '#336699' }}
			};
		
		var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
		chart.draw(data, options);
	}
	
	/* 달력 */
	$(document).ready(function(){
	    var date_input=$('input[name="date"]');
	    var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
	    var options={
	      language:'kr',
	      format: 'yyyy-mm-dd',
	      container: container,
	      todayHighlight: true,
	      autoclose: true,
	    };
	    date_input.datepicker(options);
	   
	  });
	
	
	
	/* 피드백 */
	 $(document).ready(function() {
        $("#slider").slider({
            value:0,
            min: 0,
            max: 10,
            step: 1,
            slide: function(event, ui) {
                update(1,ui.value); //changed
            }
        });

        $("#slider2").slider({
            value:0,
            min: 0,
            max: 10,
            step: 1,
            slide: function(event, ui) {
                update(2,ui.value); //changed
            }
        });
        
        $("#slider3").slider({
            value:0,
            min: 0,
            max: 10,
            step: 1,
            slide: function(event, ui) {
                update(3,ui.value); //changed
            }
        });
        
        $("#slider4").slider({
            value:0,
            min: 0,
            max: 10,
            step: 1,
            slide: function(event, ui) {
                update(4,ui.value); //changed
            }
        });
        
        $("#slider5").slider({
            value:0,
            min: 0,
            max: 10,
            step: 1,
            slide: function(event, ui) {
                update(5,ui.value); //changed
            }
        });
        

        //Added, set initial value.
        $("#spa1").val(0);
        $("#spa2").val(0);
        $("#spa3").val(0);
        $("#spa4").val(0);
        $("#spa5").val(0);
        $("#spa1-label").text(0);
        $("#spa2-label").text(0);
        $("#spa3-label").text(0);
        $("#spa4-label").text(0);
        $("#spa5-label").text(0);
        
        update();
    });

    function update(slider,val) {
      var $spa1 = slider == 1?val:$("#spa1").val();
      var $spa2 = slider == 2?val:$("#spa2").val();
      var $spa3 = slider == 3?val:$("#spa3").val();
      var $spa4 = slider == 4?val:$("#spa4").val();
      var $spa5 = slider == 5?val:$("#spa5").val();


       $( "#spa1" ).val($spa1);
       $( "#spa1-label" ).text($spa1);
       $( "#spa2" ).val($spa2);
       $( "#spa2-label" ).text($spa2);
       $( "#spa3" ).val($spa3);
       $( "#spa3-label" ).text($spa3);
       $( "#spa4" ).val($spa4);
       $( "#spa4-label" ).text($spa4);
       $( "#spa5" ).val($spa5);
       $( "#spa5-label" ).text($spa5);

       $('#slider a').html('<label><span class="glyphicon glyphicon-chevron-left"></span>'+$spa1+'<span class="glyphicon glyphicon-chevron-right"></span></label>');
       $('#slider2 a').html('<label><span class="glyphicon glyphicon-chevron-left"></span>'+$spa2+'<span class="glyphicon glyphicon-chevron-right"></span></label>');
       $('#slider3 a').html('<label><span class="glyphicon glyphicon-chevron-left"></span>'+$spa3+'<span class="glyphicon glyphicon-chevron-right"></span></label>');
       $('#slider4 a').html('<label><span class="glyphicon glyphicon-chevron-left"></span>'+$spa4+'<span class="glyphicon glyphicon-chevron-right"></span></label>');
       $('#slider5 a').html('<label><span class="glyphicon glyphicon-chevron-left"></span>'+$spa5+'<span class="glyphicon glyphicon-chevron-right"></span></label>');
    } 
    
    $(document).ready(function () 
    { 
    	$('head').append('<style type="text/css">.modal .modal-body {max-height: ' + ($('body').height() * .8) + 'px;}.modal-open .modal{overflow-y: hidden !important;overflow-x: hidden !important;}</style>'); 
    	
        
        // 모달창 값 보내기(피드백)
        $("#feedBtn").click(function()
       	{
        	$.ajax(
  			{
  				type : "POST"
  				, url : "feedinsert.action"
  			    , data : {"cd":$(this).val(),
  			    	"spa1":$("#spa1").val(),
  					"spa2":$("#spa2").val(),
  					"spa3":$("#spa3").val(),
  					"spa4":$("#spa4").val(),
  					"spa5":$("#spa5").val(),
  					} 
  				, success : function()
  				{
  					alert("피드백 등록 성공!");
  				}
  				, error : function(e)
  				{
  					alert("이미 등록된 피드백이 있습니다.");
  				}
  			});
        	feedEnd();
       	});
        
        
        $(".onlyNumber").keyup(function(event){
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
                var inputVal = $(this).val();
                $(this).val(inputVal.replace(/[^0-9]/gi,''));
            }
        });
        
        // 모달창 값 보내기(예약하기)
        $(".spaReq").click(function()
       	{
        	$.ajax(
  			{
  				type : "POST"
  				, url : "reqinsert.action"
  			    , data : {"spaReqCd":$(this).val(),
  			    	"peoCd":$("#peoCd").val(),
  			    	"date":$("#date").val(),
  					"time":$("#time").val(),
  					"import":$("#import").val(),
  					"reqNum":$("#reqNum").val(),
  					} 
  				, success : function()
  				{
  					alert("예약이 성공적으로 완료되었습니다.");
  				}
  				, error : function(e)
  				{
  					alert("예약이 실패되었습니다.");
  				}
  			});
        	feedEnd();
       	});
        
        $(".btnImages").click(function() 
        {
        	$.ajax(
   			{
   				
   				type : "POST"
   				, url : "sparepinsert.action"
   			    , data : {"spa_req_cd":$(this).val(),
   					"rep_rsn_type_cd":$(".rsnType").val(),
   					"rep_rsn":$("#repRsn").val(),
   					} 
   				, success : function()
   				{
   					alert("신고 접수되었습니다.");
   				}
   				, error : function(e)
   				{
   					alert("신고 접수에 실패하였습니다.");
   				}
   			});
         	feedEnd();
		});
        
    });
    
    function feedEnd() {
    	location.reload();
	}
    
    
    	


</script>
</head>
<body>
<!-- 헤더 -->
<div class="row">
	<div class="col-md-12">
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>
</div>
			

<!-- Page Content -->
  <div class="container">

    <div class="row">
     <div class="col-lg-8">

        <!-- Title -->
        <h1 class="mt-4">${spaceInfo.spa_name }</h1>

        <!-- Author -->
        <p class="lead">${spaceInfo.busi_name }</p>
        <hr>
        </div>

      <!-- Post Content Column -->
      <div class="col-lg-8">
        <!-- Preview Image -->
        <img src="${spaceInfo.img_url }" alt="53" style="width: 755px; height: 250px;">

        <hr>

        <!-- Post Content -->
        <div class="lead">
        <ul class="list-space-tags form-inline">
		<c:forEach var="spaceTagss" items="${spaceTag }">
		<c:if test="${spaceTagss.spa_req_cd eq spaceInfo.spa_req_cd}">
		<li class="stack-item"><h4 >#${spaceTagss.tag_name }</h4></li>
		</c:if>
		</c:forEach>
		</ul>
		<h5>${spaceInfo.type_name }</h5>
        </div>
        <br><br>
        
        <!-- 공간 정보 부분 -->
        <div class="row">
		<div class="col-md-12 font-14">
			<dl>
				<dt class="dtbr">
					한줄 소개
				</dt>
				<dd>
					${spaceInfo.one_intro }
				</dd>
				<dt class="dtbr">
					상세 소개
				</dt>
				<dd>
					${spaceInfo.dtl_intro }
				</dd>
				<dt class="dtbr">
					예약시 주의사항
				</dt>
				<dd>
				    ${spaceInfo.rsv_notes }
				</dd>
				<dt class="dtbr">
					시설 안내
				</dt>
				<dd>
				<div class="row">
					<div class="col-md-12">
						<ul class=" ">
							<c:forEach var="fcltys" items="${fclty }">
							<c:if test="${fcltys.spa_req_cd eq spaceInfo.spa_req_cd}">
							<li class=""><h4 >${fcltys.content }</h4></li>
							</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
				</dd>
				<dt class="dtbr">
					평균 점수
				</dt>
				<dd>
				<div id="chart_div" style="width: 350px; height: 350px;"></div>
				</dd> 
			</dl>
		</div>
	</div><!-- end row -->
	
	
				
        
   <!-- 댓글 목록 영역 -->
	<div class="feed">
		<div class="reList">
			<div class="count">
			<span class="glyphicon glyphicon-heart heart" aria-hidden="true"></span>피드백참여: ${spaceInfo.feedCount }명</p>
			</div>
			<table class="table table-hover table-bordered">
				<tr>
					<!-- <th>Feedback<button type="button" class="btn btn-primary btnfeed">등록</button></th> -->
					<th colspan="6">Feedback
					<c:if test="${not empty feedCheck.mem_id}">
					<button type="button"  class="btn btn-primary btnfeed" data-toggle="modal" data-target="#staticBackdrop2">등록하기</button>
					</c:if>
					</th> 
				</tr>
				<tr>
					<td class="countNum">번호</td>
					<td>시설</td>
					<td>친절</td>
					<td>가격</td>
					<td>위치</td>
					<td>소음</td>
				</tr>
				<c:forEach var="feedbacks" items="${feedback }">
				<c:if test="${feedbacks.spa_req_cd eq spaceInfo.spa_req_cd}">
				<tr>
					<td>
						<c:set var="countNum" value="${countNum + 1}" />
						<div class="countNum">${countNum }</div>
					</td>
					<td>
						${feedbacks.facility }
					</td>
					<td>
						${feedbacks.kindness }
					</td>
					<td>
						${feedbacks.price }
					</td>
					<td>
						${feedbacks.location }
					</td>
					<td>
						${feedbacks.noise }
					</td>
				</tr>
				</c:if>
				</c:forEach>
			</table>
		</div>
	</div>
	 </div>
	 
	 
	 <!-- 모달 -->
		<div class="modal fade" id="staticBackdrop2" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel2" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-content">
		      <div class="head">
		      <!-- 피드백 -->
		      	<div class="container modalfeed modal-body modal-dialog">
		      	<button type="button" class="close xBtn" data-dismiss="modal" aria-label="Close">
		        X
		        </button>
      <!-- START -->
      <div class="price-box">
	 <div class="modal-body mbody">
          			<div class="price-slider">
            		<h4 class="great" style="color: #336699; font-weight: bold;" >시설</h4>
           			 <span>공간의 시설 만족도를 평가하세요!</span>
            		<div class="col-sm-12">
            		 <div id="slider" ></div>
            		 <input type="hidden" id="spa1" class="form-control">
            		</div>
          			</div>
          			<div class="price-slider" style="margin-top: 15px;">
            		<h4 class="great1"  style="color: #336699; font-weight: bold;">친절</h4>
           			 <span>공간의 친절 만족도를 평가하세요!</span>
            		<div class="col-sm-12">
            		 <div id="slider2"></div>
            		 <input type="hidden" id="spa2" class="form-control">
            		</div>
          			</div>
          			<div class="price-slider" style="margin-top: 15px;">
            		<h4 class="great1"  style="color: #336699; font-weight: bold;">가격</h4>
           			 <span>공간의 가격 만족도를 평가하세요!</span>
            		<div class="col-sm-12">
            		 <div id="slider3"></div>
            		 <input type="hidden" id="spa3" class="form-control">
            		</div>
          			</div>
          			<div class="price-slider" style="margin-top: 15px;">
            		<h4 class="great1"  style="color: #336699; font-weight: bold;">위치</h4>
           			 <span>공간의 위치 만족도를 평가하세요!</span>
            		<div class="col-sm-12">
            		 <div id="slider4"></div>
            		 <input type="hidden" id="spa4" class="form-control">
            		</div>
          			</div>
          			<div class="price-slider" style="margin-top: 15px;">
            		<h4 class="great1"  style="color: #336699; font-weight: bold;">소음</h4>
           			 <span>공간의 소음 만족도를 평가하세요!0(소음강함)~10(소음없음)</span>
            		<div class="col-sm-12">
            		 <div id="slider5"></div>
            		 <input type="hidden" id="spa5" class="form-control">
            		</div>
          			</div>

          <div class="form-group">
            <div class="col-sm-12">
              <button type="button" value="${feedCheck.req_cd}" id="feedBtn" class="btn btn-primary btn-lg btn-block">피드백등록 <span class="glyphicon glyphicon-chevron-right pull-right" style="padding-right: 10px;"></span></button>
            </div>
          </div>
</div>
      </div>

		      	<!-- 피드백 -->
		      </div>
		    </div>
		  </div>
		</div><!-- 모달 끝  -->
					

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">


        <!-- Search Widget -->
        <div class="card my-0 cardgray">
          <h5 class="card-header">업체 정보</h5>
          <div class="card-body">
          	<dl>
          		<dt>대표자명</dt>
          		<dd>${spaceInfo.rprsn_name }</dd>
          		<dt>전화번호</dt>
          		<dd>${spaceInfo.spa_tel }</dd>
          		<dt>영업 정보</dt>
          		<dd>영업시간 : ${spaceInfo.str_time }시 ~ ${spaceInfo.end_time }시<br> 최대 이용시간: ${spaceInfo.use_hrs }시</dd>
          	</dl>
          </div>
        </div>

        <!-- Side Widget -->
        <div class="card my-4">
          <h5 class="card-header">위치</h5>
          <div class="card-body">
          <!-- 지도넣는 부분 -->
          <address>
				 <strong>업체 주소</strong><br /> ${spaceInfo.area_name } ${spaceInfo.spc_area_name }<br />${spaceInfo.dtl_addr }<br />
			</address>
			<c:if test="${peoCd!=''}">
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">
						예약하기
					</button></c:if>
					
					<!-- 모달 -->
					<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header head">
					        <h5 class="modal-title mTit" id="staticBackdropLabel">공간 예약</h5>
					        <button type="button" class="close xBtn" data-dismiss="modal" aria-label="Close">
					        X
					        </button>
					      </div>
					      <div class="modal-body mbody">
					      	
					      	
					      	<form action="reqinsert.action" id="reqForm" name="reqForm" method="post" >
					      	<%-- <input type="hidden" name="spaReqCd" id="spaReqCd" value="${spaceInfo.spa_req_cd}"> --%>
					      	<table class="table" style="margin-top: 30px;">
					      		
					      		<tr>
					      			<td style="border-top:none"><div class="rsnTit">예약일</div></td>
					      			<td style="width: 180px;border-top:none">
								      <div class="form-group">
								        <label class="control-label" for="date">Date</label>
								        <input class="form-control" id="date" name="date" placeholder="YYYY/MM/DD" type="text" style="width: 150px;"/>
								      </div>
					      			</td>
					      			<td style="border-top:none">
					      				<label class="control-label" for="time">총 이용시간</label>
					      				<input type="text" id="time" name="time" class="form-control onlyNumber" style="width: 150px;" placeholder="예)2(숫자만 입력)">
					      			</td>
					      		</tr>
					      		<tr>
					      			<td><div class="rsnTit">예약정보</div></td>
					      			<td>
					      			  <div class="form-group">
								        <label class="control-label" for="import">이용시작시간</label>
								        <input type="text" id="import" name="import" class="form-control onlyNumber" style="width: 150px;" id="tot" placeholder="예)오전9시 = 9(숫자만 입력)">
								      </div>
					      			</td>
					      			<td >
					      				<div class="form-group"><label class="control-label" for="reqNum">인원수</label>
					      				<input type="text" id="reqNum" name="reqNum" class="form-control content onlyNumber" id="peo" style="width: 150px;"  placeholder="예) 2(숫자만 입력)"></div>
					      				<input type="hidden" value="${peoCd }" name="peoCd" id="peoCd"><!-- 스터디장이력, 강의코드 -->
					      			</td>
					      		</tr>
					      	</table>
					      	</form>
					      </div>
					      <div class="modal-footer">
					        <button type="button" value="${spaceInfo.spa_req_cd }" class="btn btn-primary spaReq">확인</button>
					      </div>
					    </div>
					  </div>
					</div><!-- 모달 끝  -->
          
          </div>
        </div>
	<button type="button" id="report" class="btn btnEvent " style="background-color:transparent;float: right;  border:0px transparent solid;outline:none;" data-toggle="modal" data-target="#staticBackdrop3">
		<img src="<%=cp %>/assets/images/report.png" style="width: 35px;">
	</button>
    </div>
    <!-- /.row -->
    <!-- 신고 모달 -->
					<div class="modal fade" id="staticBackdrop3" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header head">
					        <h5 class="modal-title mTit" id="staticBackdropLabel">신고 접수</h5>
					        <button type="button" class="close xBtn" data-dismiss="modal" aria-label="Close">
					        X
					        </button>
					      </div>
					      <div class="modal-body mbody">
					      	
					      	
					      	<form action="sparepinsert.action" method="post" >
					      	<%-- <input type="hidden" name="spaReqCd" id="spaReqCd" value="${spaceInfo.spa_req_cd}"> --%>
					      	<table class="table" style="margin-top: 30px;">
					      		
					      		<tr>
					      			<td style="border-top:none"><div class="rsnTit">신고 유형</div></td>
					      			<td style="width: 180px;border-top:none">
								        <c:forEach var="typeList" items="${repType }">
											<input type="radio" class="rsnType" name="repType" value="${typeList.rep_rsn_type_cd }">${typeList.type_name }<br>
								        </c:forEach>
					      			</td>
					      			<td style="border-top:none">
					      				<label class="control-label" for="repRsn">신고 사유</label>
					      				<input type="text" id="repRsn" name="repRsn" class="form-control" style="width: 150px;">
					      			</td>
					      		</tr>
					      	</table>
					      	</form>
					      </div>
					      <div class="modal-footer">
					        <button type="button" value="${spaceInfo.spa_req_cd }" class="btn btn-primary btnImages">신고</button>
					      </div>
					    </div>
					  </div>
					</div><!-- 모달 끝  -->

</div>
  </div>
  <!-- /.container -->

<div class="row">
	<div class="col-md-12">
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>
</div>


		

  <!-- Bootstrap core JavaScript -->
<%--   <script src="<%=cp %>/assets/js/jquery.min.js"></script>
  <script src="<%=cp %>/assets/js/bootstrap.bundle.min.js"></script> --%>

</body>
</html>