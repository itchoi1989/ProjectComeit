package com.sys.comeit.dto;

public class StudyNoticeDTO
{
	// 스터디 공지사항
	// 공지사항 글번호, 제목, 작성자 스터디참가코드, 작성자명, 작성일, 조회수, 내용, 댓글수
	// , 게시글코드, 부모게시글코드, 삭제일, 스터디방 코드
	private String row_num, title, stu_join_cd, stu_join_name, crt_date, hits, content, re_count;
	private String stu_ntc_cd, stu_ntc_pnt_cd, del_date, stu_cd;
	private String mem_cd;
	
	// 검색 키, 검색 단어
	private String searchKey, searchValue;
	
	// 페이지 시작 / 끝
	private int start, end;
	
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
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
	public String getStu_cd()
	{
		return stu_cd;
	}
	public void setStu_cd(String stu_cd)
	{
		this.stu_cd = stu_cd;
	}
	public String getDel_date()
	{
		return del_date;
	}
	public void setDel_date(String del_date)
	{
		this.del_date = del_date;
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
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getRe_count()
	{
		return re_count;
	}
	public void setRe_count(String re_count)
	{
		this.re_count = re_count;
	}
	public String getStu_ntc_cd()
	{
		return stu_ntc_cd;
	}
	public void setStu_ntc_cd(String stu_ntc_cd)
	{
		this.stu_ntc_cd = stu_ntc_cd;
	}
	public String getStu_ntc_pnt_cd()
	{
		return stu_ntc_pnt_cd;
	}
	public void setStu_ntc_pnt_cd(String stu_ntc_pnt_cd)
	{
		this.stu_ntc_pnt_cd = stu_ntc_pnt_cd;
	}
	
	

	
}
