package com.sys.comeit.idao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.sys.comeit.dto.LectureNoticeDTO;

public interface ILectureNoticeDAO
{
	public ArrayList<LectureNoticeDTO> lectureNoticeList(String lec_cd);	// 전체 리스트 확인
	public LectureNoticeDTO lectureNoticeDetail(@Param("lec_cd") String lec_cd, @Param("lec_ntc_cd") String lec_ntc_cd);		// 공지사항 상세 내용 가져오기
	public ArrayList<LectureNoticeDTO> getNoticeListData(LectureNoticeDTO dto);
	public int searchNoticeCount(LectureNoticeDTO dto);
}
