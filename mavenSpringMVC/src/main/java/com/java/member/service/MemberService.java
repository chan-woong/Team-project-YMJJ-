package com.java.member.service;

import org.springframework.web.servlet.ModelAndView;

public interface MemberService {

	void memberRegisterOk(ModelAndView mav);

	void memberLoginOk(ModelAndView mav);

	void memberIdCheck(ModelAndView mav);

	void memberUpdate(ModelAndView mav);

	void memberUpdateOk(ModelAndView mav);

	void memberDeleteOk(ModelAndView mav);

}
