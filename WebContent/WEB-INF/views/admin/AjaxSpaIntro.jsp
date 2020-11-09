<%@page import="com.sys.comeit.dto.AdmSpaReqDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="intro" items="${intro }">
공간 한줄 소개 : ${intro.one_intro}
최대 이용시간 : ${intro.use_hrs}시간
예약 시 주의사항 : ${intro.rsv_notes}
공간 상세 소개 : ${intro.dtl_intro }
상세 주소 : ${intro.dtl_addr}
</c:forEach>