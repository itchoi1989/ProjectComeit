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
<title>LectureSpaceList.jsp</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/lecture/lectureSpaceList.css" >

<script type="text/javascript">

	$(function()
	{
		// ajax처리
		ajaxLectureSpaceList();
		
		// 상세 페이지로 이동
	   	$(document).on('click', '.imageBtn', function()
	   	{
			var params = "spa_req_cd=" + $(this).val() + "&peoCd=" + $("#lectureCode").val();
			location.href = "<%=cp%>/spacedetail.action?"+params;
		});
		
		// 페이징 번호가 클릭 됐을때
		$(document).on('click', '.page-link', function()
		{
			
			$.ajax(
			{
				type : "POST"
				, url : "lecturespacelist.action"
				, data : {"lec_cd" : $("#lectureCode").val(), "pageNum" : $(this).text()}
				, dataType : "text"
				, async: false
				, success : function(data)
				{
					//alert("성공" + data);
					// 여기부터 하기
					$(".spaceList").html(data);
					
				}
				, error : function(e)
				{
					alert(e.responseText + "에러");
				}
			});
			
		});
		
	});
	
	// 이 강의에 대한 모임장소 리스트 뿌려주는 ajax
	function ajaxLectureSpaceList()
	{
		var params = "lec_cd=" + $("#lectureCode").val();
		
		$.ajax(
		{
			type : "POST"
			, url : "lecturespacelist.action"
			, data : params
			, dataType : "text"
			, async: false
			, success : function(data)
			{
				//alert("성공" + data);
				// 여기부터 하기
				$(".spaceList").html(data);
				
			}
			, error : function(e)
			{
				alert(e.responseText + "에러");
			}
		});
		
	}

</script>

</head>
<body>

	<br>
	<br>

	<div align="center">

		<div class="container-fluid">
		
			<div class="row">
			
				<div class="col-md-2">
				</div>
				<!-- end div.col-md-2 -->
				
				<div class="col-md-8 text-center">
					<h1>모임 장소 정하기</h1>
				</div>
				<!-- end div.col-md-8 text-center -->
				
				<div class="col-md-2">
				</div>
				<!-- end div.col-md-2 -->
				
			</div>
			<!-- end div.row -->
			
		</div>
		<!-- end div.container-fluid -->
		
		<div class="row spaceList">
		</div>
		<!-- end div.row spaceList -->
		
		<hr>
		
	</div>
	<!-- end div -->

</body>
</html>
































