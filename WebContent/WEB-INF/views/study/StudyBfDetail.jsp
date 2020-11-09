<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyBfDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/study/studyBfDetail.css" >
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/assets/js/bootstrap.min.js"></script>
<!-- 파비콘 -->
<link rel="shortcut icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<link rel="icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<!-- 글씨체 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style type="text/css">
body{font-family: 'Noto Sans KR', sans-serif;}
</style>


<script type="text/javascript">

   $(document).ready(function () 
   {
	   // 스터디장 모달 정보 요청
      $(".leaderBtn").click(function() 
      {
    	  var params = "leaderMemCd=" +$(this).val();
    	  
    	  $.ajax(
    	  {
    	      type : "POST"
    	      , url : "leaderinfomodal.action"
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
      });   // end 스터디장 모달 정보요청
      
      
      // 스터디원 모달 정보 요청 joinMemBtn
       $(".joinMemBtn").click(function() 
      {
    	  var params = "joinMemCd=" +$(this).val();
    	  
    	  $.ajax(
    	  {
    	      type : "POST"
    	      , url : "meminfomodal.action"
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
      
      // 스터디원 참가 요청 
      $(".joinStudyBtn").click(function() 
      {
    	var params = "stuCode=" + $(this).val();  
    	  $.ajax(
		  {
			 type : "POST"
             , url : "studyjoin.action"
             , data : params
             , success : function(data)
             { 
            	 //alert(data);
            	 
            	 if (data == 1) 
            	 {
            		 alert("참가가 완료되었습니다."); 
            		 $('.commitBtn').attr('disabled', true);
            	 }
            	 else
            	 {
            		 alert("참가가 불가합니다.");
            	 }
            		 
            	 
             }
             , error : function(e) 
             {
              	alert(e.responseText);
             }
		  });
 
			  reload();	  
    	
	  });
      
      	// 스터디방 수정 버튼 클릭
      	$("#modBtn").click(function()
		{
      		var result = confirm("스터디방 정보를 수정하시겠습니까?");
      		
      		if(result)
      		{
      			<%-- location.href = "<%=cp%>/studydetailmod.action?stu_cd=" + $(this).val(); --%>
      			$(location).attr("href", "studydetailmod.action?stu_cd=" + $(this).val());	  
      		}
      		else if(result==null)
      		{
      			return;
      		}
			
		});
      
     // 스터디방 폐쇄 버튼 클릭
	 $("#deleteBtn").click(function() 
	 {
	   var delResult = confirm("스터디방을 폐쇄하시겠습니까?");
	     
	     if(delResult)
	     {
	        $(location).attr("href", "studydelete.action?stuCode=" + $(this).val());     
	     }
	     else if(delResult==null)
	     {
	        return;
	     }
	     
	});
      
      // 스터디장 커밋 버튼 클릭
      $(".commitBtn").click(function() 
      {
			var params = "stuCode=" + $(this).val();
			
			$.ajax(
			{
				 type : "POST"
	             , url : "leadercommit.action"
	             , data : params
	             , success : function(data)
	             { 
	            	 alert(data);
	            	 
	            	 if (data == 1) 
	            	 {
	            		 alert("확정이 완료되었습니다."); 
	            		 $('.commitBtn').attr('disabled', true);
	            	 }
	            	 else
	            	 {
	            		 alert("확정이 실패되었습니다.");
	            	 }
	            		 
	            	 
	             }
	             , error : function(e) 
	             {
	              	alert(e.responseText);
	             }
			});
			
			 reload();
			
	  });
      
      
      $(".outBtn").click(function() 
      {
            var outRsn = prompt("불합리한 방출은 사이트 이용에 제한이 있을 수 있습니다.\n방출 사유를 입력하세요.");
            
            
            
      });
      
      
    });
  	
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
<body class="padding">

<!-- 헤더 -->
<div class="row">

   <div class="col-md-12">
   <c:import url="/WEB-INF/views/common/header.jsp"></c:import>
   </div>

</div>

<!-- 바디 -->
<div class="container-fluid">
   
   <!-- 스터디방 이미지 -->
   <div class="row">
      <div class="col-md-2">
      </div>
      <div class="col-md-8">
         <img src="<%=cp %>/assets/images/study2.jpg" alt="" class="stuImg" />      
      </div>
      <div class="col-md-2">
      </div>
   </div>
   
   
   
   <!-- 방 정보 및 팀원 정보 -->
   <div class="row">
      <div class="col-md-2">
      </div>
      
      <!-- 방 정보 -->
      <div class="col-md-8">
         <div class="row">
         
        <form method="post" id="infoForm" name="infoForm"> 
         <c:if test="${!empty studyInfo}" >
            <div class="col-md-8">
               <!-- 스터디방 제목 -->
               <div class="stuTitle">
                  <div class="title">
                     <h2>${studyInfo.title }</h2>
                  </div>
                  <!-- 스터디장 : 커밋 , 회원 : 참가, 스터디원 : 퇴장 으로 노출 -->
                  <input type="hidden" name="" id="insertResult" value="${insertResult }"/>
                  <div class="jrBtn pull-right">
                   	<c:if test="${sessionScope.mem_cd eq leaderName.leader_mem_cd && empty studyInfo.cmt_date}">
                  	<button type="button" class="btn btn-lg btn-primary commitBtn" value="${studyInfo.stu_cd }">COMMIT</button>
                  	</c:if>
                  	<c:if test="${sessionScope.mem_cd eq leaderName.leader_mem_cd && not empty studyInfo.cmt_date}">
                  	<button type="button" class="btn btn-lg btn-primary commitBtn" value="${studyInfo.stu_cd }" disabled="disabled">COMMIT</button>
                  	</c:if>
                  	
                  	
                  	 <c:if test="${sessionScope.mem_cd ne leaderName.leader_mem_cd }">
                  	<button type="button" class="btn btn-lg btn-primary joinStudyBtn" value="${studyInfo.stu_cd }">참가</button>
                  	</c:if>
                     <img src="<%=cp %>/assets/images/report.png" alt="" class="report" onclick=""/>
                  </div><!-- end .button -->
               </div><!-- end.stuTitle -->
               
               
               <!-- 스터디방 정보 -->
               <div class="stuInfo">
                  <!-- 활동 기간 -->
                  <div class="stuTerm">
                     <span class="glyphicon glyphicon-calendar icon icTerm"></span>
                     <h4>활동 기간</h4><br>
                     <span class="term">${studyInfo.str_date } ~ ${studyInfo.end_date }&nbsp;&nbsp;&nbsp;&nbsp;${studyInfo.meet_term }개월</span><br />
                     └ <c:forEach var="dayName" items="${dayName }">
                         <span class="day"> ${dayName.stu_day_name } </span>
                        </c:forEach>
                                                
                  </div><!-- end stuTerm -->
                  
                  <!-- 활동 지역 -->
                  <div class="stuArea">
                     <span class="glyphicon glyphicon-map-marker icon icArea"></span>
                     <h4>활동 지역</h4><br />
                     <span class="area">${studyInfo.area_name } ${studyInfo.spc_area_name }</span>
                  </div><!-- end .stuArea -->
                  
                  <!-- 키워드 -->
                  <div class="stuKey">
                     <span class="glyphicon glyphicon-tags icon icKey"></span>
                     <h4>키워드</h4><br>
                     <c:forEach var="intTag" items="${intTag }">
                           <ul class="list-study-tags">
                              <li class="stack-item">${intTag.int_tag_name }</li>
                           </ul>
                     </c:forEach>
                     <c:forEach var="etcTag" items="${etcTag }">
                           <ul class="list-study-tags">
                              <li class="stack-item">${etcTag.etc_tag_name }</li>
                           </ul>
                     </c:forEach>
                  </div><!-- end .stuKey -->
                  
                  <!-- 예상 레벨 -->
                  <div class="stuLevel">
                     <span class="glyphicon glyphicon-blackboard icon icLv"></span>
                     <h4>예상 레벨</h4><br>
                     <span class="level">${studyInfo.lv }</span>
                  </div>
                  
                  <!-- 상세 설명 -->
                  <div class="stuCurr">
                     <span class="glyphicon glyphicon-bookmark icon icCrr"></span>
                     <h4>상세 설명</h4><br />
                     <p style="white-space: pre-line;" class="curr">${studyInfo.content }</p>
                     <%-- <span class="curr">${studyInfo.content }</span> --%>
                  </div>
               
            
               </div><!-- end .stuInfo -->
            </div><!-- end .col-md-8 -->
            </c:if>
            <!-- 스터디원 정보 -->
            
            
            <div class="col-md-4 ">
            <!-- 모달 -->
                     <div id="modal" class="searchModal">
                        <!-- 모달창 -->
                        <div class="search-modal-content">
           
                          
                          
                     </div><!-- end .search-modal-content -->                     
                     </div><!-- end .searchModal -->   
            
               <div class="stuMem">
               
               <!-- <h3>스터디장</h3> -->
                  <div class="memLeader" id="member1">
                  
                  
                 <div class="leaderImg">
				
					<c:set var="imgCount" value="${imgCount=0 }"/>
                     <c:forEach var="memImg" items="${memImg }">
                        <c:if test="${memImg.join_mem_cd eq leaderName.leader_mem_cd}">
                              <c:set var="imgCount" value="${imgCount=1 }"/>	
                              	<img src="${memImg.mem_img }" alt="" class="img-circle memImg" />
                        </c:if>
                     </c:forEach>
                     
                     <c:if test="${imgCount==0 }" >
                     	<img src="<%=cp %>/assets/images/basic.png" alt="" class="img-circle memImg" />
                     </c:if>
                   </div><!-- end .leaderImg -->  
                     
                     
                     
                     <div class="leaderInfo">
                        <span class="glyphicon glyphicon-ok ok"></span>
                        <h4>Study Leader</h4><br>
                        <span class="name">${leaderName.leader_name }</span>
                      
                       <button type="button" class="btn btn-xs btn-default infoBtn leaderBtn" value="${leaderName.leader_mem_cd  }">정보</button>
                        
                     </div><!-- end .leaderInfo -->
                     
                  </div><!-- end .memLeader -->
                  
                  
               <!--    <h3>스터디원</h3> -->
                 <c:forEach var="joinName" items="${joinName }">
                     <c:if test="${joinName.stu_join_name ne leaderName.leader_name}">
                        <div class="memLeader" id="">
                         <%--  <c:forEach var="memImg" items="${memImg }">
                              <c:if test="${memImg.join_mem_cd eq joinName.join_mem_cd}">
                              
                           
                              
                              </c:if>
                           </c:forEach> --%>
                           
                              <div class="leaderImg">
                              <img src="<%=cp %>/assets/images/basic.png" alt="" class="img-circle memImg" />
                                    
                                 </div><!-- end .leaderImg -->
                           
                           <div class="leaderInfo">
                              <h4>Study Member</h4><br>
                              <span class="name">${joinName.stu_join_name }</span>
                              <input type="hidden" name="joinMemCd" id="joinMemCd" value="${joinName.join_mem_cd }"/>
                              
                              <button type="button" class="btn btn-xs btn-default infoBtn joinMemBtn" value="${joinName.join_mem_cd   }">정보</button>
                           
                           </div><!-- end .leaderInfo -->
                        </div><!-- end .memLeader -->
                     </c:if>
                     
                  </c:forEach>
               </div><!-- end .stuMem -->
      		
               
               <!-- 스터디장에게만 보일 수정 / 폐쇄 버튼 -->
               <div class="roomBtn">
               <c:if test="${sessionScope.mem_cd eq leaderName.leader_mem_cd }">
                  <button type="button" class="btn modBtn" value="${studyInfo.stu_cd }" id="modBtn">방 정보 수정</button>
				  <button type="button" class="btn delBtn" id="deleteBtn" value="${studyInfo.stu_cd }">폐쇄</button>               
               </c:if>
               </div><!-- end .roomBtn -->
            </div>
            
            </form>
            
         </div><!-- end .row -->
      
      </div><!-- end .col-md-8 -->
      
      <div class="col-md-2">
      </div>
   </div><!-- end .row -->
   
   
</div><!-- end .container-fluid -->

<!-- 푸터 -->
<div class="row">
   <div class="col-md-12">
   <c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
   </div>
   
</div>
</body>
</html>