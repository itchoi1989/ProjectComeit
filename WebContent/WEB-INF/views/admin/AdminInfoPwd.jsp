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
#login_wrapper 
{ 
    border: 20px solid #E6E6E6;
    padding: 5px 20px;
    position: absolute;
    top: 50%;
    left: 50%;
    width: 450px; height: 250px;
    margin-left: -220px;
    margin-top : -170px;
    
    display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
} 
h1{
	font-size: 25px;
	padding-bottom: 20px;
}
.form{
	width: 300px;
}
.form > div{
	display: flex;
	justify-content: center;
	padding-bottom: 7px;
	align-items: center;
}
label{
	flex: 1;
	text-align: left;
}
button{
	width: 85px;
	float: left;
	padding: 3px;
}
input {
	padding: 5px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function() 
	{
		$(".btn-sm").click(function() 
		{
			//var loginPwd = ;
			//alert(loginPwd);
			var inputPwd = $("#pwd").val();
			alert(inputPwd);
			
			if("${sessionScope.pwd}" == inputPwd)
			{
				$("#memberForm").submit();
			}
			else
			{
				alert("비밀번호 일치하지 않습니다. 다시 입력해주세요.");
				$("#pwd").val("");
				$("#pwd").focus();
			}
		})
	});
	
</script>
</head>
<body>

	<div id="login_wrapper">
		<form action="admin_info_mod.action" method="post" role="form"
			id="memberForm">
			<div class="form-group">
				<label for="password"> 비밀번호를 입력해주세요 </label> 
				<input type="password" id="pwd" name="pwd" class="form-control"
					style="text-align: center; width: 200px; height: 40px;">
			</div>
			<div>
				<button type="button" class="btn btn-default btn-sm">확인</button>
				<button type="button" class="btn btn-default btn-sm btnCancel">취소</button>
			</div>
		</form>
	</div>


</body>
</html>