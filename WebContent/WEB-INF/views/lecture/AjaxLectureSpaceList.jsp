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
<title>AjaxLectureSpaceList.jsp</title>
</head>
<body>

	<hr>
	<div align="center">
		<table
			style="width: 600px; margin: 1px; padding: 3px; background-color: #FFFFFF; align-self: center;">
			<c:set var="n" value="0"></c:set>

			<c:forEach var="spaceList" items="${lists }">

				<c:if test="${n==0 }">
					<tr>
				</c:if>

				<c:if test="${n!=0 && n%3==0 }">
					</tr>
					<tr>
				</c:if>

				<td style="width: 200px;" align="center">

					<div class="item">
						<ul class="thumbnails" style="list-style: none;">

							<li>
								<div class="demo">
									<figure class="imghvr-scale-top-left">
										<img src="<%=cp%>/assets/images/199.jpg" alt="53"
											style="width: 300px; height: 250px;">
										<figcaption>
											<button type="button" class="imageBtn"
												value="${spaceList.spa_req_cd }"
												style="background-color: transparent; border: 0px transparent solid; text-align: left; outline: none;">
												<p>
													<span class="glyphicon glyphicon-map-marker"
														aria-hidden="true"></span> ${spaceList.area_name}
													${spaceList.spc_area_name}
												</p>
												<p>
													<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
													영업 시간 : ${spaceList.str_time}시 ~ ${spaceList.end_time}시
												</p>
												<p>
													<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
													최대이용시간 : ${spaceList.use_hrs}시간
												</p>
												<div class="form-inline">
													<p>
														<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
														${spaceList.type_name}
													</p>
													<p>
														<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
														${spaceList.busi_name}
													</p>
												</div>
												<!-- end div.form-inline -->
											</button>
										</figcaption>
									</figure>
									<!-- end figure.imghvr-scale-top-left -->
									<div class="caption">
										<div class="nameAndCount">
											<h4>${spaceList.spa_name}</h4>
											<p class="feed">
												<span class="glyphicon glyphicon-heart heart"
													aria-hidden="true"></span>피드백수: ${spaceList.feedCount }개
											</p>
										</div>
										<!-- end div.nameAndCount -->
										<p class="intro">&quot;${spaceList.one_intro}&quot;</p>
										<p>
										<ul class="list-study-tags">
											<c:forEach var="spaceTagss" items="${spaceTags }">
												<c:if
													test="${spaceTagss.spa_req_cd eq spaceList.spa_req_cd}">
													<li class="stack-item">${spaceTagss.tag_name }</li>
												</c:if>
											</c:forEach>
										</ul>
									</div>
									<!-- end div.caption -->
								</div>
								<!-- end div.demo -->
							</li>
						</ul>
						<!-- end ul.thumbnails -->
					</div>
					<!-- end div.item -->

				</td>

				<c:set var="n" value="${n+1}"></c:set>

			</c:forEach>

			<c:if test="${n>0 || n%3!=0}">
				<c:forEach var="i" begin="${n%3+1 }" end="3" step="1">
					<td>&nbsp;</td>
				</c:forEach>
			</c:if>

			<c:if test="${n!=0 }">
				</tr>
			</c:if>

			<!-- 페이징 처리에 따른 페이지 인덱스 적용 -->
			<c:if test="${dataCount != 0 }">
				<tr style="height: 30px; background-color: #FFFFFF">
					<td align="center" colspan="3">${pageIndexList }</td>
				</tr>
			</c:if>

			<!-- DB에 데이터가 존재하지 않을 경우 -->
			<c:if test="${dataCount == 0 }">
				<tr style="height: 30px; background-color: #FFFFFF;">
					<td align="center" colspan="3">등록된 자료가 존재하지 않습니다.</td>
				</tr>
			</c:if>

		</table>
		<!-- end table -->
		
	</div>
	<!-- end div align=center -->
	
</body>
</html>