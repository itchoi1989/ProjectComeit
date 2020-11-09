<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 검색 영역 -->
<div class="row searchRow">
	<div class="col-md-12 form-inline">
		<input type="text" style="width: 10%;" class="form-control" value="제목" readonly="readonly"/>
		<input type="text" style="width: 80%;"class="searchBox form-control" placeholder="검색어를 입력하세요."/>
		
		<button type="button" class="search btn btn-primary">검색</button>
	</div>
</div>

<!-- 리스트 영역 -->
<table class="table">
	<thead class="thead-dark">
		<tr>
			<th style="text-align: center;">번호</th>
			<th style="text-align: center;">제목</th>
			<th style="text-align: center;">작성자</th>
			<th style="text-align: center;">작성일</th>
			<th style="text-align: center;">조회수</th>
		</tr>
	</thead>
	
	<tbody>
	<c:forEach var="studyNoticeLists" items="${studyNoticeList }">
		<tr>
			<td>${studyNoticeLists.row_num }</td>
			<td>
			<button class="btn btn-link noticeListTitle" name="stu_ntc_pnt_cd"
				value="${studyNoticeLists.stu_ntc_pnt_cd}">${studyNoticeLists.title }</button>
			</td>
			<td>${studyNoticeLists.stu_join_name }</td>
			<td>${studyNoticeLists.crt_date }</td>
			<td>${studyNoticeLists.hits }</td>
		</tr>
	</c:forEach>
		</tbody>
</table>

<!-- 페이징 영역 -->
<div class="col-md-12">
	<div class="paging"> 
		
		<c:if test="${dataCount != 0 }">
			<div align="center">
				${pageIndexList }
			</div>
		</c:if>
	</div>
	
	<c:if test="${sessionScope.mem_cd eq leaderName.leader_mem_cd}">
		<button type="button" class="add btn btn-primary pull-right notice-add">등록</button>
	</c:if>
			
		
</div><!-- end .col-md-12 -->