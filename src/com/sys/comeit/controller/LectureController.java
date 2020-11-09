package com.sys.comeit.controller;

import java.io.UnsupportedEncodingException;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sys.comeit.util.MyUtil;
import com.sys.comeit.dto.*;
import com.sys.comeit.idao.*;

@Controller
public class LectureController
{
	@Autowired
	private SqlSession sqlSession;

	// 강의 등록 FORM에서 지역, 기간, 요일 리스트 던져주기
	@RequestMapping(value = "/lecturecreate.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String lectureCreate(Model model)
	{
		String view = null;

		IAreaDAO areaDao = sqlSession.getMapper(IAreaDAO.class);
		IIntTagDAO intTagDao = sqlSession.getMapper(IIntTagDAO.class);

		model.addAttribute("area", areaDao.areaList());
		model.addAttribute("intTag", intTagDao.intTagList());

		view = "WEB-INF/views/lecture/LectureCreate.jsp";

		return view;
	}

	@RequestMapping(value = "/lectureinsert.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String lectureInsert(Model model, HttpServletRequest request)
	{
		ILectureDAO lectureDao = sqlSession.getMapper(ILectureDAO.class);
		IProDAO proDao = sqlSession.getMapper(IProDAO.class);
		
		HttpSession session = request.getSession();
		
		String view = "";
		String mem_cd = "";
		mem_cd = (String) session.getAttribute("mem_cd");

		// String lec_cd = request.getParameter("id");
		String prof_cd = proDao.lecCreateCheck2(mem_cd); //
		System.out.println("prof_cd : " + prof_cd);
		String spc_area_cd = request.getParameter("spcArea");
		System.out.println("spcArea_cd : " + spc_area_cd);
		String lec_term_cd = request.getParameter("lecTerm");
		System.out.println("lecTerm_cd : " + lec_term_cd);
		String lec_name = request.getParameter("lecName"); //
		System.out.println("lecName : " + lec_name);
		String str_date = request.getParameter("start"); //
		System.out.println("str_date : " + str_date);
		String lec_fee = request.getParameter("lecFee");
		System.out.println("lecFee : " + lec_fee);
		String lec_intro = request.getParameter("lecIntro"); //
		System.out.println("lecIntro : " + lec_intro);
		String min_mem = request.getParameter("minMem");
		System.out.println("minMem : " + min_mem);
		String max_mem = request.getParameter("maxMem");
		System.out.println("maxMem : " + max_mem);
		String startTime = request.getParameter("startTime");
		System.out.println("startTime : " + startTime);
		String endTime = request.getParameter("endTime");
		System.out.println("endTime : " + endTime);

		LectureDTO dto = new LectureDTO();

		dto.setLec_name(lec_name);
		dto.setProf_cd(prof_cd);
		dto.setSpc_area_cd(spc_area_cd);
		dto.setLec_term_cd(lec_term_cd);
		dto.setStr_date(str_date);
		dto.setLec_fee(lec_fee);
		dto.setLec_intro(lec_intro);
		dto.setMin_mem(min_mem);
		dto.setMax_mem(max_mem);
		dto.setStr_hrs(startTime);
		dto.setEnd_hrs(endTime);
		
		System.out.println(lec_name);
		System.out.println(prof_cd);
		System.out.println(spc_area_cd);
		System.out.println(lec_term_cd);
		System.out.println(str_date);
		System.out.println(lec_fee);
		System.out.println(lec_intro);
		System.out.println(min_mem);
		System.out.println(max_mem);
		System.out.println(startTime);
		System.out.println(endTime);

		lectureDao.lectureInsert(dto);

		String lec_cd = dto.getLec_cd();
		System.out.println(lec_cd);

		String[] dayTagList = request.getParameterValues("dayTagList");		
		String[] intTagList = {};
		String[] etcTagList = {};
		
		if(request.getParameterValues("intTagList")!=null)
		{
			intTagList = request.getParameterValues("intTagList"); // 선택한 모든 관심 키워드 배열에 넣기
		}
		
		if(request.getParameterValues("etcTagList")!=null)
		{
			etcTagList = request.getParameterValues("etcTagList"); // 선택한 모든 관심 기타 키워드 배열에 넣기
		}
		System.out.println("그냥 관심 : " + intTagList.length);
		System.out.println("기타 관심 : " + etcTagList.length);
		
		// 관심키워드 DB INSERT
		if (lec_cd != null)
		{
			// 관심키워드가 존재할 때 INSERT
			if (intTagList.length > 0)
			{
				for (int i = 0; i < intTagList.length; i++)
				{
					dto.setInt_tag_cd(intTagList[i]);

					System.out.println("각 관심 : " + intTagList[i]);

					lectureDao.insertIntTag(dto);
				}
			}
			// 기타 키워드가 존재할 때 INSERT
			if (etcTagList.length > 0)
			{
				for (int i = 0; i < etcTagList.length; i++)
				{
					dto.setEtc_tag(etcTagList[i]);
					System.out.println("각 기타 키워드 : " + etcTagList[i]);

					lectureDao.insertEtcTag(dto); // 기타 키워드 INSERT

					int etcTagCount = lectureDao.etcTagCount(etcTagList[i]);

					if (etcTagCount == 10)
						lectureDao.addTagName(etcTagList[i]);

				}
			}

			// 강의 진행 일시 INSERT
			if (dayTagList.length > 0)
			{
				for (int i = 0; i < dayTagList.length; i++)
				{
					dto.setDay_cd(dayTagList[i]);
					lectureDao.addLecturePrgTime(dto);	
				}
			}

		}
		
		view = "redirect:lecturelist.action";

		return view;
	}
	
	// 강의 수정 FORM 호출
	@RequestMapping(value = "/lecturemod.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String lectureMod(Model model, HttpServletRequest request)
	{
		String view = null;
	
		IAreaDAO areaDao = sqlSession.getMapper(IAreaDAO.class);
		IIntTagDAO intTagDao = sqlSession.getMapper(IIntTagDAO.class);
		ILectureDAO lectureDao = sqlSession.getMapper(ILectureDAO.class);
		String lec_cd = request.getParameter("lec_cd");
	
		model.addAttribute("area", areaDao.areaList());
		model.addAttribute("intTag", intTagDao.intTagList());
		model.addAttribute("lecInfo", lectureDao.lectureInfo(lec_cd));
		model.addAttribute("lecCd", lec_cd);
	
		view = "WEB-INF/views/lecture/LectureMod.jsp";
	
		return view;
	}
	
	@RequestMapping(value = "/lectureupdate.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String lectureUpdate(Model model, HttpServletRequest request)
	{
		ILectureDAO lectureDao = sqlSession.getMapper(ILectureDAO.class);
		IProDAO proDao = sqlSession.getMapper(IProDAO.class);
		
		HttpSession session = request.getSession();
		
		String view = "";
		String mem_cd = "";
		mem_cd = (String) session.getAttribute("mem_cd");

		String lec_cd = request.getParameter("lecCd");
		String prof_cd = proDao.lecCreateCheck2(mem_cd); //
		System.out.println("prof_cd : " + prof_cd);
		String spc_area_cd = request.getParameter("spcArea");
		System.out.println("spcArea_cd : " + spc_area_cd);
		String lec_term_cd = request.getParameter("lecTerm");
		System.out.println("lecTerm_cd : " + lec_term_cd);
		String lec_name = request.getParameter("lecName"); //
		System.out.println("lecName : " + lec_name);
		String str_date = request.getParameter("start"); //
		System.out.println("str_date : " + str_date);
		String lec_fee = request.getParameter("lecFee");
		System.out.println("lecFee : " + lec_fee);
		String lec_intro = request.getParameter("lecIntro"); //
		System.out.println("lecIntro : " + lec_intro);
		String min_mem = request.getParameter("minMem");
		System.out.println("minMem : " + min_mem);
		String max_mem = request.getParameter("maxMem");
		System.out.println("maxMem : " + max_mem);
		String startTime = request.getParameter("startTime");
		System.out.println("startTime : " + startTime);
		String endTime = request.getParameter("endTime");
		System.out.println("endTime : " + endTime);

		LectureDTO dto = new LectureDTO();

		dto.setLec_cd(lec_cd);
		dto.setLec_name(lec_name);
		dto.setSpc_area_cd(spc_area_cd);
		dto.setLec_term_cd(lec_term_cd);
		dto.setLec_name(lec_name);
		dto.setStr_date(str_date);
		dto.setLec_fee(lec_fee);
		dto.setLec_intro(lec_intro);
		dto.setMin_mem(min_mem);
		dto.setMax_mem(max_mem);
		dto.setStr_hrs(startTime);
		dto.setEnd_hrs(endTime);

		lectureDao.lectureUpdate(dto);

		String[] dayTagList = request.getParameterValues("dayTagList");		
		String[] intTagList = {};
		String[] etcTagList = {};
		
		if(request.getParameterValues("intTagList")!=null)
		{
			intTagList = request.getParameterValues("intTagList"); // 선택한 모든 관심 키워드 배열에 넣기
		}
		
		if(request.getParameterValues("etcTagList")!=null)
		{
			etcTagList = request.getParameterValues("etcTagList"); // 선택한 모든 관심 기타 키워드 배열에 넣기
		}
		System.out.println("그냥 관심 : " + intTagList.length);
		System.out.println("기타 관심 : " + etcTagList.length);
		
		// 관심키워드 DB INSERT
		if (lec_cd != null)
		{
			// 관심키워드가 존재할 때 INSERT
			if (intTagList.length > 0)
			{
				lectureDao.intTagDelete(lec_cd);
				
				for (int i = 0; i < intTagList.length; i++)
				{
					dto.setInt_tag_cd(intTagList[i]);

					System.out.println("각 관심 : " + intTagList[i]);

					lectureDao.insertIntTag(dto);
				}
			}
			// 기타 키워드가 존재할 때 INSERT
			if (etcTagList.length > 0)
			{
				lectureDao.etcTagDelete(lec_cd);
				
				for (int i = 0; i < etcTagList.length; i++)
				{
					dto.setEtc_tag(etcTagList[i]);
					System.out.println("각 기타 키워드 : " + etcTagList[i]);

					lectureDao.insertEtcTag(dto); // 기타 키워드 INSERT

					int etcTagCount = lectureDao.etcTagCount(etcTagList[i]);

					if (etcTagCount == 10)
						lectureDao.addTagName(etcTagList[i]);

				}
			}

			// 강의 진행 일시 INSERT
			if (dayTagList.length > 0)
			{
				lectureDao.lecPrgTimeDelete(lec_cd);
				
				for (int i = 0; i < dayTagList.length; i++)
				{
					dto.setDay_cd(dayTagList[i]);
					lectureDao.addLecturePrgTime(dto);	
				}
			}

		}
		
		view = "redirect:lecturelist.action";

		return view;
	}
	
	// 강의 리스트 화면 노출하기
	@RequestMapping(value = "/lecturelist.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String lectureList(Model model, HttpServletRequest request) throws UnsupportedEncodingException
	{
		String view = null;
		String mem_cd = null;
		int mem_cd_check = 0;
		
		// mem_cd 를 받기 위한 세션 생성
		HttpSession session = request.getSession();
		
		IAreaDAO areaDao = sqlSession.getMapper(IAreaDAO.class); // 지역
		ILectureDAO lecDao = sqlSession.getMapper(ILectureDAO.class); // 강의
		IProDAO proDao = sqlSession.getMapper(IProDAO.class); // 강사

		// 세션을 통해 mem_cd를 얻어오고 해당 회원이 강사인지 아닌지 판단 하기 위한 변수
		mem_cd = (String) session.getAttribute("mem_cd");
		
		if(mem_cd != null)
		{
			mem_cd_check = proDao.lecCreateCheck(mem_cd);
		}
		
		model.addAttribute("area", areaDao.areaList());
		// model.addAttribute("lec", lecDao.lecList()); // 실제 강의 리스트
		model.addAttribute("count", lecDao.lecCount());
		model.addAttribute("lecTags", lecDao.lecTagList()); // 하나의 강의의 모든 키워드
		model.addAttribute("lecHrDays", lecDao.lecHrDaySearch());  // 하나의 강의의 요일, 시간
		model.addAttribute("mem_cd_check", mem_cd_check); // 멤버 코드 LectureList.jsp 페이지로 넘기기
		
		// 페이징 처리 --------------------------------------

		MyUtil util = new MyUtil();

		String pageNum = request.getParameter("pageNum"); // 페이지 번호? 왜 삭제 버튼에서..?
		
		int currentPage = 1;
		if (pageNum != null && pageNum.length() != 0)
		{
			currentPage = Integer.parseInt(pageNum);
		}

		String searchKey = null;
		String searchValue = null;

		searchKey = request.getParameter("searchKey");
		System.out.println("searchKey : " + searchKey);
		searchValue = request.getParameter("searchValue");
		System.out.println("searchValue : " +searchValue);

		if (searchKey == null)
		{
			searchKey = "LEC_NAME";
			searchValue = "";
		}

		if (request.getMethod().equalsIgnoreCase("GET"))
		{
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}

		LectureDTO dto = new LectureDTO();

		dto.setSearchKey(searchKey);
		dto.setSearchValue(searchValue);
		
		/* lecDao.getListData(dto); */
		
		// 전체 데이터 개수
		int dataCount = lecDao.lecSearchCount(dto); // 검색 완료된 데이터 개수
		
		// 전체 페이지 수 구하기
		int numPerPage = 10;
		int totalPage = util.getPageCount(numPerPage, dataCount);

		// 전체 페이지 수 보다 현재 표시할 페이지가 큰 경우
		if (totalPage < currentPage)
		{
			currentPage = totalPage;
		}

		// 테이블에서 가져올 리스트들의 시작과 끝 위치
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		dto.setStart(start);
		dto.setEnd(end);

		// 테이블에서 리스트를 출력할 데이터 가져오기
		List<LectureDTO> lec = lecDao.getListData(dto);

		String params = "";
		if (searchValue != null && searchValue.length() != 0)
		{
			searchValue = URLEncoder.encode(searchKey, "UTF-8");
			params = "searchKey=" + searchKey + "&searchValue=" + searchValue;
		}

		String cp = request.getContextPath();

		// 페이징 처리
		String listUrl = cp + "/lecturelist.action";
		if (params.length() != 0)
		{
			listUrl += "?" + params;
		}

		String pageIndexList = util.pageIndexList(currentPage, totalPage, listUrl);
		System.out.println("pageIndexList : " + pageIndexList);
		
		// 포워딩할 LectureList.jsp 에 넘겨준다.
		request.setAttribute("lec", lec);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);

		view = "WEB-INF/views/lecture/LectureList.jsp";

		return view;
	}

	
	// 강의 상세 페이지 호출
	@RequestMapping(value = "/lecturedetail.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String lectureDetail(Model model, HttpServletRequest request)
	{
		String view = "";
		int profCheck = 0; // 강의 상세 페이지를 호출하는 회원이 강사인지 아닌지 판단하는 변수
		
		HttpSession session = request.getSession();
		
		ILectureDAO lectureDao = sqlSession.getMapper(ILectureDAO.class);
		IProDAO proDao = sqlSession.getMapper(IProDAO.class);
		IMemberDAO memDao = sqlSession.getMapper(IMemberDAO.class);
		
		// 강의코드 받기
		String lec_cd = request.getParameter("lec_cd");
		String mem_cd = lectureDao.findMemcd(lec_cd); // 해당 강의의 강사 mem_cd 
		String mem_cd_session = (String) session.getAttribute("mem_cd"); // 해당 페이지에 접속하는 mem_cd
		
		profCheck = lectureDao.checkProfcd(lec_cd, mem_cd_session);
		
		if(profCheck == 0)
		{
			model.addAttribute("lecInfo", lectureDao.getListData2(lec_cd));
			model.addAttribute("lecTag", lectureDao.lecIntTagSearch(lec_cd));
			model.addAttribute("profInfo", proDao.profInfo(mem_cd));
			model.addAttribute("memInfo", memDao.memPayInfo(mem_cd_session)); // 결제정보 넘기기
			model.addAttribute("lec_cd", lec_cd);
			
			view = "WEB-INF/views/lecture/LectureStudentDetail.jsp";
			
			return view;
		}
		else
		{
			model.addAttribute("lecInfo", lectureDao.lectureInfo(lec_cd));
			model.addAttribute("lecTag", lectureDao.lecIntTagSearch(lec_cd));
			model.addAttribute("profInfo", proDao.profInfo(mem_cd));
			model.addAttribute("lec_cd", lec_cd);
			
			view = "WEB-INF/views/lecture/LectureProfessorDetail.jsp";
			
			return view;
		}
		
	}
	
	// 결제 완료 페이지 호출
	@RequestMapping(value = "/lecturepaysuccess.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String lecturePaySuccess(Model model, HttpServletRequest request)
	{
		String view = "";
		
		HttpSession session = request.getSession();
		String mem_cd = (String) session.getAttribute("mem_cd");
		
		String lec_cd = request.getParameter("lecCd");
		
		System.out.println("테스트1" + mem_cd);
		System.out.println("테스트2" + lec_cd);
		
		ILectureDAO lectureDao = sqlSession.getMapper(ILectureDAO.class);
		
		lectureDao.lecMemInsert(lec_cd, mem_cd);
		
		view = "WEB-INF/views/lecture/LecturePaySuccess.jsp";
			
			return view;
	}

}
