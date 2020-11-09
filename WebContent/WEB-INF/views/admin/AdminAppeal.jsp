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
<title>1_AdminAppeal.jsp</title>
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
		<h1 class="h3 mb-2 text-gray-800">항소 관리</h1>
		<p class="mb-4">
			항소 목록을 볼 수 있는 페이지 입니다. <a target="_blank"
				href="https://datatables.net"> official DataTables documentation</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">항소 목록</h6>
			</div>

			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>항소코드</th>
								<th>항소사유</th>
								<th>항소이름</th>
								<th>항소아이디</th>
								<th>항소날짜</th>
								<th>승인/거부</th>
								<th>처리상태</th>
								<th>처리관리자</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>항소코드</th>
								<th>항소사유</th>
								<th>항소이름</th>
								<th>항소아이디</th>
								<th>항소날짜</th>
								<th>승인/거부</th>
								<th>처리상태</th>
								<th>처리관리자</th>
							</tr>
						</tfoot>
						<tbody>
							<tr>
								<td>APL0001</td>
								<td>억울합니다 풀어주세요.</td>
								<td>항소1</td>
								<td>cacao2347</td>
								<td>2020-07-12</td>
								<td id="btnTbl">
									<input type ="button" value="승인">
									<input type ="button" value="거부">
								</td>
								<td></td>
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