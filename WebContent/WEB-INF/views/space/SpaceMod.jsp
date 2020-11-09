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
<title>SpaceMod.jsp</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/spacemod.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

		$(document).ready(function () 
	    { 
	    	  $(".onlyNumber").keyup(function(event){
	              if (!(event.keyCode >=37 && event.keyCode<=40)) {
	                  var inputVal = $(this).val();
	                  $(this).val(inputVal.replace(/[^0-9]/gi,''));
	              }
	          });
	    	  
	    	// 관심 키워드 추가 버튼
	 		 $("#keyAddBtn").click(function() 
	 	     {
	 		      var tmpHtml = "";
	 		      var selectedKey = "";
	 		      var keyInput = "";

	 		      tmpHtml = tmpHtml + "";
	 		      
	 		      selectedText = $("#keySelect option:checked").text();
	 		      selectedValue = $("#keySelect option:checked").val();
	 		      
	 		      keyInput = $("#keyInput").val();
	 		      elementCount = $(".tagStyle").length;
	 		      
	 		      if(selectedValue =='SPTGT1000')
	 		      {
	 		    	  selectedText = keyInput;
	 		      }
	 		      
	 		      for (var i = 0; i < array.length; i++) 
	 		      {
	 					if(selectedText == array[i])
	 					{
	 						//alert(selectedText)
	 						alert("중복된 키워드는 입력 할 수 없습니다.");
	 						return;
	 					}
	 			  }
	 		      
	 		      if(selectedText.trim()=="")
	 		     {
	 		    	alert("공백은 입력할 수 없습니다.");
	 		    	return;
	 		     }
	 		      
	 		   	  // 키워드 개수 제한
	 		      if(elementCount == 5)
	 		      {
	 		    	  alert("키워드는 최대 5개 까지 선택 할 수 있습니다.")
	 		    	  return;
	 		      }
	 		      
	 		      array.push(selectedText);
	 		      document.getElementById("keyInput").value = null;
	 		      
	 		      if(selectedValue == 'SPTGT1000')
	 		      {
	 		    	  
	 		    	  $(".KeyBox").append("<div class='tagStyle'><span class='keyTag'>"+ selectedText 
	 		    			  + "<input type='hidden' name='etcTagList' value='"+ selectedText + "'></span></div>");
	 		      }
	 		      // 관심키워드 일 때...
	 		      else
	 		      {
	 		    	  $(".KeyBox").append("<div class='tagStyle'><span class='keyTag'>"+ selectedText 
	 		    			  + "<input type='hidden' name='intTagList' value='"+ selectedValue + "'></span></div>");			    	  
	 		      }
	 		      
	 		 });
	 		
	 		 $("#keySelect").change(function() 
	 		 {
	 			    var selectedValue = "";
	 			 	// alert("셀렉트값 변경");
	 			 	
	 			 	selectedValue = $("#keySelect option:checked").val();
	 			 
	 				if(selectedValue == "SPTGT1000")
	 				{
	 					$("#keyInput").attr("readonly", false);
	 				}
	 				else
	 				{
	 					$("#keyInput").attr("readonly", true);
	 				}
	 		 });
	 		 
	 		 // 관심 키워드 삭제 버튼
	 		 $("#keyResetBtn").click(function() 
	 	     {
	 			   $(".KeyBox").empty();
	 			   array = [];
	 		 });
	 	
	 	
	 	// 시설안내 추가 버튼
	 	 $("#spaconup").click(function() 
	     {
	 		 var spacon = document.getElementById("spacon").value;

	 		 if(arrayCon.length == 5)
	 	      {
	 	    	  alert("시설안내는 최대 5개 까지만 등록 가능합니다.");
	 	    	  return;
	 	      }
	 	   	  
	 	      for (var i = 0; i < arrayCon.length; i++) 
	 	      {
	 				if(spacon == arrayCon[i])
	 				{
	 					alert("중복된 시설안내는 입력 할 수 없습니다.");
	 					return;
	 				}
	 		  }
	 	      
	 	   	  if(spacon.trim()!="")
	 	   	  {
	 	   			$(".spaConBox").append("<div class='tagStyle'><span class='keyTag'> ※"+ spacon
	 		    			  + "<input type='hidden' name='contentList' value='"+ spacon + "'></span></div>");
	 	   	  }
	 	      arrayCon.push(spacon);
	 	      document.getElementById("spacon").value = null;
	 	 });
	 	
	 	// 시설안내 삭제 버튼
	 	 $("#resetBtn").click(function() 
	      {
	 		   $(".spaConBox").empty();
	 		   arrayCon = [];
	 	 });
	 	
	 	 // 수정 취소
	   	$(".myPageBtn").click(function()
	   	{
			var params = "spa_req_cd=" + $(this).val();
			location.href = "<%=cp%>/spacedetail.action?"+params;
		});
	 	 
	    // 수정
	   	$(".ModBtn").click(
  	       function()
  	       {
  	          $("#spaReqForm").submit();
  	 
  	       });
	   });
</script>
</head>
<body>



<div class="container-fluid">

	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="boardName">
				<h1>공간 수정</h1>
				<hr />
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	
<!-- 리스트 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<!-- 업체명/상호명 -->
			<form id="spaReqForm" class="form-horizontal" role="form" action="spamod.action">
			<div>
				<h4>업체명<span class="ePoint">*</span></h4>
			</div>
			<div>
				<input type="text" class="form-control"
				value="${spaceInfo.spa_name }" name="spaname" readonly="readonly"/>
			</div>
			<br>
			<div>
				<h4>상호명<span class="ePoint">*</span></h4>
			</div>
			<div>
				<input type="text" class=" form-control" 
				value="${spaceInfo.busi_name }" name="spa" readonly="readonly"/>
			</div>
			<br>
			<div>
				<h4>대표자명<span class="ePoint">*</span></h4>
			</div>
			<div >
				<input type="text" class=" form-control" 
				value="${spaceInfo.rprsn_name }" name="spapeo"/>
			</div>
			<br>
			<br>
			<!-- 공간소개 -->
			<div class=" form-inline">
				<h4>공간 소개<span class="ePoint">*</span></h4>
			</div>
			한줄 소개
			<div >
				<input type="text" value="${spaceInfo.one_intro }" name="onein" class="form-control">
			</div>
			상세 소개
			<div>
				<input type="text" value="${spaceInfo.dtl_intro }" name="dtlin" class="form-control" >
			</div>
			<br>
			<!-- 키워드 -->
			<div>
				<h4>키워드<span class="ePoint">*</span></h4>
				<span class="check">최대 5개</span>
			</div>
			<div class="Key">
				<div class="KeySel">
					<div class="Key">
					<div class="KeySel">
						<div class="col-lg-10 form-inline">
							<select name="keySelect" id="keySelect"
								class="form-control keySelect">
								<c:forEach var="Tag" items="${spaTag }">
									<option value="${Tag.spa_tag_type_cd }">
										${Tag.tag_name }</option>
								</c:forEach>
							</select> &nbsp; 
							<input type="text" class="keyInput form-control" id="keyInput" placeholder="키워드를 입력해 주세요." style="width: 30%" readonly="readonly"/>
							&nbsp; <input type="button" id="keyAddBtn" value="추가"
								class="keyBtn btn btn-primary" />
							&nbsp;	
								<input type="button" id="keyResetBtn" value="초기화"
								class="keyBtn btn btn-primary" />
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-10 form-inline">
					<div id="KeyBox" class="KeyBox">
					<%-- <c:forEach var="spaceTagss" items="${spaceTag }">
					<c:if test="${spaceTagss.spa_req_cd eq spaceInfo.spa_req_cd}">
					<li class="stack-item"><h4 >${spaceTagss.tag_name }</h4></li>
					</c:if>
					</c:forEach> --%>
					</div>
				</div>
			</div>
			</div>
			<br>
			
			<!-- 공간정보 -->
			<div>
				<h4>시설안내<span class="ePoint">*</span></h4>
			</div>
			<div>
				<div class="form-inline">
	                <input maxlength="200" type="text" id="spacon" name="spacon"  class="form-control" style="width: 80%;"/>
	                <input type="button" id="spaconup" value="추가" class="keyBtn btn btn-primary" />
					<input type="button" id="resetBtn" value="초기화" class="keyBtn btn btn-primary" />
				</div>
                <div class="form-group">
					<label for="inputPhoneNumber" class="col-lg-2 control-label"></label>
					<div class="col-lg-10 form-inline">
						<div id="spaConBox" class="spaConBox" style="width:100%;">
						<%-- <c:forEach var="fcltys" items="${fclty }">
							<c:if test="${fcltys.spa_req_cd eq spaceInfo.spa_req_cd}">
							<li class=""><h4 >${fcltys.content }</h4></li>
							</c:if>
							</c:forEach> --%>
						</div>
					</div>
				</div>
			</div>
				
			<br>
			<!-- 예약시 주의사항 -->
			<div class="form-group">
				<h4>예약시 주의사항<span class="ePoint">*</span></h4>
			</div> 
			<div>
				<input type="text" value="${spaceInfo.rsv_notes }" name="sparsv" class="form-control">
			</div>
			<br>
			<!-- <div>
				<h4>이미지 <span class="ePoint">*</span></h4>
			</div>
             <div class="form-inline">
            	<input type="file" id="uploadSpaFile" name="uploadSpaFile"class="form-control" accept=".gif, .jpg, .png, .jpeg" style="width: 65%;" />
            	<input type="text" class="form-control" id="thumbnail2" style="width: 20%;" readonly="readonly" value="미리보기">
		               &nbsp;
		        <button class="btn btn-primary" id="uploadSpaBtn" type="button">등록</button>
		        <input type="hidden" id="okFile2" name="okFile2" class="btn btn-primary">
		   </div>
		   <br> -->
                     <div class="form-inline">
                    	업체 전화번호<span class="red">*</span> : 
                    	<input maxlength="50" type="text" value="${spaceInfo.spa_tel }" id="spatel" name="spatel" class="form-control key onlyNumber" style="margin-right: 10px; margin-left: 10px;"/>
                    </div>
                    <div class="form-inline">
                    	영업시작시간<span class="red">*</span>: 
                    	<input maxlength="50" type="text" value="${spaceInfo.str_time }" id="start" name="start"  class="form-control key onlyNumber" style="margin-left: 10px; margin-right: 10px;"/>
                    	영업종료시간<span class="red">*</span> : 
                    	<input maxlength="50" type="text" value="${spaceInfo.end_time }" id="end" name="end" class="form-control key onlyNumber" style="margin-right: 10px; margin-left: 10px;"/>
                    </div>
                    <div class="form-inline">
                    	최대이용시간<span class="red">*</span>: 
                    	<input maxlength="50" type="text" value="${spaceInfo.use_hrs }" id="max" name="max"  class="form-control key onlyNumber" style="margin-left: 10px; margin-right: 10px;"/>
                    </div>
                <br><br>
				<input type="hidden" value="${spaceInfo.spa_req_cd }" name="spa_req_cd"> 
				<div class="form-inline" style="text-align: center; margin-bottom: 50px;">
						<input type="button" value="취소" class="btn btn-default myPageBtn"/>
						<input type="submit" value="수정"  class="btn btn-primary ModBtn"/>
				</div><!-- end .button -->
			
			</form>
		</div> <!-- end .col-md-8 -->
		<div class="col-md-2">
		</div>
	</div>
	
</div><!-- end .container-fluid -->

</body>
</html>