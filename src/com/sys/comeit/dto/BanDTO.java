package com.sys.comeit.dto;

public class BanDTO
{
	private String lngg_ban_cd, admin_cd, ban, name, crt_date;

	private String searchKey, searchValue;	// 검색 키, 검색 단어
	private int start, end;			// 페이지 시작 / 끝
	
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

	public String getAdmin_cd()
	{
		return admin_cd;
	}

	public void setAdmin_cd(String admin_cd)
	{
		this.admin_cd = admin_cd;
	}

	public String getLngg_ban_cd()
	{
		return lngg_ban_cd;
	}

	public void setLngg_ban_cd(String lngg_ban_cd)
	{
		this.lngg_ban_cd = lngg_ban_cd;
	}

	public String getBan()
	{
		return ban;
	}

	public void setBan(String ban)
	{
		this.ban = ban;
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
}
