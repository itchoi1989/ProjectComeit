<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1_AdminAskList.jsp</title>
</head>
<body>

<!-- Begin Page Content -->
      <div class="container-fluid">

	<!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">환불 문의</h1>
    <p class="mb-4">환불 문의 게시판
          <a target="_blank" href="https://datatables.net">
          official DataTables documentation</a>.</p>
    <hr>

		<div class="card shadow mb-4">
            <div class="card-header py-3">
            </div>
            <div class="card-body">
			<div class="row searchRow">
				<div class="col-md-8">
					<div class="col-md-2" style="float: left; width: 20%;">
						<select name="search" id="search" class="form-control">
							<option value="title">제목</option>
							<option value="author">작성자</option>
						</select>
					</div>
					<div class="col-md-8" style="float: left; width: 40%;">
						<input type="text" id="keyword" class="searchBox form-control"
							placeholder="검색어를 입력하세요." />
					</div>
					<div class="col-md-2" style="float: left; width: 20%;">
						<button type="button" class="search btn btn-dark">검색</button>
					</div>

					<br>
					<br>
				</div>
				<div class="col-md-2"></div>
			</div>


			<div class="row">
				<div class="col-md-12 container">
					<table class="table" style="table-layout:fixed">
						<thead class="thead-dark" style="text-align: center">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody style="text-align: center">
							<tr>
								<td>1</td>
								<td>2020.07.02 회의 진행 사항 입니다.</td>
								<td>김길동</td>
								<td>2020-07-02</td>
								<td>5</td>
							</tr>
							<tr>
								<td>2</td>
								<td>2020.07.03 과제입니다.</td>
								<td>김길동</td>
								<td>2020-07-03</td>
								<td>5</td>
							</tr>
							<tr>
								<td>3</td>
								<td>2020.07.04 뷰페이지 진행 사항 입니다.</td>
								<td>김길동</td>
								<td>2020-07-04</td>
								<td>5</td>
							</tr>
							<tr>
								<td>4</td>
								<td>2020.07.05 회의 진행 사항 입니다.</td>
								<td>김길동</td>
								<td>2020-07-05</td>
								<td>5</td>
							</tr>
							<tr>
								<td>5</td>
								<td>2020.07.02 과제 진행 사항 입니다.</td>
								<td>김길동</td>
								<td>2020-07-06</td>
								<td>5</td>
							</tr>
							<tr>
								<td>6</td>
								<td>2020.07.02 과제 진행 사항 입니다.</td>
								<td>김길동</td>
								<td>2020-07-06</td>
								<td>5</td>
							</tr>
							<tr>
								<td>7</td>
								<td>2020.07.02 과제 진행 사항 입니다.</td>
								<td>김길동</td>
								<td>2020-07-06</td>
								<td>5</td>
							</tr>
							<tr>
								<td>8</td>
								<td>2020.07.02 과제 진행 사항 입니다.</td>
								<td>김길동</td>
								<td>2020-07-06</td>
								<td>5</td>
							</tr>
							<tr>
								<td>9</td>
								<td style='text-overflow:ellipsis; -o-text-overflow:ellipsis;
								 overflow:hidden; white-space:nowrap;'>
								2020.07.02 과제 진행 사항 입니다.2020.07.02 과제 진행 사항 입니다.2020.07.02 과제 진행 사항 입니다.2020.07.02 과제 진행 사항 입니다.2020.07.02 과제 진행 사항 입니다.2020.07.02 과제 진행 사항 입니다.
								</td>
								<td>김길동</td>
								<td>2020-07-06</td>
								<td>5</td>
							</tr>
							<tr>
								<td>10</td>
								<td>2020.07.02 과제 진행 사항 입니다.</td>
								<td>김길동</td>
								<td>2020-07-06</td>
								<td>5</td>
							</tr>
						</tbody>
					</table>

				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6" style="float: right;">
						<div class="paging">
							<ul class="pagination">
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
							</ul>
						</div>
				</div>
				<div class="col-md-3">
					<button type="button" class="add btn btn-dark">등록</button>
				</div>
			</div>
			
			
		</div>
	</div>
</div>
  
</body>
</html>