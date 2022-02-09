package com.java.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.LogAspect;
import com.java.member.dto.MemberDto;
import com.java.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/member/join.do", method = RequestMethod.GET)
	public ModelAndView memberJoin(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("member/join.tiles");
	}

	@RequestMapping(value = "/member/joinOk.do", method = RequestMethod.POST)
	public ModelAndView memberJoinOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberDto", memberDto);

		memberService.memberJoinOk(mav);
		return mav;
	}

	@RequestMapping(value = "/member/ID_Check.do", method = RequestMethod.GET)
	public ModelAndView memberIdCheck(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		memberService.memberIdCheck(mav);
		return mav;
	}

	@RequestMapping(value = "/member/login.do", method = RequestMethod.GET)
	public ModelAndView memberLogin(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("member/login.tiles");
	}

	@RequestMapping(value = "/member/loginOk.do", method = RequestMethod.POST)
	public ModelAndView memberLoginOk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		memberService.memberLoginOk(mav);
		return mav;
	}

	@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public ModelAndView memberLogout(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("member/logout.tiles");
	}

	@RequestMapping(value = "/member/Mypage-Acc.do", method = RequestMethod.GET)
	public ModelAndView memberMypageAcc(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		memberService.MypageAcc(mav);
		return mav;
	}

	@RequestMapping(value = "/member/Mypage-Com.do", method = RequestMethod.GET)
	public ModelAndView memberMypageCom(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		memberService.MypageCom(mav);
		return mav;
	}

	@RequestMapping(value = "/member/Mypage-M.do", method = RequestMethod.GET)
	public ModelAndView memberMypageM(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		memberService.MypageM(mav);
		return mav;
	}

	@RequestMapping(value = "/member/Mypage-M-D.do", method = RequestMethod.GET)
	public ModelAndView memberMypageMD(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		memberService.MypageMD(mav);
		return mav;
	}

	@RequestMapping(value = "/member/delelt.do", method = RequestMethod.GET)
	public ModelAndView memberDelelt(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		memberService.Delelt(mav);
		return mav;
	}

	@RequestMapping(value = "/member/updata.do", method = RequestMethod.POST)
	public ModelAndView memberUpdata(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberDto", memberDto);
		LogAspect.logger.info(LogAspect.LogMsg + memberDto.toString());
		memberService.Updata(mav);
		return mav;
	}

	@RequestMapping(value = "/comments/Delete.do", method = RequestMethod.GET)
	public ModelAndView commentDel(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		memberService.commentDel(mav);
		return mav;
	}

}
