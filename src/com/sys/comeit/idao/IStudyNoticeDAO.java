package com.sys.comeit.idao;

import java.util.ArrayList;
import com.sys.comeit.dto.*;

public interface IStudyNoticeDAO
{
	// 스터디 공지사항
	
	public String studyNoticeInsert(StudyNoticeDTO dto);	// 게시글 등록
	
	public int studyNoticeReInsert(StudyNoticeDTO dto);	// 댓글 등록
	
	public int studyNoticeUpdate(StudyNoticeDTO dto);	// 게시글 수정
	
	public int studyNoticeDelete(StudyNoticeDTO dto);	// 게시글 삭제
	
	public int studyNoticeReDelete(StudyNoticeDTO dto);	// 댓글 삭제
	
	public int studyReCount(StudyNoticeDTO dto);	// 특정 게시글의 댓글 개수 확인
	
	public ArrayList<StudyNoticeDTO> studyNoticeList(String stu_cd);	// 전체 리스트 확인
	
	public ArrayList<StudyNoticeDTO> studyNoticeSearch(String title);	// 제목 검색
	
	public StudyNoticeDTO studyNoticeDetail(StudyNoticeDTO dto);	// 특정 게시글의 상세 데이터
	
	public ArrayList<StudyNoticeDTO> studyNoticeReList(StudyNoticeDTO dto);	// 1번방의 2번게시물의 댓글리스트

	public int searchNoticeCount(StudyNoticeDTO dto);			// 게시물 수
	
	public ArrayList<StudyNoticeDTO> getNoticeListData(StudyNoticeDTO dto);	// 페이징 처리 된 게시물 리스트
	
	public StudyNoticeDTO studyNoticeAddData(StudyNoticeDTO dto);	// 스터디 공지사항 등록화면 노출 데이터

	public String studyLeaderJoin(String stu_cd);		// 작성자의 스터디 참가 코드 알아내기

	public String noticeReCreateJoin(StudyNoticeDTO dtoRe);	// 댓글 작성자의 스터디 참가 코드 알아내기
}
