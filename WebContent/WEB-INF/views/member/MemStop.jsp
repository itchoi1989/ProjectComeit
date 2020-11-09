<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COME-IT</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/member/memstop.css" >

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="shortcut icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<link rel="icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style type="text/css">
body{font-family: 'Noto Sans KR', sans-serif;}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>

<style type="text/css">

 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
 

.row .blinking{
   -webkit-animation:blink 0.5s ease-in-out infinite alternate;
    -moz-animation:blink 0.5s ease-in-out infinite alternate;
    animation:blink 0.5s ease-in-out infinite alternate;
}
@-webkit-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@-moz-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}


 </style>
</head>
<body class="stopBody">
<div class="row">
	<div class="col-md-12">
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>
</div>
<!-- 본문 영역 -->
<div class="container-fluid">
	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8 mainContent">
			<div class="cont">
			<table class="stopContent">
				<tr>
					<td rowspan="3">
					<span class="image blinking">
               		<img class="img-fluid rounded stopImg" src="assets/images/exclamation.png" alt="exclamation">
               		</span>
					</td>
					<td> 
					<c:if test="${!empty sessionScope.name }">
					 ${sessionScope.name }님의 계정은
					</c:if>
					</td>
				</tr>
				<tr>
					<td>
					<c:if test="${!empty sessionScope.stopDate }">
					 ${sessionScope.stopDate } 일 부로 
					</c:if>
					</td>
				</tr>
				<tr>
					<td> 7일간 정지 처리 되었습니다.</td>
				</tr>
			</table>
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	
</div>
<div class="row">
	<div class="col-md-12">
		
	</div>
</div>



</body>
</html>