package com.sys.comeit.dto;

public class LectureDTO
{
	private String lec_cd, prof_cd, spc_area_cd, lec_term_cd, area_name, spc_area_name
	, lec_name, name, crt_date, str_date, lec_intro , min_mem
	, max_mem, int_tag_cd, etc_tag, str_hrs, end_hrs, day_cd
	, lec_term, img_url, end_date, lec_fee;
	
	private String int_tag_name, etc_tag_name, int_lec_cd;	// 관심 키워드 태그, 기타 관심 키워드 태그
	private String int_tag, day_name;
	
	public String getDay_name()
	{
		return day_name;
	}
	public String getLec_fee()
	{
		return lec_fee;
	}
	public void setLec_fee(String lec_fee)
	{
		this.lec_fee = lec_fee;
	}
	public void setDay_name(String day_name)
	{
		this.day_name = day_name;
	}
	public String getInt_tag()
	{
		return int_tag;
	}
	public void setInt_tag(String int_tag)
	{
		this.int_tag = int_tag;
	}
	public String getInt_tag_name()
	{
		return int_tag_name;
	}
	public void setInt_tag_name(String int_tag_name)
	{
		this.int_tag_name = int_tag_name;
	}
	public String getEtc_tag_name()
	{
		return etc_tag_name;
	}
	public void setEtc_tag_name(String etc_tag_name)
	{
		this.etc_tag_name = etc_tag_name;
	}
	public String getInt_lec_cd()
	{
		return int_lec_cd;
	}
	public void setInt_lec_cd(String int_lec_cd)
	{
		this.int_lec_cd = int_lec_cd;
	}
	
	private String id;					// 로그인 회원 아이디
	
	private String lec_count;			// 참가중인 스터디 개수
	
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getLec_count()
	{
		return lec_count;
	}
	public void setLec_count(String lec_count)
	{
		this.lec_count = lec_count;
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

	private String searchKey, searchValue;	// 검색 키, 검색 단어
	private int start, end;			// 페이지 시작 / 끝
	
	public String getArea_name()
	{
		return area_name;
	}
	public void setArea_name(String area_name)
	{
		this.area_name = area_name;
	}
	public String getSpc_area_name()
	{
		return spc_area_name;
	}
	public void setSpc_area_name(String spc_area_name)
	{
		this.spc_area_name = spc_area_name;
	}
	public String getDay_cd()
	{
		return day_cd;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getLec_term()
	{
		return lec_term;
	}
	public void setLec_term(String lec_term)
	{
		this.lec_term = lec_term;
	}
	public String getImg_url()
	{
		return img_url;
	}
	public void setImg_url(String img_url)
	{
		this.img_url = img_url;
	}
	public String getEnd_date()
	{
		return end_date;
	}
	public void setEnd_date(String end_date)
	{
		this.end_date = end_date;
	}
	public void setDay_cd(String day_cd)
	{
		this.day_cd = day_cd;
	}
	public String getStr_hrs()
	{
		return str_hrs;
	}
	public void setStr_hrs(String str_hrs)
	{
		this.str_hrs = str_hrs;
	}
	public String getEnd_hrs()
	{
		return end_hrs;
	}
	public void setEnd_hrs(String end_hrs)
	{
		this.end_hrs = end_hrs;
	}
	public String getInt_tag_cd()
	{
		return int_tag_cd;
	}
	public void setInt_tag_cd(String int_tag_cd)
	{
		this.int_tag_cd = int_tag_cd;
	}
	public String getEtc_tag()
	{
		return etc_tag;
	}
	public void setEtc_tag(String etc_tag)
	{
		this.etc_tag = etc_tag;
	}
	
	public String getLec_cd()
	{
		return lec_cd;
	}
	public void setLec_cd(String lec_cd)
	{
		this.lec_cd = lec_cd;
	}
	public String getProf_cd()
	{
		return prof_cd;
	}
	public void setProf_cd(String prof_cd)
	{
		this.prof_cd = prof_cd;
	}
	public String getSpc_area_cd()
	{
		return spc_area_cd;
	}
	public void setSpc_area_cd(String spc_area_cd)
	{
		this.spc_area_cd = spc_area_cd;
	}
	public String getLec_term_cd()
	{
		return lec_term_cd;
	}
	public void setLec_term_cd(String lec_term_cd)
	{
		this.lec_term_cd = lec_term_cd;
	}
	public String getLec_name()
	{
		return lec_name;
	}
	public void setLec_name(String lec_name)
	{
		this.lec_name = lec_name;
	}
	public String getCrt_date()
	{
		return crt_date;
	}
	public void setCrt_date(String crt_date)
	{
		this.crt_date = crt_date;
	}
	public String getStr_date()
	{
		return str_date;
	}
	public void setStr_date(String str_date)
	{
		this.str_date = str_date;
	}
	public String getLec_intro()
	{
		return lec_intro;
	}
	public void setLec_intro(String lec_intro)
	{
		this.lec_intro = lec_intro;
	}
	public String getMin_mem()
	{
		return min_mem;
	}
	public void setMin_mem(String min_mem)
	{
		this.min_mem = min_mem;
	}
	public String getMax_mem()
	{
		return max_mem;
	}
	public void setMax_mem(String max_mem)
	{
		this.max_mem = max_mem;
	}
	
}
