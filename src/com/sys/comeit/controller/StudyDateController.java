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
public class StudyDateController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 스터디방 모임장소 리스트 요청
	@RequestMapping(value = "/studydatelist.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String studyFileList(Model model, HttpServletRequest request) throws UnsupportedEncodingException
	{
		String view = null;
		
		
		
		return view;
	}


}
