package com.sys.comeit.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sys.comeit.dto.StudyCalendarDTO;
import com.sys.comeit.idao.IStudyCalendarDAO;

@Controller
public class StudyCalendarController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 해당 스터디방의 캘린더 정보 모두 노출
	@RequestMapping(value = "/studycalendarresponse.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String studyCalendarResponse(Model model, HttpServletRequest request)
	{
		String view = null;
		
		IStudyCalendarDAO studyCalDao = sqlSession.getMapper(IStudyCalendarDAO.class);
		
		String stu_cd = request.getParameter("stu_cd");
		System.out.println("캘린더에서 받은 스터디코드 : " + stu_cd);
		
		ArrayList<StudyCalendarDTO> studyCalList = studyCalDao.studyCalList(stu_cd);
		
		model.addAttribute("studyCalList", studyCalList);
		
		view = "WEB-INF/views/study/StudyCalendarResponse.jsp";
		
		return view;
		
	}
	
	// 캘린더 등록
	@RequestMapping(value = "/studycalendarinsert.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String studyCalendarInsert(Model model, HttpServletRequest request)
	{
		String view = null;
		
		IStudyCalendarDAO studyCalDao = sqlSession.getMapper(IStudyCalendarDAO.class);
		
		String stu_cd = request.getParameter("stu_cd");
		System.out.println("캘린더에서 받은 스터디코드22 : " + stu_cd);
		
		// 작성자의 스터디참가코드
		HttpSession session = request.getSession();

	    String mem_cd = (String) session.getAttribute("mem_cd");	// 로그인한 사람의 회원코드
		
	    StudyCalendarDTO dtoJoin = new StudyCalendarDTO();
	    
	    dtoJoin.setStu_cd(stu_cd);
	    dtoJoin.setMem_cd(mem_cd);
	    
	    String stu_join_cd = studyCalDao.studyCalJoin(dtoJoin);		// 스터디 참가코드 알아내기
	    System.out.println("작성자의 스터디 참가 코드 : " + stu_join_cd);
	    
		// 시작일
	    
		
		// 종료일
		
		// 내용
		
		
		return view;
		
	}
	
}
