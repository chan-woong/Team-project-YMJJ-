package com.java.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.review.dto.ReviewDto;
import com.java.review.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService reviewService;

	@RequestMapping(value = "/community/ReviewList.do", method = RequestMethod.GET)
	public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		reviewService.reviewList(mav);
		return mav;
	}

	@RequestMapping(value = "/community/ReviewRead.do", method = RequestMethod.GET)
	public ModelAndView reviewRead(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		reviewService.reviewRead(mav);
		return mav;
	}

	@RequestMapping(value = "/community/ReviewUpdate.do", method = RequestMethod.GET)
	public ModelAndView reviewUpdate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		reviewService.reviewUpdate(mav);
		return mav;
	}

	@RequestMapping(value = "/community/ReviewUpdateOk.do", method = RequestMethod.POST)
	public ModelAndView reviewUpdateOk(HttpServletRequest request, HttpServletResponse response, ReviewDto reviewDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("reviewDto", reviewDto);
		reviewService.reviewUpdateOk(mav);
		return mav;
	}

	@RequestMapping(value = "/community/ReviewWrite.do", method = RequestMethod.GET)
	public ModelAndView reviewWrite(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		reviewService.reviewWrite(mav);
		return mav;
	}

	@RequestMapping(value = "/community/ReviewWriteOk.do", method = RequestMethod.POST)
	public ModelAndView reviewWriteOk(HttpServletRequest request, HttpServletResponse response, ReviewDto reviewDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("reviewDto", reviewDto);
		reviewService.reviewWriteOk(mav);
		return mav;
	}

	@RequestMapping(value = "/community/ReviewDelete", method = RequestMethod.GET)
	public ModelAndView reviewDelete(HttpServletRequest request, HttpServletResponse response) {
		String RVnumber = request.getParameter("RVnumber");
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		ModelAndView mav = new ModelAndView();
		mav.addObject("RVnumber", RVnumber);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("community/ReviewDelete.tiles");
		return mav;
	}

	@RequestMapping(value = "/community/ReviewDeleteOk", method = RequestMethod.POST)
	public ModelAndView reviewDeleteOk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		reviewService.reviewDeleteOk(mav);
		return mav;
	}

	@RequestMapping(value = "/community/RestaurantSearch", method = RequestMethod.GET)
	public ModelAndView restaurantSearch(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		reviewService.RTsearch(mav);
		return mav;
	}

}
