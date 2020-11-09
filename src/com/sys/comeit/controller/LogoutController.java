package com.sys.comeit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LogoutController 
{
	   @RequestMapping(value = "/logout.action", method = RequestMethod.GET)
	   public String memberLogin(HttpServletRequest request)
	   {
		   HttpSession session = request.getSession(); 
	      String view = null;
	      session.invalidate();
	      view = "/mainpage.action";
	      
	      return view;
	   }

}
