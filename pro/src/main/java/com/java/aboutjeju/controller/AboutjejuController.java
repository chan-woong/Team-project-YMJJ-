package com.java.aboutjeju.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.aboutjeju.service.AboutjejuService;

@Controller
public class AboutjejuController {
	@Autowired
	private AboutjejuService aboutjejuService;
	
	@RequestMapping(value="/aboutjeju/introduction.do", method = RequestMethod.GET)
	public ModelAndView aboutjejuIntroduction(HttpServletRequest request,HttpServletResponse response) {
		return new ModelAndView("aboutjeju/introduction");
	}
	
	@RequestMapping(value="/aboutjeju/location.do", method = RequestMethod.GET)
	public ModelAndView aboutjejuLocation(HttpServletRequest request,HttpServletResponse response) {
		return new ModelAndView("aboutjeju/location");
	}
	
	@RequestMapping(value="/aboutjeju/speciality.do", method = RequestMethod.GET)
	public ModelAndView aboutjejuSpeciality(HttpServletRequest request,HttpServletResponse response) {
		return new ModelAndView("aboutjeju/speciality");
	}
	
	@RequestMapping(value="/aboutjeju/activities.do", method = RequestMethod.GET)
	public ModelAndView aboutjejuactivities(HttpServletRequest request,HttpServletResponse response) {
		return new ModelAndView("aboutjeju/activities");
	}
}
