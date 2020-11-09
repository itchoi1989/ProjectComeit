package com.sys.comeit.util;

public class MyUtil
{

	// *******************************************************************************
	// 전체페이지수 구하기
	/*
	 * param : numPerPage : 한페이지에 표시할 데이터의 개수 dataCount : 전체데이터수
	 */
	public int getPageCount(int numPerPage, int dataCount)
	{
		int pageCount = 0;

		pageCount = dataCount / numPerPage;
		if (dataCount % numPerPage != 0)
			pageCount++;

		// System.out.println("MyUtil.getPageCount.pageCount : " + pageCount);

		return pageCount;
	}

	// 페이지 처리 메소드(GET 방식)
	/*
	 * param: current_page : 현재 표시할 페이지 total_page : 전체페이지수 list_url : 링크를 설정할 url
	 */

	public String pageIndexList(int current_page, int total_page, String list_url)
	{
		if (current_page < 1 || total_page < 1)
			return "";

		StringBuffer sb = new StringBuffer();
		int numPerBlock = 10;
		int currentPageSetup;
		int n, page;

		if (list_url.indexOf("?") != -1)
			list_url = list_url + "&";
		else
			list_url = list_url + "?";

		// currentPageSetup : 표시할첫페이지-1
		currentPageSetup = (current_page / numPerBlock) * numPerBlock;
		if (current_page % numPerBlock == 0)
			currentPageSetup = currentPageSetup - numPerBlock;

		// 1 페이지, [Prev]:10 페이지를 이전페이지로 이동
		n = current_page - numPerBlock;
		
		sb.append("<ul class=\"pagination\">");
		if (total_page > numPerBlock && currentPageSetup > 0)
		{
			sb.append("<li class=\"page-item\"><a href='" + list_url + "pageNum=1'>1</a></li>");
			sb.append("<li class=\"page-item\"><a href='" + list_url + "pageNum=" + n + "'>Prev</a></li>");
		}

		// 바로가기 페이지
		page = currentPageSetup + 1;
		while (page <= total_page && (page <= currentPageSetup + numPerBlock))
		{
			if (page == current_page)
			{
				sb.append("<li class=\"page-item\"><a class='page-link' style='text-decoration: underline; font-weight: bold;'>" + page + "</a></li>");
			} else
			{
				sb.append("<li class=\"page-item\"><a href='" + list_url + "pageNum=" + page + "' class='page-link'>" + page + "</a></li>");
			}
			page++;
		}

		// [Next]:10페이지를 다음페이지로 이동, 마지막 페이지
		n = current_page + numPerBlock;
		if (total_page - currentPageSetup > numPerBlock)
		{
			sb.append("<li class=\"page-item\"><a href='" + list_url + "pageNum=" + n + "'>Next</a></li>");
			sb.append("<li class=\"page-item\"><a href='" + list_url + "pageNum=" + total_page + "'>" + total_page + "</a></li>");
		}
		sb.append("</ul>");
		return sb.toString();
	}
}
