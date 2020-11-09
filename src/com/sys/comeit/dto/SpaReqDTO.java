package com.sys.comeit.dto;

public class SpaReqDTO
{
	private String spa_req_cd, spa_cd, spa_type,type_name,rep_rsn_type_cd,rep_rsn,spa_id;//등록요청 코드, 업체코드, 업체타입&신고타입,신고사유 유형,신고이유, 업체 아이디
    private String one_intro,dtl_intro, rsv_notes, req_date; //한줄 소개, 상세소개, 주의사항, 등록요청일
    private int use_hrs, str_time, end_time,mem_num;//최대 이용시간, 시작시간, 종료시간
    private String busi_name, spa_name, dtl_addr, tel,spa_tel; // 상호명, 공간명, 상세주소, 전화번호, 업체 전화번호
    private String rprsn_name, spa_addr; //대표자명, 사업장 주소
    private String web_url, file_url,check_type,stu_spa_req_cd,prcs_rsn;//웹사이트, 사업자번호파일,승인여부, 예약 요청 코드, 요청 처리 이유
    private String area_name, spc_area_name;						// 지역명, 세부지역명
    private String rprsn_num,img_url ; //사업자번호, 대표이미지
    private String spc_area_cd; //세부지역코드
    private String int_tag, etc_tag,img_type_cd,content;	// 관심키워드, 기타관심키워드,이미지 타입, 시설안내
    public String getPrcs_date()
	{
		return prcs_date;
	}
	public String getSpa_tel() {
		return spa_tel;
	}
	public void setSpa_tel(String spa_tel) {
		this.spa_tel = spa_tel;
	}
	public String getPrcs_rsn() {
		return prcs_rsn;
	}
	public void setPrcs_rsn(String prcs_rsn) {
		this.prcs_rsn = prcs_rsn;
	}
	public String getRep_rsn() {
		return rep_rsn;
	}
	public void setRep_rsn(String rep_rsn) {
		this.rep_rsn = rep_rsn;
	}
	public String getRep_rsn_type_cd() {
		return rep_rsn_type_cd;
	}
	public void setRep_rsn_type_cd(String rep_rsn_type_cd) {
		this.rep_rsn_type_cd = rep_rsn_type_cd;
	}
	public String getStu_spa_req_cd() {
		return stu_spa_req_cd;
	}
	public void setStu_spa_req_cd(String stu_spa_req_cd) {
		this.stu_spa_req_cd = stu_spa_req_cd;
	}
	public void setPrcs_date(String prcs_date)
	{
		this.prcs_date = prcs_date;
	}
	private String spa_tag_type_cd,tag_name; // 키워드 코드, 명
    public String getMem_cd() {
		return mem_cd;
	}
	public void setMem_cd(String mem_cd) {
		this.mem_cd = mem_cd;
	}
	private String feedCount; // 피드백수
    private int facility, kindness, price, location, noise, count;// 시설, 친절, 가격, 위치, 소음, 피드백 평균 구할 개수
	private String mem_id,mem_cd,req_cd,name,type,lec_cd,lec_spa_cd; //피드백을 s입력한 사람 아이디,사람코드, 요청 코드, 요청한사람 실명, 승인거부 여부, 강의 코드, 강의 예약 코드
	public String getLec_cd() {
		return lec_cd;
	}
	public String getLec_spa_cd() {
		return lec_spa_cd;
	}
	public void setLec_spa_cd(String lec_spa_cd) {
		this.lec_spa_cd = lec_spa_cd;
	}
	public void setLec_cd(String lec_cd) {
		this.lec_cd = lec_cd;
	}
	private String prcs_date;	// 예약 승인/거부 처리 날짜
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	private String stu_hist_cd,use_time;// 스터디장코드, 실제사용시간, 인원수
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getSpa_id() {
		return spa_id;
	}
	public void setSpa_id(String spa_id) {
		this.spa_id = spa_id;
	}
	public String getCheck_type() {
		return check_type;
	}
	public void setCheck_type(String check_type) {
		this.check_type = check_type;
	}
	// 검색
	private String searchKey, searchValue;	// 검색 키, 검색 단어
	private int start, end;			// 페이지 시작 / 끝
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public String getUse_time() {
		return use_time;
	}
	public void setUse_time(String use_time) {
		this.use_time = use_time;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getStu_hist_cd() {
		return stu_hist_cd;
	}
	public void setStu_hist_cd(String stu_hist_cd) {
		this.stu_hist_cd = stu_hist_cd;
	}
	public String getReq_cd() {
		return req_cd;
	}
	public void setReq_cd(String req_cd) {
		this.req_cd = req_cd;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getFacility() {
		return facility;
	}
	public void setFacility(int facility) {
		this.facility = facility;
	}
	public int getKindness() {
		return kindness;
	}
	public void setKindness(int kindness) {
		this.kindness = kindness;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getLocation() {
		return location;
	}
	public void setLocation(int location) {
		this.location = location;
	}
	public int getNoise() {
		return noise;
	}
	public void setNoise(int noise) {
		this.noise = noise;
	}
	public String getFeedCount() {
		return feedCount;
	}
	public void setFeedCount(String feedCount) {
		this.feedCount = feedCount;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public String getSpa_tag_type_cd()
	{
		return spa_tag_type_cd;
	}
	public void setSpa_tag_type_cd(String spa_tag_type_cd)
	{
		this.spa_tag_type_cd = spa_tag_type_cd;
	}
	public String getTag_name()
	{
		return tag_name;
	}
	public void setTag_name(String tag_name)
	{
		this.tag_name = tag_name;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getImg_type_cd()
	{
		return img_type_cd;
	}
	public void setImg_type_cd(String img_type_cd)
	{
		this.img_type_cd = img_type_cd;
	}
	public String getInt_tag()
	{
		return int_tag;
	}
	public void setInt_tag(String int_tag)
	{
		this.int_tag = int_tag;
	}
	public String getEtc_tag()
	{
		return etc_tag;
	}
	public void setEtc_tag(String etc_tag)
	{
		this.etc_tag = etc_tag;
	}
	public String getSpc_area_cd() {
		return spc_area_cd;
	}
	public void setSpc_area_cd(String spc_area_cd) {
		this.spc_area_cd = spc_area_cd;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public String getRprsn_num() {
		return rprsn_num;
	}
	public void setRprsn_num(String rprsn_num) {
		this.rprsn_num = rprsn_num;
	}
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}
	public String getSpc_area_name() {
		return spc_area_name;
	}
	public void setSpc_area_name(String spc_area_name) {
		this.spc_area_name = spc_area_name;
	}
	public String getSpa_req_cd()
	{
		return spa_req_cd;
	}
	public void setSpa_req_cd(String spa_req_cd)
	{
		this.spa_req_cd = spa_req_cd;
	}
	public String getSpa_cd()
	{
		return spa_cd;
	}
	public void setSpa_cd(String spa_cd)
	{
		this.spa_cd = spa_cd;
	}
	public String getSpa_type()
	{
		return spa_type;
	}
	public void setSpa_type(String spa_type)
	{
		this.spa_type = spa_type;
	}
	public String getOne_intro()
	{
		return one_intro;
	}
	public void setOne_intro(String one_intro)
	{
		this.one_intro = one_intro;
	}
	public String getDtl_intro()
	{
		return dtl_intro;
	}
	public void setDtl_intro(String dtl_intro)
	{
		this.dtl_intro = dtl_intro;
	}
	public String getRsv_notes()
	{
		return rsv_notes;
	}
	public void setRsv_notes(String rsv_notes)
	{
		this.rsv_notes = rsv_notes;
	}
	public String getReq_date()
	{
		return req_date;
	}
	public void setReq_date(String req_date)
	{
		this.req_date = req_date;
	}
	public int getUse_hrs()
	{
		return use_hrs;
	}
	public void setUse_hrs(int use_hrs)
	{
		this.use_hrs = use_hrs;
	}
	public int getStr_time()
	{
		return str_time;
	}
	public void setStr_time(int str_time)
	{
		this.str_time = str_time;
	}
	public int getEnd_time()
	{
		return end_time;
	}
	public void setEnd_time(int end_time)
	{
		this.end_time = end_time;
	}
	public String getBusi_name()
	{
		return busi_name;
	}
	public void setBusi_name(String busi_name)
	{
		this.busi_name = busi_name;
	}
	public String getSpa_name()
	{
		return spa_name;
	}
	public void setSpa_name(String spa_name)
	{
		this.spa_name = spa_name;
	}
	public String getDtl_addr()
	{
		return dtl_addr;
	}
	public void setDtl_addr(String dtl_addr)
	{
		this.dtl_addr = dtl_addr;
	}
	public String getTel()
	{
		return tel;
	}
	public void setTel(String tel)
	{
		this.tel = tel;
	}
	public String getRprsn_name()
	{
		return rprsn_name;
	}
	public void setRprsn_name(String rprsn_name)
	{
		this.rprsn_name = rprsn_name;
	}
	public String getSpa_addr()
	{
		return spa_addr;
	}
	public void setSpa_addr(String spa_addr)
	{
		this.spa_addr = spa_addr;
	}
	public String getWeb_url()
	{
		return web_url;
	}
	public void setWeb_url(String web_url)
	{
		this.web_url = web_url;
	}
	public String getFile_url()
	{
		return file_url;
	}
	public void setFile_url(String file_url)
	{
		this.file_url = file_url;
	}
	   
	   
	

}
