<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<c:forEach var="studentList" items="${studentList }">

	<div class="mem" style="text-align:left;">

		<div class="memImg" style="margin-left:10%;">
			<img alt="Bootstrap Image Preview" 
				src="${studentList.img_url eq null ? 'assets/images/basic.png' : studentList.img_url}"
				class="img-circle profileImg" />
		</div>

		<div class="memName">
			<span class="name">${studentList.name }</span>
			<button class="stdntModalBtn" type="button" class="btn btn-light" value="${studentList.mem_cd }">정보</button>
		</div>
		
		<hr size="10px">

	</div>
	<!-- end .mem -->

</c:forEach>
