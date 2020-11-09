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
<title>Insert title here</title>
</head>
<body>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">업체 회원 관리</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>업체명</th>
                      <th>이름</th>
                      <th>아이디</th>
                      <th>이메일</th>
                      <th>업체 전화번호</th>
                      <th>업체 주소</th>
                      <th>가입일</th>
                      <th>탈퇴일</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                  <c:forEach var="spa" items="${adminspaList}">
                    <tr>
                    	<td>${spa.spa_cd }</td>
                    	<td>${spa.spa_name }</td>
                    	<td>${spa.name }</td>
                    	<td>${spa.spa_id }</td>
                    	<td>${spa.email }</td>
                    	<td>${spa.tel }</td>
                    	<td>${spa.dtl_addr }</td>
                    	<td>${spa.join_date }</td>
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