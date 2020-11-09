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
<title>AdminMemList.jsp</title>
</head>
<body>

  <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">회원명단</h1>
          <p class="mb-4">회원의 명단을 볼 수 있는 페이지입니다.

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">회원명단</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>회원코드</th>
                      <th>이름</th>
                      <th>아이디</th>
                      <th>이메일</th>
                      <th>전화번호</th>
                      <th>매너연필(cm)</th>
                      <th>강사자격유무</th>
                      <th>회원주소</th>
                      <th>시작일</th>
                      <th>탈퇴일</th>
                    </tr>
                  </thead>
                  <tbody>
       
                    <!-- mem_id, name, email. tel, joindate -->
                    
                    <c:forEach var="mem" items="${admmemList }">
						<tr>
							<td>${mem.mem_cd }</td>
							<td>${mem.id }</td>
							<td>${mem.name }
							<td>${mem.email }</td>
							<td>${mem.tel }</td>
							<td>없음</td>
							<td>
							<c:if test="${mem.prof_cd == null}">
							무
							</c:if>
							<c:if test="${mem.prof_cd != null}">
							유							
							</c:if>
							</td>
							<td>${mem.area_name} ${mem.spc_area_name}</td>
							<td>${mem.join_date}</td>
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
