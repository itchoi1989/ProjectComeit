<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table detail" style="margin-top: 30px;">
		<tr>
			<th style="text-align: center; background-color: #EEEEEE">제목</th>
			<td colspan="6">${detail.file_title }</td>
		</tr>
		<tr class="tit" style="text-align: center;">
			<th>작성자</th>
			<td>${detail.file_mem_name }</td>
			<th>작성일</th>
			<td>${detail.file_crt_date }</td>
			<th>조회수</th>
			<td>${detail.file_hits }</td>
		</tr>
	<!-- 	<tr>
		<th>첨부파일</th>
		<td colspan="6">회의록.doc</td> 
			
			 -->
		<%-- 	<c:choose>
			<c:when test="${file ne '없음' }"> --%>
			
			
					<tr>
					<th>첨부파일</th>	
						
						<td colspan="6">
						<c:choose>
						<c:when test="${file eq '없음' }">
						없음
						</c:when>
						<c:otherwise>
						<a href="">${file.file_url }</a>
						</c:otherwise>
						</c:choose>
						</td> 
						
					</tr>	
		
		<%-- 	</c:when>
			<c:otherwise>
			 --%>
		<%-- 	<c:if test="${file eq '없음'}">
			<tr>
			<th>첨부파일</th>
					<td colspan="6">없음</td>		
			</tr>		
			</c:if> --%>
			
	<%-- 		</c:otherwise>
			</c:choose>  --%>
			
			
	<!-- 	</tr> -->
		<tr class="content" style="vertical-align: top; height: 300px;">
			<td colspan="6">${detail.file_content }</td>
		</tr>
		<tr>
			<td colspan="6" style="text-align: left;">이전글 : 산출물의 아홉 번째 게시글 제목입니다.</td>
		</tr>
		<tr>
			<td colspan="6" style="text-align: left;">다음글 : 없음</td>
		</tr>
</table>
<!-- 버튼 영역 -->
	<div class="row">
		
		<div class="col-md-12">
	
			<div class="btns">
			
			
			<c:if test="${detail.file_mem_cd eq sessionScope.mem_cd }"> 
				<div class="leftBtn" style="display: inline-block;">
					<button type="button" class="btn">
						수정
					</button>
					<button type="button" class="btn">
						삭제
					</button>
				</div>
			</c:if>
				
				<div class="rightBtn">
					<button type="button" class="btn btn-primary fileListBtn" style="float: right;"
					value="${detail.file_stu_cd }">
						목록
					</button>
				</div>
			</div>
			
		</div>
		
	</div><!-- 버튼 영역 끝-->