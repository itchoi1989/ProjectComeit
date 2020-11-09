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
<title>StudyFileDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/study/studyfiledetail.css" >

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/assets/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container-fluid">

	<!-- 상세내용 영역 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<table class="table detail">
				<tr>
					<th>제목</th>
					<td colspan="6">산출물의 열 번째 게시글 입니다.</td>
				</tr>
				<tr class="tit">
					<th>작성자</th>
					<td>홍길동</td>
					<th>작성일</th>
					<td>2020-06-18</td>
					<th>조회수</th>
					<td>22</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="6">회의록.doc</td>
				</tr>
				<tr class="content">
					<td colspan="6">산출물의 상세 내용 노출 영역입니다.</td>
				</tr>
				<tr>
					<td colspan="6">이전글 : 산출물의 아홉 번째 게시글 제목입니다.</td>
				</tr>
				<tr>
					<td colspan="6">다음글 : 없음</td>
				</tr>
			</table>
		</div>
		<div class="col-md-2">
		</div>
	</div><!-- 상세내용 영역 끝 -->
	
	<!-- 버튼 영역 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="repBtn">
				<button type="button" class="btn btn-link">
				신고
				</button>
			</div>
			
			<div class="btns">
				<div class="leftBtn">
					<button type="button" class="btn">
						수정
					</button>
					<button type="button" class="btn">
						삭제
					</button>
				</div>
				
				<div class="rightBtn">
					<button type="button" class="btn btn-primary">
						목록
					</button>
				</div>
			</div>
			
		</div>
		<div class="col-md-2">
		</div>
	</div><!-- 버튼 영역 끝-->
	
</div>
</body>
</html>