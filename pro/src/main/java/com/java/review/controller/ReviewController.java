package com.java.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.review.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value="/community/ReviewList.do", method = RequestMethod.GET)
	public ModelAndView reviewList(HttpServletRequest request,HttpServletResponse response) {
		return new ModelAndView("community/ReviewList");
	}
	
	@RequestMapping(value="/community/ReviewRead.do", method = RequestMethod.GET)
	public ModelAndView aboutjejuLocation(HttpServletRequest request,HttpServletResponse response) {
		return new ModelAndView("community/ReviewRead");
	}
	
	@RequestMapping(value="/community/ReviewUpdate.do", method = RequestMethod.GET)
	public ModelAndView aboutjejuSpeciality(HttpServletRequest request,HttpServletResponse response) {
		return new ModelAndView("community/ReviewUpdate");
	}
	
	@RequestMapping(value="/community/ReviewWrite.do", method = RequestMethod.GET)
	public ModelAndView aboutjejuactivities(HttpServletRequest request,HttpServletResponse response) {
		return new ModelAndView("community/ReviewWrite");
	}
}
