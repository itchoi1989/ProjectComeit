<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%
   String searchValue = request.getParameter("searchValue");
   String searchKey = request.getParameter("searchKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COME-IT</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/study/studylist.css" >

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link rel="shortcut icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<link rel="icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<style type="text/css">

body
{
   font-family: 'Noto Sans KR', sans-serif !important;
}
</style>

<script type="text/javascript">

   $(function()
   {
      // AJAX 요청 및 응답 처리
        ajaxSpcAreaRequest();
      
        // 지역명이 바뀌면 상세지역 ajax 호출
      $("#area").change(function()
      {
         ajaxSpcAreaRequest();
         
      });
        
        // 카테고리 체크박스 제어
        $("#allCheckcat").click(function()   
      {  
         if ($("#allCheckcat").is(':checked')) {
                $("input[name=catChk]").prop("checked", true);
            } else {
                $("input[name=catChk]").prop("checked", false);
            }
      });
        
        
        // 한개의 카테고리 체크박스 해제시 전체 해제
        $("input[name=catChk]").click(function()
      {
         if($("input[name=catChk]:checked").length == 4)
         {
            $("#allCheckcat").prop("checked", true);
         }
         else
         {
            $("#allCheckcat").prop("checked", false);
         }
      });
        
      
        // 레벨 체크박스 제어
      $("#allCheck").click(function()   
      {  
         if ($("#allCheck").is(':checked')) {
                $("input[name=levelChk]").prop("checked", true);
            } else {
                $("input[name=levelChk]").prop("checked", false);
            }
      });

      // 한개의 레벨 체크박스 해제시 전체 해제
        $("input[name=levelChk]").click(function()
      {
         if($("input[name=levelChk]:checked").length == 3)
         {
            $("#allCheck").prop("checked", true);
         }
         else
         {
            $("#allCheck").prop("checked", false);
         }
      });

      
      // 선택 초기화 버튼 클릭 시
      $("#resetBtn").click(function()
      {
         
         f = document.filterForm;
         f.reset();
      });
      
      // 필터 적용 버튼 클릭 시 
      $("#filterBtn").click(function()
      {
    	 
         if($("input[name=catChk]:checked").length < 1)
         {
            alert("한 개 이상의 카테고리를 선택해주세요.");
            return;
         }
         
         if($("input[name=levelChk]:checked").length < 1)
         {
            alert("한 개 이상의 레벨을 선택해주세요.");
            return;
         } 
         
         
         f = document.filterForm;
         f.action = "<%=cp %>/studylist.action";
         f.submit();
         
      });
      
      // 검색 버튼 클릭 시
      $("#searchBtn").click(function()
      {
         f = document.searchForm;
         f.action = "<%=cp %>/studylist.action";
         f.submit();
         
      });
      
      // 스터디 각각 리스트 클릭 시 (로그인 전)
      $(".bFtitleBtn").click(function()
      {
         var result = confirm("로그인 후 이용 가능합니다.\n확인 버튼 클릭 시 로그인 페이지로 이동합니다.");
         
         if(result)
         {
            location.href = "<%=cp%>/memberlogin.action";
         }
         else if(result==null)
         {
            return;
         }
         
      });
      
      // 스터디 각각 리스트 클릭 시 (로그인 후)
      $(".titleBtn").click(function()
      {
         //var params = "scrtCheck" + $
         //alert($(".stu_cd").val());
         
         //$(location).attr("href", "employeeupdateform.action?employeeId=" + $(this).val());
         
         //alert($(this).val());
         
         var params = "stu_cd=" + $(this).val();
         
         $.ajax(
         {
            type : "POST"
            , url : "stuscrtcheck.action"
            , data : params
            , dataType : "text"
            , async:false
            , success : function(data)
            {
               if(data != 0)
               {
                  var result = prompt("비밀번호를 입력해 주세요 : ");
                  
                  if(result=="" || result==null)
                     return;
                  else if(result == data)
                     location.href = "<%=cp%>/studydetail.action?" + params;
                  else if(result != data)
                     alert("비밀번호가 틀렸습니다!");
               }
               else
               {
                  location.href = "<%=cp%>/studydetail.action?" + params;
               }
                  
               
            }
            , error : function(e)
            {
               alert(e.responseText + "에러");
            }
         });
   
      });
      
      // 스터디방 개설 버튼 클릭 시 (로그인 전)
      $("#bFcreateBtn").click(function()
      {
         var result = confirm("로그인 후 이용 가능합니다.\n확인 버튼 클릭 시 로그인 페이지로 이동합니다.");
         
         if(result)
         {
            location.href = "<%=cp%>/memberlogin.action";
         }
         else if(result==null)
         {
            return;
         }
      });
      
      // 스터디방 개설 버튼 클릭 시 (로그인 후)
      $("#createBtn").click(function()
      {
         // 여기서 ajax 처리로 개수 체크하기
         
         $.ajax(
         {
            type : "POST"
            , url : "stucreatecnt.action"
            , dataType : "text"
            , success : function(data)
            {
               if(data >= 10)
               {
                  alert("스터디는 최대 10개까지 참가 가능합니다.\n스터디 종료 후 새로운 스터디에 참가해주세요.");
               }
               else if(data <= 10)
               {
                  location.href = "<%=cp%>/studycreate.action";
               }
               else
               {
                  alert("판별불가");
               }
               
            }
            , error : function(e)
            {
               alert(e.responseText + "에러");
            }
         });
         
         
         
      });
      
   });
   
   // 지역에 따른 세부지역 불러오는 ajax
    function ajaxSpcAreaRequest()
    {

       $.post("areaajax.action",
       {
          area_cd : $("#area").children("option:selected").val()
       }, function(data)
       {
          //alert(data);
          $("#spcAreadd").html(data);
          $("#spcArea").removeAttr("disabled");
       });
    }
   

</script>
</head>
<body style="overflow-x:hidden; overflow-y:auto;" class="padding">
<c:if test="">

</c:if>

<div class="row">
   <div class="col-md-12">
   <c:import url="/WEB-INF/views/common/header.jsp"></c:import>
   </div>
</div>

<div class="container-fluid">
   <div class="row">
      <div class="col-md-12">
         <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
            <img class="img-fluid rounded study-img" src="assets/images/스터디배너.png" alt="studyImg">
            </div>
            <div class="col-md-2">
            </div>
         </div>
         <div class="row content">
            <div class="col-md-2">
            </div>
            <div class="col-md-2"><!-- 필터 시작 -->
            <form name="filterForm" method="post">
            
            <div class="side">
            
               <dl class="cat" id="cate">
                  <dt>카테고리</dt>
                  <dd class="checkboxcat">
                     <label id="allChecklabelcat">
                     <input type="checkbox" id="allCheckcat" name="allCat" value="0" checked="checked">전체
                     </label>
                  </dd>
                  
                  <c:forEach var="stuCats" items="${stuCat }">
                     
                     <dd id="catKey" class="checkboxcat">
                     <label>
                     <input type="checkbox" name="catChk" checked="checked" value="${stuCats.stu_cat_cd }">${stuCats.cat_name }
                     </label>
                     </dd>
                  
                  </c:forEach>
                  
               </dl><!-- end cat -->
               
               <dl class="region">
                  <dt>지역</dt>
                  <dd>
                     <select name="area" id="area" class="area form-control">
                           <option value="0">전체</option>
                              <c:forEach var="areas" items="${area }">
                                       <option value="${areas.area_cd }" 
                                       ${areas.area_cd == spcArea.area_cd ? "selected= \"selected\"" : ""}>
                                          ${areas.area_name }
                                       </option>
                                    </c:forEach>
                           </select>
                  </dd>
                  
                  <dd id="spcAreadd">
                     
                  </dd>
                   
               </dl><!-- end region -->
               
               
               <dl class="inwon">
                  <dt>인원 수</dt>
                  <dd class="radioNum">
                     <label for="all">
                     <input type="radio" id="all" name="inwon" value="0" checked="checked">전체
                     </label>
                  </dd>
                  <dd class="radioNum">
                     <label id="fiveDown">
                     <input type="radio" id="fiveDown" name="inwon" value="5">5명 미만
                     </label>
                  </dd>
                  <dd class="radioNum">
                     <label id="fiveUp">
                     <input type="radio" id="fiveUp" name="inwon" value="6">5명 이상 ~ 10명 미만
                     </label>
                     
                  </dd>
                  <dd class="radioNum">
                     <label id="tenUp">
                     <input type="radio" id="tenUp" name="inwon" value="10">10명 이상
                     </label>
                     
                  </dd>
               </dl><!-- end inwon -->
               
               <dl class="level">
                  <dt>레벨</dt>
                  <dd class="checkboxLevel">
                     <label id="allChecklabel">
                     <input type="checkbox" id="allCheck" name="allLevel" value="0" checked="checked">전체
                     </label>
                  </dd>
                  
                  <c:forEach var="levels" items="${level }">
                     <dd class="checkboxLevel">
                        <label>
                        <input type="checkbox" name="levelChk" checked="checked" value="${levels.lv_cd }">${levels.lv }
                        </label>
                     </dd>
                  
                  </c:forEach>
               </dl><!-- end level -->
               
               <div class="filterDiv">
                  <button type="reset" style="width: 40%;" id="resetBtn" class="btn">초기화</button>
                  <button type="button" style="width: 40%;" id="filterBtn" class="btn btn-success filterBtn">적용</button>
               </div>
            
            </div><!-- end side -->
            <input type="hidden" name="searchValue" value="<%=searchValue %>">
            <input type="hidden" name="searchKey" value="<%=searchKey %>">
            </form>
            </div><!-- 필터 끝 -->
            
            <!-- 본문 영역 -->
            <div class="col-md-6">
            
               <!-- 검색 영역 -->
               <div class="row">
                  <div class="col-md-12">
                  <div class="form-inline search">
                  
                  <form name="searchForm" method="post">
                     <select name="searchKey" class="form-control selectField" style="width: 20%;">
                        <option value="title">제목</option>
                     </select>
                     
                     <input type="text" name="searchValue" placeholder="관심 키워드 또는 스터디방 제목으로 검색하세요!" class="form-control boxTF" style="width: 70%;">
                     <input type="button" value="검색" class="btn btn-primary searchBtn" id="searchBtn" style="width: 9%">
                  </form>
                     <!-- <input type="text" class="form-control tag" id="tag" placeholder="기술 태그">
                     <input type="text" class="form-control title" id="title" placeholder="스터디방 제목">
                     <button type="button" id="searchBtn" class="btn btn-primary searchBtn">검색</button> -->
                  </div>
                  </div>
               </div>
               
               <!-- 리스트 영역 -->
               <div class="row list">
                  <div class="col-md-12">
                  ${count }개의 스터디방에서 스터디원을 모집중입니다!
                  </div> 
                  <div class="col-md-12">
                  <ul class="list-study">
                                          
                     <c:forEach var="studys" items="${study }">
                        <li class="list-study-item">
                        <div class="item-header">
                        <!-- <img class="study-logo" alt="study-logo" src="assets/images/studylogo.PNG"> -->
                        <c:choose>
                        <c:when test="${empty studys.img_url }">
                        <img class="study-logo" alt="study-logo" src="assets/images/study_logo2.png">
                        </c:when>
                        <c:when test="${not empty studys.img_url }">
                        <img class="study-logo" alt="study-logo" src="${studys.img_url }">
                        </c:when>
                        </c:choose>
                        </div>
                        <div class="item-body">
                        <div class="firstLine">
                           <div class="listTitle">
                              <h4 class="study-title" style="font-weight: bold;">
                              
                              <c:choose>
                              <c:when test="${empty sessionScope.id }">
                                 <button type="button" class="btn btn-link bFtitleBtn" value="${studys.stu_cd }">[${studys.cat_name }] ${studys.title }</button>
                              </c:when>
                              
                              <c:when test="${not empty sessionScope.id }">
                                 <button type="button" class="btn btn-link titleBtn" value="${studys.stu_cd }">[${studys.cat_name }] ${studys.title }</button>
                              </c:when>
                              </c:choose>
                              
                              
                              </h4>
                           </div>
                           
                           <c:if test="${studys.scrt_num ne '0'}">
                              <div class="lock">
                              <h5><span class="glyphicon glyphicon-lock icon" aria-hidden="true"></span></h5>
                              <input type="hidden" name=currentbook${status.index} class="scrtCheck" value="${studys.scrt_num }">
                              </div> 
                           </c:if>
                           
                           <!-- 
                           <div class="lock">
                              <h5><span class="glyphicon glyphicon-lock icon" aria-hidden="true"></span></h5>
                           </div> 
                           -->
                           
                        </div>
                        <div class="form-inline">
                           <h5 class="study-date">${studys.str_date } ~ ${studys.end_date }</h5>
                           <h5 class="study-term">${studys.meet_term }개월</h5>
                        </div>
                        
                        <ul class="study-info">
                           <li class="level"><span class="glyphicon glyphicon-stats iconLv" aria-hidden="true"></span> ${studys.lv }</li>
                           <li class="location"><span class="glyphicon glyphicon-map-marker iconArea" aria-hidden="true"></span> ${studys.area_name } ${studys.spc_area_name }</li>
                           <li class="numb"><span class="glyphicon glyphicon-user iconNum" aria-hidden="true"></span> ${studys.mem_num }명</li>
                        </ul>

                        
                        <ul class="list-study-tags">
                        <c:forEach var="studyTagss" items="${studyTags }">
                        <c:if test="${studyTagss.stu_cd eq studys.stu_cd}">
                           <li class="stack-item">${studyTagss.int_tag_name }</li>
                        </c:if>
                        </c:forEach>
                        </ul>

                        </div>
                        
                     </li>
                     
                     </c:forEach>
                  </ul>
                  
                  </div>
               </div><!-- 리스트 영역 끝 -->
               
               <div class="row">
               <div class="col-md-12">
                  <div class="create">
                     <c:choose>
                     
                     <c:when test="${empty sessionScope.id }">
                        <button type="button" id="bFcreateBtn" class="btn btn-primary btn-sm createBtn">스터디방 개설</button>
                     </c:when>
                     
                     <c:when test="${not empty sessionScope.id }">
                        <button type="button" id="createBtn" class="btn btn-primary btn-sm createBtn">스터디방 개설</button>
                     </c:when>
                     </c:choose>
                  
                  </div>
               </div>
               </div>
                  
               
               <!-- 페이징 영역 -->
               <div class="row paging">
               <div class="col-md-12">
                  <!-- <nav>
                     <ul class="pagination">
                        <li class="page-item"><a href="#" class="page-link">Previous</a></li>
                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                        <li class="page-item"><a href="#" class="page-link">3</a></li>
                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                        <li class="page-item"><a href="#" class="page-link">6</a></li>
                        <li class="page-item"><a href="#" class="page-link">7</a></li>
                        <li class="page-item"><a href="#" class="page-link">8</a></li>
                        <li class="page-item"><a href="#" class="page-link">9</a></li>
                        <li class="page-item"><a href="#" class="page-link">10</a></li>
                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                        </ul>
                  </nav> -->
                  
                  <!-- 페이징 처리에 따른 페이지 인덱스 적용 -->
                  <c:if test="${dataCount != 0 }">
                     <div align="center">
                        ${pageIndexList }
                     </div>
                  </c:if>
               </div>
               </div><!-- 페이징 영역 끝 -->
               
            </div>
            
         </div>
      </div>
   </div>
</div>
<div class="row">
   <div class="col-md-12">
   <c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
   </div>
</div>

</body>
</html>