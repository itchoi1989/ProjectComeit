/*===========================
	JoinController.java
	- 회원가입 컨트롤러
===========================*/

package com.sys.comeit.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import com.sys.comeit.dto.*;
import com.sys.comeit.idao.*;

@Controller
public class JoinController
{
	@Autowired
	private SqlSession sqlSession;

	// 회원가입 처리. 회원가입 프로시저 호출
	@RequestMapping(value = "/memberinsert.action", method = RequestMethod.POST)
	public String memberInsert(Model model, HttpServletRequest request)
	{
		String view = null;

		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);

		// 필수항목
		String id = request.getParameter("id"); // 아이디
		String name = request.getParameter("name"); // 이름
		String email = request.getParameter("email"); // 이메일
		String tel = request.getParameter("phoneNumber"); // 휴대폰번호
		String pwd = request.getParameter("password"); // 비밀번호
		String idntt_cd = request.getParameter("week"); // 신분코드

		String img_url = request.getParameter("okFile"); // 프로필 이미지
		// 프로필 이미지가 없다면 null 처리
		if (img_url == "") 
		{
			img_url = null;
		}
		
		String mem_content = request.getParameter("intro"); // 본인소개
		// 본인소개가 없다면 null 처리
		if (mem_content == "") 
		{
			mem_content = null;
		}
		String spc_area_cd = request.getParameter("spcArea"); // 세부지역 코드

		System.out.println("파라미터 값");
		System.out.println(id);
		System.out.println(name);
		System.out.println(email);
		System.out.println(tel);
		System.out.println(pwd);
		System.out.println(idntt_cd);
		System.out.println(img_url);
		System.out.println(mem_content);
		System.out.println(spc_area_cd);
		System.out.println("파라미터 끝");

		MemberDTO dto = new MemberDTO();

		dto.setId(id);
		dto.setName(name);
		dto.setEmail(email);
		dto.setTel(tel);
		dto.setPwd(pwd);
		dto.setIdntt_cd(idntt_cd);
		dto.setImg_url(img_url);
		dto.setMem_content(mem_content);
		dto.setSpc_area_cd(spc_area_cd);

		// 실제 회원가입 프로시저 호출
		dao.memberAdd(dto);

		String mem_cd = dto.getMem_cd(); // OUT 변수인 PK를 담기

		System.out.println(mem_cd);

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
		
		
		if (mem_cd != null) // 회원 발급 코드 PK 가 NULL 이 아닐경우
		{
			if (intTagList.length > 0)
			{
				for (int i = 0; i < intTagList.length; i++) // 선택한 모든 관심 키워드 중에
				{
					dto.setInt_tag(intTagList[i]); // 자바를 키워드에 세팅하고

					System.out.println("각 관심 : " + intTagList[i]);

					dao.memIntTagInsert(dto); // 회원관심 키워드 insert 실행시키기
				}
			}
			if (etcTagList.length > 0)
			{
				for (int i = 0; i < etcTagList.length; i++) // 선택한 모든 관심 기타 키워드 중에
				{
					// value에 따른 코드 뽑아내는 dao 호출

					dto.setEtc_tag(etcTagList[i]); // 기타태그를 키워드에 세팅하고
					System.out.println("각 기타 : " + etcTagList[i]);

					dao.memEtcTagInsert(dto); // 기타 키워드 insert 실행시키기

					int etcTagCount = dao.etcTagCount(etcTagList[i]);

					if (etcTagCount == 10) // 회원 관심 기타 키워드 테이블 호출해서 10개일 경우
						dao.addTagName(etcTagList[i]); // 그냥 관심키워드 테이블에 insert 시키기

				}
			}

			view = "redirect:memberlogin.action"; // 회원가입 성공 시 로그인 페이지
		} else
		{
			view = "redirect:memberjoin.action"; // 회원가입 실패 시 회원가입 페이지 유지

		}

		view = "redirect:memberlogin.action";

		return view;

	}

	// 회원가입 FORM에서 신분, 지역, 세부지역, 관심키워드 리스트 던져주기
	@RequestMapping(value = "/memberjoin.action", method = RequestMethod.GET)
	public String memberJoin(Model model)
	{
		String view = null;

		IIdnttDAO idnttDao = sqlSession.getMapper(IIdnttDAO.class);
		IAreaDAO areaDao = sqlSession.getMapper(IAreaDAO.class);
		/* ISpcAreaDAO spcAreaDao = sqlSession.getMapper(ISpcAreaDAO.class); */
		IIntTagDAO intTagDao = sqlSession.getMapper(IIntTagDAO.class);

		model.addAttribute("idntt", idnttDao.idnttList());
		model.addAttribute("area", areaDao.areaList());
		/* model.addAttribute("spcArea", spcAreaDao.spcAreaList()); */
		model.addAttribute("intTag", intTagDao.intTagList());

		view = "WEB-INF/views/member/MemberJoin.jsp";

		return view;
	}


	// MemberJoin.jsp의 #dupBtn 클릭 시 아이디 중복 확인하는 AJAX 처리
	@ResponseBody
	@RequestMapping(value = "/checkidajax.action", method = RequestMethod.POST)
	public String checkidAjax(HttpServletRequest request)
	{

		IMemberDAO memberDao = sqlSession.getMapper(IMemberDAO.class);

		int result = memberDao.memcheckCount(request.getParameter("id"));

		return String.valueOf(result);

	}

	// 회원 전화번호 중복 AJAX 처리
	@ResponseBody
	@RequestMapping(value = "/checkphonenumberdajax.action", method = RequestMethod.POST)
	public String checkTelAjax(HttpServletRequest request)
	{
		IMemberDAO memberDao = sqlSession.getMapper(IMemberDAO.class);

		String tel = request.getParameter("phoneNumber");

		int result = memberDao.memTelcheckCount(tel);

		return String.valueOf(result);
	}

	// 일반 회원 가입 끝
	// --------------------------------------------------------------------------------------------------------

	// 업체 회원 가입 시작
	// ------------------------------------------------------------------------------------------------------

	// 업체 회원가입 form 던져주기
	@RequestMapping(value = "/spacejoin.action", method = RequestMethod.GET)
	public String spaJoin(Model model)
	{
		String view = null;

		view = "WEB-INF/views/space/SpaceJoin.jsp";

		return view;
	}

	// 업체 아이디가 맞는지 확인해주고 알려주는 AJAX 처리
	@ResponseBody
	@RequestMapping(value = "/checkspaidajax.action", method = RequestMethod.POST)
	public String checkSpaIdAjax(HttpServletRequest request, Model model)
	{

		ISpaDAO spaDao = sqlSession.getMapper(ISpaDAO.class);

		String id = request.getParameter("id");
		System.out.println(id);

		int result = spaDao.spaCheckCount(request.getParameter("id"));
		System.out.println(result);

		return String.valueOf(result);

	}

	// 업체 회원가입 처리. 회원가입 프로시저 호출
	@RequestMapping(value = "/spaceinsert.action", method = RequestMethod.POST)
	public String spaceInsert(Model model, HttpServletRequest request)
	{
		String view = null;

		ISpaDAO spaDao = sqlSession.getMapper(ISpaDAO.class);

		// 필수항목
		String id = request.getParameter("id"); // 아이디
		String name = request.getParameter("name"); // 이름
		String email = request.getParameter("email"); // 이메일
		String tel = request.getParameter("phoneNumber"); // 휴대폰번호
		String pwd = request.getParameter("password"); // 비밀번호

		SpaDTO dto = new SpaDTO();

		dto.setSpa_id(id);
		dto.setName(name);
		dto.setEmail(email);
		dto.setTel(tel);
		dto.setPwd(pwd);

		// 실제 회원가입 프로시저 호출
		spaDao.spaAdd(dto);

		String spa_cd = dto.getSpa_cd(); // OUT 변수인 PK를 담기

		System.out.println(spa_cd);

		if (spa_cd != null) // 회원 발급 코드 PK 가 NULL 이 아닐경우
			view = "redirect:memberlogin.action"; // 회원가입 성공 시 로그인 페이지
		else
			view = "redirect:spacejoin.action";
		
		
		view = "redirect:memberlogin.action";

		return view;

	}

	// 업체 전화번호 중복 ajax 처리
	@ResponseBody
	@RequestMapping(value = "/checkpwdspaajax.action", method = RequestMethod.POST)
	public String checkPwdSpaAjax(HttpServletRequest request, Model model)
	{

		// String view = null;

		ISpaDAO spaDao = sqlSession.getMapper(ISpaDAO.class);

		String tel = request.getParameter("phoneNumber");

		int result = spaDao.spaTelcheckCount(tel);

		return String.valueOf(result);
	}

	@RequestMapping(value = "/ajaximg.action", method = RequestMethod.POST)
	public String ajaximg()
	{
		String view = null;

		view = "WEB-INF/views/member/AjaxProImg.jsp";

		return view;
	}

}
