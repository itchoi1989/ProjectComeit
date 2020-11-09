package com.sys.comeit.idao;

import java.util.ArrayList;

import com.sys.comeit.dto.MemberDTO;

public interface ILectureLecStudentDAO
{
	public ArrayList<MemberDTO> getStudentInfo(String lec_cd);
}
