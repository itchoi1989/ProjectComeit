<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/space/spacecreate.css">
<!-- 글씨체 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet"><style type="text/css">
body{font-family: 'Noto Sans KR', sans-serif;}
</style>
<!-- 파비콘 -->
<link rel="shortcut icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<link rel="icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<style type="text/css">
	
	#preview 
	{
	  z-index: 1;
	  position: absolute;
	  background: #333333;
	  padding: 2px;
	}

</style>
<script type="text/javascript">
var array = new Array();
var arrayCon = new Array();


	/* 페이지 전환 */
	$(document).ready(function()
	{
		$('.show1').show(); //페이지를 로드할 때 표시할 요소
		$('.show2').hide(); //페이지를 로드할 때 숨길 요소
		$('.show3').hide(); //페이지를 로드할 때 숨길 요소
		$('.show4').hide(); //페이지를 로드할 때 숨길 요소
		$('.show5').hide(); //페이지를 로드할 때 숨길 요소
		
		$('#next1').click(function()
		{
			$ ('.show1').hide();
			$ ('.show2').show();
			$ ('.show3').hide();
			$ ('.show4').hide();
			$ ('.show5').hide(); 
			$('#check1').addClass('btn-default');
			$('#check1').removeClass('btn-success');
			$('#check2').addClass('btn-success');
			return false;
		});
		
		$('#next2').click(function()
		{
			$ ('.show1').hide(); 
			$ ('.show3').show(); 
			$ ('.show2').hide(); 
			$ ('.show4').hide(); 
			$ ('.show5').hide(); 
			$('#check2').addClass('btn-default');
			$('#check2').removeClass('btn-success');
			$('#check3').addClass('btn-success');
			return false;
		});
		$('#next3').click(function()
		{
			$ ('.show1').hide(); 
			$ ('.show4').show(); 
			$ ('.show2').hide(); 
			$ ('.show3').hide(); 
			$ ('.show5').hide(); 
			$('#check3').addClass('btn-default');
			$('#check3').removeClass('btn-success');
			$('#check4').addClass('btn-success');
			return false;
		});
		$('#next4').click(function()
		{
			$ ('.show1').hide(); 
			$ ('.show5').show(); 
			$ ('.show2').hide(); 
			$ ('.show3').hide(); 
			$ ('.show4').hide(); 
			$('#check4').addClass('btn-default');
			$('#check4').removeClass('btn-success');
			$('#check5').addClass('btn-success');
			return false;
		});
	});
		

$(function(){
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
       	 
        $('#spanumfile').attr('disabled', false);
           break;
        $('#uploadSpaBtn').attr('disabled', false);           
      	 default:
           alert('형식에 어긋나는 파일입니다.');
           this.value = '';
  	 	}
 	});
    		  
    // 사업자 파일
    $("#spanumfile").click(function()
      {
    	var result = confirm('정말 등록하시겠습니까?'); 
        
        if(result) 
        {
         var myFormData = new FormData();
         var fileok = document.getElementById("uploadFile1");
         var fileCheck = null;
         fileCheck = $("#uploadFile1").val();

         //alert(fileCheck);
         
          //alert(fileok.files[0].name);
         
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
                 url: '<%=cp%>/ajaxspafile.action',
                 type: 'POST',
                 processData: false, // important
                 contentType: false,//'multipart/form-data', // important
                 dataType : 'text',
                 data: myFormData,
                 async:false,
                 success : function(data)
                 {
                	 //alert(data);
                     
                     var dataArray = data.split("\\");
                     
                     
                     var reverse = dataArray.reverse().join("\\");
                     
                     var newpics = reverse.substring( 0, reverse.indexOf("\\"));
                     
                     newpics = "/FinalComeit/pds/saveData/" + newpics;
                     
                     $('#okFile1').val(newpics);
                     
                    //alert(good);
                    <%-- alert('<%=cp%>'); --%>
                    
                    $("#next1").removeAttr("disabled");
                    <%-- $("#goodImg").attr("src", '<%=imagePath%>'+'/' + fileok.files[0].name); --%>
                 }
            })
         }
        }
        else
        {
        	
        }
      
      });
      
      
    // 대표사진여부
    $("#uploadSpaBtn").click(function()
    {
		var result = confirm('정말 등록하시겠습니까?'); 
        
        if(result)
        {
         var myFormData = new FormData();
         var fileok = document.getElementById("uploadSpaFile");
         var fileCheck = null;
         fileCheck = $("#uploadSpaFile").val();

         //alert(fileCheck);
         
          //alert(fileok.files[0].name);
         
         myFormData.append("fileokSpa", fileok.files[0]);
         
         if(fileCheck == false)
         {
              alert("파일을 첨부해 주세요");
              return;
         }
         else
         {
            $.ajax(
            {
                 url: '<%=cp%>/ajaxspaimg.action',
                 type: 'POST',
                 processData: false, // important
                 contentType: false,//'multipart/form-data', // important
                 dataType : 'text',
                 data: myFormData,
                 async:false,
                 success : function(data)
                 {
                	 //alert(data);
                	 var dataArray = data.split("\\");
                     
                     var reverse = dataArray.reverse().join("\\");
                     
                     var newpics = reverse.substring( 0, reverse.indexOf("\\"));
                     
                     newpics = "/FinalComeit/pds/saveData/" + newpics;
                     
                     $('#okFile2').val(newpics);
                     
             
                    //var good = $("#fileokSpa").val();
                    
                    //alert(good);
                    <%-- alert('<%=cp%>'); --%>
                    
                    $("#spa").removeAttr("disabled");
                    $("#spaname").removeAttr("disabled");
                    $("#spapeo").removeAttr("disabled");
                    $("#spatel").removeAttr("disabled");
                    $("#start").removeAttr("disabled");
                    $("#end").removeAttr("disabled");
                    $("#max").removeAttr("disabled");
                    <%-- $("#goodImg").attr("src", '<%=imagePath%>'+'/' + fileok.files[0].name); --%>
                 }
            })
         }
        }
        else
        {
        	
        }
      
      });
      
      var xOffset = 5;
      var yOffset = 15;
            
          $(document).on("mouseover", "#thumbnail1", function (e) 
          {
              
              var okFile1 = $("#okFile1").val();
          
               if(okFile1 == false)
              {
                  return;
              }
               else
               {
                var div = $("<div>", {id: "preview"});
                
                var img = "<img id='bye' src='" + okFile1 + "' style='width: 400px; height: 200px;'>";
                
                div.append(img);
                
                $("body").append(div);
                
                $("#preview")
                    .css("top", (e.pageY - xOffset) + "px")
                    .css("left", (e.pageX + yOffset) + "px")
                    .fadeIn("fast"); 
               }
              
              
          }); 
          
          $(document).on("mousemove", "#thumbnail1", function (e) {
              $("#preview")
                  .css("top", (e.pageY - xOffset) + "px")
                  .css("left", (e.pageX + yOffset) + "px");
          });


          $(document).on("mouseout", "#thumbnail1", function () 
          { 
             $("#preview").remove()
          });
          
          
          
          $(document).on("mouseover", "#thumbnail2", function (e) 
                  {
                      
                      var okFile2 = $("#okFile2").val();
                  
                       if(okFile2 == false)
                      {
                          return;
                      }
                       else
                       {
                        var div = $("<div>", {id: "preview"});
                        
                        var img = "<img id='bye' src='" + okFile2 + "' style='width: 400px; height: 200px;'>";
                        
                        div.append(img);
                        
                        $("body").append(div);
                        
                        $("#preview")
                            .css("top", (e.pageY - xOffset) + "px")
                            .css("left", (e.pageX + yOffset) + "px")
                            .fadeIn("fast"); 
                       }
                      
                      
                  }); 
                  
                  $(document).on("mousemove", "#thumbnail2", function (e) {
                      $("#preview")
                          .css("top", (e.pageY - xOffset) + "px")
                          .css("left", (e.pageX + yOffset) + "px");
                  });


                  $(document).on("mouseout", "#thumbnail2", function () 
                  { 
                     $("#preview").remove()
                  });
    
    // 사업자번호 중복 확인
    $('#dupBtn').click(function()
		 {
   	 
			 if(!$('#num').val())
			 {
				 alert("사업자 번호를 입력하세요.");
				 $('#num').focus();
			 }
			 else
			 {
				$.ajax({ type: 'POST', url: 'checkspanum.action', data: { "num" : $('#num').val() }
     		, success: function(data)
         		{  
		           	if($.trim(data) == 0 && $('#num').val() != null)
		           	{ 
		           		alert("등록가능한 번호입니다.");
		           		$("#spanumfile").removeAttr("disabled");
		           	}
		           	else 
		           	{ 
		           		alert("등록 불가능한 번호입니다.");
		           	}
		           	
       				} 
				}); //end ajax
			 }
     	 //alert('뭐');
     	
		});
    
    var oneinch = false;
    var dtlinch = false;
    
    // 한줄소개
    $('#onein').keyup(function(event){
        var oneindiv = $('#oneindiv');
        
        if(($.trim($('#onein').val())!="" && dtlinch==true)){
        	$("#next2").removeAttr("disabled");
        	oneinch=true;
        }
        else if(($.trim($('#onein').val())!=""))
        {
        	oneinch=true;
        }
    });
    
    // 상세소개
    $('#dtlin').keyup(function(event){
        var dtlindiv = $('#dtlindiv');
        
        if(($.trim($('#dtlin').val())!="" && oneinch==true)){
        	$("#next2").removeAttr("disabled");
        	dtlinch=true;
        }
        else if(($.trim($('#dtlin').val())!=""))
        {
        	dtlinch=true;
        }
    });
    
	
	   // 지역명이 바뀌면 상세지역 ajax 호출
		$("#area").change(function()
		{
			ajaxSpcAreaRequest();
			
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
		    	  
		    	  $(".stuKeyBox").append("<div class='tagStyle'><span class='keyTag'>"+ selectedText 
		    			  + "<input type='hidden' name='etcTagList' value='"+ selectedText + "'></span></div>");
		      }
		      // 관심키워드 일 때...
		      else
		      {
		    	  $(".stuKeyBox").append("<div class='tagStyle'><span class='keyTag'>"+ selectedText 
		    			  + "<input type='hidden' name='intTagList' value='"+ selectedValue + "'></span></div>");			    	  
		      }
		      
		      $("#spacon").removeAttr("disabled");
		      $("#spaconup").removeAttr("disabled");
		      $("#resetBtn").removeAttr("disabled");
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
			   $(".stuKeyBox").empty();
			   array = [];
			   $("#spacon").attr("disabled", "disabled");
			   $("#sparsv").attr("disabled", "disabled");
			   $("#spaconup").attr("disabled", "disabled");
			   $("#resetBtn").attr("disabled", "disabled");
			   $("#next3").attr("disabled", "disabled");
		 });
	
	
	
	var checkcon=false;
	
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
	      $("#sparsv").removeAttr("disabled");
	      $("#spaconup").removeAttr("disabled");
	      $("#resetBtn").removeAttr("disabled");
	      checkcon=true;
	 });
	
	// 시설안내 삭제 버튼
	 $("#resetBtn").click(function() 
     {
		   $(".spaConBox").empty();
		   arrayCon = [];
		   $("#sparsv").attr("disabled", "disabled");
		   $("#next3").attr("disabled", "disabled");
	 });
	
	
	// 예약시 주의사항
	$('#sparsv').keyup(function(event){
	    
	    var sparsvdiv = $('#sparsvdiv');
	    
	    if(($.trim($('#sparsv').val())!="" && checkcon==true)){
	    	$("#next3").removeAttr("disabled");
	    }
	});
	
	var checkspa = checkspapeo = checkspaname = checkspatel = checkstart = checkend = checkmax = false;
	 // 상호명
    $('#spa').keyup(function(event){
        if(($.trim($('#spa').val())!="" && checkspapeo==true && checkspatel==true && checkspaname==true && checkstart==true && checkend==true && checkmax==true)){
        	$("#next4").removeAttr("disabled");
        	checkspa=true;
        }
        else if(($.trim($('#spa').val())!=""))
        {
        	checkspa=true;
        }
    });
    
    // 대표자명
    $('#spapeo').keyup(function(event){
        if(($.trim($('#spapeo').val())!="" && checkspa==true && checkspatel==true  && checkspaname==true && checkstart==true && checkend==true && checkmax==true)){
        	$("#next4").removeAttr("disabled");
        	checkspapeo=true;
        }
        else if(($.trim($('#spapeo').val())!=""))
        {
        	checkspapeo=true;
        }
    });
    
    // 공간명
    $('#spaname').keyup(function(event){
        if(($.trim($('#spaname').val())!="" && checkspa==true &&  checkspapeo==true && checkspatel==true && checkstart==true && checkend==true && checkmax==true)){
        	$("#next4").removeAttr("disabled");
        	checkspaname=true;
        }
        else if(($.trim($('#spaname').val())!=""))
        {
        	checkspaname=true;
        }
    });
    
    // 업체 전화번호
    $('#spatel').keyup(function(event){
        if(($.trim($('#spatel').val())!="" && checkspa==true && checkspapeo==true && checkspaname==true && checkstart==true && checkend==true && checkmax==true)){
        	$("#next4").removeAttr("disabled");
        	checkspatel=true;
        }
        else if(($.trim($('#spatel').val())!=""))
        {
        	checkspatel=true;
        }
    }); 
    
    // 시작시간
    $('#start').keyup(function(event){
        if(($.trim($('#start').val())!="" && checkspa==true && checkspapeo==true && checkspaname==true && checkspatel==true && checkend==true && checkmax==true)){
        	$("#next4").removeAttr("disabled");
        	checkstart=true;
        }
        else if(($.trim($('#start').val())!=""))
        {
        	checkstart=true;
        }
    }); 

    // 종료시간
    $('#end').keyup(function(event){
        if(($.trim($('#end').val())!="" && checkspa==true && checkspapeo==true && checkspaname==true && checkspatel==true && checkstart==true && checkmax==true)){
        	$("#next4").removeAttr("disabled");
        	checkend=true;
        }
        else if(($.trim($('#end').val())!=""))
        {
        	checkend=true;
        }
    }); 
    
   // 최대 이용시간
    $('#max').keyup(function(event){
        if(($.trim($('#max').val())!="" && checkspa==true && checkspapeo==true && checkspaname==true && checkspatel==true && checkstart==true && checkend==true)){
        	$("#next4").removeAttr("disabled");
        	checkmax=true;
        }
        else if(($.trim($('#max').val())!=""))
        {
        	checkmax=true;
        }
    }); 
    
/*  	// 세부지역입력
	 $("#spcArea").keyup(function(event)
   {
		   $("#dtladdr").removeAttr("disabled");
	 }); */
    
 	// 상세주소 입력, 등록버튼 해제하기
	 $("#dtladdr").change(function() 
    {
		   $("#finish").removeAttr("disabled");
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
	
	 $("#finish").click(
       function()
       {
          if ($("#dtladdr").val() == "" || $("#area").val() == 0
                || $("#spcArea").val() == 0 )
          {
             $("#err").html("필수 입력 항목이 누락되었습니다.");
             $("#err").css("display", "inline");
             return;
          }
          $("#spaReqForm").submit();
 
       });
	 
	//카페 유형 cafe
	    function cafeType()
	    { 
	    	/* var cafeSelect = document.getElementById("cafe"); 
	    	var cafeValue = cafeSelect.options[cafeSelect.selectedIndex].value; 
	    	var cafeText = cafeSelect.options[cafeSelect.selectedIndex].text;  */
	    	$("#onein").removeAttr("disabled");
	    	$("#dtlin").removeAttr("disabled");
	    }
	
</script>
</head>
<body>

<div class="container spadiv spawh">
	<br><h5>공간 등록</h5><button type="button" class="btn" onclick="location.href='spalist.action'">등록취소</button>
	<br><br>
    <div class="stepwizard">

        <div class="stepwizard-row setup-panel">
            <div class="stepwizard-step col-xs-3"> 
                <a href="#step-1" id="check1" type="button" class="btn btn-success btn-circle">1</a>
                <p><small>사업자번호 & 파일</small></p>
            </div>
            <div class="stepwizard-step col-xs-3"> 
                <a href="#step-2" id="check2" type="button" class="btn btn-default btn-circle">2</a>
                <p><small>공간유형 & 소개</small></p>
            </div>
            <div class="stepwizard-step col-xs-3"> 
                <a href="#step-3" id="check3" type="button" class="btn btn-default btn-circle">3</a>
                <p><small>태그 & 공간정보</small></p>
            </div>
            <div class="stepwizard-step col-xs-3"> 
                <a href="#step-4" id="check4" type="button" class="btn btn-default btn-circle">4</a>
                <p><small>사업주정보 & 이미지</small></p>
            </div>
            <div class="stepwizard-step col-xs-3"> 
                <a href="#step-5" id="check5" type="button" class="btn btn-default btn-circle">5</a>
                <p><small>위치 등록[지역]</small></p><!--  & 사이트주소 -->
            </div>
        </div>
    </div>
    
    <form id="spaReqForm" class="form-horizontal" role="form" method="post" action="spareqinsert.action">
        <div class="panel panel-primary show1" id="step-1"><br><br>
            <div class="panel-heading">
                 <h4 class="panel-title">"사업자번호"</h4>
            </div>
            
            <div class="panel-body">
                <div class="form-group" id="divaa"><span style="color: red; font-size: 11pt;"> 사업자등록번호는 필수사항입니다.<br> * 제대로된 정보를 입력하지 않을시 불이익을 받을 수 있습니다.<br><br></span>
						입력한 사업자 번호와 동일한 파일을 업로드 해야합니다. 후 관리자의 검수기간을 거쳐 승인된 공간만 활동할 수 있습니다.<br> 지금 사업자등록번호를 입력해 공간을 등록 하세요!<br>
                     <label class="control-label" style="margin-left: 50px;"></label><br><br><br>
                     <label class="control-label" for="num">사업자등록번호 입력<span class="red">*</span></label>
                     <div class="spain">
                     <div class="aadiv">
                     <div class="form-inline">
                	 	<input maxlength="40" type="text" id="num" 
                		  class="onlyNumber form-control aa"  name="num" placeholder="숫자만 입력" />
                		  <button type="button" id="dupBtn" class="btn btn-primary">인증</button></div>
                		  </div>
                		  <label class="control-label" for="okFile" >첨부파일 업로드<span class="red">*</span></label><br>
                		  <div class="form-inline">
                		 <input type="file" id="uploadFile1" name="uploadFile1"
                  class="form-control" accept=".gif, .jpg, .png, .jpeg" style="width: 65%;" />
                  <input type="text" class="form-control" id="thumbnail1" style="width: 20%;" readonly="readonly" value="미리보기">
                  <button class="btn btn-primary " type="button" id="spanumfile" disabled="disabled">등록</button></div>
                		 <input type="hidden" id="okFile1" name="okFile1" class="btn btn-primary">
                	 </div>
                	 <div class="errMsg">
                    	<span id="err"></span>
                    </div>
                </div>
                
                <button class="btn btn-primary nextBtn pull-right" disabled="disabled" type="button" id="next1">Next</button>
                <div class="errMsg">
               		<span id="err1"></span>
               	</div>
                <br><br>
            </div>
        </div>
        <br><br>
        <div class="panel panel-primary show2" id="step-2">
            <div class="panel-heading">
                 <h4 class="panel-title">"공간 유형"</h4>
            </div>
            <div class="panel-body">
                <div class="form-group">
                       카페의 유형을 선택해주세요!<span class="red">*</span><br>
                    <select name="cafe"  id="cafe" class="posiSel form-control" style="width: 450px;" onchange="cafeType()">
                     <option value="0">카페 유형</option>
                     <c:forEach var="cafe" items="${spaType }">
                             <option value="${cafe.spa_type_cd }">
                                ${cafe.type_name }
                             </option>
                        </c:forEach>
                  </select>
                    
                 </div>
            </div>
            <br><br>
            <div class="panel-heading">
                 <h4 class="panel-title">"공간 소개"</h4>
            </div>
            <div class="panel-body">
                <div class="form-group" id="oneindiv">
                    <label class="control-label">한줄 소개<span class="red">*</span></label>
                    <input maxlength="200" id="onein" name="onein" type="text" disabled="disabled"  class="form-control" placeholder="예) 노트북 대여 가능한 스터디 카페입니다." />
                </div>
                <div class="form-group" id="dtlindiv">
                    <label class="control-label">상세 소개<span class="red">*</span></label>
                    <input maxlength="1000" type="text" id="dtlin" name="dtlin" disabled="disabled"  class="form-control" placeholder="예) 위치는 홍대입구 2번 출구 앞이며 노트북 대여가 가능하고, 최대 이용 시간은 3시간입니다." />
                </div>
                <button class="btn btn-primary nextBtn pull-right"  disabled="disabled"type="button" id="next2">Next</button>
                <br><br>
            </div>
        </div>
        
        <!-- 키워드 입력 -->
        <div class="panel panel-primary show3" id="step-3">
            <div class="panel-heading">
                 <h4 class="panel-title">"태그/키워드"</h4>
            </div>
			    <div class="form-group">
				<div class="stuKeyword">
					<label for="inputIntKeyword" class="col-lg-2 control-label">
						키워드(최대 5개)<span class="red">*</span>
					</label>

				</div>
				<div class="stuKey1">
					<div class="stuKeySel">
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
				<label for="inputPhoneNumber" class="col-lg-2 control-label"></label>
				<div class="col-lg-10 form-inline">
					<div id="stuKeyBox" class="stuKeyBox" style="width: 85%;">
					</div>
					<!-- end .stuKeyBox -->
				</div>
			</div>
			
			
			
			
                <br><br>
                <div class="panel-heading ">
                 	<h4 class="panel-title">"공간 정보"</h4>
            	</div>
                <div class="form-group" id="spacondiv">
                    <label class="control-label" for="1">공간 시설 안내(최대5개)<span class="red">*</span></label>
                    &nbsp;
                    <input type="button" id="spaconup" disabled="disabled" value="추가" class="keyBtn btn btn-primary" />
					&nbsp;	<input type="button" disabled="disabled" id="resetBtn" value="초기화" class="keyBtn btn btn-primary" />
                    <br><br>
                    <input maxlength="200" type="text" id="spacon" name="spacon" disabled="disabled" class="form-control" placeholder="예) 화장실은 복도 왼편에 있습니다." />
                    <div class="form-group">
				<label for="inputPhoneNumber" class="col-lg-2 control-label"></label>
				<div class="col-lg-10 form-inline">
					<div id="spaConBox" class="spaConBox" style="width: 85%;">
						</div>
						<!-- end .stuKeyBox -->
					</div>
				</div>
                </div>
                
                
                
                <div class="form-group" id="sparsvdiv">
                    <label class="control-label" for="2">예약시 주의사항<span class="red">*</span></label>
                    <input maxlength="1000" type="text" id="sparsv" name="sparsv" disabled="disabled"  class="form-control" placeholder="예) 최대 이용시간은 3시간입니다. 준수해주십시오. 5명이상의 단체 예약은 받기 어렵습니다..." />
                </div>
                <button class="btn btn-primary nextBtn pull-right" disabled="disabled" type="button" id="next3">Next</button>
                <br><br>
            </div>

        
        <div class="panel panel-primary show4" id="step-4">
            <div class="panel-heading">
                 <h4 class="panel-title">"사업주정보 & 이미지"</h4>
            </div>
            <br><br>
            <div class="panel-body">
            	대표이미지<span class="red">*</span> 
            <div class="form-inline">
            	<input type="file" id="uploadSpaFile" name="uploadSpaFile"class="form-control" accept=".gif, .jpg, .png, .jpeg" style="width: 65%;" />
            	<input type="text" class="form-control" id="thumbnail2" style="width: 20%;" readonly="readonly" value="미리보기">
		               &nbsp;
		        <button class="btn btn-primary" id="uploadSpaBtn" type="button">등록</button>
		        <input type="hidden" id="okFile2" name="okFile2" class="btn btn-primary">
		   </div>
                		<!-- <br><br>상세이미지<span class="red">*</span>
                		<div class="form-inline">
                		<input type="file" id="uploadFile" name="uploadFile"
		                  class="form-control" style="width: 65%;" />
		               &nbsp;<button class="btn btn-primary" id="proImgBtn" type="button">등록</button></div> -->
            </div>
            <br><br>
            <div class="panel-body">
                <div class="form-inline">
                		상호명<span class="red">*</span>: 
                    	<input maxlength="50" type="text" id="spa" name="spa"  disabled="disabled" class="form-control key" placeholder="예) (주)길동" style="margin-left: 10px; margin-right: 10px;"/>
                    	대표자명<span class="red">*</span>: 
                    	<input maxlength="50" type="text" id="spapeo" name="spapeo" disabled="disabled" class="form-control key" placeholder="예) 홍길동" style="margin-right: 10px; margin-left: 10px;"/>
                    </div>
                     <div class="form-inline">
                    	공간명<span class="red">*</span>: 
                    	<input maxlength="50" type="text" id="spaname" name="spaname"  disabled="disabled" class="form-control key" placeholder="예) 길동이 가게" style="margin-left: 10px; margin-right: 10px;"/>
                    	업체 전화번호<span class="red">*</span> : 
                    	<input maxlength="50" type="text" id="spatel" name="spatel"  disabled="disabled" class="form-control key onlyNumber" placeholder="예) 01000000000(- 제외)" style="margin-right: 10px; margin-left: 10px;"/>
                    </div>
                    <div class="form-inline">
                    	영업시작시간<span class="red">*</span>: 
                    	<input maxlength="50" type="text" id="start" name="start"  disabled="disabled" class="form-control key onlyNumber" placeholder="예)9(→오전9시 오픈시(숫자만입력))" style="margin-left: 10px; margin-right: 10px;"/>
                    	영업종료시간<span class="red">*</span> : 
                    	<input maxlength="50" type="text" id="end" name="end" disabled="disabled" class="form-control key onlyNumber" placeholder="예)20(→오후8시 종료시(숫자만입력))" style="margin-right: 10px; margin-left: 10px;"/>
                    </div>
                    <div class="form-inline">
                    	최대이용시간<span class="red">*</span>: 
                    	<input maxlength="50" type="text" id="max" name="max"  disabled="disabled" class="form-control key onlyNumber" placeholder="예)3 ((시간)숫자만입력)" style="margin-left: 10px; margin-right: 10px;"/>
                    </div>
                <button class="btn btn-primary nextBtn pull-right" type="button" disabled="disabled" id="next4">Next</button>
                <br><br>
            </div>
        </div>
        
        <div class="panel panel-primary show5" id="step-5">
            <div class="panel-heading">
                 <h4 class="panel-title" style="margin-bottom: 10px;">"위치"</h4>
            </div>
            <div class="panel-body">
                <div class="form-group">
                <label class="control-label">위치 등록[지역]<span class="red">*</span></label>
                <div class="form-group" id="areaMemNum">
					<div class="col-lg-10" style="float: left; width: 225px;" >
					
						<select name="area" id="area" class="area form-control">
						<option value="0">지역 선택</option>
							<c:forEach var="areas" items="${area }">
		                        <option value="${areas.area_cd }" 
		                        ${areas.area_cd == spcArea.area_cd ? "selected= \"selected\"" : ""}>
		                           ${areas.area_name }
		                        </option>
		                     </c:forEach>
						</select>
						
					</div>
					
					
					<!-- div 안에있는 select 문은 AjaxJoinSpcArea.jsp에서 가져온다 -->
					<div id="spcAreaDiv" class="col-lg-10" style="float: left; width: 225px;" >
					
					</div>
				</div><!-- end .areaMemNum -->
					<br><br>
					상세주소<span class="red">*</span>
                    <input maxlength="200" type="text" id="dtladdr" name="dtladdr" class="form-control" placeholder="예) 홍대입구 2번출구" />
                </div>
                
                
                <br>
                <div class="panel-heading">
                 	<!-- <h4 class="panel-title" style="margin-bottom: 10px;">"사이트주소"</h4> -->
            	</div>
                <div class="form-group">
                    <!-- <label class="control-label">웹 사이트 주소</label>
                    <input maxlength="200" id="url" type="text" class="form-control" placeholder="예) http://www.~~~.com" /> -->
                </div>
                <div class="errMsg">
                   <span id="err"></span>
                </div>
                <button class="btn btn-success" type="submit" disabled="disabled" id="finish">Finish!</button>
                <br><br>
            </div>
        </div>
    </form>
</div>

</body>
</html>