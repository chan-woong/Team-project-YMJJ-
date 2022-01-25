package com.java.event.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.event.service.EventService;

@Controller
public class EventController {
	@Autowired
	private EventService eventService;
	
	@RequestMapping(value="/community/EventList.do", method = RequestMethod.GET)
	public ModelAndView reviewList(HttpServletRequest request,HttpServletResponse response) {
		return new ModelAndView("community/EventList");
	}
	
	@RequestMapping(value="/community/EventRead.do", method = RequestMethod.GET)
	public ModelAndView aboutjejuLocation(HttpServletRequest request,HttpServletResponse response) {
		return new ModelAndView("community/EventRead");
	}
	
	@RequestMapping(value="/community/EventUpdate.do", method = RequestMethod.GET)
	public ModelAndView aboutjejuSpeciality(HttpServletRequest request,HttpServletResponse response) {
		return new ModelAndView("community/EventUpdate");
	}
	
	@RequestMapping(value="/community/EventWrite.do", method = RequestMethod.GET)
	public ModelAndView aboutjejuactivities(HttpServletRequest request,HttpServletResponse response) {
		return new ModelAndView("community/EventWrite");
	}
}
