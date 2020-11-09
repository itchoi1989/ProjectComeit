package com.sys.comeit.dto;

public class AdmSpaReqDTO
{
	private String spa_req_cd, spa_name, spa_id, com_name, check_type_cd
	, req_date, type, prcs_date, adm_name, admin_cd;
	
	private String spa_cd, email, tel, dtl_addr, join_date, name, prcs_rsn;
	
	private String one_intro, use_hrs, rsv_notes, dtl_intro;

	public String getOne_intro()
	{
		return one_intro;
	}

	public void setOne_intro(String one_intro)
	{
		this.one_intro = one_intro;
	}

	public String getUse_hrs()
	{
		return use_hrs;
	}

	public void setUse_hrs(String use_hrs)
	{
		this.use_hrs = use_hrs;
	}

	public String getRsv_notes()
	{
		return rsv_notes;
	}

	public void setRsv_notes(String rsv_notes)
	{
		this.rsv_notes = rsv_notes;
	}

	public String getDtl_intro()
	{
		return dtl_intro;
	}

	public void setDtl_intro(String dtl_intro)
	{
		this.dtl_intro = dtl_intro;
	}

	private String searchKey, searchValue;	// 검색 키, 검색 단어
	private int start, end;			// 페이지 시작 / 끝
	
	public String getPrcs_rsn()
	{
		return prcs_rsn;
	}

	public void setPrcs_rsn(String prcs_rsn)
	{
		this.prcs_rsn = prcs_rsn;
	}
	
	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}
	
	public String getSearchKey()
	{
		return searchKey;
	}

	public String getSpa_cd()
	{
		return spa_cd;
	}

	public void setSpa_cd(String spa_cd)
	{
		this.spa_cd = spa_cd;
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

	public String getDtl_addr()
	{
		return dtl_addr;
	}

	public void setDtl_addr(String dtl_addr)
	{
		this.dtl_addr = dtl_addr;
	}

	public String getJoin_date()
	{
		return join_date;
	}

	public void setJoin_date(String join_date)
	{
		this.join_date = join_date;
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

	public String getCheck_type_cd()
	{
		return check_type_cd;
	}

	public void setCheck_type_cd(String check_type_cd)
	{
		this.check_type_cd = check_type_cd;
	}

	public String getSpa_req_cd()
	{
		return spa_req_cd;
	}

	public void setSpa_req_cd(String spa_req_cd)
	{
		this.spa_req_cd = spa_req_cd;
	}

	public String getSpa_name()
	{
		return spa_name;
	}

	public void setSpa_name(String spa_name)
	{
		this.spa_name = spa_name;
	}

	public String getSpa_id()
	{
		return spa_id;
	}

	public void setSpa_id(String spa_id)
	{
		this.spa_id = spa_id;
	}

	public String getCom_name()
	{
		return com_name;
	}

	public void setCom_name(String com_name)
	{
		this.com_name = com_name;
	}

	public String getReq_date()
	{
		return req_date;
	}

	public void setReq_date(String req_date)
	{
		this.req_date = req_date;
	}

	public String getType()
	{
		return type;
	}

	public void setType(String type)
	{
		this.type = type;
	}

	public String getPrcs_date()
	{
		return prcs_date;
	}

	public void setPrcs_date(String prcs_date)
	{
		this.prcs_date = prcs_date;
	}

	public String getAdm_name()
	{
		return adm_name;
	}

	public void setAdm_name(String adm_name)
	{
		this.adm_name = adm_name;
	}
	
	
	
}
