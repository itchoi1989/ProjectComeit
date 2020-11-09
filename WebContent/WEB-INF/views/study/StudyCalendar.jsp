<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyCalendar.jsp</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/assets/css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/assets/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="<%=cp%>/assets/util/core/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/assets/util/daygrid/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/assets/util/timegrid/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/assets/util/interaction/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/studycalendar.css" >


<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/assets/js/bootstrap.min.js"></script>


<script src='fullcalendar/core/locales/ko.js'></script>
<script type="text/javascript" src="<%=cp%>/assets/util/core/main.js"></script>
<script type="text/javascript" src="<%=cp%>/assets/util/daygrid/main.js"></script>
<script type="text/javascript" src="<%=cp%>/assets/util/timegrid/main.js"></script>
<script type="text/javascript" src="<%=cp%>/assets/util/interaction/main.js"></script>

<script type="text/javascript">
      
// 실제 캘린더 뿌려주는 영역



</script>

</head>
<body>


<!-- content  -->

<div class="container-fluid">
   <div class="row">
      <div class="col-md-12">
         <div id="calendar" style="width: 100%; height: 100%;" class="text-center">
         <div ></div>
         </div>
      </div>
   </div>
</div>

<!-- content end -->



</body>
</html>