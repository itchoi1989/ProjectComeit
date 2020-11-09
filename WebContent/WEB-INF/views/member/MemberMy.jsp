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
<title>MemberMy.jsp</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/member/membermy.css" >

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link rel="shortcut icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<link rel="icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<style type="text/css">
.modal {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
 
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}

body{font-family: 'Noto Sans KR', sans-serif;}
	
	#preview {
	  z-index: 1; /* 필요시 설정 */
	  position: absolute;
	  background: #999999;
	  padding: 2px;
	}
 </style>
<script type="text/javascript">

	$(function() 
	{
		// 프로필 정보 수정 버튼 클릭 시
		$(".myModiBtn").click(function()
		{
		   f = document.memberInfo;
		   f.action = "<%=cp%>/memberinfomod.action";
		   f.submit();		
		});
		
	});
	
	
	
</script>
</head>
<body class="padding">

<!-- 헤더 -->
<div class="row">
	<div class="col-md-12">
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>
</div><!-- row -->

<div class="container-fluid">

	<!-- 내 정보 -->
	<div class="row row">
	<form name="memberInfo" method="post">
		<div class="col-md-2">
		</div>
		<div class="col-md-3 img">
		<c:choose>
		<c:when test="${memberInfo.img_url eq null}">
			<img class="img-fluid img-circle myimg" src="<%=cp %>/assets/images/basic.png" alt="myimg">
		</c:when>
		<c:otherwise>
			<img class="img-fluid img-circle myimg" src="${memberInfo.img_url }" alt="myimg">
		</c:otherwise>
		
		</c:choose>
		</div>
		<div class="col-md-5">
			<table class="table myInfo">
				<tr>
					<th>이름</th>
					<td>${sessionScope.name }</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${sessionScope.id }</td>
				</tr>
				<tr>
					<th>한 줄 소개</th>
					<td>${memberInfo.mem_content }</td>
				</tr>
				<tr>
					<th>매너 연필</th>
					<td>55cm</td>
				</tr>
				<tr>
					<th>신분</th>
					<td>${memberInfo.idntt }</td>
				</tr>
				<tr>
					<th>관심과목</th>
					<td>
						<ul class="list-my-tags">
						<c:forEach var="intTag" items="${memIntTag }">
                              <li class="stack-item">${intTag.int_tag }</li>
                     	</c:forEach>	
                     	</ul>				
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${memberInfo.email }</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${memberInfo.tel }</td>
				</tr>
				<tr>
					<th>지역</th>
					<td>${memberInfo.area_name } ${memberInfo.spc_area_name }</td>
				</tr>
				<tr>
					<th>페널티</th>
					<td>${pnlt }</td>
				</tr>
			</table>
			
			<div class="myModi">
				<button type="button" class="btn btn-primary myModiBtn">프로필 수정</button>
			</div>
			
		</div>
		<div class="col-md-2">
		</div>
		
	</form>
	</div><!-- 내 정보 끝 -->
	
	<!-- 참여 스터디/프로젝트 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		<div class="panel panel-default">
			<div class="panel-heading head">
				<h3 class="panel-title tit"><a href="">참여 스터디 ></a></h3>
			</div>
				<table class="table table-bordered">
				<tr class="myStu">
					<th>스터디 명</th>
					<th>진행 상태</th>
				</tr>
				<tr class="detail">
					<td class="deTit">첫 번째 스터디방 제목</td>
					<td>진행중</td>
				</tr>
				<tr class="detail">
					<td class="deTit">두 번째 스터디방 제목</td>
					<td>진행중</td>
				</tr>
				<tr class="detail">
					<td class="deTit">세 번째 스터디방 제목</td>
					<td>종료</td>
				</tr>
				<tr class="detail">
					<td class="deTit">네 번째 스터디방 제목</td>
					<td>종료</td>
				</tr>
				<tr class="detail">
					<td class="deTit">다섯 번째 스터디방 제목</td>
					<td>종료</td>
				</tr>
				</table>
		</div>
		</div>
		
		<div class="col-md-2">
		</div>
	</div><!-- 참여 스터디/프로젝트 끝 -->
	
	<!-- 수강 내역 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		<div class="panel panel-default">
			<div class="panel-heading head">
				<h3 class="panel-title tit">수강 내역 ></h3>
			</div>
				<table class="table table-bordered">
				<tr class="myPro">
					<th>강의 명</th>
					<th>진행 상태</th>
					<th>강의 금액</th>
					<th>환불신청</th>
				</tr>
				<tr class="detail">
					<td class="deTit">첫 번째 강의 제목이 노출되는 영역입니다.</td>
					<td>강의진행중</td>
					<td>200,000</td>
					<td>
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">
						환불신청
					</button>
					
					<!-- 모달 -->
					<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header head">
					        <h5 class="modal-title mTit" id="staticBackdropLabel">환불신청 사유</h5>
					        
					        <button type="button" class="close xBtn" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					      </div>
					      <div class="modal-body mbody">
					      	<div class="rsnTit">사유 입력</div>
					      	<input type="text" class="form-control content">
					      	<div class="rsnTit">환불 계좌 입력</div>
					      	
					      	<table class="table">
					      		<tr>
					      			<td>
					      			<select name="bank" class="form-control">
							      		<option value="신한은행">신한은행</option>
							      		<option value="국민은행">국민은행</option>
							      		<option value="우리은행">우리은행</option>
							      	</select>
					      			</td>
					      			<td>
					      				<input type="text" class="form-control">
					      			</td>
					      		</tr>
					      	</table>
					      	
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary">확인</button>
					      </div>
					    </div>
					  </div>
					</div><!-- 모달 끝  -->
					
					</td>
				</tr>
				<tr class="detail">
					<td class="deTit">두 번째 강의 제목이 노출되는 영역입니다.</td>
					<td>강의진행중</td>
					<td>100,000</td>
					<td>
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">
						환불신청
					</button>
					
					
					</td>
				</tr>
				<tr class="detail">
					<td class="deTit">세 번째 강의 제목이 노출되는 영역입니다.</td>
					<td>강의종료</td>
					<td>200,000</td>
					<td>
					<button class="btn">환불신청</button>
					</td>
				</tr>
				</table>
		</div>
		</div>
		<div class="col-md-2">
		</div>
	</div><!-- 수강 내역 끝 -->
	
	<!-- 결제 내역 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		<div class="panel panel-default">
			<div class="panel-heading head">
				<h3 class="panel-title tit">결제 내역 ></h3>
			</div>
				<table class="table table-bordered">
				<tr class="myPro">
					<th>강의 코드</th>
					<th>강의 명</th>
					<th>강사 명</th>
					<th>강의기간</th>
					<th>금액</th>
					<th>유형</th>
				</tr>
				<tr class="detail">
					<td>A0004</td>
					<td>JAVA배우기</td>
					<td>박길동</td>
					<td>2020-05-30 ~ 2020-06-30</td>
					<td>170,000</td>
					<td>결제</td>
				</tr>
				<tr class="detail">
					<td>A0003</td>
					<td>웹만들기</td>
					<td>홍길동</td>
					<td>2020-04-01 ~ 2020-05-01</td>
					<td>250,000</td>
					<td>환불</td>
				</tr>
				<tr class="detail">
					<td>A0003</td>
					<td>웹만들기</td>
					<td>홍길동</td>
					<td>2020-04-01 ~ 2020-05-01</td>
					<td>250,000</td>
					<td>결제</td>
				</tr>
				<tr class="detail">
					<td>A0002</td>
					<td>오라클 배우기</td>
					<td>신길동</td>
					<td>2020-02-02 ~ 2020-02-02</td>
					<td>120,000</td>
					<td>결제</td>
				</tr>
				<tr class="detail">
					<td>A0001</td>
					<td>C언어로 게임 만들기</td>
					<td>최길동</td>
					<td>2020-01-01 ~ 2020-02-01</td>
					<td>100,000</td>
					<td>결제</td>
				</tr>
				</table>
		</div>
		</div>
		<div class="col-md-2">
		</div>
	</div><!-- 결제 내역 끝 -->
	
	<!-- 공간 예약 내역 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		<div class="panel panel-default">
			<div class="panel-heading head">
				<h3 class="panel-title tit">공간 예약내역 ></h3>
			</div>
				<table class="table table-bordered">
				<tr class="myPro">
					<th>예약코드</th>
					<th>공간 명</th>
					<th>강의/스터디/프로젝트 명</th>
					<th>예약 요청일</th>
					<th>이용 일시</th>
					<th>예약 인원</th>
					<th>예약 상태</th>
					<th>예약 취소</th>
				</tr>
				<tr class="detail">
					<td>LR001</td>
					<td>업체명이 입력되는 공간입니다.</td>
					<td>강의/스터디명</td>
					<td>2020-07-01</td>
					<td>2020-07-06 18:00</td>
					<td>5명</td>
					<td>예약완료</td>
					<td>
					<button class="btn btn-primary">예약 취소</button>
					</td>
				</tr>
				<tr class="detail">
					<td>LR002</td>
					<td>업체명이 입력되는 공간입니다.</td>
					<td>강의/스터디명</td>
					<td>2020-04-01</td>
					<td>2020-04-06 18:00</td>
					<td>5명</td>
					<td>예약완료</td>
					<td>
					<button class="btn btn-primary">예약 취소</button>
					</td>
				</tr>
				<tr class="detail">
					<td>LS001</td>
					<td>업체명이 입력되는 공간입니다.</td>
					<td>강의/스터디명</td>
					<td>2020-03-01</td>
					<td>2020-03-06 18:00</td>
					<td>5명</td>
					<td>예약 거부</td>
					<td>
					<button class="btn">예약 취소</button>
					</td>
				</tr>
				<tr class="detail">
					<td>LP001</td>
					<td>업체명이 입력되는 공간입니다.</td>
					<td>강의/스터디명</td>
					<td>2020-02-01</td>
					<td>2020-02-06 18:00</td>
					<td>5명</td>
					<td>이용 완료</td>
					<td>
					<button class="btn">예약 취소</button>
					</td>
				</tr>
				<tr class="detail">
					<td>LP002</td>
					<td>업체명이 입력되는 공간입니다.</td>
					<td>강의/스터디명</td>
					<td>2020-01-01</td>
					<td>2020-01-06 18:00</td>
					<td>5명</td>
					<td>이용 완료</td>
					<td>
					<button class="btn">예약 취소</button>
					</td>
				</tr>
				</table>
		</div>
		</div>
		<div class="col-md-2">
		</div>
	</div><!-- 공간 예약 내역 끝 -->
	
</div>

<!-- 푸터 -->
<div class="row">
	<div class="col-md-12">
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>
</div>

</body>
</html>