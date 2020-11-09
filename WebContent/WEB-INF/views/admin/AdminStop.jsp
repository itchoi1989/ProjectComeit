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
<title>1_AdminStop.jsp</title>
<style type="text/css">
#btnTbl {
	text-align: center;
}
</style>
</head>
<body>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">정지회원 관리</h1>
		<p class="mb-4">
			정지회원 목록을 볼 수 있는 페이지 입니다. <a target="_blank"
				href="https://datatables.net"> official DataTables documentation</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">정지회원 목록</h6>
			</div>

			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>정지코드</th>
								<th>회원아이디</th>
								<th>정지날짜</th>
								<th>정지기간</th>
								<th>정지해제</th>
								<th>처리관리자</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>정지코드</th>
								<th>회원아이디</th>
								<th>정지날짜</th>
								<th>정지기간</th>
								<th>정지해제</th>
								<th>처리관리자</th>
							</tr>
						</tfoot>
						<tbody>
							<tr>
								<td>STOP001</td>
								<td>cacao2347</td>
								<td>2020-07-12</td>
								<td>1주일</td>
								<td id="btnTbl">
									<input type ="button" value="정지해제">
								</td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container-fluid -->



</body>

</html>