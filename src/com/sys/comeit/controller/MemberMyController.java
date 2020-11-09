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

import com.sys.comeit.dto.MemberDTO;
import com.sys.comeit.idao.IMemberDAO;

@Controller
public class MemberMyController
{
   @Autowired
   private SqlSession sqlSession;
   
   // 기혜
   // 회원 MyPage 요청 시 MyPage 보여주기
   @RequestMapping(value = "/membermy.action", method = {RequestMethod.GET, RequestMethod.POST})
   public String memberMy(Model model, HttpServletRequest request)
   {
      HttpSession session = request.getSession();
	  
      String view = null;
      IMemberDAO memberDao = sqlSession.getMapper(IMemberDAO.class);
      // 멤버의 회원 코드 받기
      String mem_cd = (String)session.getAttribute("mem_cd");
      
      // 멤버 정보 조회
      MemberDTO dto = memberDao.memModalList(mem_cd);
      
      // 멤버 관심 키워드 조회
      ArrayList<MemberDTO> intTag = memberDao.memIntTagSearch(mem_cd);
      
      // 패널티 개수 조회
      int pnltCnt = memberDao.pnltCount(mem_cd);
      
      if (dto != null) 
    	  model.addAttribute("memberInfo", dto);
      if (intTag != null) 
    	  model.addAttribute("memIntTag", intTag);
		
	  if (pnltCnt == 0) 
		  model.addAttribute("pnlt", "없음"); 
	  else
		  model.addAttribute("pnlt", "페널티 " + pnltCnt + "개");
	 
		  
	 
      view = "/WEB-INF/views/member/MemberMy.jsp";
      
      return view;
   }
   
   // 정보 수정 페이지 요청
   @RequestMapping(value = "/memberinfomod.action", method = {RequestMethod.GET, RequestMethod.POST})
   public String memberInfoMod(Model model)
   {
      String view = null;
      
      view = "/WEB-INF/views/member/MemberMyMod.jsp";
      
      return view;
   }
     
   
}
