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
	
	try
	{
		multi = new MultipartRequest(request, savePath, maxSize, encType, new DefaultFileRenamePolicy());
		
		//out.println("업로드된 파일 : <br>");
		
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
				//out.println("서버에 저장된 파일명 : "+multi.getFilesystemName(name));
				//out.println(", 업로드한 파일명 : "+multi.getOriginalFileName(name));
				
				File file = multi.getFile(name);
				System.out.println(file);
				
				if(file != null)
				{
					out.println(file);
					//out.println(", 업로드된 파일 크기 : "+file.length()+"Bytes.");
					//out.println("<br>");
				}
			}
		}
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
