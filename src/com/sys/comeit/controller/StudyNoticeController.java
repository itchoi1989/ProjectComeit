package com.sys.comeit.controller;

import java.io.UnsupportedEncodingException;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sys.comeit.util.MyTabUtil;
import com.sys.comeit.dto.*;
import com.sys.comeit.idao.*;

@Controller
public class StudyNoticeController
{
	@Autowired
	private SqlSession sqlSession;

	// 스터디 공지사항 리스트 화면 노출하기
	@RequestMapping(value = "/studynoticelist.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String studyNoticeList(Model model, HttpServletRequest request) throws UnsupportedEncodingException
	{
		String view = null;

		IStudyNoticeDAO studyNoticeDao = sqlSession.getMapper(IStudyNoticeDAO.class);
		
		String stu_cd = request.getParameter("stu_cd");
		
		System.out.println("받은 스터디코드" + stu_cd);
		
		
		// 페이징 처리 ----------------
		
		MyTabUtil util = new MyTabUtil();
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		if (pageNum != null && pageNum.length() != 0)
			currentPage = Integer.parseInt(pageNum);

		String searchKey = null;
		String searchValue = null;
		
		searchKey = request.getParameter("searchKey");
		searchValue = request.getParameter("title");
		
		if (searchKey == null)
		{
			searchKey = null;
			searchValue = null;
		}
		
		if (request.getMethod().equalsIgnoreCase("GET"))	// equals 말고 이거 맞나?
		{
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		StudyNoticeDTO pagingDto = new StudyNoticeDTO();
		
		pagingDto.setStu_cd(stu_cd);
		pagingDto.setSearchKey(searchKey);
		pagingDto.setSearchValue(searchValue);
		
		// 전체 데이터 개수
		int dataCount = studyNoticeDao.searchNoticeCount(pagingDto);
		
		// 전체 페이지 수 구하기
		int numPerPage = 10;
		int totalPage = util.getPageCount(numPerPage, dataCount);
		
		// 전체 페이지 수 보다 현재 표시할 페이지가 큰 경우
		if (totalPage < currentPage)
			currentPage = totalPage;
		
		// 테이블에서 가져올 리스트들의 시작과 끝 위치
		int ntcStart = (currentPage - 1) * numPerPage + 1;
		int ntcEnd = currentPage * numPerPage;
		
		pagingDto.setStart(ntcStart);
		pagingDto.setEnd(ntcEnd);
		
		// 출력할 데이터
		ArrayList<StudyNoticeDTO> studyNoticeList = studyNoticeDao.getNoticeListData(pagingDto);
		
		String params = "";
		if (searchValue != null && searchValue.length() != 0)
		{
			searchValue = URLEncoder.encode(searchKey, "UTF-8");
			params = "searchKey=" + searchKey + "&searchValue=" + searchValue;
		}
		
		String cp = request.getContextPath();

		// 페이징 처리
		String listUrl = cp + "/studynoticelist.action";
		if (params.length() != 0)
			listUrl += "?" + params;
		
		String pageIndexList = util.pageIndexList(currentPage, totalPage, listUrl);
		
		
		IStudyDAO studyDao = sqlSession.getMapper(IStudyDAO.class);
		
		// 포워딩 할 데이터 넘겨주기
		request.setAttribute("studyNoticeList", studyNoticeList);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		
		model.addAttribute("leaderName", studyDao.studyLeaderSearch(stu_cd));
		model.addAttribute("stu_cd", stu_cd);
		
		// 테스트
		//System.out.println(stu_cd);
		System.out.println("공지사항start : " + ntcStart);
		System.out.println("공지사항end : " + ntcEnd);
		
		view = "WEB-INF/views/study/AjaxStudyNoticeList.jsp";

		return view;
	}
	
	// 스터디 공지사항 상세 화면 노출하기
	@RequestMapping(value = "/studynoticedetail.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String studyNoticeDetail(Model model, HttpServletRequest request) throws UnsupportedEncodingException
	{
		String view = null;

		IStudyNoticeDAO studyNoticeDao = sqlSession.getMapper(IStudyNoticeDAO.class);
		
		String stu_cd = request.getParameter("stu_cd");
		String stu_ntc_pnt_cd = request.getParameter("stu_ntc_pnt_cd");
		System.out.println("상세" + stu_cd);
		System.out.println(stu_ntc_pnt_cd);
		
		StudyNoticeDTO dto = new StudyNoticeDTO();
		
		dto.setStu_cd(stu_cd);
		dto.setStu_ntc_pnt_cd(stu_ntc_pnt_cd);
		
		
		StudyNoticeDTO noticeDetail = studyNoticeDao.studyNoticeDetail(dto);
		
		model.addAttribute("noticeDetail", noticeDetail);
		
		// 댓글 정보 -------------------------------------
		
		// 댓글 수
		int re_count = studyNoticeDao.studyReCount(dto);
		
		model.addAttribute("re_count", re_count);
		
		// 댓글 리스트
		
		ArrayList<StudyNoticeDTO> noticeReList = studyNoticeDao.studyNoticeReList(dto);
		
		model.addAttribute("noticeReList", noticeReList);
		
		//view = "WEB-INF/views/study/AjaxStudyNoticeDetail.jsp";
		view = "WEB-INF/views/study/StudyNoticeDetail.jsp";

		return view;
	}
	
	// 스터디 공지사항 등록화면 노출
	@RequestMapping(value = "/studynoticeaddjsp.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String studyNoticeAdd(Model model, HttpServletRequest request)
	{
		String view = null;
		
		IStudyNoticeDAO studyNoticeDao = sqlSession.getMapper(IStudyNoticeDAO.class);
		
		// 세션에서 로그인한 회원 코드 받아오기
		HttpSession session = request.getSession();

	    String mem_cd = (String) session.getAttribute("mem_cd");
		
		String stu_cd = request.getParameter("stu_cd");
		
		System.out.println("등록화면에서 받은 스터디코드" + stu_cd);
		
		StudyNoticeDTO dto = new StudyNoticeDTO();
		
		dto.setStu_cd(stu_cd);
	    dto.setMem_cd(mem_cd);
		
		StudyNoticeDTO noticeAddData = studyNoticeDao.studyNoticeAddData(dto);
		
		model.addAttribute("noticeAddData", noticeAddData);
		
		view = "WEB-INF/views/study/StudyNoticeAdd.jsp";
		
		return view;
	}
	
	// 실제 스터디 공지사항 등록하기 → 프로시저 호출
	@RequestMapping(value = "/studynoticeinsert.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String studyNoticeInsert(Model model, HttpServletRequest request) 
	{
		String view = null;
		
		IStudyNoticeDAO studyNoticeDao = sqlSession.getMapper(IStudyNoticeDAO.class);
		
		String stu_cd = request.getParameter("stu_cd");
		System.out.println("등록화면에서 받은 스터디코드22" + stu_cd);
		String stu_join_cd = studyNoticeDao.studyLeaderJoin(stu_cd);	// 작성자의 스터디 참가 코드
		
		String title = request.getParameter("title");		// 제목
		String content = request.getParameter("content");	// 내용		
		
		//System.out.println(stu_join_cd);
		//System.out.println(title);
		//System.out.println(content);
		
		StudyNoticeDTO dto = new StudyNoticeDTO();
		
		dto.setStu_join_cd(stu_join_cd);
		dto.setTitle(title);
		dto.setContent(content);
		
		studyNoticeDao.studyNoticeInsert(dto);	// 실제 등록 프로시저 호출
		
		model.addAttribute("stu_cd", stu_cd);
		
		//view = "WEB-INF/views/study/StudyAfDetail.jsp";		
		view = "redirect:studydetail.action";				// 스터디 상세 재호출
		
		return view;

	}
	
	// 공지사항 댓글 등록하기
	@RequestMapping(value = "/studynoticereinsert.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String studyNoticeReInsert(Model model, HttpServletRequest request) 
	{
		String view = null;
		
		IStudyNoticeDAO studyNoticeDao = sqlSession.getMapper(IStudyNoticeDAO.class);
		String stu_cd = request.getParameter("stu_cd");
		// 그 게시글 코드
		String stu_ntc_pnt_cd = request.getParameter("stu_ntc_pnt_cd");
		System.out.println("게시글 코드 : " + stu_ntc_pnt_cd);
		
		// 그 게시글의 제목
		String title = request.getParameter("title");
		System.out.println("게시글제목 : " + title);
		
		// 작성자의 스터디참가코드
		HttpSession session = request.getSession();

	    String mem_cd = (String) session.getAttribute("mem_cd");	// 로그인한 사람의 회원코드
		
	    StudyNoticeDTO dtoRe = new StudyNoticeDTO();
	    
	    dtoRe.setStu_cd(stu_cd);
	    dtoRe.setMem_cd(mem_cd);
	    
	    String stu_join_cd = studyNoticeDao.noticeReCreateJoin(dtoRe);
	    System.out.println("댓글 작성자의 스터디 참가 코드 : " + stu_join_cd);
	    
		// 댓글 내용
	    String content = request.getParameter("reContent");
	    System.out.println("댓글 내용 : " + content);
	    
	    StudyNoticeDTO dto = new StudyNoticeDTO();
	    
	    dto.setStu_ntc_pnt_cd(stu_ntc_pnt_cd);
	    dto.setTitle(title);
	    dto.setStu_join_cd(stu_join_cd);
	    dto.setContent(content);
	    
	    studyNoticeDao.studyNoticeReInsert(dto);	// 실제 댓글 등록
	    
	    
	    System.out.println("스터디코드3" + stu_cd);
	    model.addAttribute("stu_cd", stu_cd);
	    
	    view = "redirect:studydetail.action";				// 스터디 상세 재호출
		
		return view;

	}
	
	
	
	

}
