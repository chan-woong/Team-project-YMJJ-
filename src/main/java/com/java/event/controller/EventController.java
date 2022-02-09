package com.java.event.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.event.dto.EventDto;
import com.java.event.service.EventService;

@Controller
public class EventController {
	@Autowired
	private EventService eventService;

	@RequestMapping(value = "/community/EventList.do", method = RequestMethod.GET)
	public ModelAndView fileBoardList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		eventService.eventList(mav);
		return mav;
	}

	@RequestMapping(value = "/community/EventWrite.do", method = RequestMethod.GET)
	public ModelAndView eventWrite(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		eventService.eventWrite(mav);
		return mav;
	}

	@RequestMapping(value = "/community/EventWriteOk.do", method = RequestMethod.POST)
	public ModelAndView eventWriteOk(HttpServletRequest request, HttpServletResponse response, EventDto eventDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("eventDto", eventDto);
		eventService.eventWriteOk(mav);
		return mav;
	}

	@RequestMapping(value = "/community/EventRead.do", method = RequestMethod.GET)
	public ModelAndView eventRead(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		eventService.eventRead(mav);
		return mav;
	}

	public ModelAndView eventDownload(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		eventService.eventDownload(mav);
		return null;
	}

	@RequestMapping(value = "community/EventDeleteOk.do", method = RequestMethod.GET)
	public ModelAndView noticeBoardDeleteOk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		eventService.eventDeleteOk(mav);
		return mav;
	}

	@RequestMapping(value = "/community/EventUpdate.do", method = RequestMethod.GET)
	public ModelAndView EventUpdate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		eventService.eventUpdate(mav);
		return mav;
	}

	@RequestMapping(value = "/community/EventUpdateOk.do", method = RequestMethod.POST)
	public ModelAndView reviewUpdateOk(HttpServletRequest request, HttpServletResponse response, EventDto eventDto) {

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("eventDto", eventDto);

		eventService.eventUpdateOk(mav);

		return mav;
	}

}
