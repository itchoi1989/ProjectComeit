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
<title>LectureTab</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/lecture/lectureTab.css">
<script type="text/javascript">
        $(document).ready(function() {

            $(".tab_content").hide(); 
            $("ul.tabs li:first").addClass("active").show(); 
            $(".tab_content:first").show();

            $("ul.tabs li").click(function() 
            {

                $("ul.tabs li").removeClass("active"); 
                $("ul.tabs li").removeClass("on"); 
                $(this).addClass("active");
                $(this).addClass("on");
                $(".tab_content").hide();

                var activeTab = $(this).find("a").attr("href");
                $(activeTab).fadeIn(); 
                return false;
            });

        });
        
</script>

</head>
<body>

<div id="wrapper">    
    <!--탭 메뉴 영역 -->
    <ul class="tabs">
        <li class="on"><a href="#tab1">공지사항</a></li>
        <li><a href="#tab2">모임 날짜</a></li>
         <li><a href="#tab3">모임 장소</a></li>
         <li><a href="#tab4">강의 관리</a></li> 
         <li><a href="#tab5">피드백</a></li> 
    </ul>

    <!--탭 콘텐츠 영역 -->
    <div class="tab_container">

        <div id="tab1" class="tab_content">
            <!--Content-->
            <c:import url="/WEB-INF/views/lecture/LectureNoticeList.jsp"></c:import>
        </div>
        <!-- end div#tab1 -->

        <div id="tab2" class="tab_content">
           <!--Content-->
           <c:import url="/WEB-INF/views/lecture/LectureDateList.jsp"></c:import>
        </div>
        <!-- end div#tab2 -->

        <div id="tab3" class="tab_content">
           <!--Content-->
           <c:import url="/WEB-INF/views/lecture/LectureSpaceList.jsp"></c:import>
        </div>
        <!-- end div#tab3 -->
   
         <div id="tab4" class="tab_content">
           <!--Content-->
           <c:import url="/WEB-INF/views/lecture/LectureLecStudent.jsp"></c:import>
        </div>
        <!-- end div#tab4 -->
        
        <div id="tab5" class="tab_content">
           <!--Content-->
           <c:import url="/WEB-INF/views/lecture/LectureFeedback.jsp"></c:import>
        </div>
        <!-- end div#tab5 -->

    </div>
    <!-- end div.tab_container -->

</div>
<!-- end div#wrapper -->

</body>
</html>