<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=cp %>/assets/css/common/login.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

<!-- 파비콘 -->
<link rel="shortcut icon" href="<%=cp %>/assets/images/pen_1.ico"
	type="image/x-icon">
<link rel="icon" href="<%=cp %>/assets/images/pen_1.ico"
	type="image/x-icon">

<!-- 글꼴 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<style type="text/css">
body {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<script type="text/javascript">
	$(document).ready(function () {
		
	    var navListItems = $('div.setup-panel div a'),
	        allWells = $('.setup-content'),
	        allNextBtn = $('.nextBtn');
	
	    allWells.hide();
	
	    navListItems.click(function (e) {
	        e.preventDefault();
	        var $target = $($(this).attr('href')),
	            $item = $(this);
	
	        if (!$item.hasClass('disabled')) {
	            navListItems.removeClass('btn-success').addClass('btn-default');
	            $item.addClass('btn-success');
	            allWells.hide();
	            $target.show();
	            $target.find('input:eq(0)').focus();
	        }
	    });
	
	    allNextBtn.click(function () {
	        var curStep = $(this).closest(".setup-content"),
	            curStepBtn = curStep.attr("id"),
	            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
	            curInputs = curStep.find("input[type='text'],input[type='url']"),
	            isValid = true;
	
	        $(".form-group").removeClass("has-error");
	        for (var i = 0; i < curInputs.length; i++) {
	            if (!curInputs[i].validity.valid) {
	                isValid = false;
	                $(curInputs[i]).closest(".form-group").addClass("has-error");
	            }
	        }
	
	        if (isValid) nextStepWizard.removeAttr('disabled').trigger('click');
	    });
	
	    $('div.setup-panel div a.btn-success').trigger('click');
	});

	jQuery(document).ready(function(){
	    var select = $("select#mm");
	    select.change(function(){
	        var select_name = $(this).children("option:selected").text();
	        $(this).siblings("label").text(select_name);
	    });
	});
	
	$(document).ready(function () {

		// 회원 아이디 찾기
        $("#memSearchIdBtn").click(function() 
        {
				$("#LoginMemForm").attr("action", "searchid.action");
		});
		
    	// 회원 비밀번호 찾기
        $("#memSearchPwdBtn").click(function() 
        {
				$("#LoginMemForm").attr("action", "searchpwd.action");
		});
		
    	// 일반 회원가입
        $("#memJoinBtn").click(function() 
        {
				$("#LoginMemForm").attr("action", "memberjoin.action");
		});
        
		// 업체 아이디
        $("#spaSearchIdBtn").click(function() 
        {
				$("#LoginSpaForm").attr("action", "searchid.action");
		});
		
    	// 업체 비밀번호
        $("#spaSearchPwdBtn").click(function() 
        {
				$("#LoginSpaForm").attr("action", "searchpwd.action");
		});
		
    	// 업체 회원가입
        $("#spaJoinBtn").click(function() 
        {
				$("#LoginSpaForm").attr("action", "spacejoin.action");
		});
        
      
        
        
    });



</script>
</head>

<body>

	<div class="container register">
		<div class="row">
			<div class="col-md-3 register-left">
				<img src="<%=cp %>/assets/images/data.png" alt="" />
				<h3>Welcome</h3>
				<p>COME-IT에 오신걸 환영합니다. 지금 바로 로그인하세요!</p>
				<input type="submit" name="" value="메인페이지"
					onClick="location.href='mainpage.action'" /><br />
			</div>
			<div class="col-md-9 register-right">
				<ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
					<li class="nav-item" value="1"><a class="nav-link active"
						id="mem-tab" data-toggle="tab" href="#mem" role="tab"
						aria-controls="mem" aria-selected="true">회원</a></li>
					<li class="nav-item" value="2"><a class="nav-link"
						id="spa-tab" data-toggle="tab" href="#spa" role="tab"
						aria-controls="spa" aria-selected="false">업체</a></li>
					<li class="nav-item" value="3"><a class="nav-link"
						id="adm-tab" data-toggle="tab" href="#adm" role="tab"
						aria-controls="adm" aria-selected="false">관리자</a></li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="mem" role="tabpanel"
						aria-labelledby="mem-tab">
						<div class="col-sm-6 col-sm-offset-3 form-box login">
							<div class="form-top">
								<div class="form-top-left">
									<h3>회원 Login</h3>
									<br>
									<p>Enter your username and password to log on:</p>
								</div>
								<div class="form-top-right"></div>
							</div>
							<div class="form-bottom">
								<form role="form" action="login.action" method="post"
									class="login-form">
									<div class="form-group">
										<input type="hidden" id="memType" name="loginType" value="0">
										<label class="sr-only" for="formUsername">Username</label> <input
											type="text" name="formUsername" placeholder="UserId..."
											class="form-username form-control" id="formUsername">
									</div>
									<div class="form-group">
										<label class="sr-only" for="formPassword">Password</label> <input
											type="password" name="formPassword" placeholder="Password..."
											class="form-password form-control" id="formPassword">
									</div>
									<input type="hidden" name="" id="loginMsg" value="${loginMsg }"/>
									<button type="submit" class="btn signInBtn">Sign in!</button>
								</form>
								<form name="LoginMemForm" id="LoginMemForm">
									<div class="row2 login-form">
										<div>
											<a class="long-form-btn"> <input type="hidden"
												id="memSearchId" name="searchId" value="memIdSearch">
												<button type="submit" class="btn" id="memSearchIdBtn"
													style="background: none; color: gray;">ID찾기</button>
											</a> <a class="long-form-btn"> <input type="hidden"
												id="memSearchPwd" name="searchPwd" value="memPwdSearch">
												<button type="submit" class="btn" id="memSearchPwdBtn"
													style="background: none; color: gray;">PW 찾기</button>
											</a> <a class="long-form-btn"> 
											
											<input type="hidden" id="memJoin" name="joinType" value="memJoin">
												<button type="submit" class="btn" id="memJoinBtn"
													style="background: none; color: gray;">회원가입</button>
											</a>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="tab-pane fade show" id="spa" role="tabpanel"
						aria-labelledby="spa-tab">
						<div class="col-sm-6 col-sm-offset-3 form-box login">
							<div class="form-top">
								<div class="form-top-left">
									<h3>업체 Login</h3>
									<br>
									<p>Enter your username and password to log on:</p>
								</div>
								<div class="form-top-right"></div>
							</div>
							<div class="form-bottom">
								<form role="form" action="login.action" method="post"
									class="login-form">
									<div class="form-group">
										<label class="sr-only" for="formSpaName">Username</label> <input
											type="hidden" id="spaType" name="loginType" value="1">
										<input type="text" name="formUsername"
											placeholder="Username..." class="form-username form-control"
											id="formSpaName">
									</div>
									<div class="form-group">
										<label class="sr-only" for="formSpaPassword">Password</label>
										<input type="password" name="formPassword"
											placeholder="Password..." class="form-password form-control"
											id="formSpaPassword">
									</div>
									<button type="submit" class="btn">Sign in!</button>
								</form>
								<form name="LoginSpaForm" id="LoginSpaForm">
									<div class="row2 login-form">
										<div>
											<a class="long-form-btn"> <input type="hidden"
												id="spaSearchId" name="searchId" value="spaIdSearch">
												<button type="submit" class="btn" id="spaSearchIdBtn"
													style="background: none; color: gray;">ID찾기</button>
											</a> <a class="long-form-btn"> <input type="hidden"
												id="spaSearchPwd" name="searchPwd" value="spaPwdSearch">
												<button type="submit" class="btn" id="spaSearchPwdBtn"
													style="background: none; color: gray;">PW 찾기</button>
											</a> <a class="long-form-btn"> <input type="hidden" id="spaJoin" name="joinType" value="spaJoin">
												<button type="submit" class="btn" id="spaJoinBtn"
													style="background: none; color: gray;">회원가입</button>
											</a>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="tab-pane fade show" id="adm" role="tabpanel"
						aria-labelledby="adm-tab">
						<div class="col-sm-6 col-sm-offset-3 form-box login">
							<div class="form-top">
								<div class="form-top-left">
									<h3>관리자 Login</h3>
									<br>
									<p>Enter your username and password to log on:</p>
								</div>
								<div class="form-top-right"></div>
							</div>
							<div class="form-bottom">
								<form role="form" action="login.action" method="post"
									class="login-form">
									<div class="form-group">
										<label class="sr-only" for="formAdminName">Username</label> <input
											type="hidden" id="admType" name="loginType" value="2">
										<input type="text" name="formUsername"
											placeholder="Username..." class="form-username form-control"
											id="formAdminName">
									</div>
									<div class="form-group">
										<label class="sr-only" for="formAdmPassword">Password</label>
										<input type="password" name="formPassword"
											placeholder="Password..." class="form-password form-control"
											id="formAdmPassword">
									</div>
									<button type="submit" class="btn">Sign in!</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
</body>

</html>