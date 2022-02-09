package com.java.member.service;

import org.springframework.web.servlet.ModelAndView;

public interface MemberService {

	void memberJoinOk(ModelAndView mav);

	void memberIdCheck(ModelAndView mav);

	void memberLoginOk(ModelAndView mav);

	void MypageAcc(ModelAndView mav);

	void MypageM(ModelAndView mav);

	void MypageMD(ModelAndView mav);

	void Delelt(ModelAndView mav);

	void Updata(ModelAndView mav);

	void MypageCom(ModelAndView mav);

	void commentDel(ModelAndView mav);

}
