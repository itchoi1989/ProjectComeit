package com.sys.comeit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ComeitController 
{
	   @RequestMapping(value = "/comeit.action", method = RequestMethod.GET)
	   public String ComeIt(Model model)
	   {
	      String view = null;
	      
	      view = "/WEB-INF/views/common/ComeIt.jsp";
	      
	      return view;
	   }
	   
	   @RequestMapping(value = "/mainpage.action", method = RequestMethod.GET)
	   public String MainPage(Model model)
	   {
	      String view = null;
	      
	      view = "/WEB-INF/views/common/MainPage.jsp";
	      
	      return view;
	   }

}
