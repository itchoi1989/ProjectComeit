<%@page import="com.sys.comeit.dto.StudyDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <!-- 버튼 -->
<div class="closeD" onClick="closeModal();">
   <span class="pop_bt modalCloseBtn pull-right" >X</span>
</div><!-- end .closeD -->

<div class="userName">
   <span class="glyphicon glyphicon-user user"></span><h4>이름 :</h4><span class="name" id="modalName">${modalDto.name }</span>              
 
</div><!-- end .userName -->
<div class="userManner">
   <span class="glyphicon glyphicon-pencil pencil"></span><h4>매너연필 :</h4><span class="manPencil">5cm</span>
</div><!-- userManner -->
<div class="userPosi">
   <h4>신분 :</h4><span class="position" id="modalIdntt">${modalDto.idntt }</span>
</div><!-- end .userPosi -->
<div class="userKey">
   <h4>관심키워드 :</h4>
   <!-- <span class="keyword" id="modalTag"></span> -->
  
   <ul class="list-study-tags">
    <c:forEach var="intTag" items="${intTagSearch }">
      <li class="stack-item">${intTag.int_tag }</li>
    </c:forEach>
   </ul>
   
</div><!-- end .userKey -->
<div class="userInt">
   <h4>자기소개 :</h4>
   <c:if test="${modalDto.mem_content eq null }">
   	<span class="oneInt" id="memContent">없음</span>
   </c:if>
   <c:if test="${modalDto.mem_content ne null }">
   	<span class="oneInt" id="memContent">${modalDto.mem_content}</span>
   </c:if>  
</div><!-- end .userInt -->
<div class="userStu">
   <h4>참여중인 스터디 :</h4>
   <c:if test="${stuTitle ne null }">
	   <c:forEach var="stuName" items="${stuTitle }">
	   		<span class="joinStu" id="memJoinStu">${stuName.join_stu_title }</span><br />
	   </c:forEach>
   </c:if>
   <c:if test="${stuTitle eq null }">
   		<span class="joinStu" id="memJoinStu">없음</span>
   </c:if>
</div><!-- end .userStu -->