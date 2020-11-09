package com.sys.comeit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sys.comeit.dto.SpcAreaDTO;
import com.sys.comeit.idao.ISpcAreaDAO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class CommonController
{

	@Autowired
	private SqlSession sqlSession;
	
	// 지역에 맞는 세부지역 불러오는 AJAX 처리
	@RequestMapping(value = "/areaajax.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String selectAjax(HttpServletRequest request, Model model)
	{
		String view = null;

		ISpcAreaDAO spcAreaDao = sqlSession.getMapper(ISpcAreaDAO.class);

		// request로 받아온 area_cd로 조회한 세부지역 리스트 list에 담기
		ArrayList<SpcAreaDTO> list = spcAreaDao.spcAreaList(request.getParameter("area_cd"));

		model.addAttribute("spcAreaList", list);

		view = "WEB-INF/views/member/AjaxJoinSpcArea.jsp";

		return view;
	}

	// 휴대폰 인증 버튼 클릭 시 문자 발송 AJAX 처리
	@ResponseBody
	@RequestMapping(value = "/sendsms.action", method = RequestMethod.POST)
	public String sendSms(@RequestParam(value = "receiver") String receiver) throws CoolsmsException
	{
		// coolsms에서 발급받은 api_key와 api_secret 코드
		String api_key = "NCSXHDF6ZGMKEB2C";
		String api_secret = "VONNHWGHSKC86IDOCJIDV9W996SH3UR9";
		String authNum = "";

		Message coolsms = new Message(api_key, api_secret);

		authNum = sendAuthNum();	// 난수 발생 메소드

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", receiver);
		params.put("from", "01099044626"); // coolsms에서 인증받은 발신번호
		params.put("type", "SMS");
		params.put("text", "[COME-IT] 인증번호 : " + authNum);
		params.put("app_version", "test app 1.2"); // application name and version

		try
		{
			// send() 는 메시지를 보내는 coolsms 함수
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println("에러코드" + obj.get("error_count"));
			//-->> 에러코드 0이 성공
		} 
		catch (CoolsmsException e)
		{
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}

		return authNum;
	}

	// 인증번호 난수 발생시키기
	public String sendAuthNum()
	{
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();

		// 영문 대문자, 숫자 조합으로 6자리 난수 발생시키기
		for (int i = 0; i < 6; i++)
		{
			int rIndex = rnd.nextInt(2);
			switch (rIndex)
			{
			case 0:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 1:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		return temp.toString();
	}
	
}
