package com.sys.comeit.idao;

import java.util.ArrayList;

import com.sys.comeit.dto.SpaReqDTO;

public interface ISpaReqDAO 
{
	public String spaReqAdd(SpaReqDTO dto);	// 공간 등록
	public int spaReqCount();				// 공간 수
	public ArrayList<SpaReqDTO> spaReqList();	// 공간 리스트
	public int spaReqModify(SpaReqDTO dto);	// 공간 수정
	public int spaReqRemove(int sid); 		// 공간 삭제
	
	public int spaIntTagInsert(SpaReqDTO dto);	// 키워드
	public int spaEtcTagInsert(SpaReqDTO dto);	// 기타 키워드
	
	public int spaEtcTagCount(String etcTag);		// 회원 관심 기타 키워드 10개 체크
	public int spaAddTagName(String etcTag);	// 관심 키워드에 INSERT
	public ArrayList<SpaReqDTO> spaTagList();	// 키워드 리스트
	
	public int spaAddImg(SpaReqDTO dto);	// 공간 이미지 INSERT
	public int spaAddContent(SpaReqDTO dto);	// 시설안내 INSERT
	
	public int spaIntTagDel(String spa_req_cd);	// 키워드 DELETE
	public int spaEtcTagDel(String spa_req_cd);	// 기타 키워드 DELETE
	public int spaDelContent(String spa_req_cd);	// 시설안내 DELETE
}
