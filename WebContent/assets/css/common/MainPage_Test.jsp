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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/mainPage_test.css">
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() 
	{
	    $('.carousel').carousel({
	      interval: 6000
	    });
	});

</script>
</head>

<body>

<div class="container">
<div class="col-xs-12">

    <div class="page-header">
        <h3>Bootstrap 3.3.0</h3>
        <p>Responsive Moving Box Carousel Demo</p>
    </div>
        
    <div class="carousel slide" id="myCarousel">
        <div class="carousel-inner">
            <div class="item active">
                    <img src="<%=cp %>/assets/images/main_img_1.jpg" style="width:1110px; height:324px;">
                    <div class="carousel-caption active align-items-center"> 
                    	<h1>COME-IT</h1>
                    	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</p> 
                   	</div>
              </div><!-- /Slide1 --> 
            <div class="item">
                    <img src="<%=cp %>/assets/images/main_img_2.jpg" style="width:1110px; height:324px;">
                    <div class="carousel-caption active align-items-center"> 
                    	<h1>COME-IT</h1>
                    	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</p> 
                   	</div>
              </div><!-- /Slide2 --> 
        </div>
		
		<ul class="carousel-indicators"> 
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li> <!--0번부터시작--> 
			<li data-target="#myCarousel" data-slide-to="1"></li> 
		</ul>

	   <!-- /.control-box -->   
                              
    </div><!-- /#myCarousel -->
        
</div><!-- /.col-xs-12 -->          

</div><!-- /.container -->

</body>
</html>