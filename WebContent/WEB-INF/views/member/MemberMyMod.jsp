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
<title>MemberMyMod.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css" >
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/memberMyMod.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container-fluid">
	
	<!-- 헤더 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		</div>
		<div class="col-md-2">
		</div>
	</div>
	
	<!-- 수정폼 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="row">
				<!-- 이미지 -->
				<div class="col-md-4 img">
					<img alt="Bootstrap Image Preview" src="assets/images/proImg.png" class="img-circle proImg" />
					<input type="file" name="" id="" class="imgUpload" value="이미지 등록"/>
				</div><!-- end .col-md-4 .img -->
				
				<!-- 제목 -->
				<div class="col-md-2 info">
					<h2>아이디</h2>
					<h2>매너연필</h2>
					<h2>페널티</h2>
				</div>
				
				<!-- 내용 -->
				<div class="col-md-6 infoDet">
					<h3>h_gildong</h3>
					<h3>55cm</h3>
					<h3>옐로카드 1개</h3>
				</div>
			</div>
			
			<div class="row">
				<!-- 이름 -->
				<div class="col-md-4 nameDiv">
					<h3>이름<span class="ePoint">*</span></h3>
					<input type="text" class="form-control nameInput" value="장기혜"/>
				</div>
				
				<!-- 이메일 -->
				<div class="col-md-4 emailDiv">
					<h3>이메일<span class="ePoint">*</span></h3>
					<input type="text" class="form-control emailInput" value="gihyej@test.com"/>
				</div>
				
				<!-- 비밀번호 -->
				<div class="col-md-4 passDiv">
					<h3>비밀번호<span class="ePoint">*</span></h3>
					<input type="password" class="form-control passInput" value="123456"/>
				</div>
			</div>
			<div class="row">
				<!-- 전화번호 -->
				<div class="col-md-4 telDiv">
					<h3>전화번호<span class="ePoint">*</span></h3>
					<select name="" id="" class="form-control tel1">
						<option value="">010</option>
						<option value="">011</option>
						<option value="">070</option>
					</select> - 
					<input type="text" class="form-control tel2" value="1234"/> -
					<input type="text" class="form-control tel3" value="1234"/>
				
				</div>
				<!-- 신분 -->
				<div class="col-md-4 iddtDiv">
					<h3>신분<span class="ePoint">*</span></h3>
					<select name="" id="" class="form-control iddt">
						<option value="">대학생</option>
						<option value="">재직자</option>
						<option value="">취준생</option>
					</select> 
				</div>
				<!-- 지역 -->
				<div class="col-md-4 areaDiv">
					<h3>지역<span class="ePoint">*</span></h3>
					<select name="" id="" class="form-control area1">
						<option value="">서울</option>
						<option value="">경기</option>
						<option value="">인천</option>
					</select> 
					<select name="" id="" class="form-control area2">
						<option value="">마포구</option>
						<option value="">일산동구</option>
						<option value="">서구</option>
					</select> 
				</div>
			</div>
			<div class="row">
				<!-- 키워드 -->
				<div class="col-md-8 keyDiv">
					<h3>키워드<span class="ePoint">*</span></h3>
					
						<div class="stuKeySel">
						<select name="keySelect" id="keySelect" class="form-control keySelect">
							<option value="key1">java</option>
							<option value="key2">oracle</option>
							<option value="key3">jsp</option>
							<option value="key4">spring</option>
							<option value="key5">기타</option>
						</select>
					</div>
					<div class="stuKeyInput">
						<input type="text" class="keyInput form-control" id="keyInput" 
							placeholder="관심 키워드를 입력해 주세요."/>
					</div>
					<div class="stuKeyBtn">
						<input type="button" value="추가" class="keyBtn btn-lg btn-primary" />
					</div>
					
					<div class="stuKeyBox">
						<div class="tagStyle">
							<span class="keyTag">
								# 자바
								<a href="" class="tag_delete">
								X
								</a>
							</span>
						</div>
						<div class="tagStyle">
							<span class="keyTag">
								# 오라클
								<a href="" class="tag_delete">
								X
								</a>
							</span>
						</div>
						<div class="tagStyle">
							<span class="keyTag">
								# 정보처리기사
								<a href="" class="tag_delete">
								X
								</a>
							</span>
						</div>
					</div><!-- end .stuKeyBox -->
				</div><!-- end .stuKey -->
			
				</div>
				
				<div class="col-md-4">
				</div>
			
			
			<!-- 한줄 소개 -->
			<div class="row">
				<div class="col-md-8 intDiv">
					<h3>한 줄 소개<span class="ePoint">*</span></h3>
					<input type="text" class="form-control myInt" value="등록된 한 줄 소개가 노출되는 영역입니다."/>
				</div>
				<div class="col-md-4">
				</div>
			</div>
			
			<div class="modBtn">
				<input type="button" value="등록" class="btn-lg btn-primary" />
				<input type="button" value="취소" class="btn-lg" />
			</div>
		</div>
			
		</div>
		<div class="col-md-2">
		</div>
	</div><!-- end .container-fluid -->
	
	<!-- 푸터 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		</div>
		<div class="col-md-2">
		</div>
	</div>


</body>
</html>