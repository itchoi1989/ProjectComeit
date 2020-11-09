<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%


String result="";

//Json데이터
//{"키1": "값1","키2":"값2"}

   JSONArray jarr = new JSONArray();

   JSONObject jobj2 = new JSONObject();
   jobj2.put("title", "ERD 마감!");
   jobj2.put("start","2020-07-10");
   jobj2.put("end","2020-07-12");
   
   JSONObject jobj = new JSONObject();
   jobj.put("title", "구현 단계");
   jobj.put("start","2020-07-19");
   jobj.put("end","2020-07-30");
   
   JSONObject jobj1 = new JSONObject();
   jobj1.put("title", "기획 마감");
   jobj1.put("start","2020-07-01");
   
   JSONObject jobj3 = new JSONObject();
   jobj3.put("title", "캘린더 마무리");
   jobj3.put("start","2020-07-17");
   jobj3.put("end","2020-07-19");
   
   jarr.add(jobj);
   jarr.add(jobj1);
   jarr.add(jobj2);
   jarr.add(jobj3);
   out.println(jarr.toString());


%>