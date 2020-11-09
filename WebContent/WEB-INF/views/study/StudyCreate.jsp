<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String imagePath = cp + "/pds/saveData";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyCreate.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/study/studyCreate.css">
<link rel="shortcut icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<link rel="icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/assets//js/jquery-ui.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
	body{font-family: 'Noto Sans KR', sans-serif;}
	
	#preview {
	  z-index: 1; /* 필요시 설정 */
	  position: absolute;
	  background: #999999;
	  padding: 2px;
	}
</style>
<script type="text/javascript">
		
	var array = new Array();
	var array2 = new Array();

    $(function(){
    	
    	$("#calBtn").datepicker(
		{
			dateFormat : "yy-mm-dd"
			, changeYear : true
			, changeMonth : true
		});	
   	 
	   	// AJAX 요청 및 응답 처리
	   	ajaxSpcAreaRequest();
   	 
        //모달을 전역변수로 선언
        var modalContents = $(".modal-contents");
        var modal = $("#defaultModal");
        
        $('.onlyAlphabetAndNumber').keyup(function(event){
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
                var inputVal = $(this).val();
                $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), 영어, 숫자만 가능
            }
        });
        
        $(".onlyHangul").keyup(function(event){
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
                var inputVal = $(this).val();
                $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
            }
        });
    
        $(".onlyNumber").keyup(function(event){
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
                var inputVal = $(this).val();
                $(this).val(inputVal.replace(/[^0-9]/gi,''));
            }
        });
        
        
        $('#title').keyup(function(event){
            
            var divName = $('#divName');
            
            if($.trim($('#name').val())==""){
                divName.removeClass("has-success");
                divName.addClass("has-error");
            }else{
                divName.removeClass("has-error");
                divName.addClass("has-success");
            }
        });
        
        
		
       // 지역명이 바뀌면 상세지역 ajax 호출
		$("#area").change(function()
		{
			ajaxSpcAreaRequest();
			
		})

		// 취소 버튼 클릭 시 되돌아가기
		$("#cancelBtn").click(function() 
		{
			var result = confirm("스터디 개설을 취소하시겠습니까?");
	         
	         if(result)
	         {
	            location.href = "<%=cp%>/studylist.action";
	         }
	         else if(result==null)
	         {
	            return;
	         }
		});

		//alert($('input[name=provisionyn]').val());
		// 개설 버튼 클릭 시 유효성 체크
		$("#joinBtn").click(
			function()
			{
				if ($("#title").val() == "" || $("#content").val() == ""
						|| $("#week").val() == 0
						|| $("#area").val() == 0
						|| $("#spcArea").val() == 0
						|| $("#stuNum").val() == ""
						|| $("#start").val() == ""
						|| $("#term").val() == 0
						|| $("#level").val() == 0
						|| $("#Idntt").val() == 0
						)
				{
					$("#err").html("필수 입력 항목이 누락되었습니다.");
					$("#err").css("display", "inline");
					return;
				}
				
				if ($("#stuNum").val() > 15)
				{
					$("#err").html("모임 인원수는 15명 이하만 가능합니다.");
					$("#err").css("display", "inline");
					return;
				}
				
				if($("#stuKeyBox").children().length == 0)
	            {
	               $("#err").html("관심 키워드는 최소 한 개 이상 선택해야 합니다.");
	               $("#err").css("display", "inline");
	               return;
	            }
				
				if($("#stuDayBox").children().length == 0)
	            {
	               $("#err").html("모임 요일은 최소 한 개 이상 선택해야 합니다.");
	               $("#err").css("display", "inline");
	               return;
	            }
				
				// 최종 submit
				$("#joinForm").submit();
	
			});
		
		// datePicker
		$("#start").datepicker(
		{
			showOn: "both",
			buttonImage: "<%=cp%>/assets/images/calendar.PNG",
			buttonImageOnly: true,
			buttonText: "Select date",
			dateFormat: 'yy-mm-dd'
		});
		
		$("#authNumBtn").click(function() 
		{			 
			if($("#authNum").val() == "" || $("#authNum").val() == null)
			 {
				  alert("인증번호를 입력하세요.");
				  return;
			 }

			 if($("#authNum").val() == phoneCheck)
		     {
				 alert("인증에 성공하였습니다.");
				 $("#authNumRslt").attr("value", "인증 성공");
				 
				 $("#joinBtn").removeAttr("disabled");
		     }
			 else if($("#authNum").val() != phoneCheck)
			 {
				 alert("인증에 실패하였습니다.");
				 $("#authNumRslt").attr("value", "인증 실패"); 
			 }
			 else
			 {
				 alert("인증에 실패하였습니다.");
				 $("#authNumRslt").attr("value", "인증 실패");
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
		      
		      if(selectedValue =='INT9999')
		      {
		    	  selectedText = keyInput;
		      }
		      
		      for (var i = 0; i < array.length; i++) 
		      {
					if(selectedText == array[i])
					{
						alert(selectedText)
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
		      
		      if(selectedValue == 'INT9999')
		      {
		    	  
		    	  $(".stuKeyBox").append("<div class='tagStyle'><span class='keyTag'>"+ selectedText 
		    			  + "<input type='hidden' name='etcTagList' value='"+ selectedText + "'></span></div>");
		      }
		      // 관심키워드 일 때...
		      else
		      {
		    	  $(".stuKeyBox").append("<div class='tagStyle'><span class='keyTag'>"+ selectedText 
		    			  + "<input type='hidden' name='intTagList' value='"+ selectedValue + "'></span></div>");			    	  
		      }
		      
		 });
			
		 $("#keySelect").change(function() 
		 {
			    var selectedValue = "";
			 	// alert("셀렉트값 변경");
			 	
			 	selectedValue = $("#keySelect option:checked").val();
			 
				if(selectedValue == "INT9999")
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
			   $(".stuKeyBox").empty();
			   array = [];
		 });
		 
		 
		// 요일 키워드 추가 버튼
		 $("#dayAddBtn").click(function() 
	     {
		      var tmpHtml = "";
		      var selectedKey = "";
		      var dayInput = "";

		      tmpHtml = tmpHtml + "";
		      
		      selectedText = $("#daySelect option:checked").text();
		      selectedValue = $("#daySelect option:checked").val();
		      dayInput = $("#dayInput").val();
		      elementCount = $(".tagStyle2").length;
		      
		      for (var i = 0; i < array2.length; i++) 
		      {
					if(selectedText == array2[i])
					{
						alert(selectedText)
						alert("중복된 키워드는 입력 할 수 없습니다.");
						return;
					}
			  }
		      
		   	  // 요일 개수 제한
		      if(elementCount == 4)
		      {
		    	  alert("요일은 최대 4개 까지 선택 할 수 있습니다.")
		    	  return;
		      }
		      
		      array2.push(selectedText);
		      
	    	  $(".stuDayBox").append("<div class='tagStyle2'><span class='dayTag'>"+ selectedText 
	    			  + "<input type='hidden' name='dayList' value='"+ selectedValue + "'></span></div>");			    	  
		      
		 });
			
			 
		 // 요일 삭제 버튼
		 $("#dayResetBtn").click(function() 
	     {
			   $(".stuDayBox").empty();
			   array2 = [];
		 });
		 
		 $('INPUT[type="file"]').change(function () 
	      {
	    	 var ext = this.value.match(/\.(.+)$/)[1];
	    	 switch (ext) 
	    	 {
		         case 'jpg':
		         case 'JPG':
		         case 'jpeg':
		         case 'JPEG':
		         case 'png':
		         case 'PNG' :
		         case 'gif':
		         case 'GIF':
		        	 
		         $('#proImgBtn').attr('disabled', false);
		            break;
	        	 default:
	             alert('형식에 어긋나는 파일입니다.');
	             this.value = '';
	    	 }
		  });
		 
		 $("#proImgBtn").click(function()
         {
            var result = confirm('정말 등록하시겠습니까?'); 
            
            if(result) 
            { 
                    var myFormData = new FormData();
                    
                    var fileok = document.getElementById("uploadFile");
                    
                    var fileCheck = null;
                    
                    fileCheck = $("#uploadFile").val();

                    
                    myFormData.append("fileok", fileok.files[0]);
                    
                    if(fileCheck == false)
                    {
                         alert("파일을 첨부해 주세요");
                         return;
                    }
                    else
                    {
                       $.ajax(
                       {
                            url: '<%=cp%>/ajaximg.action',
                            type: 'POST',
                            processData: false, 
                            contentType: false,
                            dataType : 'text',
                            data: myFormData,
                            
                            success : function(data)
                            {
                             var dataArray = data.split("\\");
                                
                             
                             var reverse = dataArray.reverse().join("\\");
                             
                             var newpics = reverse.substring( 0, reverse.indexOf("\\"));
                             
                             newpics = "/FinalComeit/pds/saveData/" + newpics;
                             
                             $('#okFile').val(newpics);
                               
                            }
                       })
                    }
             } 
            else 
             { 
             }

                    
                 
          })
                 
          
                 
           var xOffset = 0;
           var yOffset = 5;
             
           $(document).on("mouseover", "#thumbnail", function (e) 
           {
               
               var okFile = $("#okFile").val();
           
                if(okFile == false)
               {
                   return;
               }
                else
                {
                 var div = $("<div>", {id: "preview"});
                 
                 var img = "<img id='bye' src='" + okFile + "' style='width: 400px; height: 200px;'>";
                 
                 div.append(img);
                 
                 $("body").append(div);
                 
                 $("#preview")
                     .css("top", (e.pageY - xOffset) + "px")
                     .css("left", (e.pageX + yOffset) + "px")
                     .fadeIn("fast"); 
                }
               
               
           }); 
           
           $(document).on("mousemove", "#thumbnail", function (e) {
               $("#preview")
                   .css("top", (e.pageY - xOffset) + "px")
                   .css("left", (e.pageX + yOffset) + "px");
           });


           $(document).on("mouseout", "#thumbnail", function () 
           { 
              $("#preview").remove()
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
 			$("#spcAreaDiv").html(data);
 			$("#spcArea").removeAttr("disabled");
 		});
 	}
	
</script>
</head>
<body class="padding">

	<!-- 헤더 -->
	<div class="row">
		<div class="col-md-12">
		<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
		</div>
	</div><!-- row -->
	
	<div class="container-fluid">
	
	<!-- 스터디 개설 문구 -->	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="boardName">
				<h1>스터디 개설</h1>
				<hr />
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	
	<!-- 리스트 -->
	<div class="row listBody">
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
	<form id="joinForm" class="form-horizontal" role="form" method="post"
		action="studycreate.action">

		<div class="form-group " id="divTitle">
			<label for="inputTitle" class="col-lg-2 control-label">제목<span
				class="must">*</span></label>
			<div class="col-lg-10 form-inline">
				<input type="text" required="required"
					class="form-control" id="title" name="title"
					data-rule-required="true" 
					maxlength="30"
					style="width: 85%;"> &nbsp;
				
			</div>
		</div>
		<div class="form-group" id="divContent">
			<label for="inputContent" class="col-lg-2 control-label">상세내용<span
				class="must">*</span></label>
			<div class="col-lg-10 form-inline">
				<textarea id="content" name="content" style="width: 85%;" class="form-control" rows="8"
				placeholder="우리 스터디가 공부할 내용 및 상세 커리큘럼을 입력해 주세요. "></textarea>
			</div>
		</div>
		<!-- 키워드 -->
		<div class="form-group">
			<div class="stuKeyword">
				<label for="inputIntKeyword" class="col-lg-2 control-label">관심
					키워드(최대 5개)<span class="must">*</span>
				</label>

			</div>
			<div class="stuKey1">
				<div class="stuKeySel">
					<div class="col-lg-10 form-inline">
						<!-- <select name="keySelect" id="keySelect" class="form-control keySelect">
								<option value="key1">java</option>
								<option value="key2">oracle</option>
								<option value="key3">jsp</option>
								<option value="key4">spring</option>
								<option value="key5">기타</option>
							</select> -->

						<select name="keySelect" id="keySelect"
							class="form-control keySelect">
							<c:forEach var="intTag" items="${intTag }">
								<option value="${intTag.int_tag_cd }">${intTag.int_tag }</option>
							</c:forEach>
						</select> &nbsp; <input type="text" class="keyInput form-control"
							id="keyInput" placeholder="기타 관심 키워드를 입력해 주세요." style="width: 30%"
							readonly="readonly" /> &nbsp; <input type="button" id="keyAddBtn"
							value="추가" class="keyBtn btn btn-primary" /> &nbsp; <input
							type="button" id="keyResetBtn" value="초기화"
							class="keyBtn btn btn-primary" />

					</div>
					<!-- end / col-lg-10 form-inline -->
				</div>
				<!-- stuKeySel -->
			</div>
			<!-- end .stuKey -->
		</div>

		<div class="form-group">
			<label for="inputIntTag" class="col-lg-2 control-label"></label>
			<div class="col-lg-10 form-inline">
				<div id="stuKeyBox" class="stuKeyBox" style="width: 85%;"></div>
				<!-- end .stuKeyBox -->
			</div>
		</div><!-- 관심 키워드 선택 영역 끝 -->
		
		<!-- 모임 지정 요일 -->
		<div class="form-group">
			<div class="stuDay">
				<label for="inputStuDay" class="col-lg-2 control-label">모임 요일(최대 4개)<span class="must">*</span>
				</label>

			</div>
			<div class="stuDay1">
				<div class="stuDaySel">
					<div class="col-lg-10 form-inline">
						
						<select name="daySelect" id="daySelect"
							class="form-control daySelect">
							<c:forEach var="days" items="${day }">
								<option value="${days.day_cd }">${days.day_name }</option>
							</c:forEach>
						</select> &nbsp; <input type="button" id="dayAddBtn"
							value="추가" class="dayBtn btn btn-primary" /> &nbsp; <input
							type="button" id="dayResetBtn" value="초기화"
							class="dayBtn btn btn-primary" />

					</div>
					<!-- end / col-lg-10 form-inline -->
				</div>
				<!-- stuKeySel -->
			</div>
			<!-- end .stuKey -->
		</div>
		
		<div class="form-group">
			<label for="inputdayBox" class="col-lg-2 control-label"></label>
			<div class="col-lg-10 form-inline">
				<div id="stuDayBox" class="stuDayBox" style="width: 85%;"></div>
				<!-- end .stuKeyBox -->
			</div>
		</div><!-- 모임 지정 요일 영역 끝 -->
		
		<!-- 활동 지역 -->
		<div class="form-group" id="stuArea">
			<label for="stuArea" class="col-lg-2 control-label">활동 지역<span
				class="must">*</span></label>
			<div class="col-lg-10" style="float: left; width: 210px;">

				<select name="area" required="required" id="area"
					class="area form-control">
					<option value="0">지역 선택</option>
					<c:forEach var="areas" items="${area }">
						<option value="${areas.area_cd }"
							${areas.area_cd == spcArea.area_cd ? "selected= \"selected\"" : ""}>
							${areas.area_name }</option>
					</c:forEach>
				</select>

			</div>


			<!-- div 안에있는 select 문은 AjaxJoinSpcArea.jsp에서 가져온다 -->
			<div id="spcAreaDiv" class="col-lg-10"
				style="float: left; width: 225px;"></div>
		</div>
		
		<!-- 모집 인원 -->
		<div class="form-group" id="divNum">
			<label for="inputNum" class="col-lg-2 control-label">모집 인원<span class="must">*</span>
			</label>
			<div class="col-lg-10 form-inline">
				<input type="text" class="form-control onlyNumber" id="stuNum"
					name="stuNum" data-rule-required="true"
					placeholder="숫자만 입력하세요." maxlength="2" style="width: 40%;">
			</div>
			
		</div>
		
		<!-- 시작 날짜 -->
		<div class="form-group" id="divStuStart">
			<label for="inputStuStart" class="col-lg-2 control-label">시작 날짜<span class="must">*</span>
			</label>
			<div class="col-lg-10 form-inline">
				<input type="text" class="start form-control" id="start"  name="start"
					placeholder="시작날짜를 선택하세요." readonly="readonly" style="width: 40%;"/>
			</div>
			
		</div>
		
		<!-- 스터디 카테고리 -->
		<div class="form-group" id="divCat">
			<label for="inputCat" class="col-lg-2 control-label">카테고리<span
				class="must">*</span></label>
			<div class="col-lg-10">

				<select name="stuCat" required="required" id="term"
					class="posiSel form-control" style="width: 40%;">
					<option value="0">카테고리 선택</option>
					
					<c:forEach var="stuCats" items="${stuCat }">
						<option value="${stuCats.stu_cat_cd }">${stuCats.cat_name }
						</option>
					</c:forEach>
				</select>

			</div>
		</div>
		
		<!-- 기간 -->
		<div class="form-group" id="divTerm">
			<label for="inputTerm" class="col-lg-2 control-label">기간<span
				class="must">*</span></label>
			<div class="col-lg-10">

				<select name="term" required="required" id="term"
					class="posiSel form-control" style="width: 40%;">
					<option value="0">기간 선택</option>
					
					<c:forEach var="meetTerms" items="${meetTerm }">
						<option value="${meetTerms.meet_term_cd }">${meetTerms.meet_term }개월
						</option>
					</c:forEach>
				</select>

			</div>
		</div>
		
		<!-- 레벨 -->
		<div class="form-group" id="divLevel">
			<label for="inputLevel" class="col-lg-2 control-label">레벨<span
				class="must">*</span></label>
			<div class="col-lg-10">

				<select name="level" required="required" id="level"
					class="posiSel form-control" style="width: 40%;">
					<option value="0">레벨 선택</option>
					
					<c:forEach var="levels" items="${level }">
						<option value="${levels.lv_cd }">${levels.lv }
						</option>
					</c:forEach>
				</select>

			</div>
		</div>
		
		<!-- 신분 -->
		<div class="form-group" id="divIndtt">
			<label for="inputIdntt" class="col-lg-2 control-label">신분<span
				class="must">*</span></label>
			<div class="col-lg-10">

				<select name="Idntt" required="required" id="Idntt"
					class="posiSel form-control" style="width: 40%;">
					<option value="0">신분 선택</option>
					
					<c:forEach var="idntts" items="${idntt }">
						<option value="${idntts.idntt_cd }">${idntts.idntt_type }
						</option>
					</c:forEach>
				</select>

			</div>
		</div>
		
		<!-- 비밀방 여부 -->
		<div class="form-group" id="divSecret">
			<label for="inputSecret" class="col-lg-2 control-label">비밀방 설정</label>
			<div class="col-lg-10">
			<input type="text" class="form-control onlyNumber" id="scrt"
					name="scrt" data-rule-required="true"
					placeholder="4자리 숫자를 입력하세요." maxlength="4" style="width: 40%;">
			</div>
		</div>
		
		
		<!-- 대표 이미지 -->
		<div class="image form-group">
            <label for="profileimage" class="col-lg-2 control-label">대표
               이미지</label>
            <div class="col-lg-10 form-inline">
               <!-- <form action="Test_ok.jsp" method="post" enctype="multipart/form-data"> -->
               <input type="file" id="uploadFile" name="uploadFile"
                  class="form-control" accept=".gif, .jpg, .png, .jpeg" style="width: 65%;" />
               <input type="text"
                  class="form-control" id="thumbnail" style="width: 20%;" readonly="readonly" value="미리보기">
               &nbsp;
               <button class="btn btn-primary" id="proImgBtn" type="button">등록</button>
               <input type="hidden" id="okFile" name="okFile" class="btn btn-primary">
            </div>
         </div>
		

		<div class="form-group">
			<div class="col-lg-offset-2 col-lg-10 bottom">
				<div class="errMsg">
					<span id="err"></span>
				</div>
				<div class="joinDiv">
					<button type=button id="cancelBtn"
						class="btn btn-lg cancelBtn">취소</button>
					<button type="button" id="joinBtn"
						class="btn btn-lg btn-success joinBtn">개설</button>
				</div>
			</div>
		</div>
	</form>
	</div><!-- end .col-md-8 -->
	<div class="col-md-2">
	</div>
	</div>
	</div><!-- end .container-fluid -->
	
	<!-- 푸터 -->
	<div class="row">
		<div class="col-md-12">
		<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
		</div>
	</div>

</body>
</html>