<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!-- searchId : 회원인지 업체인지(어떠한 회원 유형의 아이디를 찾을건지) -->
<!-- search_id : 찾은 회원 아이디  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchId.jsp</title>
<link rel="stylesheet" href="<%=cp %>/assets/css/common/searchid.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<!-- 파비콘 -->
<link rel="shortcut icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<link rel="icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">

<!-- 글꼴 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style type="text/css">
body{font-family: 'Noto Sans KR', sans-serif;}

.okNumBox
{
	border: none;
	color: red;
	font-weight: bold;
	background-color: transparent;
}

</style>
<script type="text/javascript">

	var phoneCheck = "";
	
	$(function() {
		
		$("#okNumBtn").click(function() 
         {          
            if($("#formOknumber").val() == "" || $("#formOknumber").val() == null)
             {
                 alert("인증번호를 입력하세요.");
                 return;
             }
   
             if($("#formOknumber").val() == phoneCheck)
              {
                alert("인증에 성공하였습니다.");
                $("#okNumRslt").attr("value", "인증 성공");
                
                $("#rcvIdBtn").prop("disabled", false);           

              }
             else if($("#formOknumber").val() != phoneCheck)
             {
                alert("인증에 실패하였습니다.");
                $("#okNumRslt").attr("value", "인증 실패"); 
             }
             else
             {
                alert("인증에 실패하였습니다.");
                $("#okNumRslt").attr("value", "인증 실패");
             }
             
         });
		
			
	})
	
	// 문자 발송 설정
	function idSendSms() 
	{
		phoneCheck = "";
		//alert("phoneCheck_bf : " + phoneCheck);
		
		$.ajax({
			url : "<%=cp%>/idsendsms.action",
			data : {
				receiver:$("#formTel").val()
			},
			type: "post",
			success: function(result) {
				phoneCheck = result;
				//alert("result : " + result);
				//alert("phoneCheck_af : " + phoneCHeck);
			}
		});	
	}

</script>
</head>

<body>
<c:set var = "searchId" scope = "session" value = "${sessionScope.searchId }"/>

	<div class="container register">
		<div class="row">
			<div class="col-md-3 register-left">
				<img src="<%=cp %>/assets/images/data.png" alt="" />
				<h3>Welcome</h3>
				<p>COME-IT에 가입하세요!</p>
				<input type="submit" name="mainPage" value="메인페이지"  onClick="location.href='mainpage.action'"/><br />
			</div>
			<div class="col-md-9 register-right">
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="mem" role="tabpanel"
						aria-labelledby="mem-tab">
						<div class="col-sm-6 col-sm-offset-3 form-box login">
							<div class="form-top">
								<div class="form-top-left">
								
				           		 <c:choose>
				           		 <c:when  test="${searchId eq 'memIdSearch'}">
									<h3>회원 ID 찾기</h3>
								 </c:when>
								 <c:when  test="${searchId eq 'spaIdSearch'}">
								    <h3>업체 ID 찾기</h3>
								 </c:when>
								 </c:choose>
									
								</div>
								<div class="form-top-right"></div>
							</div>
							<div class="form-bottom">
								<form role="form" action="searchidcheck.action" method="post" class="login-form">
								<c:choose>
								<c:when test="${empty search_id}">
								<br>
									<p>가입시 입력한 실명과 전화번호를 입력해 주세요. </p>
									<table class="inputForm">
										<tr>
											<th>실명</th>
											<td>
											<label class="sr-only" for="formUserName">Username</label>
											<input type="text" name="formUserName"
											placeholder="가입시 입력한 실명" class="form-username form-control"
											id="formUserName">
											</td>
										</tr>
										<tr>
											<th>전화번호</th>
											<td>
											<label class="sr-only" for="formTel">Password</label>
											<input type="text" name="formTel" 
											placeholder="가입시 입력한 전화번호" class="form-password form-control"
											id="formTel">
											</td>
											<td>
											<button type="button" class="btn" onclick="idSendSms()">문자발송</button>
											</td>
										</tr>
										<tr>
											<th>인증번호</th>
											<td>
											<label class="sr-only" for="formOknumber">Oknumber</label>
											<input type="text" name="formOknumber"
											placeholder="인증번호" class="form-oknumber form-control"
											id="formOknumber">
											</td>
											<td>
											<button type="button" class="btn" id="okNumBtn">인증하기</button>
											</td>
										</tr>
										
									</table>
									</c:when>
									<c:when test="${not empty search_id}">
									<br><br>
									당신의 아이디는 ${search_id }입니다.
									</c:when>
									</c:choose>
									<div class="resultArea">
										<div class="resultMsg">
											<input type="text" id="okNumRslt" value="${msg }" class="okNumBox" readonly="readonly"/>
										</div>
										<input type="hidden" name="searchId" value="${searchId }"/>
										<c:if test="${empty search_id}" >
										<button type="submit" class="btn btn-primary searchBtn" id="rcvIdBtn" disabled="disabled">ID 받기</button>
										</c:if>
									</div>
								</form>
								<div class="row2 login-form">
						          	<div >
							           	<a class="long-form-btn">
							           	<input type="hidden" id="admType" name="loginType" value="memIpSearch"> 
							           		<button type="submit" class="btn" style="background: none; color: gray;" onClick="location.href='memberlogin.action'">로그인</button>
							           	</a>
							           	<a class="long-form-btn">
							           	<input type="hidden" id="admType" name="loginType" value="join"> 
							           		 <c:choose>
							           		 <c:when  test="${searchId eq 'memIdSearch'}">
							           		 <button type="submit" class="btn" style="background: none; color: gray;" onClick="location.href='memberjoin.action'">회원가입</button>
							           		 </c:when >
							           		 <c:when  test="${searchId eq 'spaIdSearch'}">
							           		 <button type="submit" class="btn" style="background: none; color: gray;" onClick="location.href='spajoin.action'">회원가입</button>
							           		 </c:when>
							           		 </c:choose>
							           	</a>
						          	</div>
						        </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>