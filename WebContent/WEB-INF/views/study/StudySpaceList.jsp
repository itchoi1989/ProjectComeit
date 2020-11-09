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
<title>StudySpaceList.jsp</title>


<style type="text/css">
#listTbl {
	border-spacing: 20px;
	border-collapse: separate;
}
</style>

<script type="text/javascript">

	function searchList() 
	{
		f = document.searchForm;
		f.action = "<%=cp%>/image/list.action";
		f.submit();
	}
</script>

</head>
<body>
	<div align="center">

		<div class="container-fluid">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8 text-center">
					<h1>모임 장소 정하기</h1>
				</div>
				<div class="col-md-2"></div>
			</div>
	</div>
		
		<div class="row">
			<hr>

			<div class="col-md-12">

				
				<div class="row">
					<div class="col-md-12">
					
						<select name="searchKey" class="selectField form-control"
						style="width: 15%; display: inline;">
						<option value="subject">제목</option>
						<option value="userName">작성자</option>
						</select> <input type="text" name="searchValue" class="boxTF form-control"
						style="width: 25%; display: inline;">
						<button type="button" class="btn btn-primary">검색</button>
					
					
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
					
						<table
					style="width: 600px; margin: 1px; padding: 3px; background-color: #FFFFFF; align-self: center;"
					id="listTbl">

					<tr>

						<td style="width: 200px;" align="left"><img
							src="<%=cp%>/assets/images/studycafe.jpg"
							style="width: 300px; height: 200px;"> <span
							style="color: #2E64FE; font-weight: bold;">우리 스터디 카페</span>
							&nbsp;&nbsp;&nbsp;&nbsp; <span
							style="color: gray; font-size: 8pt;">스터디 카페</span> <br> <img
							src="<%=cp%>/assets/images/pin.PNG"
							style="width: 15px; height: 15px;">&nbsp;<span
							style="font-size: 12pt;">경기 화성시</span> &nbsp;&nbsp;&nbsp;&nbsp; <img
							src="<%=cp%>/assets/images/clock.PNG"
							style="width: 15px; height: 15px;">&nbsp;<span
							style="font-size: 12pt;">09:00 ~ 23:00</span> <br> <img
							src="<%=cp%>/assets/images/calendar.PNG"
							style="width: 15px; height: 15px;">&nbsp;<span
							style="font-size: 12pt;">월~토</span> <br> <span
							style="color: gray; font-size: 10pt;">#와이파이</span> &nbsp; <span
							style="color: gray; font-size: 10pt;">#소음없음</span> &nbsp; <span
							style="color: gray; font-size: 10pt;">#역가까움</span></td>

						<td style="width: 200px;" align="left"><img
							src="<%=cp%>/assets/images/studycafe.jpg"
							style="width: 300px; height: 200px;"> <span
							style="color: #2E64FE; font-weight: bold;">우리 스터디 카페</span>
							&nbsp;&nbsp;&nbsp;&nbsp; <span
							style="color: gray; font-size: 8pt;">스터디 카페</span> <br> <img
							src="<%=cp%>/assets/images/pin.PNG"
							style="width: 15px; height: 15px;">&nbsp;<span
							style="font-size: 12pt;">경기 화성시</span> &nbsp;&nbsp;&nbsp;&nbsp; <img
							src="<%=cp%>/assets/images/clock.PNG"
							style="width: 15px; height: 15px;">&nbsp;<span
							style="font-size: 12pt;">09:00 ~ 23:00</span> <br> <img
							src="<%=cp%>/assets/images/calendar.PNG"
							style="width: 15px; height: 15px;">&nbsp;<span
							style="font-size: 12pt;">월~토</span> <br> <span
							style="color: gray; font-size: 10pt;">#와이파이</span> &nbsp; <span
							style="color: gray; font-size: 10pt;">#소음없음</span> &nbsp; <span
							style="color: gray; font-size: 10pt;">#역가까움</span></td>

						<td style="width: 200px;" align="left"><img
							src="<%=cp%>/assets/images/studycafe.jpg"
							style="width: 300px; height: 200px;"> <span
							style="color: #2E64FE; font-weight: bold;">우리 스터디 카페</span>
							&nbsp;&nbsp;&nbsp;&nbsp; <span
							style="color: gray; font-size: 8pt;">스터디 카페</span> <br> <img
							src="<%=cp%>/assets/images/pin.PNG"
							style="width: 15px; height: 15px;">&nbsp;<span
							style="font-size: 12pt;">경기 화성시</span> &nbsp;&nbsp;&nbsp;&nbsp; <img
							src="<%=cp%>/assets/images/clock.PNG"
							style="width: 15px; height: 15px;">&nbsp;<span
							style="font-size: 12pt;">09:00 ~ 23:00</span> <br> <img
							src="<%=cp%>/assets/images/calendar.PNG"
							style="width: 15px; height: 15px;">&nbsp;<span
							style="font-size: 12pt;">월~토</span> <br> <span
							style="color: gray; font-size: 10pt;">#와이파이</span> &nbsp; <span
							style="color: gray; font-size: 10pt;">#소음없음</span> &nbsp; <span
							style="color: gray; font-size: 10pt;">#역가까움</span></td>

					</tr>
					<tr>

						<td style="width: 200px;" align="left"><img
							src="<%=cp%>/assets/images/studycafe.jpg"
							style="width: 300px; height: 200px;"> <span
							style="color: #2E64FE; font-weight: bold;">우리 스터디 카페</span>
							&nbsp;&nbsp;&nbsp;&nbsp; <span
							style="color: gray; font-size: 8pt;">스터디 카페</span> <br> <img
							src="<%=cp%>/assets/images/pin.PNG"
							style="width: 15px; height: 15px;">&nbsp;<span
							style="font-size: 12pt;">경기 화성시</span> &nbsp;&nbsp;&nbsp;&nbsp; <img
							src="<%=cp%>/assets/images/clock.PNG"
							style="width: 15px; height: 15px;">&nbsp;<span
							style="font-size: 12pt;">09:00 ~ 23:00</span> <br> <img
							src="<%=cp%>/assets/images/calendar.PNG"
							style="width: 15px; height: 15px;">&nbsp;<span
							style="font-size: 12pt;">월~토</span> <br> <span
							style="color: gray; font-size: 10pt;">#와이파이</span> &nbsp; <span
							style="color: gray; font-size: 10pt;">#소음없음</span> &nbsp; <span
							style="color: gray; font-size: 10pt;">#역가까움</span></td>

						<td style="width: 200px;" align="left"><img
							src="<%=cp%>/assets/images/studycafe.jpg"
							style="width: 300px; height: 200px;"> <span
							style="color: #2E64FE; font-weight: bold;">우리 스터디 카페</span>
							&nbsp;&nbsp;&nbsp;&nbsp; <span
							style="color: gray; font-size: 8pt;">스터디 카페</span> <br> <img
							src="<%=cp%>/assets/images/pin.PNG"
							style="width: 15px; height: 15px;">&nbsp;<span
							style="font-size: 12pt;">경기 화성시</span> &nbsp;&nbsp;&nbsp;&nbsp; <img
							src="<%=cp%>/assets/images/clock.PNG"
							style="width: 15px; height: 15px;">&nbsp;<span
							style="font-size: 12pt;">09:00 ~ 23:00</span> <br> <img
							src="<%=cp%>/assets/images/calendar.PNG"
							style="width: 15px; height: 15px;">&nbsp;<span
							style="font-size: 12pt;">월~토</span> <br> <span
							style="color: gray; font-size: 10pt;">#와이파이</span> &nbsp; <span
							style="color: gray; font-size: 10pt;">#소음없음</span> &nbsp; <span
							style="color: gray; font-size: 10pt;">#역가까움</span></td>

						<td style="width: 200px;" align="left"><img
							src="<%=cp%>/assets/images/studycafe.jpg"
							style="width: 300px; height: 200px;"> <span
							style="color: #2E64FE; font-weight: bold;">우리 스터디 카페</span>
							&nbsp;&nbsp;&nbsp;&nbsp; <span
							style="color: gray; font-size: 8pt;">스터디 카페</span> <br> <img
							src="<%=cp%>/assets/images/pin.PNG"
							style="width: 15px; height: 15px;">&nbsp;<span
							style="font-size: 12pt;">경기 화성시</span> &nbsp;&nbsp;&nbsp;&nbsp; <img
							src="<%=cp%>/assets/images/clock.PNG"
							style="width: 15px; height: 15px;">&nbsp;<span
							style="font-size: 12pt;">09:00 ~ 23:00</span> <br> <img
							src="<%=cp%>/assets/images/calendar.PNG"
							style="width: 15px; height: 15px;">&nbsp;<span
							style="font-size: 12pt;">월~토</span> <br> <span
							style="color: gray; font-size: 10pt;">#와이파이</span> &nbsp; <span
							style="color: gray; font-size: 10pt;">#소음없음</span> &nbsp; <span
							style="color: gray; font-size: 10pt;">#역가까움</span></td>

					</tr>

				</table>
					
					</div>
				</div>

			</div>
			<!-- col-md-12 -->

		</div>
		<!-- row -->
		
		
		<hr>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row paging">
					<div class="col-md-12">
						<nav>
							<ul class="pagination">
								<li class="page-item"><a href="#" class="page-link">Previous</a></li>
								<li class="page-item"><a href="#" class="page-link">1</a></li>
								<li class="page-item"><a href="#" class="page-link">2</a></li>
								<li class="page-item"><a href="#" class="page-link">3</a></li>
								<li class="page-item"><a href="#" class="page-link">4</a></li>
								<li class="page-item"><a href="#" class="page-link">5</a></li>
								<li class="page-item"><a href="#" class="page-link">6</a></li>
								<li class="page-item"><a href="#" class="page-link">7</a></li>
								<li class="page-item"><a href="#" class="page-link">8</a></li>
								<li class="page-item"><a href="#" class="page-link">9</a></li>
								<li class="page-item"><a href="#" class="page-link">10</a></li>
								<li class="page-item"><a href="#" class="page-link">Next</a></li>
							</ul>
						</nav>
					</div>
				</div>
				<!-- 페이징 영역 끝 -->
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>

</body>
</html>
































