<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String stu_cd = request.getParameter("stu_cd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyNoticeAdd.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/studynoticeadd.css" >

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/assets/js/bootstrap.min.js"></script>
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
					<td>${noticeAddData.stu_join_name }</td>
					<th>작성일</th>
					<td>${noticeAddData.crt_date }</td>
				</tr>
				<tr class="content">
					<th>내용 *</th>
					<td colspan="4">
					<textarea class="form-control ntcContent" rows="20" name="content" id="ntcContent"></textarea>
					</td>
				</tr>
			</table>
			<input type="hidden" id="studyCode" name="stu_cd" value="<%=stu_cd%>">
		</form>
		</div>
	</div><!-- 상세내용 영역 끝 -->
	
	<!-- 버튼 영역 -->
	<div class="row">
		<div class="col-md-12">
		
			<div class="bottom">
				<div class="errMsg">
					<span id="err" style="display: none; color: red; font-weight: bold; font-size: 12pt;"></span>
				</div>
				
				<button type="button" class="btn btn-primary btn-lg btm" id="noticeCreateBtn" style="margin-top: 20px;">
					등록
				</button>
				<button type="button" class="btn btn-lg btm notice-cancel" style="margin-top: 20px;">
					취소
				</button>
			
			</div>
		</div>
	</div><!-- 버튼 영역 끝-->
	
	
</div>

</body>
</html>