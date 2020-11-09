<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="row searchRow">
	
			<div class="col-md-12">
				<select name="" id="searchSel" class="form-control searchSel">
				<option value="title">제목</option>
				<option value="name">작성자</option>
				</select>
				<input type="text" id="searchBox" class="searchBox form-control" placeholder="검색어를 입력하세요."/>
				<button type="button" class="fileSearch btn btn-primary">검색</button>
			</div>
		
	</div><!-- end .row .searchRow -->
<table class="table">
	<thead class="thead-dark">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	</thead>
	
	<tbody>
	<c:forEach var="studyFileList" items="${studyFileList }">
		<tr>
			<td>${studyFileList.file_row_num }</td>
			<td>
			<button class="btn btn-link listTitle" value="${studyFileList.file_oput_cd }">${studyFileList.file_title }</button>
			</td>
			<td>${studyFileList.file_mem_name }</td>
			<td>${studyFileList.file_crt_date }</td>
			<td>${studyFileList.file_hits }</td>
		</tr>
	</c:forEach>
		</tbody>
</table>

<div class="col-md-12">
			<div class="paging"> 
			<!-- 	<ul class="pagination">
				<li class="page-item"><a href="#" class="page-link">Previous</a></li>
				<li class="page-item"><a href="#" class="page-link">1</a></li>
				<li class="page-item"><a href="#" class="page-link">2</a></li>
				<li class="page-item"><a href="#" class="page-link">3</a></li>
				<li class="page-item"><a href="#" class="page-link">4</a></li>
				<li class="page-item"><a href="#" class="page-link">5</a></li>
				<li class="page-item"><a href="#" class="page-link">6</a></li>
				<li class="page-item"><a href="#" class="page-link">7</a></li>
				<li class="page-item"><a href="#" class="page-link">8</a></li>
				<li class="page-item"><a href="#" class="page-link">9</a></li>
				<li class="page-item"><a href="#" class="page-link">10</a></li>
				<li class="page-item"><a href="#" class="page-link">Next</a></li>
				</ul> -->
				
				<c:if test="${dataCount != 0 }">
					<div align="center">
						${pageIndexList }
					</div>
				</c:if>
			</div>
			
			<button type="button" class="add btn btn-primary pull-right file-add">등록</button>
		
		
		</div><!-- end .col-md-12 -->