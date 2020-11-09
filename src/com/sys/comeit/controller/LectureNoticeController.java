package com.sys.comeit.controller;

import java.io.UnsupportedEncodingException;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sys.comeit.util.MyTabUtil;
import com.sys.comeit.util.MyUtil;
import com.sys.comeit.dto.*;
import com.sys.comeit.idao.*;

@Controller
public class LectureNoticeController
{
	@Autowired
	private SqlSession sqlSession;

	// 강의 공지사항 리스트 화면 노출하기
	@RequestMapping(value = "/lecturenoticelist.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String lectureNoticeList(Model model, HttpServletRequest request) throws UnsupportedEncodingException
	{
		String view = null;
		String mem_cd = null;
		
		ILectureNoticeDAO lectureNoticeDao = sqlSession.getMapper(ILectureNoticeDAO.class);
		
		String lec_cd = request.getParameter("lec_cd");
		
		System.out.println("받은 강의코드" + lec_cd);
		
		// 페이징 처리
		MyTabUtil util = new MyTabUtil();
		String pageNum = request.getParameter("pageNum");

		int currentPage = 1;
		if (pageNum != null && pageNum.length() != 0)
		{
			currentPage = Integer.parseInt(pageNum);
		}
		
		// 검색
		String searchKey = null;
		String searchValue = null;
					
		searchKey = request.getParameter("searchKey");
		searchValue = request.getParameter("title");
		
		if (searchKey == null)
		{
			searchKey = null;
			searchValue = null;
		}
		
		if (request.getMethod().equalsIgnoreCase("GET"))
		{
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		LectureNoticeDTO pagingDto = new LectureNoticeDTO();
		
		pagingDto.setLec_cd(lec_cd);
		pagingDto.setSearchKey(searchKey);
		pagingDto.setSearchValue(searchValue);
		
		// 전체 데이터 개수
		int dataCount = lectureNoticeDao.searchNoticeCount(pagingDto);
		
		// 전체 페이지 수 구하기
		int numPerPage = 10;
		int totalPage = util.getPageCount(numPerPage, dataCount);
		
		// 전체 페이지 수 보다 현재 표시할 페이지가 큰 경우
		if (totalPage < currentPage)
			currentPage = totalPage;
		
		// 테이블에서 가져올 리스트들의 시작과 끝 위치
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		pagingDto.setStart(start);
		pagingDto.setEnd(end);
		
		// 출력할 데이터
		ArrayList<LectureNoticeDTO> lectureNoticeList = lectureNoticeDao.getNoticeListData(pagingDto);
		mem_cd = lectureNoticeList.get(0).getMem_cd();
		
		String params = "";
		if (searchValue != null && searchValue.length() != 0)
		{
			searchValue = URLEncoder.encode(searchKey, "UTF-8");
			params = "searchKey=" + searchKey + "&searchValue=" + searchValue;
		}
		
		String cp = request.getContextPath();

		// 페이징 처리
		String listUrl = cp + "/lecturenoticelist.action";
		if (params.length() != 0)
			listUrl += "?" + params;
		
		String pageIndexList = util.pageIndexList(currentPage, totalPage, listUrl);
		
		/*
		 * System.out.println("lectureNoticeList : " + lectureNoticeList);
		 * System.out.println("pageIndexList : " + pageIndexList);
		 * System.out.println("dataCount : " + dataCount);
		 * System.out.println("mem_cd : " + mem_cd);
		 */
		
		model.addAttribute("lectureNoticeList", lectureNoticeList);
		model.addAttribute("pageIndexList", pageIndexList);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("mem_cd", mem_cd);
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		view = "WEB-INF/views/lecture/AjaxLectureNoticeList.jsp";

		return view;
	}

	// 강의 공지사항 상세 화면 노출하기
	@RequestMapping(value = "/lecturenoticedetail.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String lectureNoticeDetail(Model model, HttpServletRequest request) throws UnsupportedEncodingException
	{
		String view = null;
		String lec_ntc_cd = request.getParameter("lec_ntc_cd");
		String lec_cd = request.getParameter("lec_cd");
		ILectureNoticeDAO lectureNoticeDao = sqlSession.getMapper(ILectureNoticeDAO.class);
		
		System.out.println("공지사항상세 강의코드 : " + lec_cd);
		System.out.println("공지사항상세 공지사항코드 : " + lec_ntc_cd);

		LectureNoticeDTO noticeDetail = lectureNoticeDao.lectureNoticeDetail(lec_cd, lec_ntc_cd);

		model.addAttribute("noticeDetail", noticeDetail);
		
		System.out.println("title" + noticeDetail.getTitle());
		System.out.println("name" + noticeDetail.getName());
		System.out.println("crt_date" + noticeDetail.getCrt_date());
		System.out.println("hits" + noticeDetail.getHits());
		System.out.println("content" + noticeDetail.getContent());
		System.out.println("mem_cd" + noticeDetail.getMem_cd());

		// 댓글 정보 ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
		// 댓글 수
		/*
		int re_count = lectureNoticeDao.studyReCount(dto);

		model.addAttribute("re_count", re_count);

		// 댓글 리스트

		ArrayList<StudyNoticeDTO> noticeReList = studyNoticeDao.studyNoticeReList(dto);

		model.addAttribute("noticeReList", noticeReList);
		★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★*/

		// view = "WEB-INF/views/study/AjaxStudyNoticeDetail.jsp";
		
		view = "WEB-INF/views/lecture/LectureNoticeDetail.jsp";

		return view;
	}
	
	// 스터디 공지사항 등록화면 노출
		@RequestMapping(value = "/lecturenoticeaddjsp.action", method = { RequestMethod.GET, RequestMethod.POST })
		public String lecutreNoticeAdd(Model model, HttpServletRequest request)
		{
			String view = null;
			
			ILectureNoticeDAO lectureNoticeDao = sqlSession.getMapper(ILectureNoticeDAO.class);
			
			// 세션에서 로그인한 회원 코드 받아오기
			HttpSession session = request.getSession();

		    String mem_cd = (String) session.getAttribute("mem_cd");
			
			String lec_cd = request.getParameter("lec_cd");
			
			System.out.println("등록화면에서 받은 강의코드" + lec_cd);
			
			LectureNoticeDTO dto = new LectureNoticeDTO();
			
			dto.setLec_cd(lec_cd);
		    dto.setMem_cd(mem_cd);
			
			// LectureNoticeDTO noticeAddData = LectureNoticeDao.studyNoticeAddData(dto);
			
			// model.addAttribute("noticeAddData", noticeAddData);
			
			view = "WEB-INF/views/lecture/LectureNoticeAdd.jsp";
			
			return view;
		}

}
