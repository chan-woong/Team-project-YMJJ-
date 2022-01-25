package com.java.notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.notice.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value="/community/Notice.do", method = RequestMethod.GET)
	public ModelAndView reviewList(HttpServletRequest request,HttpServletResponse response) {
		return new ModelAndView("community/Notice");
	}
	@RequestMapping(value="/community/NoticeWrite.do", method = RequestMethod.GET)
	public ModelAndView aboutjejuactivities(HttpServletRequest request,HttpServletResponse response) {
		return new ModelAndView("community/NoticeWrite");
	}
}
