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
<title>1_AdminList.jsp</title>
<style type="text/css">

	#btnTbl
	{
		text-align : center;
	}

</style>
<script type="text/javascript">

	$(document).ready(function()
	{
		$(".adminDelBtn").on("click", function()
		{
			// 확인
			//alert("삭제 버튼 클릭");
			
			var admin_cd = $(this).val();
			
			if(confirm(admin_cd + "번 데이터를 삭제하시겠습니까?"))
			{
				$(location).attr("href", "admindelete.action?admin_cd=" + admin_cd);
			}
		});
		
		
	});
</script>
</head>
<body>

  <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">관리자 명단</h1>
          <p class="mb-4">관리자 명단을 볼 수 있는 페이지입니다.

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">관리자명단</h6>
            </div>
            
            <c:if test="${sessionScope.id == 'ADM1001'}">
            <div class="card-body">
            	<div class="table-responsive">
            	<form action="adminadd.action" method="post" role="form" id="adminForm">
            		<table class="table table-bordered">
	            		<thead>
	            			<tr>
	            				<td>이름</td>
	            				<td>전화번호</td>
	            				<td>이메일</td>
	            				<td>등록</td>
	            			</tr>
	            		</thead>
	            			<tr>
	            				<td>
	            					<input type="text" id="name" name="name" class="form-control">
	            				</td>
	            				<td>
	            					<input type="tel" id="tel" name="tel" class="form-control">
	            				</td>
	            				<td>
	            					<input type="email" id="email" name="email" class="form-control">
	            				</td>
	            				<td id="btnTbl">
	            					<button type="submit" class="btn btn-default btn-sm adminAddBtn">등록</button>
	            				</td>
	            			</tr>
	            	</table>
	            	</form>
            	</div>
            </div>
            </c:if>
            
            
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>아이디</th>
                      <th>이름</th>
                      <th>전화번호</th>
                      <th>이메일</th>
                      <th>관리자등급</th>
                      <c:if test="${sessionScope.id == 'ADM1001'}">
                      <th>삭제</th>
                      </c:if>
                    </tr>
                  </thead>
                  <tbody>
       
                    <!-- name, id, email, tel, manpen, addr, qual, stadate, enddate -->
                    
					<c:forEach var="admin" items="${adminList }">
					
						<tr>
							<td>${admin.admin_cd }</td>
							<td>${admin.name }</td>
							<td>${admin.tel }</td>
							<td>${admin.email }</td>
							<td>${admin.grds_name }</td>
							
							<c:if test="${sessionScope.id == 'ADM1001'}">
							<td id="btnTbl">	
								<button type="button" class="btn btn-default btn-xs adminDelBtn" value=${admin.admin_cd }>삭제</button>
							</td>
							</c:if>
							
					</c:forEach>
					
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

  

</body>

</html>
