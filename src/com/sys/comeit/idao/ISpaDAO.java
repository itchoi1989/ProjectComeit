package com.sys.comeit.idao;

import java.util.ArrayList;
import com.sys.comeit.dto.*;

public interface ISpaDAO
{
	public String spaAdd(SpaDTO dto);	// 실제 회원 가입 insert
	public int spaCount();				// 회원 수
	public ArrayList<SpaDTO> spaList();	// 회원 리스트
	public int spaModify(SpaDTO dto);	// 업체 회원이 자기 정보 수정 update
	public int spaRemove(int sid); 		// 업체 회원탈퇴요청
	
	public SpaDTO spaLogin(SpaDTO dto); //로그인
	public String spaStop(String id);	// 정지 여부 확인
	public int spaBlock(String id);		// 블락 여부 확인
	
	public String sapId(SpaDTO dto);	// 아이디 찾기
	public String spaCd(String id);		// 업체 회원 코드 찾기
	
	public int spaPwd(SpaDTO dto);	// 임시 패스워드 변경
	public int pwdInfo(SpaDTO dto); // 패스워드 찾기 정보 조회
	
	public int spaCheckCount(String id);	// 아이디 중복확인
	public int spaTelcheckCount(String tel);   // 전화번호 중복확인
	
}
