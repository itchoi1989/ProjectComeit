package com.sys.comeit.dto;

public class LectureNoticeDTO
{
	// 게시글번호, 게시글제목, 작성자명, 작성일, 공지사항 번호, 강의코드, 내용, 작성자 회원코드
	String row_num, title, name, crt_date, lec_ntc_cd, lec_cd, content, mem_cd, del_date;
	
	// 검색 키, 검색 단어
	String searchKey, searchValue;
	
	// 페이지 시작 / 끝
	int start, end;
	
	// 조회수
	String hits;
	
	public String getDel_date()
	{
		return del_date;
	}
	public void setDel_date(String del_date)
	{
		this.del_date = del_date;
	}
	
	public String getSearchKey()
	{
		return searchKey;
	}
	public void setSearchKey(String searchKey)
	{
		this.searchKey = searchKey;
	}
	public String getSearchValue()
	{
		return searchValue;
	}
	public void setSearchValue(String searchValue)
	{
		this.searchValue = searchValue;
	}
	public int getStart()
	{
		return start;
	}
	public void setStart(int start)
	{
		this.start = start;
	}
	public int getEnd()
	{
		return end;
	}
	public void setEnd(int end)
	{
		this.end = end;
	}
	public String getMem_cd()
	{
		return mem_cd;
	}
	public void setMem_cd(String mem_cd)
	{
		this.mem_cd = mem_cd;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	
	public String getLec_cd()
	{
		return lec_cd;
	}
	public void setLec_cd(String lec_cd)
	{
		this.lec_cd = lec_cd;
	}
	public String getLec_ntc_cd()
	{
		return lec_ntc_cd;
	}
	public void setLec_ntc_cd(String lec_ntc_cd)
	{
		this.lec_ntc_cd = lec_ntc_cd;
	}
	public String getRow_num()
	{
		return row_num;
	}
	public void setRow_num(String row_num)
	{
		this.row_num = row_num;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getCrt_date()
	{
		return crt_date;
	}
	public void setCrt_date(String crt_date)
	{
		this.crt_date = crt_date;
	}
	public String getHits()
	{
		return hits;
	}
	public void setHits(String hits)
	{
		this.hits = hits;
	}
	
}
