package com.sys.comeit.idao;

import java.util.ArrayList;

import com.sys.comeit.dto.SpaDTO;
import com.sys.comeit.dto.SpaReqDTO;

public interface ISpaceDAO 
{
	public SpaReqDTO spaceInfoSearch(String spa_req_cd);						// 공간 정보 조회
	public ArrayList<SpaReqDTO> spaceFcltySearch(String spa_req_cd);		// 공간 시설안내 조회
	public ArrayList<SpaReqDTO> spaceTagSearch(String spa_req_cd);		// 공간 키워드 태그 조회
	public ArrayList<SpaReqDTO> spaceFeed(String spa_req_cd);		// 공간 피드백 조회
	public SpaReqDTO reqCount(SpaReqDTO dto);// 각 회원별 피드백 등록 여부 체크
	public String reqCd(SpaReqDTO dto);// 각 회원별 피드백 등록 여부 체크
	
	public ArrayList<SpaReqDTO> spaceList(SpaReqDTO dto);			// 공간 리스트
	public ArrayList<SpaReqDTO> MyInfoSearch(String spa_id);			// 마이페이지 공간 리스트
	
	public int spaceCount(SpaReqDTO dto);						// 공간 개수 조회
	public ArrayList<SpaReqDTO> spaceTagList();		// 모든 공간 키워드들
	public int feedStuInsert(SpaReqDTO dto);	// 스터디장 피드백 insert
	public int feedLecInsert(SpaReqDTO dto);	// 강사 피드백 insert
	public int feedbacPeokCheck(String req_cd);	// 강사인지 스터디장인지 구별
	public int reqStuInsert(SpaReqDTO dto);	// 스터디장 예약하기 insert
	public int reqLecInsert(SpaReqDTO dto);	// 강사 예약하기 insert
	public int peoCdCheck(String stu_hist_cd);//강의 코드인지 스터디장 코드인지 구별
	
	public SpaDTO Search(String spa_id);// 마이페이지 내정보
	public int spaUpdate(SpaDTO dto);// 마이페이지 내정보 수정
	public SpaReqDTO googleChart(String spa_req_cd);		// 마이페이지 그래프
	public ArrayList<SpaReqDTO> SpaReqCheck(String spa_id);		// 마이페이지 예약 내역 관리
	public ArrayList<SpaReqDTO> SpaReqStu(String spa_id);		// 마이페이지 스터디 예약 요청 관리
	public ArrayList<SpaReqDTO> SpaReqLec(String spa_id);		// 마이페이지 강의 예약 요청 관리
	public int SpaStuReqAppr(String stu_spa_req_cd);		// 스터디 예약 요청 승인
	public int SpaLecReqAppr(String lec_spa_cd);		// 강의 예약 요청 승인
	public int StuSpaReqApprN(SpaReqDTO dto);		// 스터디 예약 요청 거부
	public int LecSpaReqApprN(SpaReqDTO dto);		// 강의 예약 요청 거부
	
	public int spaRepInsert(SpaReqDTO dto);	//공간 신고
	public ArrayList<SpaReqDTO> spaRepType();//신고 타입
	public int spaceDel(String spa_req_cd); //공간삭제
	public int spaceDelCheck(String spa_req_cd);	//공간 삭제 여부 확인
	
}
