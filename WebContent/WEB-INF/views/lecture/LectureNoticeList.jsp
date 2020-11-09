<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String lec_cd = request.getParameter("lec_cd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LectureNoticeList.jsp</title>
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/assets/css/lecture/lectureNoticeList.css">

<script type="text/javascript">
	var pageNum = 0;
	
	$(function()
	{
		// ajax처리
		ajaxLectureNoticeList();
		
		// 페이징 번호가 클릭 됐을때
		$(document).on('click', '.page-link', function()
		{
			pageNum = $(this).text();
			ajaxLectureNoticeList();
		});
		// end 페이징 번호가 클릭 됐을때
		
	});

	// 이 강의에 대한 공지사항 리스트 뿌려주는 메소드
	function ajaxLectureNoticeList()
	{
		if(pageNum == 0)
		{
			var params = "lec_cd=" + $("#lectureCode").val();	
		}
		else
		{
			var params = "lec_cd=" + $("#lectureCode").val() + "&pageNum=" + pageNum; 
		}
		
		// 공지사항 리스트 뿌려주는 Ajax
		$.ajax(
		{
			type : "POST",
			url : "lecturenoticelist.action",
			data : params,
			dataType : "text",
			async : false,
			success : function(data)
			{
				alert(data);
				$(".noticeList").html(data);

				// 공지사항 목록의 제목 버튼이 눌렸을 때
				$(".listTitle").click(function()
				{
					var send = params + "&lec_ntc_cd=" + $(this).val();
					
					// 공지사항 상세 ajax
					$.ajax(
					{
						type : "POST",
						url : "lecturenoticedetail.action",
						data : send,
						dataType : "text",
						async : false,
						success : function(args)
						{
							$(".noticeList").html(args);

							// 목록 버튼 클릭 시 리스트로 이동
							$(".goListBtn").click(function()
							{
								ajaxLectureNoticeList();
							});

						}
					});
					// end 공지사항 상세 Ajax
					
				});
				// end 공지사항의 제목이 눌렸을때
				
				// 등록 버튼 클릭 시
				$(".notice-add").click(function() 
				{
					
					var params2 = "lec_cd=" + $("#lectureCode").val();
					
					$.ajax(
					{
						type : "POST"
						, url : "lecturenoticeaddjsp.action"
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
								ajaxLectureNoticeList();	
							});
						}
					});
				});
				// end 등록 버튼 클릭 시 
				
			},
			error : function(e)
			{
				alert(e.responseText + "에러");
			}
			
		});
		// 공지사항 리스트 뿌려주는 Ajax 끝
		
	}
	
</script>

</head>
<body>

	<div class="container-fluid" id="bodyDiv">

		<div class="row">

				<input type="hidden" id="lectureCode" name="lec_cd"
					value="<%=lec_cd%>">

				<!-- 실제 테이블 -->
				<div class="col-md-12 noticeList">
				</div>
				<!-- end div.col-md-12 noticeList -->

		</div>
		<!-- end div.row -->

	</div>
	<!-- end div.container-fluid #bodyDiv -->

</body>
</html>