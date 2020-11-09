package com.sys.comeit.controller;


import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sys.comeit.dto.*;
import com.sys.comeit.idao.*;

@Controller
public class SpaReqController
{
	@Autowired
	private SqlSession sqlSession;

	// 공간 등록 키워드
	  @RequestMapping(value = "/spacreate.action", method = { RequestMethod.GET, RequestMethod.POST })
	  public String spaCreate(Model model) 
	  { 
		  String view = null;
	  
		  IAreaDAO areaDao = sqlSession.getMapper(IAreaDAO.class);
		  ISpaTypeDAO ispaTypeDao = sqlSession.getMapper(ISpaTypeDAO.class);
		  ISpaReqDAO iSpaReqDao = sqlSession.getMapper(ISpaReqDAO.class);
		  
		  model.addAttribute("spaType", ispaTypeDao.cafeList());
		  model.addAttribute("area", areaDao.areaList()); 
		  model.addAttribute("spaTag",iSpaReqDao.spaTagList());
		  
		  view = "WEB-INF/views/space/SpaceCreate.jsp";
		  
		  return view; 
	  }
	  
	  // 사업자 번호 중복 확인 ajax
		@ResponseBody
		@RequestMapping(value = "/checkspanum.action", method = { RequestMethod.GET, RequestMethod.POST })
		public String checkidAjax(HttpServletRequest request, Model model)
		{
			ISpaNumDAO iSpaNumDao = sqlSession.getMapper(ISpaNumDAO.class);

			int num = Integer.parseInt(request.getParameter("num"));

			int result = iSpaNumDao.spacheckCount(num);

			return String.valueOf(result);
		}
		
		// 공간 등록
		@RequestMapping(value = "/spareqinsert.action", method = { RequestMethod.GET, RequestMethod.POST })
		public String spareqinsert(Model model, HttpServletRequest request)
		{
			String view = null;
			ISpaReqDAO dao = sqlSession.getMapper(ISpaReqDAO.class);
			HttpSession session = request.getSession(); 

			String spa_cd = (String) session.getAttribute("spa_cd");
			
			// 필수항목
			String num = request.getParameter("num"); // 사업자 번호
			String cafe_cd = request.getParameter("cafe"); // 카페유형
			String onein = request.getParameter("onein"); // 한줄소개
			String dtlin = request.getParameter("dtlin"); // 상세소개
			String sparsv = request.getParameter("sparsv"); // 주의사항
			
			String img_url_file = request.getParameter("okFile1"); // 첨부파일
			String img_url_img = request.getParameter("okFile2"); // 공간 이미지
			
			String spc_area_cd = request.getParameter("spcArea"); // 세부지역 코드
			String spa = request.getParameter("spa"); // 상호명
			String spapeo = request.getParameter("spapeo"); // 대표자명
			String spaname = request.getParameter("spaname"); // 공간명
			String spatel = request.getParameter("spatel"); // 업체 전화번호
			int start = Integer.parseInt(request.getParameter("start").trim());  // 영업시작시간
			int end = Integer.parseInt(request.getParameter("end").trim()); // 영업최대 이용시간
			int max = Integer.parseInt(request.getParameter("max").trim()); // 영업최대 이용시간
			String dtladdr = request.getParameter("dtladdr"); // 업체 상세주소
			String web_url = null;
			
			SpaReqDTO dto = new SpaReqDTO();

			dto.setRprsn_num(num);
			dto.setSpa_type(cafe_cd);
			dto.setOne_intro(onein);
			dto.setDtl_intro(dtlin);
			dto.setRsv_notes(sparsv);
			dto.setFile_url(img_url_file);
			dto.setImg_url(img_url_img);
			dto.setSpc_area_cd(spc_area_cd);
			dto.setBusi_name(spa);
			dto.setRprsn_name(spapeo);
			dto.setSpa_name(spaname);
			dto.setTel(spatel);
			dto.setDtl_addr(dtladdr);
			dto.setSpa_cd(spa_cd);
			dto.setUse_hrs(max);
			dto.setStr_time(start); 
			dto.setEnd_time(end);
			dto.setWeb_url(web_url);
			
			// 공간등록 프로시저 호출
			dao.spaReqAdd(dto);
			
			String spa_req_cd = dto.getSpa_req_cd(); // OUT 변수인 PK를 담기

			System.out.println(spa_req_cd);

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
			
			// 공간 이미지 설정
			String img_type_cd = "IMGT1001";

			if (spa_req_cd != null) // 카페 등록 성공했을경우
			{
				if (intTagList.length > 0)
				{
					for (int i = 0; i < intTagList.length; i++) // 선택한 모든 관심 키워드 중에
					{
						dto.setInt_tag(intTagList[i]); // 자바를 키워드에 세팅하고

						System.out.println("각 관심 : " + intTagList[i]);

						dao.spaIntTagInsert(dto); // 키워드 insert 실행시키기
					}
				}
				if (etcTagList.length > 0)
				{
					for (int i = 0; i < etcTagList.length; i++) // 선택한 모든 기타 키워드 중에
					{
						dto.setEtc_tag(etcTagList[i]); // 기타태그를 키워드에 세팅하고
						System.out.println("각 기타 : " + etcTagList[i]);

						dao.spaEtcTagInsert(dto); // 기타 키워드 insert 실행시키기

						int etcTagCount = dao.spaEtcTagCount(etcTagList[i]);

						if (etcTagCount == 10) // 기타 키워드 테이블 호출해서 10개일 경우
							dao.spaAddTagName(etcTagList[i]); // 그냥 관심키워드 테이블에 insert 시키기
					}
				}
				
				// 공간 이미지 등록
				dto.setImg_type_cd(img_type_cd);
				dao.spaAddImg(dto);
				
				// 시설안내 등록
				String[] contentList = request.getParameterValues("contentList"); // 모든 시설안내를 배열에 넣기
				if (contentList.length > 0)
				{
					for (int i = 0; i < contentList.length; i++) // 모든 시설안내를
					{
						dto.setContent(contentList[i]); // 시설안내 set
						System.out.println("시설안내 : " + contentList[i]);

						dao.spaAddContent(dto); // 시설안내 insert 실행시키기
					}
				}
				
				view = "redirect:spalist.action"; // 회원가입 성공 시 로그인 페이지
			} else
			{
				view = "redirect:spacreate.action"; // 회원가입 실패 시 회원가입 페이지 유지
			}
			view = "redirect:spalist.action";
			return view;
		}
		
		@RequestMapping(value = "/ajaxspafile.action", method = { RequestMethod.GET, RequestMethod.POST })
		public String ajaxSpaFile()
		{
			String view = null;
			view = "WEB-INF/views/space/AjaxSpaFile.jsp";
			return view;
		}
		
		@RequestMapping(value = "/ajaxspaimg.action", method = { RequestMethod.GET, RequestMethod.POST })
		public String ajaxSpaImg()
		{
			String view = null;
			view = "WEB-INF/views/space/AjaxSpaImg.jsp";
			return view;
		}
		
		// 공간 수정 뷰
		  @RequestMapping(value = "/spamodview.action", method = { RequestMethod.GET, RequestMethod.POST })
		  public String spaModView(Model model,HttpServletRequest request) 
		  { 
			  String view = null;
			  String spa_req_cd = request.getParameter("spa_req_cd");
			  ISpaReqDAO iSpaReqDao = sqlSession.getMapper(ISpaReqDAO.class);
			  ISpaceDAO ispaceDAO = sqlSession.getMapper(ISpaceDAO.class); // 공간 정보
				
				
			  model.addAttribute("spaceInfo",ispaceDAO.spaceInfoSearch(spa_req_cd));
			  model.addAttribute("spaTag",iSpaReqDao.spaTagList());		// 키워드 종류
			  model.addAttribute("spaceTag",ispaceDAO.spaceTagSearch(spa_req_cd)); // 공간 키워드
			  model.addAttribute("fclty",ispaceDAO.spaceFcltySearch(spa_req_cd));// 시설 안내
			  
			  view = "WEB-INF/views/space/SpaceMod.jsp";
			  
			  return view; 
		  }
		  
		  // 공간 수정
		  @RequestMapping(value = "/spamod.action", method = { RequestMethod.GET, RequestMethod.POST })
		  public String spaMod(Model model,HttpServletRequest request) 
		  { 
			  String view = null;
			  String spa_req_cd = request.getParameter("spa_req_cd");
			  ISpaReqDAO iSpaReqDao = sqlSession.getMapper(ISpaReqDAO.class);
			  SpaReqDTO dto = new SpaReqDTO();
			  
			  String onein = request.getParameter("onein"); // 한줄소개
			  String dtlin = request.getParameter("dtlin"); // 상세소개
			  String sparsv = request.getParameter("sparsv"); // 주의사항
			  String spa = request.getParameter("spa"); // 상호명
			  String spapeo = request.getParameter("spapeo"); // 대표자명
			  String spaname = request.getParameter("spaname"); // 공간명
			  String spatel = request.getParameter("spatel"); // 업체 전화번호
			  int start = Integer.parseInt(request.getParameter("start"));  // 영업시작시간
			  int end = Integer.parseInt(request.getParameter("end")); // 영업최대 이용시간
			  int max = Integer.parseInt(request.getParameter("max")); // 영업최대 이용시간
			  
			  dto.setOne_intro(onein);
			  dto.setUse_hrs(max);
			  dto.setRsv_notes(sparsv);
			  dto.setStr_time(start); 
			  dto.setEnd_time(end);
			  dto.setDtl_intro(dtlin);
			  dto.setBusi_name(spa);
			  dto.setSpa_name(spaname);
			  dto.setTel(spatel);
			  dto.setRprsn_name(spapeo);
			  dto.setSpa_req_cd(spa_req_cd);
			
			  iSpaReqDao.spaReqModify(dto);
			  
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
			
			
			  if (spa_req_cd != null) 
			  {
				  if (intTagList.length > 0)
				  {
					  for (int i = 0; i < intTagList.length; i++) // 선택한 모든 관심 키워드 중에
					  {
						  dto.setInt_tag(intTagList[i]); // 자바를 키워드에 세팅하고
						  
						  System.out.println("각 관심 : " + intTagList[i]);
		
						  iSpaReqDao.spaIntTagDel(spa_req_cd);	// 기존 키워드 delete
						  iSpaReqDao.spaIntTagInsert(dto); // 키워드 insert 실행시키기
					  }
				  }
				if (etcTagList.length > 0)
				{
					for (int i = 0; i < etcTagList.length; i++) // 선택한 모든 기타 키워드 중에
					{
						dto.setEtc_tag(etcTagList[i]); // 기타태그를 키워드에 세팅하고
						
						System.out.println("각 기타 : " + etcTagList[i]);
						
						iSpaReqDao.spaEtcTagDel(spa_req_cd);	//기존 기타 키워드 delete
						iSpaReqDao.spaEtcTagInsert(dto); // 기타 키워드 insert 실행시키기
			
						int etcTagCount = iSpaReqDao.spaEtcTagCount(etcTagList[i]);
			
						if (etcTagCount == 10) // 기타 키워드 테이블 호출해서 10개일 경우
							iSpaReqDao.spaAddTagName(etcTagList[i]); // 그냥 관심키워드 테이블에 insert 시키기
					}
				}
				
				// 시설안내 등록
				String[] contentList = request.getParameterValues("contentList"); // 모든 시설안내를 배열에 넣기
				if (contentList.length > 0)
				{
					for (int i = 0; i < contentList.length; i++) // 모든 시설안내를
					{
						dto.setContent(contentList[i]); // 시설안내 set
						System.out.println("시설안내 : " + contentList[i]);
			
						iSpaReqDao.spaDelContent(spa_req_cd); // 기존 시설안내 delete
						iSpaReqDao.spaAddContent(dto); // 시설안내 insert 실행시키기
					}
				}
			} 
			  view = "redirect:spacedetail.action?spa_req_cd="+spa_req_cd;
			  return view; 
		  }
}
