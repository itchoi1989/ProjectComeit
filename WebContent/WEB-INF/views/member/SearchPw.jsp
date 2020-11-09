<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchPw.jsp</title>
<link rel="stylesheet" href="<%=cp %>/assets/css/common/searchpw.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>


<!-- 파비콘 -->
<link rel="shortcut icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<link rel="icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">

<!-- 글꼴 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style type="text/css">
body{font-family: 'Noto Sans KR', sans-serif;}

.login
{
   max-width: 70% !important;
   padding: 0px !important;
}

.okNumBox
{
	border: none;
	color: red;
	font-weight: bold;
	background-color: transparent;
	width: 
}


</style>
<script type="text/javascript">

	var phoneCheck = "";
	
	$(function() {
		
		
		// 정보 입력 후 정보확인 버튼 클릭 시 정보 체크 
		$("#infoCheck").click(function() 
		{
			$("#snedForm").attr("action", "searchpwdcheck.action");	
		});
		
		
		
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
		
		
		// PW 버튼 클릭 시 
		$("#rcvIdBtn").click(function() 
		{
			$(location).attr("href", "pwdsendsms.action?tel=" + $(this).val());			
		});
		
			
	})
	
	

	
	// 문자 발송 설정
	function idSendSms() 
	{
		phoneCheck = "";
		alert("phoneCheck_bf : " + phoneCheck);

		
		$.ajax({
			url : "<%=cp%>/idsendsms.action",
			data : {
				receiver:$("#formTel").val()
			},
			type: "post",
			success: function(result) {
				phoneCheck = result;
				alert("result : " + result);
				alert("phoneCheck_af : " + phoneCHeck);
			}
		});
	}

</script>
</head>

<body>
<c:set var = "searchPwd" scope = "session" value = "${sessionScope.searchPwd }"/>
   <div class="container register">
      <div class="row">
         <div class="col-md-3 register-left">
            <img src="<%=cp %>/assets/images/data.png" alt="" />
            <h3>Welcome</h3>
            <p>COME-IT에 가입하세요!</p>
            <input type="submit" name="loginview" value="로그인하기" onClick="location.href='memberlogin.action'" /><br />
         </div>
         <div class="col-md-9 register-right">
            <div class="col-sm-6 col-sm-offset-3 form-box login">
               <div class="form-top">
                  <div class="form-top-left">
                  
                   <c:choose>
                        <c:when  test="${searchPwd eq 'memPwdSearch'}">
                     <h3>회원 PW 찾기</h3>
                   </c:when>
                   <c:when  test="${searchPwd eq 'spaPwdSearch'}">
                      <h3>업체 PW 찾기</h3>
                   </c:when>
                   </c:choose>
                     
                     <br>
                     <p>가입시 입력한 실명, 아이디, 전화번호를 입력해 주세요.<br>패스워드 찾기 성공시 인증한 번호로 새로운 패스워드를 발송합니다.</p>
                  </div>
                  <div class="form-top-right"></div>
               </div>
               <div class="form-bottom">
                  <form method="post" class="login-form" id="snedForm">
                     <table class="inputForm">
                   
                        <tr>
                           <th>실명</th>
                           <td>
                           <label class="sr-only" for="formUserName">Username</label>
                           <input type="text" name="formUserName"
                           placeholder="가입시 입력한 실명" class="form-username form-control"
                           id="formUserName" value="${infoDto.name }">
                           </td>
                        </tr>
                        <tr>
                           <th>아이디</th>
                           <c:if test="${searchPwd eq 'memPwdSearch'}">
                           <td>
                           <label class="sr-only" for="formUserId">UserId</label>
                           <input type="text" name="formUserId"
                           placeholder="가입시 입력한 아이디" class="form-userid form-control"
                           id="formUserId" value="${infoDto.id }">
                           </td>
                           </c:if>
                           
                            <c:if test="${searchPwd eq 'spaPwdSearch'}">
                           <td>
                           <label class="sr-only" for="formUserId">UserId</label>
                           <input type="text" name="formUserId"
                           placeholder="가입시 입력한 아이디" class="form-userid form-control"
                           id="formUserId" value="${infoDto.spa_id }">
                           </td>
                           </c:if>
                           
                        </tr>
                        <tr>
                           <th>전화번호</th>
                           <td>
                           <label class="sr-only" for="formTel">Password</label>
                           <input type="text" name="formTel"
                           placeholder="가입시 입력한 전화번호" class="form-password form-control"
                           id="formTel" value="${infoDto.tel }">
                           </td>
                           <td>
                           <input type="hidden" name="searchPwd" value="${searchPwd }"/>
                           <button type="submit" class="btn" id="infoCheck">정보확인</button>
                           <button type="button" class="btn" id="msgSend" onclick="idSendSms()">문자발송</button>
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
                     <div class="resultArea">
                        <div class="resultMsg">
                        	<input type="text" id="okNumRslt" value="${msg }" class="okNumBox" readonly="readonly"/>
                        </div>
                        <input type="hidden" name="ldPwd" value="${pwd }"/>
                        <input type="hidden" name="searchPwd" value="${searchPwd }"/>
                        <button type="button" class="btn btn-primary searchBtn" id="rcvIdBtn" disabled="disabled"
                        value="${infoDto.tel }">PW 받기</button>
                     </div>
                  </form>
                  <div class="row2 login-form">
                         <div >
                          <a class="long-form-btn">
                          <input type="hidden" id="admType" name="loginType" value="memIpSearch"> 
                             <button type="submit" class="btn" style="background: none; color: gray;" onClick="location.href='memberlogin.action'">로그인</button>
                          </a>
<!--                           <a class="long-form-btn">
                          <input type="hidden" id="admType" name="loginType" value="memPwdSearch"> 
                             <button type="submit" class="btn" style="background: none; color: gray;" onClick="location.href='searchId.action'">ID 찾기</button>
                          </a> -->
                          <a class="long-form-btn">
                          <input type="hidden" id="admType" name="loginType" value="join"> 
                              <c:choose>
                              <c:when  test="${searchPwd eq 'memPwdSearch'}">
                              <button type="submit" class="btn" style="background: none; color: gray;" onClick="location.href='memberjoin.action'">회원가입</button>
                              </c:when >
                              <c:when  test="${searchPwd eq 'spaPwdSearch'}">
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
</body>

</html>