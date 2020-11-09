<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LectureFeedback.jsp</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/assets/css/lecture/lectureFeedback.css">

</head>
<body>

<div class="container-fluid">

	<div class="row">
		
		<div class="col-md-12">
		
			<div class="row prof-info">
			
				<div class="col-md-3">
					
					<img src="/FinalComeit/pds/saveData/jaemin.JPG" width="200px" height="150px">
				
				</div>
				<!-- end div.col-md-4 -->
				
				<div class="col-md-9">
				
					<div class="row">
						
						<div class="col-md-12">
							<p>
								<b>신재민</b> 강사님의 피드백
							</p>
						</div>
						<!-- end div.col-md-12 -->
						
					</div>
					<!-- end div.row -->
					
					<div class="row">
						
						<div class="col-md-12">
							<img src="assets/images/star.png" width="20px" height="20px">
							8.8
						</div>
						<!-- end div.col-md-12 -->
						
					</div>
					<!-- end div.row -->
				
				</div>
				<!-- end div.col-md-8 -->
				
			</div>
			<!-- end div.row -->
			
			<!-- 피드백 입력 영역 -->
			<div class="row feed-input">
				
				<!-- 피드백 text 입력 영역 -->
				<div class="col-md-10 feed-input">
					<textarea class="form-control" rows="3">
					</textarea>
				</div>
				<!-- end div.col-md-12 -->
				
				<!-- 피드백 입력 버튼 영역 -->
				<div class="col-md-2">
					<button class="btn btn-primary" type="button">피드백 등록</button>
				</div>
				
			</div>
			<!-- end div.row -->
			
			<!-- 피드백 리스트 영역 -->
			<div class="row">
			
				<div class="col-md-12">
				</div>
				<!-- end div.col-md-12 -->
				
			</div>
			<!-- end div.row -->
			
		</div>
		<!-- end div.col-md-12 -->
		
	</div>
	<!-- end div.row -->
	
</div>
<!-- end div.container-fluid -->

</body>
</html>