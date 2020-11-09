package com.sys.comeit.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sys.comeit.dto.SpaReqDTO;
import com.sys.comeit.idao.IAreaDAO;
import com.sys.comeit.idao.ISpaceDAO;
import com.sys.comeit.util.MyTabUtil;

@Controller
public class LectureSpaceListController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 공간 리스트 화면 노출하기
	@RequestMapping(value = "/lecturespacelist.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String lectureSpaceList(Model model,HttpServletRequest request) throws UnsupportedEncodingException
	{
		String view = null;
	
		IAreaDAO areaDao = sqlSession.getMapper(IAreaDAO.class); // 지역
		ISpaceDAO ispaceDAO = sqlSession.getMapper(ISpaceDAO.class); // 공간 정보
		
		String check_type="CHET1001";
		
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
			searchKey = "spa_name";
			searchValue = "";
		}
		
		if (request.getMethod().equalsIgnoreCase("GET"))
		{
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		SpaReqDTO dto = new SpaReqDTO();
		
		dto.setCheck_type(check_type);
		dto.setSearchKey(searchKey);
		dto.setSearchValue(searchValue);
		
		int dataCount = ispaceDAO.spaceCount(dto);
		model.addAttribute("area", areaDao.areaList());
		//model.addAttribute("space", ispaceDAO.spaceList(dto)); // 전체/검색포함 - 리스트
		//model.addAttribute("count", dataCount);  // 전체/검색포함 - 데이터수
		
		model.addAttribute("spaceTags", ispaceDAO.spaceTagList());	// 모든 공간 모든 키워드 
	
		// 전체 페이지 수 구하기
		int numPerPage = 6;
		int totalPage = util.getPageCount(numPerPage, dataCount);
		
		// 전체 페이지 수 보다 현재 표시할 페이지가 큰 경우
		if (totalPage < currentPage)
		{
			currentPage = totalPage;
		}
	
		// 테이블에서 가져올 리스트들의 시작과 끝 위치
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		dto.setStart(start);
		dto.setEnd(end);
		
		// 테이블에서 리스트를 출력할 데이터 가져오기
		List<SpaReqDTO> lists = ispaceDAO.spaceList(dto);
		
		String params = "";
		if (searchValue != null && searchValue.length() != 0)
		{
			searchValue = URLEncoder.encode(searchKey, "UTF-8");
			params = "searchKey=" + searchKey + "&searchValue=" + searchValue;
		}
		
		String cp = request.getContextPath();
	
		// 페이징 처리
		String listUrl = cp + "/lecturespacelist.action";
		if (params.length() != 0)
		{
			listUrl += "?" + params;
		}
		String pageIndexList = util.pageIndexList(currentPage, totalPage, listUrl);
	
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
	
		view = "WEB-INF/views/lecture/AjaxLectureSpaceList.jsp";
	
		return view;
		
	}
	
}
