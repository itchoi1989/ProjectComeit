package com.sys.comeit.dto;

import java.util.ArrayList;

public class StudyDTO
{

   private String stu_cd, str_date, cmt_date, crt_date, end_date;       // 스터디개설코드, 시작일, 확정일, 게시글등록일
   private String title, content;                            // 방제목, 인원수, 상세설명
   private String stu_hist_cd, stu_join_cd, apntm_dat;       // 스터디장이력코드, (스터디장)참가코드, 임명일
   private String leader_mem_cd, leader_name;               // 스터디장 회원코드, 스터디장 이름
   private String meet_term, area_name, spc_area_name;         // 기간, 지역명, 세부지역명 
   private String idntt_type, lv, cat_name, scrt_num;         // 신분유형, 레벨, 카테고리, 방비밀번호(없으면 0 나옴)
   private String join_mem_cd , stu_join_name;               // 스터디를 참가하는 사람의 이름
   private String mem_img;                     // 스터디장, 스터디원 이미지 조회
   
   private String int_tag_name, etc_tag_name, int_stu_cd;               // 관심 키워드 태그, 기타 관심 키워드 태그
   public String getInt_stu_cd()
   {
      return int_stu_cd;
   }

   public void setInt_stu_cd(String int_stu_cd)
   {
      this.int_stu_cd = int_stu_cd;
   }

   private String stu_day_name;                        // 스터디 진행 요일
   // 개설하기
   // 스터디방 제목, 세부키워드, 상세설명, 모집인원, 활동 지역, 레벨, 시작날짜
   // 종료날짜, 모임 지정 요일, 비밀방 설정 여부
   // 대표이미지, 스터디신분, 레벨코드, 신분코드
   
   private String stu_day_cd;         // 스터디 진행 요일 코드
   private String id;               // 로그인 회원 아이디
   
   private String stu_count;         // 참가중인 스터디 개수
   
   private String searchKey, searchValue;   // 검색 키, 검색 단어
   private int start, end;         // 페이지 시작 / 끝
   
   private ArrayList<String> cat_cd_list;   // 카테고리 유형 담기
   private ArrayList<String> level_list;   // 레벨 코드들 담기
   

   public ArrayList<String> getCat_cd_list()
   {
      return cat_cd_list;
   }

   public void setCat_cd_list(ArrayList<String> cat_cd_list)
   {
      this.cat_cd_list = cat_cd_list;
   }

   public ArrayList<String> getLevel_list()
   {
      return level_list;
   }

   public void setLevel_list(ArrayList<String> level_list)
   {
      this.level_list = level_list;
   }

   public String getSearchKey()
   {
      return searchKey;
   }

   public int getStart()
   {
      return start;
   }

   public void setStart(int start)
   {
      this.start = start;
   }

   public int getEnd()
   {
      return end;
   }

   public void setEnd(int end)
   {
      this.end = end;
   }

   public void setSearchKey(String searchKey)
   {
      this.searchKey = searchKey;
   }

   public String getSearchValue()
   {
      return searchValue;
   }

   public void setSearchValue(String searchValue)
   {
      this.searchValue = searchValue;
   }

   public String getStu_count()
   {
      return stu_count;
   }

   public void setStu_count(String stu_count)
   {
      this.stu_count = stu_count;
   }

   private int mem_num;

   public int getMem_num()
   {
      return mem_num;
   }

   public void setMem_num(int mem_num)
   {
      this.mem_num = mem_num;
   }

   public String getId()
   {
      return id;
   }

   public void setId(String id)
   {
      this.id = id;
   }

   public String getStu_day_cd()
   {
      return stu_day_cd;
   }

   public void setStu_day_cd(String stu_day_cd)
   {
      this.stu_day_cd = stu_day_cd;
   }

   // 개설 프로시저 : 개설자, 세부지역, 모임기간코드, 신분코드, 레벨코드, 카테고리코드, 제목, 시작날짜, 인원수, 내용
   private String crt_mem_cd, spc_area_cd, meet_term_cd, idntt_cd, lv_cd, stu_cat_cd, img_url;
   private String int_tag_cd, etc_tag_cd;
   
   // getter / setter 구성
   public String getLeader_mem_cd()
   {
      return leader_mem_cd;
   }
   
   public String getStu_join_name() {
      return stu_join_name;
   }

   public void setStu_join_name(String stu_join_name) {
      this.stu_join_name = stu_join_name;
   }

   public String getInt_tag_name()
   {
      return int_tag_name;
   }

   public void setInt_tag_name(String int_tag_name)
   {
      this.int_tag_name = int_tag_name;
   }

   public String getEtc_tag_name()
   {
      return etc_tag_name;
   }

   public void setEtc_tag_name(String etc_tag_name)
   {
      this.etc_tag_name = etc_tag_name;
   }

   public String getInt_tag_cd()
   {
      return int_tag_cd;
   }
   public void setInt_tag_cd(String int_tag_cd)
   {
      this.int_tag_cd = int_tag_cd;
   }
   public String getEtc_tag_cd()
   {
      return etc_tag_cd;
   }
   public void setEtc_tag_cd(String etc_tag_cd)
   {
      this.etc_tag_cd = etc_tag_cd;
   }
   public void setLeader_mem_cd(String leader_mem_cd)
   {
      this.leader_mem_cd = leader_mem_cd;
   }
   public String getLeader_name()
   {
      return leader_name;
   }
   public void setLeader_name(String leader_name)
   {
      this.leader_name = leader_name;
   }
   public String getCrt_mem_cd()
   {
      return crt_mem_cd;
   }
   public void setCrt_mem_cd(String crt_mem_cd)
   {
      this.crt_mem_cd = crt_mem_cd;
   }
   public String getSpc_area_cd()
   {
      return spc_area_cd;
   }
   public void setSpc_area_cd(String spc_area_cd)
   {
      this.spc_area_cd = spc_area_cd;
   }
   public String getMeet_term_cd()
   {
      return meet_term_cd;
   }
   public void setMeet_term_cd(String meet_term_cd)
   {
      this.meet_term_cd = meet_term_cd;
   }
   public String getIdntt_cd()
   {
      return idntt_cd;
   }
   public void setIdntt_cd(String idntt_cd)
   {
      this.idntt_cd = idntt_cd;
   }
   public String getLv_cd()
   {
      return lv_cd;
   }
   public void setLv_cd(String lv_cd)
   {
      this.lv_cd = lv_cd;
   }
   public String getStu_cat_cd()
   {
      return stu_cat_cd;
   }
   public void setStu_cat_cd(String stu_cat_cd)
   {
      this.stu_cat_cd = stu_cat_cd;
   }
   public String getImg_url()
   {
      return img_url;
   }
   public void setImg_url(String img_url)
   {
      this.img_url = img_url;
   }
   
   public String getStu_cd()
   {
      return stu_cd;
   }
   public void setStu_cd(String stu_cd)
   {
      this.stu_cd = stu_cd;
   }
   public String getStr_date()
   {
      return str_date;
   }
   public void setStr_date(String str_date)
   {
      this.str_date = str_date;
   }
   public String getCmt_date()
   {
      return cmt_date;
   }
   public void setCmt_date(String cmt_date)
   {
      this.cmt_date = cmt_date;
   }
   public String getCrt_date()
   {
      return crt_date;
   }
   public void setCrt_date(String crt_date)
   {
      this.crt_date = crt_date;
   }
   public String getEnd_date()
   {
      return end_date;
   }
   public void setEnd_date(String end_date)
   {
      this.end_date = end_date;
   }
   public String getTitle()
   {
      return title;
   }
   public void setTitle(String title)
   {
      this.title = title;
   }
   public String getContent()
   {
      return content;
   }
   public void setContent(String content)
   {
      this.content = content;
   }
   public String getStu_hist_cd()
   {
      return stu_hist_cd;
   }
   public void setStu_hist_cd(String stu_hist_cd)
   {
      this.stu_hist_cd = stu_hist_cd;
   }
   public String getStu_join_cd()
   {
      return stu_join_cd;
   }
   public void setStu_join_cd(String stu_join_cd)
   {
      this.stu_join_cd = stu_join_cd;
   }
   public String getApntm_dat()
   {
      return apntm_dat;
   }
   public void setApntm_dat(String apntm_dat)
   {
      this.apntm_dat = apntm_dat;
   }
   public String getMeet_term()
   {
      return meet_term;
   }
   public void setMeet_term(String meet_term)
   {
      this.meet_term = meet_term;
   }
   public String getArea_name()
   {
      return area_name;
   }
   public void setArea_name(String area_name)
   {
      this.area_name = area_name;
   }
   public String getSpc_area_name()
   {
      return spc_area_name;
   }
   public void setSpc_area_name(String spc_area_name)
   {
      this.spc_area_name = spc_area_name;
   }
   public String getIdntt_type()
   {
      return idntt_type;
   }
   public void setIdntt_type(String idntt_type)
   {
      this.idntt_type = idntt_type;
   }
   public String getLv()
   {
      return lv;
   }
   public void setLv(String lv)
   {
      this.lv = lv;
   }
   public String getCat_name()
   {
      return cat_name;
   }
   public void setCat_name(String cat_name)
   {
      this.cat_name = cat_name;
   }
   public String getScrt_num()
   {
      return scrt_num;
   }
   public void setScrt_num(String scrt_num)
   {
      this.scrt_num = scrt_num;
   }
   public String getStu_day_name()
   {
      return stu_day_name;
   }
   public void setStu_day_name(String stu_day_name)
   {
      this.stu_day_name = stu_day_name;
   }
   public String getJoin_mem_cd() {
      return join_mem_cd;
   }

   public void setJoin_mem_cd(String join_mem_cd) {
      this.join_mem_cd = join_mem_cd;
   }

   public String getMem_img() {
      return mem_img;
   }

   public void setMem_img(String mem_img) {
      this.mem_img = mem_img;
   }
}