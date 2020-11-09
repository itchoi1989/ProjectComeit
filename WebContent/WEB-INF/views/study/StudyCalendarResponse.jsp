<%@page import="com.sys.comeit.dto.StudyCalendarDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
   
   ArrayList<StudyCalendarDTO> studyCalList = (ArrayList<StudyCalendarDTO>)request.getAttribute("studyCalList");
%>
<%

	JSONArray jarr = new JSONArray();	// JSON 배열 선언

	for(int i=0; i<studyCalList.size(); i++)
	{
		JSONObject jobj = new JSONObject();
		jobj.put("title", studyCalList.get(i).getContent());
		jobj.put("start", studyCalList.get(i).getStr_date());
		jobj.put("end", studyCalList.get(i).getEnd_date());
		
		jarr.add(jobj);
	}
	out.println(jarr.toString());	// JSON배열에 넣은 정보를 String으로 현재 페이지에 뿌려주기



	/*
	String result="";
	
	//Json데이터
	//{"키1": "값1","키2":"값2"}

	JSONArray jarr = new JSONArray();
	
	JSONObject jobj2 = new JSONObject();
	jobj2.put("title", "ERD 마감!");
	jobj2.put("start","2020-08-10");
	jobj2.put("end","2020-08-12");
	
	JSONObject jobj = new JSONObject();
	jobj.put("title", "구현 단계");
	jobj.put("start","2020-08-19");
	jobj.put("end","2020-08-30");
	
	JSONObject jobj1 = new JSONObject();
	jobj1.put("title", "기획 마감");
	jobj1.put("start","2020-08-01");
	
	JSONObject jobj3 = new JSONObject();
	jobj3.put("title", "캘린더 마무리");
	jobj3.put("start","2020-08-17");
	jobj3.put("end","2020-08-19");
	
	jarr.add(jobj);
	jarr.add(jobj1);
	jarr.add(jobj2);
	jarr.add(jobj3);
	out.println(jarr.toString());

	*/
   
%>

