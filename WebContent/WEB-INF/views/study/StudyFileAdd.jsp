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
<title>StudyFileAdd.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/study/studyfileadd.css" >

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/assets/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(function() 
	{
		$('INPUT[type="file"]').change(function() {
			var ext = this.value.match(/\.(.+)$/)[1];
			switch (ext) {
			case 'DOCX':
			case 'docx':
			case 'pdf':
			case 'PDF':
			case 'hwp':
			case 'HWP':
			case 'txt':
			case 'xlsx':
				break;
			default:
				alert('형식에 어긋나는 파일입니다.');
				this.value = '';
			}
		});
		
		$("#fileAddBtn").click(function() 
		{		
			if ($("#file_upload").val() != null || $("#file_upload").val() !="") 
			{
			
				//alert($("#file_check").val())
				
				var myFormData = new FormData();
				var fileok = document.getElementById("file_upload");
				var fileCheck = null;
				
				fileCheck = $("#file_upload").val();
				
				myFormData.append("fileok", fileok.files[0]);
				
				$.ajax(
				{
					url: '<%=cp%>/ajaxfileadd.action',
                    type: 'POST',
                    processData: false, 
                    contentType: false,
                    dataType : 'text',
                    data: myFormData,
                    
                    success : function(data)
                    {
                     	alert("파일 확인");
                    	var dataArray = data.split("\\");   
                        
                        var reverse = dataArray.reverse().join("\\");
                        
                        var newpics = reverse.substring( 0, reverse.indexOf("\\"));
                        
                        newpics = "/FinalComeit/pds/saveData/" + newpics;
                        
                        $('#file_check').val(newpics);
                        
                        alert("파일확인완료 : "+ $('#file_check').val(newpics));

                    }
				})
				
			}
			
			
			if ($("#file_title").val() == "" && $("#file_content").val() == "")
			{
				$("#err").html("필수 입력 항목이 누락되었습니다.");
				$("#err").css("display", "inline");
				return;
			}
			
			$("#fileAddFrom").submit();
			
		});
		
	});
	
	
</script>


</head>
<body>

<div class="container-fluid">

	<!-- 상세내용 영역 -->
	<div class="row">
		<div class="col-md-12">
		<form id="fileAddFrom" method="post" role="form" action="studyfileinsert.action">
			<table class="table detail">
				<tr>
					<th>제목 *</th>
					<td colspan="4">
					<input type="text" class="form-control" id="file_title" name="file_title" >
					</td>
				</tr>
				<tr class="tit">
					<th>작성자</th>
					<td>${sessionScope.name }</td>
					<th>작성일</th>
					<td>${today }</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="4">
					<input type="file" id="file_upload" name="file_upload"
					onchange="$('#file_check').val(this.value.replace(/c:\\fakepath\\/i,''))">
					</td>
				</tr>
				<tr class="content">
					<th>내용 *</th>
					<td colspan="4">
					<textarea class="form-control" id="file_content" name="file_content" rows="20"></textarea>
					</td>
				</tr>
			</table>
			<input type="hidden" id="stu_cd" name="stu_cd" value="${stu_cd }"/>
			<input type="hidden" name="file_check" id="file_check" />
		</form>
		</div>
	</div><!-- 상세내용 영역 끝 -->
	
	<!-- 버튼 영역 -->
	<div class="row">
	
		<div class="col-md-12">
		
			<div class="bottom">
				<div class="errMsg">
					<span id="err" style="display: none; color: red; font-weight: bold; font-size: 12pt;"></span>
				</div>
			
				<button type="button" class="btn btn-primary btn-lg" id="fileAddBtn" >
					등록
				</button>

				<button type="button" class="btn btn-lg btm file-cancel">
					취소
				</button>
			
			</div>
		</div>
		
		
	</div><!-- 버튼 영역 끝-->
	
	
</div>

</body>
</html>