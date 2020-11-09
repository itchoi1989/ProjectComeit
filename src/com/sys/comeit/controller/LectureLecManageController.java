package com.sys.comeit.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sys.comeit.dto.MemberDTO;
import com.sys.comeit.idao.ILectureLecStudentDAO;
import com.sys.comeit.idao.IMemberDAO;

@Controller
public class LectureLecManageController
{
	@Autowired
	private SqlSession sqlSession;

	// 강의 공지사항 리스트 화면 노출하기
	@RequestMapping(value = "/lecturelecstudent.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String lectureLecStudent(Model model, HttpServletRequest request) throws UnsupportedEncodingException
	{
		String view = null;

		ILectureLecStudentDAO lectureLecStudentDao = sqlSession.getMapper(ILectureLecStudentDAO.class);
		
		String lec_cd = request.getParameter("lec_cd");
		
		ArrayList<MemberDTO> studentList = lectureLecStudentDao.getStudentInfo(lec_cd); 
		
		model.addAttribute("studentList", studentList);

		view = "WEB-INF/views/lecture/AjaxLectureLecStudent.jsp";

		return view;
	}
	
	@RequestMapping(value = "/stdntinfomodal.action", method =
		{ RequestMethod.GET, RequestMethod.POST })
		public String memInfoModal(Model model, HttpServletRequest request)
		{
			String view = null;

			IMemberDAO memberDao = sqlSession.getMapper(IMemberDAO.class);

			MemberDTO dto = new MemberDTO();

			// 수강생 정보 조회
			dto = memberDao.memModalList(request.getParameter("mem_cd"));
			System.out.println("안녕~");
			// 수강생 관심 태그 조회
			ArrayList<MemberDTO> intTagSearch = memberDao.memIntTagSearch(request.getParameter("mem_cd"));
			System.out.println("잘가~");
			model.addAttribute("modalDto", dto); // 회원 정보
			model.addAttribute("intTagSearch", intTagSearch); // 관심 키워드

			view = "/WEB-INF/views/lecture/AjaxStdntModal.jsp";

			return view;

		}
	
}
