package com.sys.comeit.idao;

import com.sys.comeit.dto.*;

import java.util.ArrayList;
import java.util.List;

public interface IAdminDAO
{
	public int adminCount();				// 관리자 수
	public ArrayList<AdminDTO> adminList();	// 관리자 리스트	
	public String adminLogin(AdminDTO dto); //로그인
	
	public int adminAdd(AdminDTO dto);		// 관리자 추가
	public int adminDelete(String admin_cd);// 관리자 삭제
	
	public int banAdd(BanDTO dto);
	public ArrayList<BanDTO> banList();
	public int banDelete(String lngg_ban_cd);
	
	public int adminModify(AdminDTO dto);	// 관리자 비밀번호 수정
	
	// 한명의 관리자에 대한 정보 리스트
	public AdminDTO adminSearchList(String admin_cd);	// 관리자 리스트	 
	
	// 관리자 업체 회원 리스트 조회
	public ArrayList<SpaDTO> admspaList();	// 업체 회원 리스트
	
	// 관리자 업체 요청 관리
	public ArrayList<SpaReqDTO> adminComAppealList();	// 회원 리스트
	
	// 관리자 업체 요청 확인 업데이트 메소드
	public int spaCheckMod(String spa_req_cd);
	
	// 관리자 업체 요청 승인/거부 업데이트 메소드
	public int spaConfirmMod(AdmSpaReqDTO dto);
	
	public int comapplSearchCount(AdmSpaReqDTO dto);	// 검색완료된 업체요청 개수
	
	public List<AdmSpaReqDTO> comapplListData(AdmSpaReqDTO dto);	// 검색완료된 업체요청
	
	public int banapplSearchCount(BanDTO dto);	// 검색완료된 금지어 요청 개수
	
	public List<BanDTO> banapplListData(BanDTO dto);	// 검색완료된 금지어 요청
	
	public ArrayList<AdmMemDTO> admmemList();	// 개인 회원 리스트
	public ArrayList<AdmMemDTO> admproList();	// 강사 회원 리스트
	
	public ArrayList<AdmSpaReqDTO> admspanoList(); //업체 거부 명단 리스트
	
	public ArrayList<AdmStuReqDTO> admstureqList();// 스터디방 신고 리스트
	
	// 관리자 스터디방 신고 요청 확인 업데이트 메소드
	public int stuReqCheckMod(String stu_rep_cd);
	
	// 관리자 스터디방 신고 요청 승인/거부 업데이트 메소드
	public int stuReqConfirmMod(AdmStuReqDTO dto);
	
	public ArrayList<AdmSpaReqDTO> admSpaIntro(String spa_req_cd); //업체 거부 명단 리스트
	
	public ArrayList<AdminCalDTO> admCalList();	// 정산 관리 리스트
	
	public int lecCalAdd(AdminCalDTO dto); // 정산 관리 추가
	
}
