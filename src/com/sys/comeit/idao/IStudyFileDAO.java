package com.sys.comeit.idao;

import java.util.ArrayList;
import com.sys.comeit.dto.*;

public interface IStudyFileDAO {
	
	public ArrayList<StudyFileDTO> studyFileList(String file_stu_cd);	// 전체 리스트 조회
	public StudyFileDTO studyFileDetail(StudyFileDTO dto);				// 상세 내역 조회
	public StudyFileDTO fileUrlSearch(StudyFileDTO dto) throws NumberFormatException;		// 첨부파일 조회
	public int searchFileCount(StudyFileDTO dto);						// 게시물 수
	public ArrayList<StudyFileDTO> getFileListData(StudyFileDTO dto);	// 페이징 처리 된 게시물 리스트
	public StudyFileDTO fileAdd(StudyFileDTO dto);						// 첨부파일 있는 게시물 등록
	public int fileboardAdd(StudyFileDTO dto);					// 첨부파일 없는 게시물 등록
	public String fileStuJoinCd(StudyFileDTO dto);							// 참가중인 스터디방 참가코드 조회
	
}
