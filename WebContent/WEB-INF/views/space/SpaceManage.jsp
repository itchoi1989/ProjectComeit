<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>SpaceManage.jsp</title>
<!-- <link href="css/space-manage.css" rel="stylesheet">
<link href="css/business-frontpage.css" rel="stylesheet"> -->
<script type="text/javascript">
	
	
	
	$(function()
	{
		// 리스트 페이지로 이동
	   	$(".listBtn").click(function()
	   	{
			//var params = "spa_req_cd=" + $(this).val();
			location.href = "<%=cp%>/spalist.action?"//+params;
		});
		
	 	// 상세 페이지로 이동
	   	$(".imageBtn").click(function()
	   	{
			var params = "spa_req_cd=" + $(this).val();
			location.href = "<%=cp%>/spacedetail.action?"+params;
		});
	 	
	 	// 공간 삭제
	   	$(".delBtn").click(function()
	   	{
			var params = "spa_req_cd=" + $(this).val();
			alert(params);
			alert("1");
			$.ajax(
  			{
  				type : "POST"
  				, data :params
  				, url : "spacedel.action"
  				, success : function(data)
  				{
  					if(data==0)
  					{
  						alert("예약 사항이 존재해 공간을 삭제할 수 없습니다.");
  					}
  					else
  					{
  						alert("공간이 삭제되었습니다.");
  					}
  				}
  				, error : function(e)
  				{
  					alert("삭제에 실패하였습니다.");
  				}
  			});
			end();
		});
	 	
		 // 공간 수정페이지로 이동
	   	$(".modBtn").click(function()
	   	{
			var params = "spa_req_cd=" + $(this).val();
			location.href = "<%=cp%>/spamodview.action?"+params;
		});
	});
	
	function end() {
		location.reload();
	}
	
	
	
</script>
</head>
<body>

	<div>
		<button type="button" class="btn btn-primary listBtn">공간등록</button>
	</div>
	<br><br>
	
	<!-- 업체 카드 영역 -->
      <!-- <h4>업체명</h4>
        <div class="card h-75">
          <img class="card-img-top" src="https://placehold.it/300x200" alt="">
          <div class="card-body">
            <h4 class="card-title">업체명</h4>
            <p class="card-text">스터디카페<br>서울 마포구<br>#태그</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div> -->
         <div  style="margin-top: 30px;">
		 <div class="item">
                  <ul class="thumbnails" style="list-style:none;" >
                  
                  <c:if test="${empty MyInfo}">
                      	<p>등록된 공간이 없습니다. 지금바로 공간을 등록하세요!</p>
                      </c:if>
                      <c:forEach var="MyInfoList" items="${MyInfo }">
                      <c:if test="${not empty MyInfoList}">
                       <li class="col-sm-4 col-md-6" >	
						<div class="demo">
					      <figure class="imghvr-scale-top-left">
					       <img src="${MyInfoList.img_url }" alt="53" style="width: 300px; height: 250px;">
					        <figcaption>
					        <button type="button" class="imageBtn" value="${MyInfoList.spa_req_cd }" style="background-color:transparent;  border:0px transparent solid; text-align: left;outline:none;" >
					        <p><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
					        ${MyInfoList.area_name} ${MyInfoList.spc_area_name}</p>
					        <p><span class="glyphicon glyphicon-time" aria-hidden="true"></span>
					               영업 시간 : ${MyInfoList.str_time}시 ~ ${MyInfoList.end_time}시</p>
					        <p><span class="glyphicon glyphicon-time" aria-hidden="true"></span>
					               최대이용시간 : ${MyInfoList.use_hrs}시간</p>
					        <div class="form-inline">
					        <p><span class="glyphicon glyphicon-home" aria-hidden="true"></span> ${MyInfoList.type_name}</p>
					        <p><span class="glyphicon glyphicon-heart" aria-hidden="true"></span> ${MyInfoList.busi_name}</p>
					        </div>
					        </button>
					        </figcaption>
					      </figure>
					      <div class="caption">
					      	<div class="nameAndCount">
							<h4>${MyInfoList.spa_name}</h4>
							<p class="feed"><span class="glyphicon glyphicon-heart heart" aria-hidden="true"></span>피드백수: ${MyInfoList.feedCount }개</p>
							</div>
							<p>&quot;${MyInfoList.one_intro}&quot;</p>
						  </div>
						  </div>
						  <div class="upandde col-md-4 form-inline"  style="margin-left: 30px; display: contents;">
							<button type="button" value="${MyInfoList.spa_req_cd }" class="btn btn-primary modBtn">수정</button>
							<button type="button" value="${MyInfoList.spa_req_cd }" class="btn btn-secondary delBtn">삭제</button>
						</div>
                       </li>
                       
      					
						</c:if>
				</c:forEach>
				
                  </ul>
                  
             </div>
        </div>
        
        <br>
        
		<br><br>
      
     
      
      
	
	
</body>
</html>