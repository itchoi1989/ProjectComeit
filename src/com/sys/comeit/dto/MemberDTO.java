package com.sys.comeit.dto;


public class MemberDTO
{
	private String id, mem_cd, idntt, name, email, tel , join_date;	// 아이디, 멤버코드, 신분, 이름, 이메일, 전화번호, 가입일
	private String mem_content;										// 본인소개
	private String area_name, spc_area_name;						// 지역명, 세부지역명
	private String int_tag, etc_tag;								// 관심키워드, 기타관심키워드
	private String img_url;											// 회원 이미지 url
	private String pwd;												// 비밀번호
	
	
	
	// 기혜 추가 
	private int sincerity, embrace, communication, skill, leadership; // 스터디 평가 내역
	private int pnlt_cnt;											  // 패널티 받은 내역
	private String join_stu_title;
	
	

	public String getJoin_stu_title() {
		return join_stu_title;
	}

	public void setJoin_stu_title(String join_stu_title) {
		this.join_stu_title = join_stu_title;
	}

	public void setPnlt_cnt(int pnlt_cnt)
	{
		this.pnlt_cnt = pnlt_cnt;
	}

	// 수진 추가
	private String idntt_cd, spc_area_cd;		// 신분코드, 세부지역코드  
	
	
	// getter / setter 구성


	public String getIdntt_cd()
	{
		return idntt_cd;
	}

	public String getJoin_date()
	{
		return join_date;
	}

	public void setJoin_date(String join_date)
	{
		this.join_date = join_date;
	}

	public String getInt_tag()
	{
		return int_tag;
	}

	public void setInt_tag(String int_tag)
	{
		this.int_tag = int_tag;
	}

	public String getEtc_tag()
	{
		return etc_tag;
	}

	public void setEtc_tag(String etc_tag)
	{
		this.etc_tag = etc_tag;
	}

	public void setIdntt_cd(String idntt_cd)
	{
		this.idntt_cd = idntt_cd;
	}

	public String getSpc_area_cd()
	{
		return spc_area_cd;
	}

	public void setSpc_area_cd(String spc_area_cd)
	{
		this.spc_area_cd = spc_area_cd;
	}

	public String getId() 
	{
		return id;
	}
	
	public void setId(String id) 
	{
		this.id = id;
	}
	
	public String getMem_cd() 
	{
		return mem_cd;
	}
	
	public void setMem_cd(String mem_cd) 
	{
		this.mem_cd = mem_cd;
	}
	
	public String getIdntt() 
	{
		return idntt;
	}
	
	public void setIdntt(String idntt) 
	{
		this.idntt = idntt;
	}
	
	public String getName() 
	{
		return name;
	}
	
	public void setName(String name) 
	{
		this.name = name;
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
	
	public String getMem_content() 
	{
		return mem_content;
	}
	
	public void setMem_content(String mem_content) 
	{
		this.mem_content = mem_content;
	}
	
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
	
	public String getImg_url() 
	{
		return img_url;
	}
	
	public void setImg_url(String img_url) 
	{
		this.img_url = img_url;
	}
	
	public String getPwd() 
	{
		return pwd;
	}
	
	public void setPwd(String pwd) 
	{
		this.pwd = pwd;
	}
	public int getSincerity()
	{
		return sincerity;
	}

	public void setSincerity(int sincerity)
	{
		this.sincerity = sincerity;
	}

	public int getEmbrace()
	{
		return embrace;
	}

	public void setEmbrace(int embrace)
	{
		this.embrace = embrace;
	}

	public int getCommunication()
	{
		return communication;
	}

	public void setCommunication(int communication)
	{
		this.communication = communication;
	}

	public int getSkill()
	{
		return skill;
	}

	public void setSkill(int skill)
	{
		this.skill = skill;
	}

	public int getLeadership()
	{
		return leadership;
	}

	public void setLeadership(int leadership)
	{
		this.leadership = leadership;
	}

	public int getPnlt_cnt()
	{
		return pnlt_cnt;
	}
}
