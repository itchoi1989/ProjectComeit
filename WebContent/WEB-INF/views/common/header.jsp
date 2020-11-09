<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="<%=cp %>/assets/css/common/header.css"  rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function(){
	    $(".dropdown").hover(            
	        function() {
	            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideDown("400");
	            $(this).toggleClass('open');        
	        },
	        function() {
	            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideUp("400");
	            $(this).toggleClass('open');       
	        }
		 );
	});
</script>
</head>

<body class="boheader">
<c:set var = "loginType" scope = "session" value = "${sessionScope.loginType }"/>
<!------ Include the above in your HEAD tag ---------->
<div class="header">
  <nav class="navbar navbar-inverse">
    <div class="navbar-header">
    	<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="<%=cp%>/mainpage.action">COME-IT!</a>
	</div>
	
	<div class="collapse navbar-collapse js-navbar-collapse">
		<ul class="nav navbar-nav">
			<li><a href="studylist.action">스터디</a></li>
			<!-- <li><a href="#">프로젝트</a></li> -->
			<li><a href="lecturelist.action">강의</a></li>
            <li><a href="spalist.action">공간</a></li>
		</ul>
        <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">My account <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
			<c:set var="idCheck" value="${id }" />
			<c:choose>
			<c:when test="${empty idCheck}">
			    <li><a href="memberlogin.action">Login</a></li>
			    <li><a href="memberjoin.action">개인 Singup</a></li>
			    <li><a href="spacejoin.action">업체 Singup</a></li>
			</c:when>
			<c:when test="${not empty idCheck}">
				<c:choose>
           		 <c:when  test="${loginType eq '0'}">
					<li><a href="membermy.action">${name } MyPage</a></li>
				 </c:when>
				 <c:when  test="${loginType eq '1'}">
				    <li><a href="spacemy.action">${name } MyPage</a></li>
				 </c:when>
				 </c:choose>
			    <li><a href="logout.action">logout</a></li>
			</c:when>
			</c:choose>
          </ul>
        </li>
      </ul>
	</div><!-- /.nav-collapse -->
  </nav>
</div>
</body>
</html>