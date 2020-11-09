<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<select name="spcArea" disabled="disabled" id="spcArea" class="spcArea form-control" >
	<option value="0">세부지역 선택</option>	
	<c:forEach var="spcArea" items="${spcAreaList }">
		<option value="${spcArea.spc_area_cd }">
		   ${spcArea.spc_area_name }
		</option>
	</c:forEach>
</select>