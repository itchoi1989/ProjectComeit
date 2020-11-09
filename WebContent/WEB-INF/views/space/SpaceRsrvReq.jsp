<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SpaceRsrvReq.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	    // memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
	    $(".menu>a").click(function(){
	    	 var submenu = $(this).next("ul");
	    	 
	            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
	            if( submenu.is(":visible") ){
	                submenu.slideUp();
	            }else{
	                submenu.slideDown();
	            }
	        });
	    
	    /* 스터디 예약 승인 */
	    $("#reqStuSubmit").click(function()
        {
	    	var params = "stu_spa_req_cd="+$(this).val();
	    	//alert(params);
	    	$.ajax(
  			{
  				type : "POST"
  				, data :params
  				, url : "stuspareqappr.action"
  				, success : function()
  				{
  					alert("승인되었습니다.");
  				}
  				, error : function(e)
  				{
  					alert("승인이 실패되었습니다.");
  				}
  			});
	    	End();	
        });
	    
	    /* 강의 예약 승인 */
	    $("#reqLecSubmit").click(function()
        {
	    	var params = "lec_spa_cd="+$(this).val();
	    	//alert(params);
	    	$.ajax(
  			{
  				type : "POST"
  				, data :params
  				, url : "lecspareqappr.action"
  				, success : function()
  				{
  					alert("승인되었습니다.");
  				}
  				, error : function(e)
  				{
  					alert("승인이 실패되었습니다.");
  				}
  			});
	    	End();	
        });
	    
	    var cd=0;
		$(".lecNBtn").click(function()
		{ 
			cd = $(this).val();
		});
		
		
		$(".stuNBtn").click(function()
		{ 
			cd = $(this).val();
		});
		
	    /* 스터디 예약 거부 */
		$("#reqStuSubmitN").click(function()
	        {
			alert(cd);
		    	$.ajax(
	  			{
	  				type : "POST"
	  				, data :{"stu_spa_req_cd":cd,
	   					"prcs_rsn":$("#prcsRsn").val(),
	   					} 
	  				, url : "stuspareqapprn.action"
	  				, success : function()
	  				{
	  					alert("예약거부되었습니다.");
	  				}
	  				, error : function(e)
	  				{
	  					alert("예약거부가 실패되었습니다.");
	  				}
	  			});
		    	End();	
	        });
	    
		/* 강의 예약 거부 */
		$("#reqLecSubmitN").click(function()
	        {
			alert(cd);
		    	//alert(params);
		    	$.ajax(
	  			{
	  				type : "POST"
	  				, data :{"lec_spa_cd":cd,
	   					"prcs_rsn":$("#prcsRsnLec").val(),
	   					} 
	  				, url : "lecspareqapprn.action"
	  				, success : function()
	  				{
	  					alert("예약거부되었습니다.");
	  				}
	  				, error : function(e)
	  				{
	  					alert("예약거부가 실패되었습니다.");
	  				}
	  			});
		    	End();	
	        });
		    });
	
	function End() {
    	location.reload();
	}
	</script>
</head>

<body>

		<div>
		<h3>스터디 예약요청</h3>
		    <ul>
		        <li class="menu"style="margin-top: 20px;">
		            <ul>
		                <li style="margin-top: 30px;">
		               		<table class="table table-hover table-bordered">
		               		<thead>
		               			<tr>
		               				<th>이름</th>
		               				<th>날짜</th>
		               				<th>요청시간</th>
		               				<th>인원</th>
		               				<th>요청한날</th>
		               				<th>승인여부</th>
		               			</tr>
		               		</thead>
		               		<tbody>
		               		<c:forEach var="reqStuList" items="${reqStu }">
		               			<tr>
		               				<td>${reqStuList.name }</td>
		               				<td>${reqStuList.use_time }</td>
		               				<td>${reqStuList.use_hrs}</td>
		               				<td>${reqStuList.mem_num}</td>
		               				<td>${reqStuList.req_date}</td>
		               				<td>
		               					<button class="btn btn-primary" value="${reqStuList.stu_spa_req_cd }" id="reqStuSubmit">승인</button>
		               					<button type="button" class="btn btn-secondary stuNBtn" value="${reqStuList.stu_spa_req_cd }" data-toggle="modal" data-target="#staticBackdrop">거부</button>
		               				</td>
		               				
		               			</tr>
		               		</c:forEach>
		               		</tbody>
		               		</table>
						</li>
		            </ul>
		        </li>
		    </ul>
		</div>
		<div>
		<h3>강의 예약요청</h3>
		    <ul>
		        <li class="menu"style="margin-top: 20px;">
		            <ul>
		                <li style="margin-top: 30px;">
		               		<table class="table table-hover table-bordered">
		               		<thead>
		               			<tr>
		               				<th>이름</th>
		               				<th>날짜</th>
		               				<th>요청시간</th>
		               				<th>인원</th>
		               				<th>요청한날</th>
		               				<th>승인여부</th>
		               			</tr>
		               		</thead>
		               		<tbody>
		               		<c:forEach var="reqLecList" items="${reqLec }">
		               			<tr>
		               				<td>${reqLecList.name }</td>
		               				<td>${reqLecList.use_time }</td>
		               				<td>${reqLecList.use_hrs}</td>
		               				<td>${reqLecList.mem_num}</td>
		               				<td>${reqLecList.req_date}</td>
		               				<td>
		               					<button class="btn btn-primary" value="${reqLecList.lec_spa_cd }" id="reqLecSubmit">승인</button>
		               					<button type="button" class="btn btn-secondary lecNBtn" value="${reqLecList.lec_spa_cd }" data-toggle="modal" data-target="#staticBackdropLec">거부</button>
		               				</td>
		               				
		               			</tr>
		               		</c:forEach>
		               		</tbody>
		               		</table>
						</li>
		            </ul>
		        </li>
		    </ul>
		</div>
		<!-- 스터디 거부모달 -->
		<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header head">
		        <h5 class="modal-title mTit" id="staticBackdropLabel">거부 사유</h5>
		        <button type="button" class="close xBtn" data-dismiss="modal" aria-label="Close">
		        X
		        </button>
		      </div>
		      <div class="modal-body mbody">
		      	
		      	
		      	<table class="table" style="margin-top: 30px;">
		      		
		      		<tr>
		      			<td style="border-top:none"><div class="rsnTit">사유</div></td>
		      			<td style="border-top:none">
		      				<input type="text" class="form-control" id="prcsRsn" style="width: 300px;" placeholder="예) 자리가 부족합니다.">
		      			</td>
		      		</tr>
		      	</table>
		      	
		      </div>
		      <div class="modal-footer">
		        <button type="button" id="reqStuSubmitN" class="btn btn-primary">확인</button>
		      </div>
		    </div>
		  </div>
		</div><!-- 모달 끝  -->
		
		<!-- 강의 거부 모달 -->
		<div class="modal fade" id="staticBackdropLec" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header head">
		        <h5 class="modal-title mTit" id="staticBackdropLabel">거부 사유</h5>
		        <button type="button" class="close xBtn" data-dismiss="modal" aria-label="Close">
		        X
		        </button>
		      </div>
		      <div class="modal-body mbody">
		      	
		      	
		      	<table class="table" style="margin-top: 30px;">
		      		
		      		<tr>
		      			<td style="border-top:none"><div class="rsnTit">사유</div></td>
		      			<td style="border-top:none">
		      				<input type="text" class="form-control" id="prcsRsnLec" style="width: 300px;" placeholder="예) 자리가 부족합니다.">
		      			</td>
		      		</tr>
		      	</table>
		      	
		      </div>
		      <div class="modal-footer">
		        <button type="button" id="reqLecSubmitN" class="btn btn-primary">확인</button>
		      </div>
		    </div>
		  </div>
		</div><!-- 모달 끝  -->
</body>
</html>