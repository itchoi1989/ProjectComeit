package com.sys.comeit.dto;

public class AdminDTO
{
	private String admin_cd, adm_grds_cd, name, pwd, email, tel, grds_name;

	public String getAdmin_cd()
	{
		return admin_cd;
	}

	public String getGrds_name() {
		return grds_name;
	}

	public void setGrds_name(String grds_name) {
		this.grds_name = grds_name;
	}

	public void setAdmin_cd(String admin_cd)
	{
		this.admin_cd = admin_cd;
	}

	public String getAdm_grds_cd()
	{
		return adm_grds_cd;
	}

	public void setAdm_grds_cd(String adm_grds_cd)
	{
		this.adm_grds_cd = adm_grds_cd;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getPwd()
	{
		return pwd;
	}

	public void setPwd(String pwd)
	{
		this.pwd = pwd;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}
	
	
}
