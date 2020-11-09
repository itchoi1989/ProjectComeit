<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SpaceMy.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/space/space-manage.css">
<link rel="shortcut icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<link rel="icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<%-- <link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
 --%>
<script type="text/javascript">
$(function()
		   {
			$(".spaUpdate").click(function()
	       	{
	        	$.ajax(
	  			{
	  				type : "POST"
	  				, url : "spaupdate.action"
	  			    , data : {"spa_id":$(this).val(),
	  			    	"name":$("#name").val(),
	  					"tel":$("#tel").val(),
	  					"email":$("#email").val(),
	  					} 
	  				, success : function()
	  				{
	  					alert("정보가 수정되었습니다.");
	  				}
	  				, error : function(e)
	  				{
	  					alert("정보 수정에 실패되었습니다.");
	  				}
	  			});
	        	end();
	       	});
			
});

function end() {
	location.reload();
}


</script>
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

</style>

</head>
<body>
<div class="headerrow">
	<div class="col-md-12">
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	</div>
</div>
			

<div class="container-fluid">
	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-6">

		<div class="form-inline">
				<h1 class="title">Mypage</h1>
		</div>
		
		<br />
		<c:import url="SpaceMytab.jsp"></c:import>
		
		
		</div>
		<div class="col-md-2">
			<div>
				<div class="col-md-12">
				<h4 class="sub-title member">내 정보</h4><hr>
				<div class="form-inline">
					<div class="memName">
					<h5>이름</h5>
					<p class="content">${Search.name }</p>
					<h5>아이디</h5>
					<p class="content">${Search.spa_id }</p>
					<h5>전화번호</h5>
					<p class="content">${Search.tel }</p>
					<h5>이메일</h5>
					<p class="content">${Search.email }</p>
					</div>
				</div>
				<button type="button" class="btn btn-primary aa" data-toggle="modal" data-target="#myModal">정보수정</button>
				</div>
			</div>
		</div>
		
		
	</div>
</div>
<!-- 정보 수정 모달창 -->
<div id="myModal" class="modal fade" role="dialog"> 
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">x</button>
        <h4 class="modal-title">정보 수정</h4>
      </div>
      <div class="modal-body">
      	<p>이름 : <input type="text" id="name" name="name" value=${Search.name }></p>
      	<p>전화번호 : <input type="text" id="tel" name="tel" value=${Search.tel }></p>
      	<p>이메일 : <input type="text" id="email" name="email" value=${Search.email }></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" value="${Search.spa_id }" class="btn btn-primary spaUpdate">Update</button>
      </div>
    </div>
  </div>
</div>
<div class="row" style="margin-top: 250pt;">
	<div class="col-md-12">
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	</div>
</div>
</body>
</html>