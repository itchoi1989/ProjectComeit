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

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$(".banDelBtn").on("click", function()
		{
			// 확인
			//alert("삭제 버튼 클릭");
			
			var lngg_ban_cd = $(this).val();
			
			if(confirm(lngg_ban_cd + "번 데이터를 삭제하시겠습니까?"))
			{
				$(location).attr("href", "bandelete.action?lngg_ban_cd=" + lngg_ban_cd);
			}
		});
		
		$(".btnCancel").on("click", function()
		{
			$("#ban").val("");
			
			$("#banForm").attr("action","banadd.action");
			$("#ban").focus();
		});
		
		// 검색 버튼 클릭 시
		$("#searchBtn").click(function()
		{
			f = document.searchForm;
			f.action = "<%=cp %>/banlist.action";
			f.submit();
			
		});
		

	});
</script>

</head>
<body>

  <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">금지어 관리</h1>
          <p class="mb-4">금지어 관리를 볼 수 있는 페이지입니다.

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">금지어 관리</h6>
            </div>
            
			<form action="banadd.action" method="post" role="form" id="banForm">
				<input type="hidden" id="admin_cd" name="admin_cd" value=${sessionScope.id }> 
				<!-- 관리자 세션 넣기 -->
				<table class="table table-bordered" style="width: 20%;" >
					<thead>
            			<tr>
            				<td>&nbsp;금지어등록</td>
            			</tr>
            		</thead>
            		<tr>
            			<td>
						<input type="text" id="ban" name="ban" class="form-control">
							<button type="submit" class="btn btn-default btn-sm">등록</button>
							<button type="button" class="btn btn-default btn-sm btnCancel">취소</button>
						</td>
					</tr>
				</table>
			</form>
			
				
				<div class="card-body">
              <div class="table-responsive">
				
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <!-- 검색 영역 -->
					<div class="form-inline search">
					
					<form name="searchForm" method="post">
						<select name="searchKey" class="form-control selectField" style="width: 20%;">
							<option value="BAN">금지어명</option>
							<option value="NAME">처리관리자</option>
						</select>
						
						<input type="text" name="searchValue" class="form-control boxTF" style="width: 70%;">
						<input type="button" value="검색" class="btn btn-primary searchBtn" id="searchBtn" style="width: 9%">
					</form>
						<!-- <input type="text" class="form-control tag" id="tag" placeholder="기술 태그">
						<input type="text" class="form-control title" id="title" placeholder="스터디방 제목">
						<button type="button" id="searchBtn" class="btn btn-primary searchBtn">검색</button> -->
					</div>
                  <thead>
                    <tr>
                      <th>등록번호</th>
                      <th>금지어</th>
                      <th>관리자명</th>
                      <th>등록일</th>
                      <th>삭제</th>
                    </tr>
                  </thead>
                  <tbody>
       
					<c:forEach var="ban" items="${banList }">
					
						<tr>
							<td>${ban.lngg_ban_cd }</td>
							<td>${ban.ban }</td>
							<td>[관리자]${ban.name }</td>
							<td>${ban.crt_date }</td>

							<td>
								<button type="button" 
								value=${ban.lngg_ban_cd } class="btn btn-default btn-xs banDelBtn">삭제</button>
							</td>
							</tr>
					</c:forEach>
					
                  </tbody>
                </table>
              </div>
              <!-- 페이징 영역 -->
				<div class="row paging" style="float: right;">
				<div class="col-md-12">
					<!-- 페이징 처리에 따른 페이지 인덱스 적용 -->
					<c:if test="${dataCount != 0 }">
						<div align="center">
							${pageIndexList }
						</div>
					</c:if>
					<!-- IMAGEBOARD 테이블에 데이터가 존재하지 않을 경우 -->
					<c:if test="${dataCount == 0 }">
						등록된 자료가 존재하지 않습니다.
					</c:if>
				</div>
				</div><!-- 페이징 영역 끝 -->
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

  

</body>

</html>
