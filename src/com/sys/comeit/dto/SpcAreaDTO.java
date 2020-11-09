package com.sys.comeit.dto;

public class SpcAreaDTO
{
	private String spc_area_cd, area_cd, spc_area_name;		// 세부지역코드, 지역코드, 세부지역명

	public String getSpc_area_cd()
	{
		return spc_area_cd;
	}

	public void setSpc_area_cd(String spc_area_cd)
	{
		this.spc_area_cd = spc_area_cd;
	}

	public String getArea_cd()
	{
		return area_cd;
	}

	public void setArea_cd(String area_cd)
	{
		this.area_cd = area_cd;
	}

	public String getSpc_area_name()
	{
		return spc_area_name;
	}

	public void setSpc_area_name(String spc_area_name)
	{
		this.spc_area_name = spc_area_name;
	}
}
