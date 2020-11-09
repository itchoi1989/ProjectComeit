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
<title>StudyDateList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css" >
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/study/studyDateList.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>

<div class="container-fluid">

<!-- 월 / 년도 회차 선택 selectbox -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="date">
				<select name="" id="" class="form-control dateSel">
					<option value="date1">2020년 6월</option>
					<option value="date2">2020년 7월</option>
					<option value="date3">2020년 8월</option>
				</select>
			</div><!-- end .date -->
			<div class="meet">
				<select name="" id="" class="form-control meetSel">
					<option value="meet1">1회차</option>
					<option value="meet2">2회차</option>
					<option value="meet3">3회차</option>
				</select>
			</div><!-- end .meet -->
		</div><!-- end .col-md-8 -->
		<div class="col-md-2">
		</div>
	</div>
	
<!-- 년도 날짜 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<h1>2020년 6월 7회차</h1>
		</div><!-- end .col-md-8 -->
		<div class="col-md-2">
		</div>
	</div>
	
<!-- 선택 박스 -->
	<div class="row">

		<div class="col-md-12 box1">
		
		
			<div class="box2">
				<div class="time">
					<h3><span class="glyphicon glyphicon-time"></span> 2020년 6월 22일 오후 1 : 00 </h3>
				</div><!-- end .time -->
				<div class="location">
					<h3><span class="glyphicon glyphicon-map-marker"></span> 서울 마포구 홍대입구역 할리스 </h3>
				</div><!-- end .location -->
			</div><!-- end .box2 -->
			<div class="box3">
				<div class="mem">
					<div class="memImg">
						<img alt="Bootstrap Image Preview" src="assets/images/hjkim.PNG" class="img-circle profileImg" />
					</div>
					<div class="memName">
						<span class="name">김길동</span>
					</div>
					<div class="memAtten">
						<div class="answer1">
							<input type="radio" name="" id="" class="attendance" /><span class="yes">참여</span>
						</div>
						<div class="answer2">
							<input type="radio" name="" id="" class="attendance" checked="checked"/><span class="no">불참</span>
						</div>
					</div>
				</div><!-- end .mem -->
				<div class="mem">
					<div class="memImg">
						<img alt="Bootstrap Image Preview" src="assets/images/khjang.PNG" class="img-circle profileImg" />
					</div>
					<div class="memName">
						<span class="name">장길동</span>
					</div>
					<div class="memAtten">
						<div class="answer1">
							<input type="radio" name="" id="" class="attendance" /><span class="yes">참여</span>
						</div>
						<div class="answer2">
							<input type="radio" name="" id="" class="attendance" checked="checked"/><span class="no">불참</span>
						</div>
					</div>
				</div><!-- end .mem -->
				<div class="mem">
					<div class="memImg">
						<img alt="Bootstrap Image Preview" src="assets/images/sjsong.PNG" class="img-circle profileImg" />
					</div>
					<div class="memName">
						<span class="name">송길동</span>
					</div>
					<div class="memAtten">
						<div class="answer1">
							<input type="radio" name="" id="" class="attendance" /><span class="yes">참여</span>
						</div>
						<div class="answer2">
							<input type="radio" name="" id="" class="attendance" checked="checked"/><span class="no">불참</span>
						</div>
					</div>
				</div><!-- end .mem -->
				<div class="mem">
					<div class="memImg">
						<img alt="Bootstrap Image Preview" src="assets/images/jmshin.PNG" class="img-circle profileImg" />
					</div>
					<div class="memName">
						<span class="name">신길동</span>
					</div>
					<div class="memAtten">
						<div class="answer1">
							<input type="radio" name="" id="" class="attendance" /><span class="yes">참여</span>
						</div>
						<div class="answer2">
							<input type="radio" name="" id="" class="attendance" checked="checked"/><span class="no">불참</span>
						</div>
					</div>
				</div><!-- end .mem -->
				<div class="mem">
					<div class="memImg">
						<img alt="Bootstrap Image Preview" src="assets/images/hschoi.PNG" class="img-circle profileImg" />
					</div>
					<div class="memName">
						<span class="name">최길동</span>
					</div>
					<div class="memAtten">
						<div class="answer1">
							<input type="radio" name="" id="" class="attendance" /><span class="yes">참여</span>
						</div>
						<div class="answer2">
							<input type="radio" name="" id="" class="attendance" checked="checked"/><span class="no">불참</span>
						</div>
					</div>
				</div><!-- end .mem -->
				<div class="blank">
				</div>
			</div><!-- end .box3 -->
			
		</div>		
			
	</div>
	
<!-- 버튼 노출 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="button">
				<div class="mod">
					<input type="button" value="수정" class="btn btn-default"/>
				</div><!-- end .mod -->
				<div class="del">
					<input type="button" value="삭제" class="btn btn-default"/>
				</div><!-- end .del -->
				<div class="upload">
					<input type="submit" value="등록" class="btn btn-primary"/>
				</div><!-- end .upload -->
			</div><!-- end .button -->
		</div><!-- end .col-md-8 -->
		<div class="col-md-2">
		</div>
	</div>
</div><!-- end .container-fluid -->

</body>
</html>