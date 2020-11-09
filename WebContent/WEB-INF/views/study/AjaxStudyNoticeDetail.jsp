<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<td>${noticeDetail.stu_join_name }</td>
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
			</c:if>
			
			<div class="rightBtn">
				<button type="button" class="btn btn-primary goListBtn">
					목록
				</button>
			</div>
		</div>
		
	</div>
</div><!-- 버튼 영역 끝-->
	
	<!-- 댓글 목록 영역 -->
	<div class="row">
		<div class="col-md-12 reList" style="float: left; text-align: left;">
			<div class="count">
			댓글 ${re_count }
			</div>
			<table class="table">
				
				<c:forEach var="noticeReLists" items="${noticeReList }">
				<tr>
					<td class="reTop">
						<h4>${noticeReLists.stu_join_name }</h4>
						<h5>${noticeReLists.crt_date }</h5>
						<button type="button" class="btn btn-link delBtn">삭제</button>
						<p>
							${noticeReLists.content }
						</p>
					</td>
				</tr>
				
				</c:forEach>
			</table>
		</div>
	</div>
	
	<!-- 댓글 등록 영역 -->
	<div class="row">
		<div class="col-md-12" style="float: left; text-align: left;">
		
			<table class="table re">
				<tr class="reAdd">
					<th class="reTh">댓글내용 * </th>
					<td class="textArea">
					<textarea rows="3" class="form-control text"></textarea>
					</td>
					<td class="addBtn">
					<button type="submit" class="btn btn-primary btn-lg">등록</button>
					</td>
				</tr>
			</table>
		</div>
	</div>