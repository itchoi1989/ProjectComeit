package com.sys.comeit.controller;
import java.io.UnsupportedEncodingException;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

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
public class SpaceController 
{
	@Autowired
	private SqlSession sqlSession;
	
		// 공간 리스트 화면 노출하기
		@RequestMapping(value = "/spalist.action", method = { RequestMethod.GET, RequestMethod.POST })
		public String spaList(Model model,HttpServletRequest request) throws UnsupportedEncodingException
		{
			String view = null;
			
			IAreaDAO areaDao = sqlSession.getMapper(IAreaDAO.class); // 지역
			ISpaceDAO ispaceDAO = sqlSession.getMapper(ISpaceDAO.class); // 공간 정보
			
			String check_type="CHET1001";
			
			MyUtil util = new MyUtil();		// 페이징 처리
			String pageNum = request.getParameter("pageNum");
			
			int currentPage = 1;
			if (pageNum != null && pageNum.length() != 0)
			{
				currentPage = Integer.parseInt(pageNum);
			}
			
			// 필터(세부지역)
			SpaReqDTO dto = new SpaReqDTO();
			String spc_area_cd = null;
			
			spc_area_cd = request.getParameter("spcArea");
			System.out.println("세부지역" + spc_area_cd); // 세부지역
			dto.setSpc_area_cd(spc_area_cd);
			
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
			
			SpaReqDTO reqdto = new SpaReqDTO();
			reqdto.setCheck_type(check_type);
			reqdto.setSearchKey(searchKey);
			reqdto.setSearchValue(searchValue);
			reqdto.setSpc_area_cd(spc_area_cd);
			
			int dataCount = ispaceDAO.spaceCount(reqdto);
			model.addAttribute("area", areaDao.areaList());
			//model.addAttribute("space", ispaceDAO.spaceList(dto)); // 전체/검색포함 - 리스트
			//model.addAttribute("count", dataCount);  // 전체/검색포함 - 데이터수
			
			model.addAttribute("spaceTags", ispaceDAO.spaceTagList());	// 모든 공간 모든 키워드 
			
			// 전체 페이지 수 구하기
			int numPerPage = 4;
			int totalPage = util.getPageCount(numPerPage, dataCount);
			
			// 전체 페이지 수 보다 현재 표시할 페이지가 큰 경우
			if (totalPage < currentPage)
			{
				currentPage = totalPage;
			}
			
			// 테이블에서 가져올 리스트들의 시작과 끝 위치
			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;
			
			reqdto.setStart(start);
			reqdto.setEnd(end);
			
			// 테이블에서 리스트를 출력할 데이터 가져오기
			List<SpaReqDTO> space = ispaceDAO.spaceList(reqdto);
			
			String params = "";
			if (searchValue != null && searchValue.length() != 0)
			{
				searchValue = URLEncoder.encode(searchKey, "UTF-8");
				params = "searchKey=" + searchKey + "&searchValue=" + searchValue;
			}
			
			String cp = request.getContextPath();
			
			// 페이징 처리
			String listUrl = cp + "/spalist.action";
			if (params.length() != 0)
			{
				listUrl += "?" + params;
			}
			String pageIndexList = util.pageIndexList(currentPage, totalPage, listUrl);
			
			request.setAttribute("space", space);
			request.setAttribute("pageIndexList", pageIndexList);
			request.setAttribute("count", dataCount);
			
			view = "WEB-INF/views/space/SpaceList.jsp";
			
			return view;
		}
		
		// 공간 상세페이지로 이동
		@RequestMapping(value = "/spacedetail.action", method = { RequestMethod.GET, RequestMethod.POST })
		public String spaceDetail(Model model,HttpServletRequest request)
		{
			String view = null;
			HttpSession session = request.getSession(); 
			
			String mem_id = (String) session.getAttribute("id");
			String spa_req_cd = request.getParameter("spa_req_cd");
			String peoCd = "";
			if(request.getParameter("peoCd")!=null)
			{
				peoCd = request.getParameter("peoCd");
				System.out.println("peoCd : " + peoCd);
			}
			if(mem_id==null)
			{
				mem_id="";
			}
			ISpaceDAO ispaceDAO = sqlSession.getMapper(ISpaceDAO.class); // 공간 정보
			SpaReqDTO dto = new SpaReqDTO();
			dto.setSpa_req_cd(spa_req_cd);
			dto.setMem_id(mem_id);
			
			model.addAttribute("spaceInfo",ispaceDAO.spaceInfoSearch(spa_req_cd));	// 공간 정보
			model.addAttribute("spaceTag",ispaceDAO.spaceTagSearch(spa_req_cd));	// 키워드
			model.addAttribute("fclty",ispaceDAO.spaceFcltySearch(spa_req_cd));	// 시설 안내
			model.addAttribute("feedback",ispaceDAO.spaceFeed(spa_req_cd));	// 피드백
			model.addAttribute("feedCheck",ispaceDAO.reqCount(dto));	// 피드백 입력 체크
			model.addAttribute("repType",ispaceDAO.spaRepType());	//신고타입
			model.addAttribute("TotData",ispaceDAO.googleChart(spa_req_cd));	//그래프
			model.addAttribute("peoCd",peoCd);	//스터디장, 강의코드
			
			view = "WEB-INF/views/space/SpaceDetail.jsp";
			return view;
		}
		
		// 피드백 등록
		@ResponseBody
		@RequestMapping(value = "/feedinsert.action", method = { RequestMethod.GET, RequestMethod.POST })
		public String feedInsert(Model model,HttpServletRequest request)
		{
			ISpaceDAO ispaceDAO = sqlSession.getMapper(ISpaceDAO.class);
			SpaReqDTO dto = new SpaReqDTO();
			
			dto.setReq_cd(request.getParameter("cd"));
			dto.setFacility(Integer.parseInt(request.getParameter("spa1"))); //시설
			dto.setKindness(Integer.parseInt(request.getParameter("spa2")));//친절
			dto.setPrice(Integer.parseInt(request.getParameter("spa3")));//가격
			dto.setLocation(Integer.parseInt(request.getParameter("spa4")));//위치
			dto.setNoise(Integer.parseInt(request.getParameter("spa5")));//소음
			
			int feedcount = 0;
			if(ispaceDAO.feedbacPeokCheck(dto.getReq_cd())>0)
			{
				feedcount = ispaceDAO.feedStuInsert(dto);
			}
			else
			{
				feedcount = ispaceDAO.feedLecInsert(dto);
			}
			return String.valueOf(feedcount);
		}
		
		// 예약 등록
		@ResponseBody
		@RequestMapping(value = "/reqinsert.action", method = { RequestMethod.GET, RequestMethod.POST })
		public String spaReq(Model model,HttpServletRequest request)
		{
			ISpaceDAO ispaceDAO = sqlSession.getMapper(ISpaceDAO.class);
			SpaReqDTO dto = new SpaReqDTO();
			
			String spa_req_cd = request.getParameter("spaReqCd");
			//String stu_hist_cd = request.getParameter("stu_hist_cd");	// 스터디장 코드
			//String lec_cd=request.getParameter("lec_cd"); 	// 강의 코드
			String peoCd=request.getParameter("peoCd"); //스터디장, 강의 코드
			String date = request.getParameter("date");
			int use_hrs =Integer.parseInt(request.getParameter("time"));	//총 요청시간
			String impo = request.getParameter("import"); //이용 시작시간
			int mem_num = Integer.parseInt(request.getParameter("reqNum")); //인원수
			String use_time="";
			int impoNum = Integer.parseInt(impo);
			if(impoNum>9)
			{
				use_time = date+" "+impo+":00:00";
			}
			else
			{
				use_time = date+" 0"+impo+":00:00";
			}
			
			dto.setSpa_req_cd(spa_req_cd);
			
			if(ispaceDAO.peoCdCheck(peoCd)>0)
			{
				dto.setStu_hist_cd(peoCd);
			}
			else
			{
				dto.setLec_cd(peoCd);
			}
			dto.setUse_hrs(use_hrs);
			dto.setUse_time(use_time);
			dto.setMem_num(mem_num);
			
			System.out.println(spa_req_cd);
			System.out.println(dto.getSpa_req_cd());
			System.out.println(dto.getStu_hist_cd());
			System.out.println(dto.getUse_hrs());
			System.out.println(dto.getUse_time());
			System.out.println(dto.getMem_num());
			
			int reqInsertNum =0;
			
			if(ispaceDAO.peoCdCheck(peoCd)>0)
			{
				reqInsertNum = ispaceDAO.reqStuInsert(dto);
			}
			else
			{
				reqInsertNum = ispaceDAO.reqLecInsert(dto);
			}
			return String.valueOf(reqInsertNum);
		}
		
		// 공간 마이페이지로 이동
		@RequestMapping(value = "/spacemy.action", method = { RequestMethod.GET, RequestMethod.POST })
		public String spaceMy(Model model,HttpServletRequest request)
		{
			String view = null;
			
			HttpSession session = request.getSession(); 
			String spa_id = (String) session.getAttribute("id");
			ISpaceDAO ispaceDAO = sqlSession.getMapper(ISpaceDAO.class); // 공간 정보
			
			model.addAttribute("Search",ispaceDAO.Search(spa_id));	// 내정보
			model.addAttribute("MyInfo",ispaceDAO.MyInfoSearch(spa_id));	// 본인이 등록한 공간 중 승인된 공간 관리
			model.addAttribute("reqCheck",ispaceDAO.SpaReqCheck(spa_id));	//마이페이지 공간 예약 내역 관리
			model.addAttribute("reqStu",ispaceDAO.SpaReqStu(spa_id));	//마이페이지 공간 스터디 예약 요청 관리
			model.addAttribute("reqLec",ispaceDAO.SpaReqLec(spa_id));	//마이페이지 공간 강의 예약 요청 관리
			view = "WEB-INF/views/space/SpaceMy.jsp";
			return view;
		}
		
		// 스터디 예약 승인
		@ResponseBody
		@RequestMapping(value = "/stuspareqappr.action", method = { RequestMethod.GET, RequestMethod.POST })
		public String SpaStuReqAppr(Model model,HttpServletRequest request)
		{
			ISpaceDAO ispaceDAO = sqlSession.getMapper(ISpaceDAO.class);
			String stu_spa_req_cd = request.getParameter("stu_spa_req_cd");
			System.out.println(stu_spa_req_cd);
			int reqInsertNum = ispaceDAO.SpaStuReqAppr(stu_spa_req_cd);
			return String.valueOf(reqInsertNum);
		}
		
		// 강의 예약 승인
		@ResponseBody
		@RequestMapping(value = "/lecspareqappr.action", method = { RequestMethod.GET, RequestMethod.POST })
		public String SpaLecReqAppr(Model model,HttpServletRequest request)
		{
			ISpaceDAO ispaceDAO = sqlSession.getMapper(ISpaceDAO.class);
			String lec_spa_cd = request.getParameter("lec_spa_cd");
			int reqInsertNum = ispaceDAO.SpaLecReqAppr(lec_spa_cd);
			return String.valueOf(reqInsertNum);
		}
				
		// 스터디 예약 거부
		@ResponseBody
		@RequestMapping(value = "/stuspareqapprn.action", method = { RequestMethod.GET, RequestMethod.POST })
		public String StuSpaReqApprN(Model model,HttpServletRequest request)
		{
			ISpaceDAO ispaceDAO = sqlSession.getMapper(ISpaceDAO.class);
			
			String stu_spa_req_cd = request.getParameter("stu_spa_req_cd");
			String prcs_rsn = request.getParameter("prcs_rsn");
			SpaReqDTO dto = new SpaReqDTO();
			dto.setStu_spa_req_cd(stu_spa_req_cd);
			dto.setPrcs_rsn(prcs_rsn);
			
			int reqNum = ispaceDAO.StuSpaReqApprN(dto);
			return String.valueOf(reqNum);
		}
		
		// 강의 예약 거부
		@ResponseBody
		@RequestMapping(value = "/lecspareqapprn.action", method = { RequestMethod.GET, RequestMethod.POST })
		public String LecSpaReqApprN(Model model,HttpServletRequest request)
		{
			ISpaceDAO ispaceDAO = sqlSession.getMapper(ISpaceDAO.class);
			
			String lec_spa_cd = request.getParameter("lec_spa_cd");
			String prcs_rsn = request.getParameter("prcs_rsn");
			SpaReqDTO dto = new SpaReqDTO();
			
			dto.setLec_spa_cd(lec_spa_cd);
			dto.setPrcs_rsn(prcs_rsn);
			
			int reqNum = ispaceDAO.LecSpaReqApprN(dto);
			
			return String.valueOf(reqNum);
		}
		
		// 내 정보 수정
		@ResponseBody
		@RequestMapping(value = "/spaupdate.action", method = { RequestMethod.GET, RequestMethod.POST })
		public String spaUpdate(Model model,HttpServletRequest request)
		{
			ISpaceDAO ispaceDAO = sqlSession.getMapper(ISpaceDAO.class);
			
			String spa_id = request.getParameter("spa_id");
			String name = request.getParameter("name");
			String tel = request.getParameter("tel");
			String email = request.getParameter("email");
			SpaDTO dto = new SpaDTO();
			dto.setName(name);
			dto.setEmail(email);
			dto.setSpa_id(spa_id);
			dto.setTel(tel);
			
			int spaUpdateNum = ispaceDAO.spaUpdate(dto);
			
			return String.valueOf(spaUpdateNum);
		}
		
		// 신고 접수
		@ResponseBody
		@RequestMapping(value = "/sparepinsert.action", method = { RequestMethod.GET, RequestMethod.POST })
		public String spaRepInsert(Model model,HttpServletRequest request)
		{
			ISpaceDAO ispaceDAO = sqlSession.getMapper(ISpaceDAO.class);
			
			HttpSession session = request.getSession(); 
			String mem_cd = (String) session.getAttribute("mem_cd");
			String spa_req_cd = request.getParameter("spa_req_cd");
			String rep_rsn_type_cd = request.getParameter("rep_rsn_type_cd");
			String rep_rsn = request.getParameter("rep_rsn");
			
			SpaReqDTO dto = new SpaReqDTO();
			dto.setMem_cd(mem_cd);
			dto.setSpa_req_cd(spa_req_cd);
			dto.setRep_rsn_type_cd(rep_rsn_type_cd);
			dto.setRep_rsn(rep_rsn);
			System.out.println(dto.getMem_cd());
			System.out.println(dto.getSpa_req_cd());
			System.out.println(dto.getRep_rsn_type_cd());
			System.out.println(dto.getRep_rsn());
			
			int spaNum = ispaceDAO.spaRepInsert(dto);
			
			return String.valueOf(spaNum);
		}
		
		// 공간 삭제
		@ResponseBody
		@RequestMapping(value = "/spacedel.action", method = { RequestMethod.GET, RequestMethod.POST })
		public String spaceDel(Model model,HttpServletRequest request)
		{
			ISpaceDAO ispaceDAO = sqlSession.getMapper(ISpaceDAO.class);
			
			String spa_req_cd = request.getParameter("spa_req_cd");
			
			int spaNum=0;
			if(ispaceDAO.spaceDelCheck(spa_req_cd)==0)
			{
				spaNum = ispaceDAO.spaceDel(spa_req_cd);
			}
			return String.valueOf(spaNum);
		}
}