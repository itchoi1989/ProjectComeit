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
<title>1_AdminCal.jsp</title>
<style type="text/css">
#btnTbl 
{
	text-align: center;
}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{		
		$(".calBtn").on("click", function()
		{
			var result = confirm("정산 처리하시겠습니까?");
			
			var admin_cd = '${sessionScope.id}';
			var lec_cd = $(this).val();
			
			if(result)
			{
				$(".btn-primary").click(function()
				{
					
					$.post("leccaladd.action",
			        {
						admin_cd : admin_cd
						,lec_cd : lec_cd
						, cal_fee : $("#cal_fee").val()
						
			        }
					, function(data)
			        {
			           alert(data);
			        });
					//새로고침
					setTimeout('location.reload()',0);
					
				});
			}
			else if(result==null)
			{
				return;
			}
			
			
		});
		
	});
		
</script>		
</head>
<body>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">정산 관리</h1>
		<p class="mb-4">
			정산 목록을 볼 수 있는 페이지입니다. <a target="_blank"
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
								<th>강의코드</th>
								<th>강사아이디</th>
								<th>수익금액</th>
								<th>환불금액</th>
								<th>정산금액</th>
								<th>정산일자</th>
								<th>정산처리</th>
								<th>관리자</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="cal"  items="${calList }">
							<tr>
								<td>${cal.lec_cd }</td>
								<td>${cal.mem_id }</td>
								<td>${cal.profit }</td>
								<td>${cal.rfnd_fee }</td>
								
								<td>
								<c:if test="${cal.admin_cd == null}">
								미확인
								</c:if>
								<c:if test="${cal.admin_cd != null}">
								${cal.cal_fee }
								</c:if>
								</td>
								
								<td>
								<c:if test="${cal.admin_cd == null}">
								미확인
								</c:if>
								<c:if test="${cal.admin_cd != null}">
								${cal.cal_date }
								</c:if>
								</td>
								
								<td>
								<c:if test="${cal.admin_cd == null}">
								<button type="button" id="calBtn" class="calBtn" 
								data-toggle="modal" data-target="#staticBackdrop"
								value=${cal.lec_cd }>정산하기</button>
								</c:if>
								<c:if test="${cal.admin_cd != null}">
								정산완료
								</c:if>
								</td>
								<td>
								<c:if test="${cal.admin_cd != null}">
								${cal.admin_cd }
								</c:if>
								<c:if test="${cal.admin_cd == null}">
								미확인
								</c:if>
								</td>
								
							</tr>
						</c:forEach>	
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container-fluid -->

	<!-- 모달 -->
	<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header head">
	        <h5 class="modal-title mTit" id="staticBackdropLabel">정산 처리</h5>
	        <button type="button" class="close xBtn" data-dismiss="modal" aria-label="Close">
	        X
	        </button>
	      </div>
	      <div class="modal-body mbody">
	      	
	      	
	      	<table class="table" style="margin-top: 30px;">
	      		
	      		<tr>
	      			<td style="border-top:none"><div class="rsnTit">정산금액</div></td>
	      			<td style="border-top:none">
	      				<input type="number" class="form-control" id="cal_fee" style="width: 300px;" placeholder="예)정산금액을 입력해주세요.">
	      			</td>
	      		</tr>
	      	</table>
	      	
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="calSubmit" class="btn btn-primary">확인</button>
	      </div>
	    </div>
	  </div>
	</div><!-- 모달 끝  -->

</body>

</html>