<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String stu_ntc_pnt_cd = request.getParameter("lec_ntc_cd");
	String stu_cd = request.getParameter("lec_cd");
%>
<!-- 상세내용 영역 -->
	<div class="row">
	
		<div class="col-md-12">
		
			<table class="table detail">
				<tr>
					<th style="text-align: center; background-color: #EEEEEE">제목</th>
					<td colspan="6">${noticeDetail.title }</td>
				</tr>
				<tr class="tit">
					<th style="text-align: center; background-color: #EEEEEE">작성자</th>
					<td>${noticeDetail.name }</td>
					<th style="text-align: center; background-color: #EEEEEE">작성일</th>
					<td>${noticeDetail.crt_date }</td>
					<th style="text-align: center; background-color: #EEEEEE">조회수</th>
					<td>${noticeDetail.hits }</td>
				</tr>
				<tr class="content" style="vertical-align: top; height: 300px;">
					<td colspan="6">${noticeDetail.content }</td>
				</tr>
			</table>
			
		</div>
		<!-- end div.col-md-12 -->
		
	</div><!-- 상세내용 영역 끝 -->
	
	<!-- 버튼 영역 -->
	<div class="row">
	
		<div class="col-md-12">
		
			<div class="btns form-inline">
			
				<c:if test="${sessionScope.mem_cd == noticeDetail.mem_cd }">
				
					<div class="leftBtn" style="float: left;">
						<button type="button" class="btn">
							수정
						</button>
						<button type="button" class="btn">
							삭제
						</button>
					</div>
					<!-- end div.leftBtn -->
					
				</c:if>
				
				<div class="rightBtn">
					<button type="button" class="btn btn-primary goListBtn">
						목록
					</button>
				</div>
				<!-- end div.rightBtn -->
				
			</div>
			<!-- end div.btns form-inline -->
			
		</div>
		<!-- end div.col-md-12 -->
		
	</div>
	<!-- end div.row -->
	<!-- 버튼 영역 끝-->