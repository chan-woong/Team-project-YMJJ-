package com.java.event.service;

import org.springframework.web.servlet.ModelAndView;

public interface EventService {

	public void eventList(ModelAndView mav);

	public void eventWrite(ModelAndView mav);

	public void eventWriteOk(ModelAndView mav);

	public void eventRead(ModelAndView mav);

	public void eventDownload(ModelAndView mav);

	public void eventUpdate(ModelAndView mav);

	public void eventDeleteOk(ModelAndView mav);

	public void eventUpdateOk(ModelAndView mav);
}
