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
<title>AdminInfoMod.jsp</title>
<link rel="stylesheet" type="text/css">
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

body{font-family: 'Noto Sans KR', sans-serif;}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function() 
	{
		$("#password").focus();
		
		$("#modify").click(function()
		{
			alert($("#name").val());
			alert($("#password").val());
			alert($("#phoneNumber").val());
			alert($("#email").val());
          
			f = document.adminForm;
			
			if($("#name").val()==""||$("#password").val()==""||$("#phoneNumber").val()==""||$("#email").val()=="")
			{
				alert("값을 입력해주세요.");
				return;
			}
			else
			{	
				// 최종 submit
		        $("#adminForm").submit();
		        f.action = "<%=cp%>/admin/adminmodify.action";
			}
          
		})
		
		$("#cancel").click(function()
		{
			$("#password").val("");
			$("#phoneNumber").val("");
			$("#email").val("");
			$("#password").focus();
			
		})
	})
</script>

</head>
<body>

	<div>
		<h1>&nbsp;관리자 정보 수정 페이지</h1>
		<hr>
	</div>

	<div class="container-fluid">
	
	

		<div class="container">
			<div class="panel-group">
				<div class="panel panel-default">
					<div class="panel-body">
					
						<form action="adminmodify.action" method="post" role="form" id="adminForm">
							<div class="form-group" id="divName">
							<label for="name"> 관리자 이름 </label>
							<%-- <c:forEach var="hi" items="${adminSearchList}">
								"${hi.tel }"
							</c:forEach> --%>
							<input type="text" id="name" name="name"
									class="form-control" readonly="readonly"
									style="text-align: left; width: 200px; height: 40px;" value="${adminSearchList.admin_cd}">
							</div>

							<div class="form-group" id="divPassword">
								<label for="password"> 비밀번호 </label> 
								<input type="password" id="password" name="password" class="form-control"
								style="text-align: left; width: 200px; height: 40px;"><span id="errPwd"></span>
							</div>
							
							<div class="form-group" id="divPhoneNumber">
								<label for="telephone"> 전화번호 </label> 
								<input type="tel" id="phoneNumber" name="phoneNumber" class="form-control"
								style="text-align: left; width: 200px; height: 40px;" value="${adminSearchList.tel}">
							</div>
							
							<div class="form-group" id="divEmail">
								<label for="email"> 이메일 </label> 
								<input type="email" id="email" name="email" class="form-control"
								style="text-align: left; width: 200px; height: 40px;" value="${adminSearchList.email}">
							</div>

							<button type="button" id="modify" class="btn btn-default btn-sm" value="${adminSearchList.admin_cd}">수정</button>
							<button type="button" id="cancel" class="btn btn-default btn-sm btnCancel">취소</button>
							
							<div class="errMsg">
                          		<span id="err"></span>
                       		</div>

						</form>
					</div>
				</div>
				<!-- end .panel .panel-default -->

			</div>
		</div>
	</div>

</body>
</html>