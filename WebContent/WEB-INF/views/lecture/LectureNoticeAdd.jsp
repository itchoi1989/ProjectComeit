<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String stu_cd = request.getParameter("lec_cd");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LectureNoticeAdd.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/studynoticeadd.css" >
<script type="text/javascript">

	$(function() 
	{
		$("#noticeCreateBtn").click(function() 
		{
			if ($("#ntcTitle").val() == "" || $("#ntcContent").val() == "")
			{
				$("#err").html("필수 입력 항목이 누락되었습니다.");
				$("#err").css("display", "inline");
				return;
			}
			
			// 최종 등록하기
			$("#ntcForm").submit();
		});
		
	});

</script>
</head>
<body>

	<div class="container-fluid">
	
		<!-- 상세내용 영역 -->
		<div class="row">
		
			<div class="col-md-12">
			
				<form id="ntcForm" class="form-horizontal" role="form" method="post" action="studynoticeinsert.action">
				
					<table class="table detail">
						<tr>
							<th>제목 *</th>
							<td colspan="4">
							<input type="text" class="form-control ntcTitle" name="title" id="ntcTitle" value="">
							</td>
						</tr>
						<tr class="tit">
							<th>작성자</th>
							<td>홍길동</td>
							<th>작성일</th>
							<td>2020-08-01</td>
						</tr>
						<tr class="content">
							<th>내용 *</th>
							<td colspan="4">
							<textarea class="form-control ntcContent" rows="20" name="content" id="ntcContent"></textarea>
							</td>
						</tr>
					</table>
					<!-- end table.table detail -->
					<input type="hidden" id="studyCode" name="stu_cd" value="">
					
				</form>
				<!-- end form#ntcForm -->
				
			</div>
			<!-- end div.col-md-12 -->
			
		</div>
		<!-- end div.rowr -->
		<!-- 상세내용 영역 끝 -->
		
		<!-- 버튼 영역 -->
		<div class="row">
		
			<div class="col-md-12">
			
				<div class="bottom">
				
					<div class="errMsg">
						<span id="err" style="display: none; color: red; font-weight: bold; font-size: 12pt;"></span>
					</div>
					<!-- end div.errMsg -->
					
					<button type="button" class="btn btn-primary btn-lg btm" id="noticeCreateBtn" style="margin-top: 20px;">
						등록
					</button>
					
					<button type="button" class="btn btn-lg btm notice-cancel" style="margin-top: 20px;">
						취소
					</button>
				
				</div>
				<!-- end div.bottom -->
				
			</div>
			<!-- end div.col-md-12 -->
			
		</div>
		<!-- end div.row -->
		<!-- 버튼 영역 끝-->
			
	</div>
	<!-- end div.container-fluid -->

</body>
</html>