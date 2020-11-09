<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String lec_cd = request.getParameter("lec_cd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LectureLecStudent.jsp</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/lecture/LectureLecStudent.css">

<script type="text/javascript">

	$(function()
	{
		ajaxLectureLecStudent();
		
		// 수강생 모달 정보 요청 joinMemBtn
	       $(".stdntModalBtn").click(function() 
	      {
	    	  var params = "mem_cd=" +$(this).val();
	    	  
	    	  $.ajax(
	    	  {
	    	      type : "POST"
	    	      , url : "stdntinfomodal.action"
	    	      , data : params
	    	      , dataType : "text"
	    	      , success : function(args)
	 	  	      { 
	    	    	  // 정보 담기
	    	    	  $(".search-modal-content").html(args);
					   
			    	  // 모달창 보여주기
			    	  $("#modal").show();
					  
					  // 스크롤 제어
			          $("html, body").css({"overflow":"hidden", "height":"100%"});
			          $("#modal").bind("touchmove", function(e) {
			            e.preventDefault();
			          });
			         
			          $("#modal .searchModal").bind("touchmove", function(e) {
			            e.stopPropagation();
			          });
		    	 
				  }
	    	  	  , error : function(e) 
	    	  	  {
						alert(e.responseText);
				  }
	    	  	
	    	  
	    	  });	
	      });// end 스터디원 모달 정보요청
		
	});
	
	function ajaxLectureLecStudent()
	{
		var params = "lec_cd=" + $("#lectureCode").val();
		
		// 수강생 리스트 뿌려주는 Ajax
		$.ajax(
		{
			type : "POST",
			url : "lecturelecstudent.action",
			data : params,
			dataType : "text",
			async : false,
			success : function(data)
			{
				$(".student").html(data);
			},
			error : function(e)
			{
				alert(e.responseText + "에러");
			}
			
		});
		// 수강생 리스트 뿌려주는 Ajax 끝
	}
	
	// 모달창 닫기 버튼 클릭 시 
	function closeModal() 
	{	
		$('.searchModal').hide();
		
		// 스크롤 제어 해제
		$("html, body").css({"overflow":"auto", "height":"auto"});
		$('#modal').unbind('touchmove');
		
	};
	
	// 다시 로드
	function reload() 
	{
		location.reload();	
	}

</script>

</head>
<body>

<div class="container-fluid">

<!-- 제목 영역 -->
	<div class="row">
	
		<input type="hidden" id="lectureCode" name="lec_cd" value="<%=lec_cd%>">
	
		<div class="col-md-2">
		</div>
		<!-- end div.col-md-2 -->
		
		<div class="col-md-8">
		
			<div class="boardName" style="text-align : center;">
				<h1>강의 관리</h1>
				<hr />
			</div>
			<!-- end div.boardName -->
			
		</div><!-- end .col-md-8 -->
		
		<div class="col-md-2">
		</div>
		<!-- end div.col-md-2 -->
		
	</div>
	<!-- end div.row -->
	<!-- 제목 영역 끝 -->
	
<!-- 선택 박스 -->
	<div class="row">
		
		<div class="col-md-12 box1">
		
			<!-- 모달 영역 -->
            <div id="modal" class="searchModal">
               
               <!-- 모달창 -->
               <div class="search-modal-content">
               </div>
               <!-- end .search-modal-content -->
            	                     
            </div>
            <!-- end .searchModal -->
		
			<div class="box2">
			
				<div class="time">
					<h3><a href="LectureLecStudent.jsp">수강생 조회</a></h3>
				</div><!-- end .time -->
				
				<div class="location">
					<h3><a href="LectureLecProfit.jsp">수익 관리</a></h3>
				</div><!-- end .location -->
				
			</div><!-- end .box2 -->
			
			<div class="box3">
			
				<div class="student">
				
				</div>
				<!-- end .student -->
				
				<div class="blank">
				</div>
				<!-- end div.blank -->
				
			</div><!-- end .box3 -->
			
		</div><!-- end .col-md-12 box1-->
		
	</div>
	
</div><!-- end .container-fluid -->

</body>
</html>