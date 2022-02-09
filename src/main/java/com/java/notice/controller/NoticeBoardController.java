package com.java.notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.notice.dto.NoticeBoardDto;
import com.java.notice.service.NoticeBoardService;

@Controller
public class NoticeBoardController {
	@Autowired
	private NoticeBoardService noticeBoardService;

	@RequestMapping(value = "/community/NoticeWrite.do", method = RequestMethod.GET)
	public ModelAndView noticeBoardWrite(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		noticeBoardService.noticeBoardWrite(mav);
		return mav;
	}

	@RequestMapping(value = "/community/NoticeWriteOk.do", method = RequestMethod.POST)
	public ModelAndView noticeBoardWriteOk(HttpServletRequest request, HttpServletResponse response,
			NoticeBoardDto noticeBoardDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticeBoardDto", noticeBoardDto);
		noticeBoardService.noticeBoardWriteOk(mav);
		return mav;
	}

	@RequestMapping(value = "/community/Notice3.do", method = RequestMethod.GET)
	public ModelAndView noticeBoardList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		noticeBoardService.noticeBoardlist(mav);
		return mav;
	}

	@RequestMapping(value = "/community/NoticeDeleteOk.do", method = RequestMethod.GET)
	public ModelAndView noticeBoardDeleteOk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		noticeBoardService.noticeBoardDeleteOk(mav);
		return mav;
	}

	@RequestMapping(value = "/community/NoticeUpdate.do", method = RequestMethod.GET)
	public ModelAndView noticeBoardUpdate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		noticeBoardService.noticeBoardUpdate(mav);
		return mav;
	}

	@RequestMapping(value = "/community/NoticeUpdateOk.do", method = RequestMethod.POST)
	public ModelAndView noticeBoardUpdateOk(HttpServletRequest request, HttpServletResponse response,
			NoticeBoardDto noticeBoardDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("noticeBoardDto", noticeBoardDto);
		noticeBoardService.noticeBoardUpdateOk(mav);
		return mav;
	}

}
