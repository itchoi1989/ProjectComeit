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
	text-align: center;
}
</style>
</head>
<body>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">강사 명단</h1>
		<p class="mb-4">
			강사 명단을 볼 수 있는 페이지입니다. <a target="_blank"
				href="https://datatables.net"> official DataTables documentation</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">강사명단</h6>
			</div>

			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>강사코드</th>
								<th>이름</th>
								<th>아이디</th>
								<th>이메일</th>
								<th>전화번호</th>
								<th>매너연필</th>
								<th>은행명</th>
								<th>계좌번호</th>
								<th>강사등록일</th>
								<th>강사박탈일</th>
							</tr>
						</thead>
						<tbody>
						
						<!-- mem_id, name, email. tel, joindate -->
                    
	                   <c:forEach var="pro" items="${admproList }">
						<tr>
							<td>${pro.prof_cd }</td>
							<td>${pro.name}</td>
							<td>${pro.id}</td>
							<td>${pro.email}</td>
							<td>${pro.tel}</td>
							<td>없음</td>
							<td>${pro.bank_name }</td>
							<td>${pro.acnt_num }</td>
							<td>${pro.crt_date }</td>
							<td>없음</td>
						</tr>
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