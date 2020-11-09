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
<title>1_AdminReport.jsp</title>
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
		$(".adminBtn").on("click", function()
		{
			// 확인
			alert("확인 되었습니다.");
			
			var stu_rep_cd = $(this).val();
			
			alert(stu_rep_cd);
			
			$.post("ajaxsrcheck.action",
	        {
				stu_rep_cd : $(this).val()
	        }
			, function(data)
	        {
	           alert(data);
	        });
			
			//새로고침
			setTimeout('location.reload()',0);
			
		});
		
		$(".okBtn").on("click", function()
		{
			var result = confirm("정말 승인하시겠습니까?");
			
			if(result)
			{
				
				alert("승인 되었습니다.");
				
				$.post("ajaxsrconfirm.action",
		        {
					admin_cd : '${sessionScope.id}'
					,stu_rep_cd : $(this).val()
					,check_type_cd : 'CHET1001'
					, prcs_rsn : '승인되었습니다'
		        }
				, function(data)
		        {
		           alert(data);
		        });
				
			}
			else if(result==null)
			{
				return;
			}
			
			//새로고침
			setTimeout('location.reload()',0);
					
		});
		
		$(".noBtn").on("click", function()
		{
			var result = confirm("정말 거부하시겠습니까?");
			
			var admin_cd = '${sessionScope.id}';
			var stu_rep_cd = $(this).val();
				
			if(result)
			{
				$(".btn-primary").click(function()
				{
					
					$.post("ajaxsrconfirm.action",
			        {
						admin_cd : admin_cd
						,stu_rep_cd : stu_rep_cd
						,check_type_cd : 'CHET1002'
						, prcs_rsn : $("#prcsRsn").val()
						
			        }
					, function(data)
			        {
			           alert(data);
			           //alert("거부 되었습니다.");
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
		
		// 검색 버튼 클릭 시
		<%-- $("#searchBtn").click(function()
		{
			f = document.searchForm;
			f.action = "<%=cp %>/admin_com_appeal_list.action";
			f.submit();
			
		}); --%>
		
		
	});
	
	
	
</script>

</head>
<body>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">신고 목록</h1>
		<p class="mb-4">
			신고 목록을 볼 수 있는 페이지 입니다. <a target="_blank"
				href="https://datatables.net"> official DataTables documentation</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">신고 목록</h6>
			</div>

			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>신고코드</th>
								<th>신고날짜</th>
								<th>신고사유</th>
								<th>신고한 아이디</th>
								<th>신고 스터디방 제목</th>
								<th>신고 유형</th>
								<th>요청확인</th>
								<th>처리 날짜</th>
								<th>관리자</th>
								<!-- <th>처리사유</th> -->
							</tr>
						</thead>
						<tbody>
						<c:forEach var="admstureqList" items="${admstureqList }">
						<tr>
						<td>${admstureqList.stu_rep_cd }</td>
						<td>${admstureqList.rep_date }</td>
						<td>${admstureqList.rep_rsn }</td>
						<td>${admstureqList.mem_id }</td>
						<td>${admstureqList.title }</td>
						
						<td>${admstureqList.type_name }</td>
						
						<td>
						<c:if test="${admstureqList.check_type_cd == null}">
						<button type="button" class="adminBtn" 
						value=${admstureqList.stu_rep_cd }>확인</button>
						</c:if>
						
						<c:if test="${admstureqList.check_type_cd == 'CHET1003'}">
						<button type="button" id="okBtn" class="okBtn" 
						value=${admstureqList.stu_rep_cd }>승인</button>
						<%-- <button type="button" id="noBtn" class="noBtn" value=${admstureqList.stu_rep_cd }>거부</button> --%>
						<button type="button" id="noBtn" class="noBtn" data-toggle="modal" data-target="#staticBackdrop"
						value=${admstureqList.stu_rep_cd }>거부</button>
						</c:if>
						
						
						<c:if test="${admstureqList.check_type_cd == 'CHET1001'}">
							승인완료
						</c:if>
						<c:if test="${admstureqList.check_type_cd == 'CHET1002'}">
							거부완료
						</c:if>
						</td>
						
						<td>
						<c:if test="${admstureqList.prcs_date == null}">
						미확인
						</c:if>
						<c:if test="${admstureqList.prcs_date != null}">
						${admstureqList.prcs_date }
						</c:if>
						</td>
					
						<td>
						<c:if test="${admstureqList.admin_cd == null}">
						미확인
						</c:if>
						<c:if test="${admstureqList.admin_cd != null}">
						${admstureqList.name }
						</c:if>
						</td>
						
						<%-- <td>
						<c:if test="${admstureqList.admin_cd == null}">
						미확인
						</c:if>
						<c:if test="${admstureqList.admin_cd != null}">
						${admstureqList.prcs_rsn }
						</c:if>
						</td> --%>
						
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
	        <h5 class="modal-title mTit" id="staticBackdropLabel">거부 사유</h5>
	        <button type="button" class="close xBtn" data-dismiss="modal" aria-label="Close">
	        X
	        </button>
	      </div>
	      <div class="modal-body mbody">
	      	
	      	
	      	<table class="table" style="margin-top: 30px;">
	      		
	      		<tr>
	      			<td style="border-top:none"><div class="rsnTit">사유</div></td>
	      			<td style="border-top:none">
	      				<input type="text" class="form-control" id="prcsRsn" style="width: 300px;" placeholder="예) 신고와는 거리가 멉니다.">
	      			</td>
	      		</tr>
	      	</table>
	      	
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="reqSubmitN" class="btn btn-primary">확인</button>
	      </div>
	    </div>
	  </div>
	</div><!-- 모달 끝  -->


</body>

</html>