package com.java.review.service;

import org.springframework.web.servlet.ModelAndView;

public interface ReviewService {
	public void reviewList(ModelAndView mav);

	public void reviewWrite(ModelAndView mav);

	public void reviewWriteOk(ModelAndView mav);

	public void reviewRead(ModelAndView mav);

	public void reviewDeleteOk(ModelAndView mav);

	public void reviewUpdate(ModelAndView mav);

	public void reviewUpdateOk(ModelAndView mav);

	public void RTsearch(ModelAndView mav);

}
