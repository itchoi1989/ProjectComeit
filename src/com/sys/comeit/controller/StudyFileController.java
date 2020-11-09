package com.sys.comeit.controller;

import java.io.UnsupportedEncodingException;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sys.comeit.util.MyUtil;
import com.sys.comeit.dto.*;
import com.sys.comeit.idao.*;

@Controller
public class StudyFileController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 스터디방 별 산출물 게시물 리스트
	@RequestMapping(value = "/studyfilelist.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String studyFileList(Model model, HttpServletRequest request) throws UnsupportedEncodingException
	{
		String view = null;
		
		IStudyFileDAO fileDao = sqlSession.getMapper(IStudyFileDAO.class);
		
		String stu_cd = request.getParameter("stu_cd");
		
		//ArrayList<StudyFileDTO> studyFileList = fileDao.studyFileList(stu_cd);
		
		//model.addAttribute("studyFileList", studyFileList);
		
		// 페이징 처리 ----------------
		
		MyUtil util = new MyUtil();
		
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		if (pageNum != null && pageNum.length() != 0)
			currentPage = Integer.parseInt(pageNum);

		String searchKey = null;
		String searchValue = null;
		
		searchKey = request.getParameter("searchKey");
		searchValue = request.getParameter("searchValue");
		
		if (searchKey == null)
		{
			searchKey = "title";
			searchValue = "";
		}
		
		if (request.getMethod().equals("GET"))
		{
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		StudyFileDTO pagingDto = new StudyFileDTO();
		
		pagingDto.setFile_stu_cd(stu_cd);
		pagingDto.setSearchKey(searchKey);
		pagingDto.setSearchValue(searchValue);
		
		// 전체 데이터 개수
		int dataCount = fileDao.searchFileCount(pagingDto);
		
		// 전체 페이지 수 구하기
		int numPerPage = 5;
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
		ArrayList<StudyFileDTO> studyFileList = fileDao.getFileListData(pagingDto);
		
		String params = "";
		if (searchValue != null && searchValue.length() != 0)
		{
			searchValue = URLEncoder.encode(searchKey, "UTF-8");
			params = "searchKey=" + searchKey + "&searchValue=" + searchValue;
		}
		
		String cp = request.getContextPath();

		// 페이징 처리
		String listUrl = cp + "/studylist.action";
		if (params.length() != 0)
			listUrl += "?" + params;
		
		String pageIndexList = util.pageIndexList(currentPage, totalPage, listUrl);
		
		// 포워딩 할 데이터 넘겨주기
		request.setAttribute("studyFileList", studyFileList);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		
		// 테스트
		//System.out.println(stu_cd);
		System.out.println("산출물start : " + start);
		System.out.println("산출물end : " + end);
		
		view = "WEB-INF/views/study/AjaxStudyFileList.jsp";
		
		return view;
	}
	
	// 스터디방 산출물 상세 
	@RequestMapping(value = "/studyfiledetail.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String studyFileDetail(Model model, HttpServletRequest request)
	{
		String view = null;
		
		IStudyFileDAO fileDao = sqlSession.getMapper(IStudyFileDAO.class);
		
		String stu_cd = request.getParameter("stu_cd");
		String oput_cd = request.getParameter("oput_cd");
		
		//System.out.println("파일코드"+oput_cd);
		
		StudyFileDTO dto = new StudyFileDTO();
		dto.setFile_stu_cd(stu_cd);
		dto.setFile_oput_cd(oput_cd);
		
		// 산출물 게시판 조회
		StudyFileDTO detail = fileDao.studyFileDetail(dto);
		if (detail != null)
			model.addAttribute("detail", detail);
		
		// 테스트
		//System.out.println(detail.getFile_title());
		
		// 첨부파일 조회
		StudyFileDTO file = fileDao.fileUrlSearch(dto);
		
		if (file != null)
			model.addAttribute("file", file);
		else
			model.addAttribute("file", "없음");
		
		view = "WEB-INF/views/study/AjaxStudyFileDetail.jsp";
		
		return view;
	}
	
	
	// 스터디방 산출물 등록페이지 요청
	@RequestMapping(value = "/studyfileadd.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String studyFileAdd(Model model, HttpServletRequest request)
	{
		String view = null;
		String stu_cd = request.getParameter("stu_cd");

		// 오늘 날짜 구하기
		Date sysdate = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		String today = date.format(sysdate);

		model.addAttribute("today", today);
		model.addAttribute("stu_cd", stu_cd);

		view = "WEB-INF/views/study/StudyFileAdd.jsp";

		return view;
	}
	
	// 스터디방 산출물 등록
	@RequestMapping(value = "/studyfileinsert.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String studyFileInsert(HttpServletRequest request, Model model)
	{
		String view = null;
		HttpSession session = request.getSession();
		IStudyFileDAO fileDao = sqlSession.getMapper(IStudyFileDAO.class);
		
		
		String stu_cd = request.getParameter("stu_cd");						// 스터디방 코드
		String mem_cd = (String)session.getAttribute("mem_cd");				// 회원코드
		String file_title = request.getParameter("file_title");				// 게시물 제목
		String file_content = request.getParameter("file_content");			// 게시물 내용
		String file_name = "파일";
		String file_url = request.getParameter("file_check"); 
		
		System.out.println("파일 :" + stu_cd);
		System.out.println(mem_cd);
		System.out.println(file_title);
		System.out.println(file_content);
		System.out.println(file_name);
		System.out.println(file_url + "파일끝");
		
		// 제목이 없다면 '제목 없음' 처리
		if (file_title == "") 
			file_title = "제목 없음";
		
		//  내용이 없다면 null 처리
		if (file_content == "") 
			file_content = "내용 없음";
		
		// 첨부파일이 없다면 null 처리
		if (file_url == "") 
			file_url = null;
		
		// 스터디방 참가코드 조회
		StudyFileDTO dto = new StudyFileDTO();
		dto.setFile_mem_cd(mem_cd);
		dto.setFile_stu_cd(stu_cd);
		
		String file_stu_join_cd = fileDao.fileStuJoinCd(dto);
		//System.out.println("파일 스터디 참가 코드 : "+ file_stu_join_cd);
		
		// 파일 등록하기
		if (file_url != null) {
			StudyFileDTO fileDto = new StudyFileDTO();
			fileDto.setFile_stu_join_cd(file_stu_join_cd);
			fileDto.setFile_title(file_title);
			fileDto.setFile_content(file_content);
			fileDto.setFile_name(file_name);
			fileDto.setFile_url(file_url);
			
			// 등록 프로시저 실행
			fileDao.fileAdd(fileDto); 
		}
		else
		{
			StudyFileDTO fileDto = new StudyFileDTO();
			fileDto.setFile_stu_join_cd(file_stu_join_cd);
			fileDto.setFile_title(file_title);
			fileDto.setFile_content(file_content);
			
			fileDao.fileboardAdd(fileDto);
		}
		
		model.addAttribute("stu_cd", stu_cd);
		view = "redirect:studydetail.action";
		
		return view;
	}
	
	// 첨부파일 등록
	@RequestMapping(value = "/ajaxfileadd.action", method = RequestMethod.POST)
	public String ajaxFileAdd()
	{
		String view = null;
		 /*
	      ServletContext file;
	      
	      String root = file.getServletContext().getRealPath("/");
	      //System.out.println(root);
	      String savePath = root + "pds\\saveData";
	      //System.out.println(savePath);
	      
	      File dir = new File(savePath);
	      //System.out.println(dir);
	      
	      if(!dir.exists())
	         dir.mkdirs();
	      
	      String encType = "UTF-8";
	      int maxSize = 5*1024*1024;
	      
	      MultipartRequest multi = null;
	      Enumeration files = null;
	      
	      try
	      {
	         multi = new MultipartRequest(request, savePath, maxSize, encType, new DefaultFileRenamePolicy());
	         
	         // check~!!!
	         // MultipartRequest 객체의 『getFileName()』
	         // → 요청으로 넘어온 파일들의 이름을 Enumeration 타입으로 반환
	         
	         files = multi.getFileNames();
	         while(files.hasMoreElements())
	         {
	            String name = (String)files.nextElement();
	            System.out.println(name);
	            if(multi.getFilesystemName(name) != null)
	            {

	               File file = multi.getFile(name);
	               System.out.println(file);
	               
	               if(file != null)
	                  System.out.println(file);
	            }
	         }
	         
	         //urlFile = "Download.jsp?saveFileName=" + multi.getFilesystemName("uploadFile");
	         //urlFile += "&originalFileName=" + multi.getOriginalFileName("uploadFile");
	      }
	      catch(IOException e1)
	      {
	         System.out.println(e1.toString());
	      }
	      catch(Exception e2)
	      {
	         System.out.println(e2.toString());
	      }

	      return files;
	       */

		view = "WEB-INF/views/member/AjaxStuFile.jsp";

		return view;
	}

}
