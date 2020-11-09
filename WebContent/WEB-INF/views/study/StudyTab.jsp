<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String studyCode = request.getParameter("stu_cd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/study/studyTab.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
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
   		 <li><a href="#tab3">캘린더</a></li>
            <li><a href="#tab4">산출물 관리</a></li>
         <li><a href="#tab5">모임 장소</a></li>
    </ul>

    <!--탭 콘텐츠 영역 -->
    <div class="tab_container">

        <div id="tab1" class="tab_content">
            <!--Content-->
            <c:import url="StudyNoticeList.jsp">
            	<c:param name="stu_cd" value="<%=studyCode %>"></c:param>
            </c:import>
        </div>

        <div id="tab2" class="tab_content">
           <!--Content--> 
           <c:import url="StudyDateList.jsp"></c:import>
        </div>

        <div id="tab3" class="tab_content">
           <!--Content-->
           <c:import url="StudyCalendar.jsp"></c:import>
        </div>
   
         <div id="tab4" class="tab_content">
           <!--Content-->
           <c:import url="StudyFileList.jsp">
           		<c:param name="stu_cd" value="<%=studyCode %>"></c:param>
           </c:import>
        </div>


         <div id="tab5" class="tab_content">
           <!--Content-->
           <c:import url="StudySpaceList.jsp"></c:import>
        </div>

    </div>

</div>

</body>
</html>