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
		<h1 class="h3 mb-2 text-gray-800">환불 관리</h1>
		<p class="mb-4">
			환불 목록을 볼 수 있는 페이지입니다. <a target="_blank"
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
								<th>환불코드</th>
								<th>강의코드</th>
								<th>회원아이디</th>
								<th>환불요청일</th>
								<th>환불요청금액</th>
								<th>처리상태</th>
								<th>처리일자</th>
								<th>확인</th>
								<th>관리자</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>환불코드</th>
								<th>강의코드</th>
								<th>회원아이디</th>
								<th>환불요청일</th>
								<th>환불요청금액</th>
								<th>처리상태</th>
								<th>처리일자</th>
								<th>확인</th>
								<th>관리자</th>
							</tr>
						</tfoot>
						<tbody>
							<tr>
								<td><a href="admin_refund_detail.action">RFND001</a></td>
								<td>LEC0001</td>
								<td>abc132</td>
								<td>2020-07-12</td>
								<td>150,000</td>
								<td></td>
								<td></td>
								<td id="btnTbl"><button type="button" id="adminCheckBtn">확인</button></td>
								<td></td>
							</tr>
							<tr>
								<td>RFND002</td>
								<td>LEC0002</td>
								<td>ajh132</td>
								<td>2020-07-12</td>
								<td>150,000</td>
								<td></td>
								<td></td>
								<td id="btnTbl"><button type="button" id="adminCheckBtn">확인</button></td>
								<td></td>
							</tr>
							<tr>
								<td>RFND001</td>
								<td>LEC0001</td>
								<td>abc132</td>
								<td>2020-07-12</td>
								<td>150,000</td>
								<td></td>
								<td></td>
								<td id="btnTbl"><button type="button" id="adminCheckBtn">확인</button></td>
								<td></td>
							</tr>
							<tr>
								<td>RFND001</td>
								<td>LEC0001</td>
								<td>abc132</td>
								<td>2020-07-12</td>
								<td>150,000</td>
								<td></td>
								<td></td>
								<td id="btnTbl"><button type="button" id="adminCheckBtn">확인</button></td>
								<td></td>
							</tr>
							<tr>
								<td>RFND001</td>
								<td>LEC0001</td>
								<td>abc132</td>
								<td>2020-07-12</td>
								<td>150,000</td>
								<td></td>
								<td></td>
								<td id="btnTbl"><button type="button" id="adminCheckBtn">확인</button></td>
								<td></td>
							</tr>
							<tr>
								<td>RFND001</td>
								<td>LEC0001</td>
								<td>abc132</td>
								<td>2020-07-12</td>
								<td>150,000</td>
								<td></td>
								<td></td>
								<td id="btnTbl"><button type="button" id="adminCheckBtn">확인</button></td>
								<td></td>
							</tr>
							<tr>
								<td>RFND001</td>
								<td>LEC0001</td>
								<td>abc132</td>
								<td>2020-07-12</td>
								<td>150,000</td>
								<td></td>
								<td></td>
								<td id="btnTbl"><button type="button" id="adminCheckBtn">확인</button></td>
								<td></td>
							</tr>
							<tr>
								<td>RFND001</td>
								<td>LEC0001</td>
								<td>abc132</td>
								<td>2020-07-12</td>
								<td>150,000</td>
								<td></td>
								<td></td>
								<td id="btnTbl"><button type="button" id="adminCheckBtn">확인</button></td>
								<td></td>
							</tr>
							<tr>
								<td>RFND001</td>
								<td>LEC0001</td>
								<td>abc132</td>
								<td>2020-07-12</td>
								<td>150,000</td>
								<td></td>
								<td></td>
								<td id="btnTbl"><button type="button" id="adminCheckBtn">확인</button></td>
								<td></td>
							</tr>
							<tr>
								<td>RFND001</td>
								<td>LEC0001</td>
								<td>abc132</td>
								<td>2020-07-12</td>
								<td>150,000</td>
								<td></td>
								<td></td>
								<td id="btnTbl"><button type="button" id="adminCheckBtn">확인</button></td>
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