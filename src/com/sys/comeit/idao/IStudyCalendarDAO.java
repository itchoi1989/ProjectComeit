package com.sys.comeit.idao;

import java.util.ArrayList;

import com.sys.comeit.dto.StudyCalendarDTO;

public interface IStudyCalendarDAO
{
	// 스터디 캘린더
	
	public ArrayList<StudyCalendarDTO> studyCalList(String stu_cd);		// 캘린더 전체 리스트
	
	public String studyCalJoin(StudyCalendarDTO dtoJoin);	// 작성자의 스터디 참가 코드 알아내기
	
	public int studyCalInsert(StudyCalendarDTO dto);		// 캘린더 등록
	
	public int studyCalDelete(StudyCalendarDTO dto);		// 캘린더 삭제

}
