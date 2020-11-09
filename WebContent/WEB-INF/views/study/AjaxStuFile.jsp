<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	
	String root = pageContext.getServletContext().getRealPath("/");
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
	String urlFile = "";
	
	try
	{
		multi = new MultipartRequest(request, savePath, maxSize, encType, new DefaultFileRenamePolicy());
		
		// check~!!!
		// MultipartRequest 객체의 『getFileName()』
		// → 요청으로 넘어온 파일들의 이름을 Enumeration 타입으로 반환
		Enumeration files = multi.getFileNames();
		while(files.hasMoreElements())
		{
			String name = (String)files.nextElement();
			System.out.println(name);
			if(multi.getFilesystemName(name) != null)
			{

				File file = multi.getFile(name);
				System.out.println(file);
				
				if(file != null)
					out.println(file);
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
	

%>
