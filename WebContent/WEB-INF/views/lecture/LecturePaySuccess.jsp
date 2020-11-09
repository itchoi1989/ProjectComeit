<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LecturePaySuccess.jsp</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
	p 
	{
		margin: 20px 0px;
	}
</style>
</head>

<body>

	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	<br>
	<div class="col-8" style="position: absolute; left: 15%; top: 25%;">
	
		<div class="card">
		
			<div class="card-body">

				<h3>결제가 완료되었습니다.</h3>
				<br>
				
				<div class="container" style="text-align: center;">
				
					<div class="table-responsive">
					
						<table class="table">
							<thead>
								<tr>
									<th>구매자명</th>
									<th>결제 금액</th>
									<th>강의명</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${memName }</td>
									<td>${lecFee }</td>
									<td>${lecName }</td>
								</tr>
							</tbody>
						</table>
						<!-- end div.table -->
						
						<button type="button" class="btn btn-primary" style="margin: auto; width:30%;">강의 페이지로 돌아가기</button>
						
					</div>
					<!-- end div.table-responsive -->
					
				</div>
				<!-- end div.container -->

			</div>
			<!-- end div.card-body -->
			
		</div>
		<!-- end div.card -->
		
	</div>
	<!-- end div.col-8 -->
	
	<!-- 푸터 -->
	<div class="row">
	
		<div class="col-md-12">
			<c:import url="WEB-INF/views/common/footer.jsp"></c:import>
		</div>
		<!-- end div.col-md-12 -->
		
	</div>
	<!-- end div.row -->
	<!-- 푸터 영역 끝 -->

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	
</body>
</html>