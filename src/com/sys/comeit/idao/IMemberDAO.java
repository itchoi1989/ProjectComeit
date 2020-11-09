/*========================
	IMemberDAO.java
	- 인터페이스
========================*/
package com.sys.comeit.idao;
import com.sys.comeit.dto.*;

import java.util.ArrayList;

public interface IMemberDAO
{
	public String memberAdd(MemberDTO dto);	// 실제 회원 가입 insert
	public int memberCount();			// 회원 수
	public ArrayList<MemberDTO> memberList();	// 회원 리스트	
	public int memberModify(MemberDTO dto);	// 회원이 자기 정보 수정 update
	public int memberRemove(int mid); 		// 회원탈퇴(프로시저로 탈퇴될텐데?)
	
	public MemberDTO memberLogin(MemberDTO dto); //로그인
	public String memStop(String id);		// 정지 여부 확인
	public int memBlock(String id);			// 블락 여부 확인
	public String memId(MemberDTO dto);	// 아이디 찾기
	public int memPwd(MemberDTO dto);	// 임시 패스워드로 변경
	public int pwdInfo(MemberDTO dto); // 패스워드 찾기 정보 조회
	
	
	public int memcheckCount(String id);	// 아이디 중복확인
	
	public int memIntTagInsert(MemberDTO dto);	// 회원 관심 키워드
	public int memEtcTagInsert(MemberDTO dto);	// 회원 관심 기타 키워드
	
	public int etcTagCount(String etcTag);		// 회원 관심 기타 키워드 10개 체크
	public int addTagName(String etcTag);	// 관심 키워드에 INSERT
	public int memTelcheckCount(String tel);   // 전화번호 중복확인
	
	
	public MemberDTO memModalList(String mem_cd); 	// 모달 정보 조회
	public MemberDTO studyEval(String mem_cd);		// 스터디 평가 내역
	public int pnltCount(String mem_cd);			// 패널티 개수
	
	public ArrayList<MemberDTO> memIntTagSearch(String mem_cd);	// 멤버 관심, 기타 키워드
	
	public ArrayList<MemberDTO> modalStudyList(String mem_cd);
	
	public MemberDTO memPayInfo(String mem_cd); // 재민 추가, 결제 정보
	
}
