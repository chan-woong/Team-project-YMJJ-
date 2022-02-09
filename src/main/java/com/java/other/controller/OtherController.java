package com.java.other.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.other.service.OtherService;

@Controller
public class OtherController {
	@Autowired
	private OtherService otherService;

	@RequestMapping(value = "/other/map.do", method = RequestMethod.GET)
	public ModelAndView OtherMap(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("other/map.tiles");
	}

	@RequestMapping(value = "/other/today.do", method = RequestMethod.GET)
	public ModelAndView OtherToday(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		otherService.OtherToday(mav);
		return mav;
	}

	@RequestMapping(value = "/other/getRestaurnat.do", method = RequestMethod.GET)
	public ModelAndView getRestaurnat(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		otherService.getRestaurnat(mav);
		return mav;
	}

	@RequestMapping(value = "/other/selectRestaurnat.do", method = RequestMethod.GET)
	public ModelAndView selectRestaurnat(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		otherService.selectRestaurnat(mav);
		return mav;
	}
}
