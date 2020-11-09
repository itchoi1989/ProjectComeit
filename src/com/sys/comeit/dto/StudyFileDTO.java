package com.sys.comeit.dto;

public class StudyFileDTO
{
	// 회원 아이디 , 회원코드, 이름(작성자), 스터디 참가 코드, 스터디 코드
	private String file_mem_id, file_mem_cd, file_mem_name, file_stu_join_cd, file_stu_cd;
	
	// 게시판 코드, 제목, 내용, 작성일, 조회수, 게시글 삭제일
	private String file_oput_cd, file_title, file_content, file_crt_date, file_hits, file_board_del;
	
	// 파일 코드, 파일 이름, 파일 url, 파일 삭제일
	private String file_cd, file_name, file_url, file_del, file_row_num;
	
	// 검색 키, 검색 단어
	private String searchKey, searchValue;
	
	// 페이지 시작 / 끝
	private int start, end;			
	
	// getter / setter 구성
	
	public String getFile_mem_id()
	{
		return file_mem_id;
	}

	public void setFile_mem_id(String file_mem_id)
	{
		this.file_mem_id = file_mem_id;
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

	public String getFile_id()
	{
		return file_mem_id;
	}

	public void setFile_id(String file_id)
	{
		this.file_mem_id = file_id;
	}

	public String getFile_mem_cd()
	{
		return file_mem_cd;
	}

	public void setFile_mem_cd(String file_mem_cd)
	{
		this.file_mem_cd = file_mem_cd;
	}

	public String getFile_mem_name()
	{
		return file_mem_name;
	}

	public void setFile_mem_name(String file_mem_name)
	{
		this.file_mem_name = file_mem_name;
	}

	public String getFile_stu_join_cd()
	{
		return file_stu_join_cd;
	}

	public void setFile_stu_join_cd(String file_stu_join_cd)
	{
		this.file_stu_join_cd = file_stu_join_cd;
	}

	public String getFile_stu_cd()
	{
		return file_stu_cd;
	}

	public void setFile_stu_cd(String file_stu_cd)
	{
		this.file_stu_cd = file_stu_cd;
	}

	public String getFile_oput_cd()
	{
		return file_oput_cd;
	}

	public void setFile_oput_cd(String file_oput_cd)
	{
		this.file_oput_cd = file_oput_cd;
	}

	public String getFile_title()
	{
		return file_title;
	}

	public void setFile_title(String file_title)
	{
		this.file_title = file_title;
	}

	public String getFile_content()
	{
		return file_content;
	}

	public void setFile_content(String file_content)
	{
		this.file_content = file_content;
	}

	public String getFile_crt_date()
	{
		return file_crt_date;
	}

	public void setFile_crt_date(String file_crt_date)
	{
		this.file_crt_date = file_crt_date;
	}

	public String getFile_hits()
	{
		return file_hits;
	}

	public void setFile_hits(String file_hits)
	{
		this.file_hits = file_hits;
	}

	public String getFile_board_del()
	{
		return file_board_del;
	}

	public void setFile_board_del(String file_board_del)
	{
		this.file_board_del = file_board_del;
	}

	public String getFile_cd()
	{
		return file_cd;
	}

	public void setFile_cd(String file_cd)
	{
		this.file_cd = file_cd;
	}

	public String getFile_name()
	{
		return file_name;
	}

	public void setFile_name(String file_name)
	{
		this.file_name = file_name;
	}

	public String getFile_url()
	{
		return file_url;
	}

	public void setFile_url(String file_url)
	{
		this.file_url = file_url;
	}

	public String getFile_del()
	{
		return file_del;
	}

	public void setFile_del(String file_del)
	{
		this.file_del = file_del;
	}

	public String getFile_row_num()
	{
		return file_row_num;
	}

	public void setFile_row_num(String file_row_num)
	{
		this.file_row_num = file_row_num;
	}

	

	

}
