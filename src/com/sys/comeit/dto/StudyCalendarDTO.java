package com.sys.comeit.dto;

public class StudyCalendarDTO
{
	// 스터디코드, 작성자의 스터디참가코드, 작성자의 스터디참가이름, 작성자의 회원코드, 캘린더코드, 시작날짜, 종료날짜
	String stu_cd, stu_join_cd, stu_join_name, mem_cd, stu_cal_cd, str_date, end_date;
	// 캘린더내용, 작성일, 삭제일
	String content, crt_date, del_date;
	
	public String getStu_cd()
	{
		return stu_cd;
	}
	public void setStu_cd(String stu_cd)
	{
		this.stu_cd = stu_cd;
	}
	public String getStu_join_cd()
	{
		return stu_join_cd;
	}
	public void setStu_join_cd(String stu_join_cd)
	{
		this.stu_join_cd = stu_join_cd;
	}
	public String getStu_join_name()
	{
		return stu_join_name;
	}
	public void setStu_join_name(String stu_join_name)
	{
		this.stu_join_name = stu_join_name;
	}
	public String getMem_cd()
	{
		return mem_cd;
	}
	public void setMem_cd(String mem_cd)
	{
		this.mem_cd = mem_cd;
	}
	public String getStu_cal_cd()
	{
		return stu_cal_cd;
	}
	public void setStu_cal_cd(String stu_cal_cd)
	{
		this.stu_cal_cd = stu_cal_cd;
	}
	public String getStr_date()
	{
		return str_date;
	}
	public void setStr_date(String str_date)
	{
		this.str_date = str_date;
	}
	public String getEnd_date()
	{
		return end_date;
	}
	public void setEnd_date(String end_date)
	{
		this.end_date = end_date;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getCrt_date()
	{
		return crt_date;
	}
	public void setCrt_date(String crt_date)
	{
		this.crt_date = crt_date;
	}
	public String getDel_date()
	{
		return del_date;
	}
	public void setDel_date(String del_date)
	{
		this.del_date = del_date;
	}

}
