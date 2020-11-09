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
<title>1_AdminRefund.jsp</title>
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
		<h1 class="h3 mb-2 text-gray-800">환불 거부사유 목록</h1>
		<p class="mb-4">
			환불 거부 사유 목록을 볼 수 있는 페이지 입니다. <a target="_blank"
				href="https://datatables.net"> official DataTables documentation</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">환불 거부 사유 목록</h6>
			</div>

			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>환불코드</th>
								<th>강의코드</th>
								<th>회원아이디</th>
								<th>환불요청금액</th>
								<th>거절사유</th>
								<th>거절일자</th>
								<th>관리자</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>환불코드</th>
								<th>강의코드</th>
								<th>회원아이디</th>
								<th>환불요청금액</th>
								<th>거절사유</th>
								<th>거절일자</th>
								<th>관리자</th>
							</tr>
						</tfoot>
						<tbody>
							<tr>
								<td>RFND001</td>
								<td>LEC0001</td>
								<td>cacao2347</td>
								<td>100,000</td>
								<td>관리자 미확인</td>
								<td>2020-06-12</td>
								<td>[관리자] SYSTEM</td>
							</tr>
							<tr>
								<td>RFND001</td>
								<td>LEC0001</td>
								<td>cacao2347</td>
								<td>100,000</td>
								<td>관리자 미확인</td>
								<td>2020-06-12</td>
								<td>[관리자] SYSTEM</td>
							</tr>
							<tr>
								<td>RFND002</td>
								<td>LEC0002</td>
								<td>kjuk2347</td>
								<td>100,000</td>
								<td>환불사유가 인정되지 않음.</td>
								<td>2020-06-13</td>
								<td>[관리자] 신재민</td>
							</tr>
							<tr>
								<td>RFND003</td>
								<td>LEC0003</td>
								<td>cacao2347</td>
								<td>100,000</td>
								<td>환불사유가 인정되지 않음.</td>
								<td>2020-06-14</td>
								<td>[관리자] 신재민</td>
							</tr>
							<tr>
								<td>RFND004</td>
								<td>LEC0004</td>
								<td>cacao2347</td>
								<td>100,000</td>
								<td>관리자 미확인</td>
								<td>2020-06-12</td>
								<td>[관리자] SYSTEM</td>
							</tr>
							<tr>
								<td>RFND005</td>
								<td>LEC0005</td>
								<td>cacao2347</td>
								<td>100,000</td>
								<td>관리자 미확인</td>
								<td>2020-06-12</td>
								<td>[관리자] SYSTEM</td>
							</tr>
							<tr>
								<td>RFND006</td>
								<td>LEC0006</td>
								<td>cacao2347</td>
								<td>100,000</td>
								<td>관리자 미확인</td>
								<td>2020-06-12</td>
								<td>[관리자] SYSTEM</td>
							</tr>
							<tr>
								<td>RFND007</td>
								<td>LEC0007</td>
								<td>cacao2347</td>
								<td>100,000</td>
								<td>관리자 미확인</td>
								<td>2020-06-12</td>
								<td>[관리자] SYSTEM</td>
							</tr>
							<tr>
								<td>RFND008</td>
								<td>LEC0008</td>
								<td>cacao2347</td>
								<td>100,000</td>
								<td>관리자 미확인</td>
								<td>2020-06-12</td>
								<td>[관리자] SYSTEM</td>
							</tr>
							<tr>
								<td>RFND009</td>
								<td>LEC0009</td>
								<td>cacao2347</td>
								<td>100,000</td>
								<td>관리자 미확인</td>
								<td>2020-06-12</td>
								<td>[관리자] SYSTEM</td>
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