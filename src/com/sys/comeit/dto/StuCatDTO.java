package com.sys.comeit.dto;

public class StuCatDTO
{
	private String stu_cat_cd, cat_name;	// 카테고리 코드, 카테고리명

	public String getStu_cat_cd()
	{
		return stu_cat_cd;
	}

	public void setStu_cat_cd(String stu_cat_cd)
	{
		this.stu_cat_cd = stu_cat_cd;
	}

	public String getCat_name()
	{
		return cat_name;
	}

	public void setCat_name(String cat_name)
	{
		this.cat_name = cat_name;
	}

}
