package com.sys.comeit.dto;

public class AdminCalDTO
{
	private String lec_cd, mem_id;
	private String lec_cal_cd, admin_cd, cal_date;
	private int profit, rfnd_fee, cal_fee;
	
	public String getLec_cd()
	{
		return lec_cd;
	}
	public void setLec_cd(String lec_cd)
	{
		this.lec_cd = lec_cd;
	}
	public String getMem_id()
	{
		return mem_id;
	}
	public void setMem_id(String mem_id)
	{
		this.mem_id = mem_id;
	}
	public String getLec_cal_cd()
	{
		return lec_cal_cd;
	}
	public void setLec_cal_cd(String lec_cal_cd)
	{
		this.lec_cal_cd = lec_cal_cd;
	}
	public String getAdmin_cd()
	{
		return admin_cd;
	}
	public void setAdmin_cd(String admin_cd)
	{
		this.admin_cd = admin_cd;
	}
	public String getCal_date()
	{
		return cal_date;
	}
	public void setCal_date(String cal_date)
	{
		this.cal_date = cal_date;
	}
	public int getProfit()
	{
		return profit;
	}
	public void setProfit(int profit)
	{
		this.profit = profit;
	}
	public int getRfnd_fee()
	{
		return rfnd_fee;
	}
	public void setRfnd_fee(int rfnd_fee)
	{
		this.rfnd_fee = rfnd_fee;
	}
	public int getCal_fee()
	{
		return cal_fee;
	}
	public void setCal_fee(int cal_fee)
	{
		this.cal_fee = cal_fee;
	}

	

}
