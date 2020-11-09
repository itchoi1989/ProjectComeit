package com.sys.comeit.idao;

import java.util.ArrayList;
import com.sys.comeit.dto.*;
import java.util.List;

public interface IStudyDAO
{
	public StudyDTO studyInfoSearch(String stu_cd);						// 스터디방 정보 조회
	public ArrayList<StudyDTO> studyIntTagSearch(String stu_cd);		// 스터디 관심 키워드 태그 조회
	public ArrayList<StudyDTO> studyEtcTagSearch(String stu_cd);		// 스터디 기타 관심 키워드 태그 조회
	
	public ArrayList<StudyDTO> studyDaySearch(String stu_cd);			// 스터디 진행 요일
	public StudyDTO studyLeaderSearch(String stu_cd);					// 스터디장 조회
	public ArrayList<StudyDTO> studyJoinName(String stu_cd);			// 참가 스터디원 이름 조회
	public ArrayList<StudyDTO> memImgSearch(String stu_cd);				// 참가 스터디원 이미지 조회
	
	public String studyInsert(StudyDTO dto);		// 스터디 개설 
	public int studyDayInsert(StudyDTO dto);		// 스터디 진행 요일 insert
	public int studyIntTagInsert(StudyDTO dto);		// 스터디 관심 키워드 insert
	public int studyEtcTagInsert(StudyDTO dto);		// 스터디 관심 기타 키워드 insert
	public int studyEtcTagCount(String etcTag);		// 스터디 관심 기타 키워드 10개 체크
	
	public ArrayList<StudyDTO> studyList();			// 스터디 리스트
	public int studyModify(StudyDTO dto);			// 스터디 정보 수정
	
	public int studyCount();						// 스터디방 개수 조회
	public ArrayList<StudyDTO> studyTagList();		// 모든 스터디 키워드들
	
	public String studyScrt(String stu_cd);			// 스터디방의 비밀번호 확인
	
	public int addTagName(String etcTag);	// 관심 키워드에 INSERT
	
	public String findMemCd(String id);		// 아이디로 회원코드 알아내기
	
	public int stuJoinMemSearch(StudyDTO dto);
	
	public int memStudyCount(String mem_cd);				// 참가중인 스터디방 개수 조회
	
	
	public int joinMemNum(String stu_cd);		// 전체 참가중인 스터디원 조회
	public int joinStudy(StudyDTO dto);			// 스터디 참가
	
	public int studySearchCount(StudyDTO dto);	// 검색완료된 스터디방 개수
	
	public List<StudyDTO> getListData(StudyDTO dto);	// 검색완료된 스터디방
	
	public int studyCommit(String stu_cd);		// 스터디 커밋
	
	public int studyDelete(String stu_cd);	// 스터디방 폐쇄
	
	public StudyDTO studyDetailMod(String stu_cd);	// 스터디방 수정 화면 노출
	
	public ArrayList<StudyDTO> studyDetailTags(String stu_cd);		// 특정 스터디방의 관심 키워드 노출
	
	public ArrayList<StudyDTO> studyDetailDays(String stu_cd);		// 특정 스터디방의 요일들 노출
	
}
