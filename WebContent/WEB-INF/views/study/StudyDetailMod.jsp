<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String imagePath = cp + "/pds/saveData";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyDetailMod.jsp</title>
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
		
	$(function()
	{
		// 취소 버튼 클릭 시 되돌아가기
		$("#cancelBtn").click(function() 
		{
			var result = confirm("수정을 취소하시겠습니까?");
	         
	         if(result)
	         {
	        	 $(location).attr("href", "studydetail.action?stu_cd=" + $(this).val());	
	         }
	         else if(result==null)
	         {
	            return;
	         }
		});
		
		// 수정 버튼 클릭 시 수정하기
		$("#updateBtn").click(function()
		{
			var result = confirm("스터디 상세정보를 수정하시겠습니까?");
			
			
			if(result)
			{
				$("#contentForm").submit();
			}
			else if(result==null)
			{
			   return;
			}
			
		});
	});
	
	
	
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
				<h1>스터디 수정</h1>
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
	<form id="contentForm" class="form-horizontal" role="form" method="post"
		action="studymodify.action">
		<div class="form-group " id="divTitle">
			<label for="inputTitle" class="col-lg-2 control-label">제목<span
				class="must">*</span></label>
			<div class="col-lg-10 form-inline">
				<input type="text" disabled="disabled" required="required"
					class="form-control" id="title" name="title"
					data-rule-required="true" 
					value = "${studydetailinfo.title }"
					maxlength="30"
					style="width: 85%;"> &nbsp;
				
			</div>
		</div>
		
		
		<div class="form-group" id="divContent">
			<label for="inputContent" class="col-lg-2 control-label">상세내용<span
				class="must">*</span></label>
			<div class="col-lg-10 form-inline">
				<textarea id="content" name="content" style="width: 85%;" class="form-control" rows="8"
				>${studydetailinfo.content }</textarea>
			</div>
		</div>
		
		<input type="hidden" name="stu_cd" value="${studydetailinfo.stu_cd }">
		
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

						<select name="keySelect" id="keySelect" disabled="disabled"
							class="form-control keySelect">
							<c:forEach var="intTag" items="${intTag }">
								<option value="${intTag.int_tag_cd }">${intTag.int_tag }</option>
							</c:forEach>
						</select> &nbsp; <input type="text" class="keyInput form-control"
							id="keyInput" placeholder="기타 관심 키워드를 입력해 주세요." style="width: 30%"
							readonly="readonly" /> &nbsp; <input type="button" id="keyAddBtn"
							value="추가" disabled="disabled" class="keyBtn btn btn-primary" /> &nbsp; <input
							type="button" disabled="disabled" id="keyResetBtn" value="초기화"
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
				<div id="stuKeyBox" class="stuKeyBox" style="width: 85%;">
				<c:forEach var="studyDetailTagss" items="${studyDetailTags }">
					<div class="tagStyle"><span class="keyTag">${studyDetailTagss.int_tag_name }</span></div>
				</c:forEach>
				</div>
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
						
						<select name="daySelect" id="daySelect" disabled="disabled"
							class="form-control daySelect">
							<c:forEach var="days" items="${day }">
								<option value="${days.day_cd }">${days.day_name }</option>
							</c:forEach>
						</select> &nbsp; <input type="button" id="dayAddBtn"
							value="추가" disabled="disabled" class="dayBtn btn btn-primary" /> &nbsp; <input
							type="button" disabled="disabled" id="dayResetBtn" value="초기화"
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
				<div id="stuDayBox" class="stuDayBox" style="width: 85%;">
				<c:forEach var="studyDetailDayss" items="${studyDetailDays }">
					<div class="tagStyle"><span class="keyTag">${studyDetailDayss.stu_day_name }</span></div>
				</c:forEach>
				</div>
				<!-- end .stuKeyBox -->
			</div>
		</div><!-- 모임 지정 요일 영역 끝 -->
		
		<!-- 활동 지역 -->
		<div class="form-group" id="stuArea">
			<label for="stuArea" class="col-lg-2 control-label">활동 지역<span
				class="must">*</span></label>
			<div class="col-lg-10" style="float: left; width: 210px;">

				<select name="area" required="required" id="area" disabled="disabled"
					class="area form-control">
					<option value="0">${studydetailinfo.area_name }</option>
				</select>

			</div>


			<!-- div 안에있는 select 문은 AjaxJoinSpcArea.jsp에서 가져온다 -->
			<div id="spcAreaDiv" class="col-lg-10"
				style="float: left; width: 225px;">
			<select name="spcArea" disabled="disabled" id="spcArea" class="spcArea form-control" >
				<option value="0">${studydetailinfo.spc_area_name }</option>
			</select>
			
			</div>
		</div>
		
		<!-- 모집 인원 -->
		<div class="form-group" id="divNum">
			<label for="inputNum" class="col-lg-2 control-label">모집 인원<span class="must">*</span>
			</label>
			<div class="col-lg-10 form-inline">
				<input type="text" class="form-control onlyNumber" id="stuNum"
					name="stuNum" data-rule-required="true" disabled="disabled"
					value="${studydetailinfo.mem_num }" maxlength="2" style="width: 40%;">
			</div>
			
		</div>
		
		<!-- 시작 날짜 -->
		<div class="form-group" id="divStuStart">
			<label for="inputStuStart" class="col-lg-2 control-label">시작 날짜<span class="must">*</span>
			</label>
			<div class="col-lg-10 form-inline">
				<input type="text" class="start form-control" id="start"  name="start"
					value="${studydetailinfo.str_date }" readonly="readonly" style="width: 40%;"/>
			</div>
			
		</div>
		
		<!-- 스터디 카테고리 -->
		<div class="form-group" id="divCat">
			<label for="inputCat" class="col-lg-2 control-label">카테고리<span
				class="must">*</span></label>
			<div class="col-lg-10">

				<select name="stuCat" required="required" id="term" disabled="disabled"
					class="posiSel form-control" style="width: 40%;">
					<option value="0">${studydetailinfo.cat_name }</option>
				</select>

			</div>
		</div>
		
		<!-- 기간 -->
		<div class="form-group" id="divTerm">
			<label for="inputTerm" class="col-lg-2 control-label">기간<span
				class="must">*</span></label>
			<div class="col-lg-10">

				<select name="term" required="required" id="term" disabled="disabled"
					class="posiSel form-control" style="width: 40%;">
					<option value="0">${studydetailinfo.meet_term }개월</option>
				</select>

			</div>
		</div>
		
		<!-- 레벨 -->
		<div class="form-group" id="divLevel">
			<label for="inputLevel" class="col-lg-2 control-label">레벨<span
				class="must">*</span></label>
			<div class="col-lg-10">

				<select name="level" required="required" id="level" disabled="disabled"
					class="posiSel form-control" style="width: 40%;">
					<option value="0">${studydetailinfo.lv }</option>
				</select>

			</div>
		</div>
		
		<!-- 신분 -->
		<div class="form-group" id="divIndtt">
			<label for="inputIdntt" class="col-lg-2 control-label">신분<span
				class="must">*</span></label>
			<div class="col-lg-10">

				<select name="Idntt" required="required" id="Idntt" disabled="disabled"
					class="posiSel form-control" style="width: 40%;">
					<option value="0">${studydetailinfo.idntt_type }</option>
				</select>

			</div>
		</div>
		
		<!-- 비밀방 여부 -->
		<div class="form-group" id="divSecret">
			<label for="inputSecret" class="col-lg-2 control-label">비밀방 설정</label>
			<div class="col-lg-10">
			<input type="text" class="form-control onlyNumber" id="scrt"
					name="scrt" data-rule-required="true" disabled="disabled"
					placeholder="4자리 숫자를 입력하세요." maxlength="4" style="width: 40%;">
			</div>
		</div>
		
		
		<!-- 대표 이미지 -->
		<div class="image form-group">
            <label for="profileimage" class="col-lg-2 control-label">대표
               이미지</label>
            <div class="col-lg-10 form-inline">
               <!-- <form action="Test_ok.jsp" method="post" enctype="multipart/form-data"> -->
               <input type="file" id="uploadFile" name="uploadFile" disabled="disabled"
                  class="form-control" accept=".gif, .jpg, .png, .jpeg" style="width: 65%;" />
               <input type="text"
                  class="form-control" id="thumbnail" style="width: 20%;" readonly="readonly" value="미리보기">
               &nbsp;
               <button class="btn btn-primary" id="proImgBtn" disabled="disabled" type="button">등록</button>
               <input type="hidden" id="okFile" name="okFile" class="btn btn-primary">
            </div>
         </div>
		

		<div class="form-group">
			<div class="col-lg-offset-2 col-lg-10 bottom">
				<div class="errMsg">
					<span id="err"></span>
				</div>
				<div class="joinDiv">
					<button type=button id="cancelBtn" value="${studydetailinfo.stu_cd }" 
						class="btn btn-lg cancelBtn">취소</button>
					<button type="button" id="updateBtn"
						class="btn btn-lg btn-success updateBtn">수정</button>
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