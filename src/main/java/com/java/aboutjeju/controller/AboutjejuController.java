package com.java.aboutjeju.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.aboutjeju.dto.AboutjejuDto;
import com.java.aboutjeju.service.AboutjejuService;
import com.java.member.dto.MemberDto;

@Controller
public class AboutjejuController {
	@Autowired
	private AboutjejuService aboutjejuService;
	
	@RequestMapping(value="/aboutjeju/write.do", method = RequestMethod.GET)
	public ModelAndView writeOk(HttpServletRequest request,HttpServletResponse response) {
		return new ModelAndView("aboutjeju/write.tiles");
	}
	@RequestMapping(value="/aboutjeju/writeOk.do", method = RequestMethod.POST)
	public ModelAndView wirte(HttpServletRequest request,HttpServletResponse response,AboutjejuDto aboutjejuDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("aboutjejuDto", aboutjejuDto);
		aboutjejuService.write(mav);
		return mav;
	}
	@RequestMapping(value="/aboutjeju/introduction.do", method = RequestMethod.GET)
	public ModelAndView Introductionread(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		
		aboutjejuService.Iread(mav);
		//return new ModelAndView("aboutjeju/introduction");
		return mav;
	}
	
	@RequestMapping(value="/aboutjeju/location.do", method = RequestMethod.GET)
	public ModelAndView Locationread(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);

		aboutjejuService.Lread(mav);
		//return new ModelAndView("aboutjeju/location");
		return mav;
	}
	
	@RequestMapping(value="/aboutjeju/speciality.do", method = RequestMethod.GET)
	public ModelAndView Specialityread(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);

		aboutjejuService.Sread(mav);
		//return new ModelAndView("aboutjeju/speciality");
		return mav;
	}
	
	@RequestMapping(value="/aboutjeju/activities.do", method = RequestMethod.GET)
	public ModelAndView activitiesread(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);

		aboutjejuService.Aread(mav);
		//return new ModelAndView("aboutjeju/activites");
		return mav;
	}
	@RequestMapping(value="/aboutjeju/listDelect.do", method = RequestMethod.GET)
	public ModelAndView listDelect(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);

		aboutjejuService.Aread(mav);
		//return new ModelAndView("aboutjeju/activites");
		return mav;
	}
	
}
