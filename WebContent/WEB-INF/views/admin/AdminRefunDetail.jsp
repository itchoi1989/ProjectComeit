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

#wrap{
    width:100%;
    height:100%;
    background:#000;
    position:relative;
} 
#wrap 
.box{ 
    width:300px;
    height:300px;
    position:absolute;
    left:50%;
    top:50%;
    margin-left:-150px;
    margin-top:-150px;
}

</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var money = $("#money").val(); // input 값을 가져올 때 사용하는 방식
		var don = "50,000";
		$("#money").val(don); // result 값을 input에 넣을 때 사용하는 방식

		var hajul = $("#hajul").val(); // input 값을 가져올 때 사용하는 방식
		var text1 = "돈없어요 환불해주세요!";
		$("#hajul").val(text1); // result 값을 input에 넣을 때 사용하는 방식


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
		
		$('#adminModBtn').click(function() 
		{
			//$("#title").text("회원 정보 수정").css({"color":"red","font-weight":"bold"});
			//alert("아오");
			//var hi= $(this).val();
			//alert(hi);
			var btn = document.getElementById("adminModBtn");
			btn.value = 'my value'; // will just add a hidden value
			btn.innerHTML = '금액저장';
		});

	});

	$(window).ready(function() {
		var max = 1000; //100% 투명할때의 스크롤 값
		$(window).scroll(function() {
			var scrollPX = $(this).scrollTop();
			if (scrollPX < max) {
				$("#bg").css({
					"opacity" : (max - scrollPX) / max
				});
			} else {
				$("#bg").css({
					"opacity" : 0
				});
			}
		});
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
						<th>환불코드</th>
						<th>강의코드</th>
						<th>회원 아이디</th>
						<th>강의 진행률</th>
						<th>환불요청일</th>
						<th>환불 요청금액</th>
						<th>환불 집행금액</th>
						<th>금액수정</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>A0001</td>
						<td>LEC0001</td>
						<td>cacao2347</td>
						<td>51%</td>
						<td>20/06/22</td>
						<td>100,000</td>
						<td>
							<input type="text" id="money" name="money" readonly="readonly" style="text-align: center"/>
						</td>
						<td>
							<button type="button" id="adminModBtn">금액수정</button>
						</td>
					</tr>
				</tbody>
			</table>


			<div id="divContent" style="padding: 0px;">

				<hr>
				<form role="form">

					<div class="panel panel-primary setup-content" id="step-1">
						<div class="panel-heading">
							<h4 class="panel-title">환불 계좌 정보</h4>
						</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="spain">
									110-511-805296 신한은행  신재민
								</div>
							</div>
						</div>
						<br>
						<br>
						<div class="panel-body">
							<h4 class="panel-title">환불 사유</h4>
							<div class="form-group">
								<div class="spain">
									<textarea name="hajul" id="hajul" cols="100%;" rows="10"
										readonly="readonly"></textarea>
								</div>
							</div>
						</div>
					</div>
				</form>
				<div >
					<button type="button">승인</button>
					<button type="button">거부</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>