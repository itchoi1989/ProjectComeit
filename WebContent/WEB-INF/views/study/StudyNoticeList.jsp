<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String stu_cd = request.getParameter("stu_cd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyNoticeList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/study/studyNoticeList.css">


<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/assets/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/study/studynoticedetail.css" >

<script type="text/javascript">

	var pageNum = 0;
	
	$(function()
	{
		// ajax처리
		ajaxStudyNoticeList();
		
		// 페이징 번호가 클릭 됐을때
		$(document).on('click', '.page-link', function()
		{
			pageNum = $(this).text();
			ajaxStudyNoticeList();
		});
		// end 페이징 번호가 클릭 됐을때
		
	});
	
	// 이 스터디방에 대한 공지사항 리스트 뿌려주는 ajax
	function ajaxStudyNoticeList()
	{
		if(pageNum == 0)
		{
			var params = "stu_cd=" + $("#studyCode").val();	
		}
		else
		{
			var params = "stu_cd=" + $("#studyCode").val() + "&pageNum=" + pageNum; 
		}
		
		$.ajax(
		{
			type : "POST"
			, url : "studynoticelist.action"
			, data : params
			, dataType : "text"
			, async: false
			, success : function(data)
			{
				alert(data);
				//alert("성공" + data);
				$(".noticeList").html(data);
				
				// 게시글 상세 정보 보기 클릭 시
				$(".noticeListTitle").click(function()
				{
					//alert("상세");
					
					var send = params + "&stu_ntc_pnt_cd=" + $(this).val();
					
					$.ajax(
					{
						type : "POST"
						, url : "studynoticedetail.action"
						, data : send
						, dataType : "text"
						, async : false
						, success : function(args) 
						{
							//alert("상세성공");
							$(".noticeList").html(args);
							
							// 목록 버튼 클릭 시 리스트로 이동
							$(".goListBtn").click(function() 
							{
								ajaxStudyNoticeList();
							});
							
							// 수정 버튼 클릭 시
							
							// 게시글 삭제 버튼 클릭 시
							
							// 댓글 삭제 버튼 클릭 시
							
							// 댓글 등록 버튼 클릭 시
							
							
							
						}
					});
				
				});
				
				// 등록 버튼 클릭 시
				$(".notice-add").click(function() 
				{
					var params2 = "stu_cd=" + $("#studyCode").val();
					
					//alert("등록");
					$.ajax(
					{
						type : "POST"
						, url : "studynoticeaddjsp.action"
						, data : params2
						, dataType : "text"
						, async : false
						, success : function(args) 
						{
							//alert("등록성공" + args);
							
							$(".noticeList").html(args);
							
							$("#noticeCreateBtn").click(function() 
							{
								alert("실제 등록");
								
								
							});
							
							$(".notice-cancel").click(function() 
							{
								ajaxStudyNoticeList();	
							});
						}
					});
				});
				
				
			}
			, error : function(e)
			{
				alert(e.responseText + "에러");
			}
		});
	}
	

</script>

</head>
<body>

<div class="container-fluid" id="bodyDiv">
	
</div><!-- end .container-fluid -->

</body>
</html>