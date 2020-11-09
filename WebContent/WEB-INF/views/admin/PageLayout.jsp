<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String args = (String)request.getAttribute("args");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>관리자 페이지</title>
  
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link rel="shortcut icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<link rel="icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<style type="text/css">
body{font-family: 'Noto Sans KR', sans-serif;}
</style>
  
<!-- Bootstrap core JavaScript-->
<script src="<%=cp %>/assets/vendor/jquery/jquery.min.js"></script>
<script src="<%=cp %>/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="<%=cp %>/assets/vendor/jquery-easing/jquery.easing.js"></script>

<!-- Custom scripts for all pages-->
<script src="<%=cp %>/assets/js/admin/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="<%=cp %>/assets/vendor/datatables/jquery.dataTables.js"></script>
<script src="<%=cp %>/assets/vendor/datatables/dataTables.bootstrap4.js"></script>

<!-- Page level custom scripts -->
<script src="<%=cp %>/assets/js/admin/demo/datatables-demo.js"></script>

<!-- Custom fonts for this template -->
<link href="<%=cp %>/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=cp %>/assets/css/admin/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="<%=cp %>/assets/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <c:import url="/WEB-INF/views/admin/SideBar.jsp"></c:import>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

		<c:import url="/WEB-INF/views/admin/Topbar.jsp"></c:import>

		<c:import url="<%=args %>"></c:import>
		
		<%-- <c:import url="StudyNoticeList.jsp"></c:import> --%>
		
		<%-- <c:import url="Member.jsp"></c:import> --%>
		
		<%-- <c:import url="MemberList.jsp"></c:import> --%>
		

    </div>
    <!-- End of Content Wrapper -->

	<c:import url="/WEB-INF/views/admin/Footer.jsp"></c:import>
      <!-- End of Footer -->
      
  </div>
  <!-- End of Page Wrapper -->
  
  </div>


</body>
</html>