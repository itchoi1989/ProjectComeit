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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style>
table {
	width: 100%;
	border: 1px solid #444444;
	border-collapse: collapse;
	width: 60%;
	height: 100px;
	margin: auto;
	text-align: center;
}

th, td {
	border: 1px solid #444444;
}

.topFixBanner {
	text-align: left;
	background-color: #ffffff;
	padding: 20px 0px 20px 20px;
	width: 100%;
	border-bottom: #666666 solid 2px;
}

</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var saup = $("#saup").val(); // input 값을 가져올 때 사용하는 방식
		var bunho = "123-11-10889";
		$("#saup").val(bunho); // result 값을 input에 넣을 때 사용하는 방식

		var hajul = $("#hajul").val(); // input 값을 가져올 때 사용하는 방식
		var text1 = "잘부탁드립니다!";
		$("#hajul").val(text1); // result 값을 input에 넣을 때 사용하는 방식

		$("input:checkbox[name='stucafe']").prop("checked", true);

		var sangse = $("#sangse").val(); // input 값을 가져올 때 사용하는 방식
		var text2 = "구구절절 아이넵베베벱베에에에에ㅔㅂ메엡젱벶엡제엡ㅈ엠네엠네엠ㄴ에ㅔㄴ";
		$("#sangse").val(text2); // result 값을 input에 넣을 때 사용하는 방식

		/* $('#div01').scroll(function()
		{
		    var scrollT = $(this).scrollTop(); //스크롤바의 상단위치
		    var scrollH = $(this).height(); //스크롤바를 갖는 div의 높이
		    var contentH = $('#divContent').height(); //문서 전체 내용을 갖는 div의 높이
		    if(scrollT + scrollH +1 >= contentH) 
		    { // 스크롤바가 아래 쪽에 위치할 때
		        $('#divContent').append(imgs);
		    }
		}); */

	});

</script>
</head>
<body>

	<!-- Begin Page Content -->
	<div id="div01" class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">업체 요청 상세페이지</h1>

		<div id="divTable" style="padding: 30px;">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>요청코드</th>
						<th>업체명</th>
						<th>업체 아이디</th>
						<th>회원명</th>
						<th>요청일자</th>
						<th>요청처리</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>R0001</td>
						<td>우리스터디카페</td>
						<td>abc123</td>
						<td>홍길동</td>
						<td>20/06/22</td>
						<td>
							<button type="button" id="adminOkBtn">승인</button>
							<button type="button" id="adminRejectBtn">거부</button>
						</td>
					</tr>
				</tbody>
			</table>


			<div id="divContent" style="padding: 70px;">

				<hr>
				<form role="form">

					<div class="panel panel-primary setup-content" id="step-1">
						<div class="panel-heading">
							<h4 class="panel-title">사업자등록번호</h4>
						</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="spain">
									<input type="text" name="saup" id="saup"
										style="text-align: center; width: 200px; height: 40px; margin: 0 auto;"
										readonly="readonly" />
									<button type="button" id="hakin" data-toggle="modal" data-target="#staticBackdrop">사업자등록증 확인</button>
									
					<!-- 모달 -->
					<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" 
					role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header head">
					        <h5 class="modal-title mTit" id="staticBackdropLabel">환불신청 사유</h5>
					        <button type="button" class="close xBtn" data-dismiss="modal" aria-label="Close">
					        X
					        </button>
					      </div>
					      <div class="modal-body mbody">
					      	<div class="rsnTit">사유 입력</div>
					      	<input type="text" class="form-control content">
					      	<div class="rsnTit">환불 계좌 입력</div>
					      	
					      	<table class="table">
					      		<tr>
					      			<td>
					      			<select name="bank" class="form-control">
							      		<option value="신한은행">신한은행</option>
							      		<option value="국민은행">국민은행</option>
							      		<option value="우리은행">우리은행</option>
							      	</select>
					      			</td>
					      			<td>
					      				<input type="text" class="form-control">
					      			</td>
					      		</tr>
					      	</table>
					      	
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary">확인</button>
					      </div>
					    </div>
					  </div>
					</div><!-- 모달 끝  -->
					
								</div>
							</div>
						</div>
						<br>
						<div class="panel-body">
							<h4 class="panel-title">업체유형</h4>
							<div class="form-group">
								<div class="spain">
									<input type="checkbox" id="stucafe" name="stucafe"
										value="스터디카페" disabled="disabled" />스터디박스 <input
										type="checkbox" id="cafe" name="cafe" value="카페"
										disabled="disabled" />카페
								</div>
							</div>
						</div>
						<br>
						<div class="panel-body">
							<h4 class="panel-title">업체 한줄 소개</h4>
							<div class="form-group">
								<div class="spain">
									<textarea name="hajul" id="hajul" cols="40" rows="1"
										readonly="readonly"></textarea>
								</div>
							</div>
						</div>
						<br>
						<div class="panel-body">
							<h4 class="panel-title">업체 상세 소개</h4>
							<div class="form-group">
								<div class="spain">
									<textarea name="sangse" id="sangse" cols="40" rows="8"
										readonly="readonly"></textarea>
								</div>
							</div>
						</div>
						<br>
						<div class="panel-body">
							<h4 class="panel-title">업체태그</h4>
							<div class="form-group">
								<div class="spain">청결, 주차시설</div>
							</div>
						</div>
						<br>
						<div class="panel-body">
							<h4 class="panel-title">대표이미지</h4>
							<div class="form-group">
								<div class="spain">
									<img class="img-fluid rounded study-img"
										src="assets/images/study2.jpg" alt="studyImg">
								</div>
							</div>
						</div>

						<div class="panel-body">
							<h4 class="panel-title">상세이미지</h4>
							<div class="form-group">
								<div class="spain">
									<img class="img-fluid rounded study-img"
										src="assets/images/study2.jpg" alt="studyImg"> 
									<img class="img-fluid rounded study-img"
										src="assets/images/study2.jpg" alt="studyImg"> 
									<img class="img-fluid rounded study-img"
										src="assets/images/study2.jpg" alt="studyImg">
								</div>
							</div>
						</div>

						<br>
						<div class="panel-body">
							<h4 class="panel-title">위치등록</h4>
							<div class="form-group">
								<div class="spain">
									<input type="text" name="dnlcl" id="dnlcl"
										style="text-align: center; width: 200px; height: 40px; margin: 0 auto;"
										readonly="readonly" />
								</div>
							
							<div>
								<div class="spain">
									<br>
									<div>
										<input type="text" name="tkdtp" id="tkdtp"
											style="text-align: center; width: 200px; height: 40px; margin: 0 auto;"
											readonly="readonly" />
									</div>
								
								</div>
							
									<br>
									<div style="float:left;margin-right:20px;">
										<h4 class="panel-title" >업체전화번호</h4>
										<input type="text" name="tel" id="tel"
											style="text-align: center; width: 200px; height: 40px; margin: 0 auto;"
											readonly="readonly" />
									</div>
									<div style="float:left;margin-right:20px;">
										<h4 class="panel-title">대표자명</h4>
										<input type="text" name="daepyo" id="daepyo"
											style="text-align: center; width: 200px; height: 40px; margin: 0 auto;"
											readonly="readonly" />
									</div>
									<div style="float:left;margin-right:20px;">
									
										<h4 class="panel-title">상호명</h4>
										<input type="text" name="sangho" id="sangho"
											style="text-align: center; width: 200px; height: 40px; margin: 0 auto;"
											readonly="readonly" />
									</div>
									<div>
									<h4 class="panel-title">웹사이트주소</h4>
										<input type="text" name="wepjuso" id="wepjuso"
										style="text-align: center; width: 200px; height: 40px; margin: 0 auto;"
										readonly="readonly" />
									</div>
								</div>
									
								</div>
							</div>
							
						</div>
				</form>

			</div>
			<br>


		</div>
		</div>
		
</body>
</html>