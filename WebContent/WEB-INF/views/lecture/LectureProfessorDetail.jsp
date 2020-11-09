<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LectureProfessorDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/assets/css/lecture/lectureprofessordetail.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/assets/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link rel="shortcut icon" href="<%=cp%>/assets/images/pen_1.ico" type="image/x-icon">
<link rel="icon" href="<%=cp%>/assets/images/pen_1.ico" type="image/x-icon">

<style type="text/css">
	body 
	{
		font-family: 'Noto Sans KR', sans-serif !important;
	}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/assets/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function()
	{

		$("#member1").mouseover(function()
		{
			$("#lecMemInfo").css('display', 'block');
		});
		$("#member1").mouseleave(function()
		{
			$("#lecMemInfo").css('display', 'none');
		});
		 
		// 수정 버튼이 눌러졌을 때
		$("#modify").click(function()
		{
			$("#buttonForm").attr("action", "lecturemod.action");
			$("#buttonForm").submit();
		});
		 
		// 삭제 버튼이 눌러졌을 때
		$("#delete").click(function()
		{
			$("#buttonForm").attr("action", "lecturedelete.action");
			$("#buttonForm").submit();
		});

	});
</script>

</head>
<body>

	<!-- 헤더 영역 -->
	<div class="row">
	
		<div class="col-md-12">
			<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
		</div>
		
	</div>
	<!-- end div.row -->
	<!-- 헤더 영역 끝 -->

	<!-- 바디 영역 -->
	<div class="container-fluid">

		<div class="row">
			
			<!-- 강의 사이드탭 영역 -->		
			<div class="col-md-2">
				<c:import url="/WEB-INF/views/lecture/LectureSidebar.jsp">
				</c:import>
			</div>
			<!-- end div.col-md-2 -->
			<!-- 강의 사이드탭 영역 끝 -->
			
			<!-- 강의 정보 영역 -->
			<div class="col-md-8">
			
				<div class="row">
				
					<div class="col-md-12">
					
						<img src="<%=cp%>/assets/images/study2.jpg" alt="" class="lecImg" />
						
						<!-- 강의 제목 -->
						<div class="lecTitle">

							<div class="row">
							
								<div class="col-md-10">
									<h2 class="title" style="font-weight: bold;">${lecInfo.lec_name }</h2>
								</div>
								<!-- end div.col-md-10 -->

								<div class="col-md-2">
									<img src="<%=cp%>/assets/images/report.png" alt=""
										class="report" onclick="" />
								</div>
								<!-- end div.col-md-2 -->
								
							</div>
							<!-- end div.row -->
							<hr />

						</div>
						<!-- end.lecTitle -->

						<!-- 강의 정보 -->
						<div class="lecInfo">
						
							<!-- 활동 기간 -->
							<div class="lecTerm">
								<span class="glyphicon glyphicon-pencil"></span>
								<h3 class="lecIntro">강의 소개</h3>
								<br>
								<h3>${lecInfo.lec_intro }</h3>
							</div>
							<!-- end lecTerm -->
							<hr />
							
							<!-- 활동 지역 -->
							<div class="lecArea">
								<span class="glyphicon glyphicon-map-marker icon"></span>
								<h3>활동 지역</h3>
								<br /> <span class="area">${lecInfo.spc_area_name }</span>
							</div>
							<!-- end .lecArea -->
							<hr />
							
							<!-- 키워드 -->
							<div class="lecKey">
								<span class="glyphicon glyphicon-tags icon"></span>
								<h3>키워드</h3>
								<span class="keword"> <c:forEach var="lecTags"
										items="${lecTag }">
										<c:if test="${lecInfo.lec_cd eq lecTags.lec_cd }">
											<li class="stack-item">${lecTags.int_tag}</li>
										</c:if>
									</c:forEach>
								</span>
							</div>
							<!-- end .lecKey -->
							<hr />
							
							<!-- 예상 레벨 -->
							<div class="lecLevel">
								<span class="glyphicon glyphicon-calendar icon"></span>
								<h3>강의 일자</h3>
								<br> <span class="level">${lecInfo.str_date }~${lecInfo.end_date }</span>
								<br> <span class="level">화, 목</span>
							</div>
							<!-- end div.lecLevel -->
							<hr />
							
							<!-- 상세 설명 -->
							<div class="lecCurr">
								<span class="glyphicon glyphicon-user icon"></span>
								<h3>강의 인원</h3>
								<br /> <span class="curr"> 강의 최소 개설 인원 :
									${lecInfo.min_mem }명 <br> 강의 최대 인원 : ${lecInfo.max_mem }명
								</span>
							</div>
							<!-- end div.lecCurr -->
							<hr />
							
							<div class="lecMoney">
								<span class="glyphicon glyphicon-shopping-cart icon"></span>
								<h3>수강료</h3>
								<br /> <span class="curr"> ${lecInfo.lec_fee } 원 </span>
							</div>
							<!-- end div.lecMoney -->

							<br>
							<br>
							<br>

							<!-- 버튼 영역 -->
							<div class="text-right">
							
								<input type="button" value="강의 수정" class="btn btn-lg btn-primary join" id="modify" />
								<input type="button" value="강의 삭제" class="btn btn-lg btn-secondary join" id="delete"/>
								
								<!-- 수정/삭제시 강의코드를 넘겨주는 Form -->
								<form id="buttonForm" action="">
									<input type="hidden" name="lec_cd" value="${lec_cd }">
								</form>
								<!-- end form.buttonForm -->
								
							</div>
							<!-- end div.text-right -->

						</div>
						<!-- end .lecInfo -->
						
					</div>
					<!-- end .col-md-8 -->

				</div>
				<!-- end .row -->

			</div>
			<!-- end .col-md-8 -->

			<div class="col-md-2">
			</div>
			<!-- end div.col-md-2 -->
			
		</div>
		<!-- end .row -->

	</div>
	<!-- end .container-fluid -->

	<div class="row">
	
		<div class="col-md-2">
		</div>
		
		<div class="col-md-8">
		
			<div class="row">
			
				<div class="col-md-12">
					<c:import url="/WEB-INF/views/lecture/LectureTab.jsp"></c:import>
				</div>
				<!-- end div.col-md-12 -->
				
			</div>
			<!-- end .row -->
			
		</div>
		<!-- end .col-md-8 -->
		
		<div class="col-md-2">
		</div>
		<!-- end div.col-md-2 -->
		
	</div>
	<!-- end .row -->
	<!-- 바디 영역 끝 -->

	<!-- 푸터 영역 -->
	<div class="col-md-12">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>
	<!-- end div.col-md-12 -->
	<!-- 푸터 영역 끝 -->
	
</body>
</html>