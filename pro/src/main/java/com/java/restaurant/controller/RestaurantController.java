package com.java.restaurant.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.restaurant.dto.RestaurnatDto;
import com.java.restaurant.service.RestaurantService;

@Controller
public class RestaurantController {
	
	@Autowired
	private RestaurantService restaurantService;
	
	@RequestMapping(value="/restaurant/main.do", method = RequestMethod.GET)
	public ModelAndView restaurantMain(HttpServletRequest request,HttpServletResponse response) {
		return new ModelAndView("restaurant/Restaurant_Main_Admin");
	}
	
	@RequestMapping(value="/restaurant/write.do", method = RequestMethod.GET)
	public ModelAndView restaurantWrite(HttpServletRequest request,HttpServletResponse response) {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		restaurantService.restaurnatWrite(mav);
		return mav;
		
	}
	
	@RequestMapping(value="/restaurant/writeOk.do", method=RequestMethod.POST)
	public ModelAndView restaurantboardWriteOk(HttpServletRequest request, HttpServletResponse response, RestaurnatDto restaurnatDto) {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("restaurnatDto", restaurnatDto);
		
		restaurantService.restaurnatWriteOk(mav);
		return mav;
	}
	
	@RequestMapping(value="/restaurant/update.do", method = RequestMethod.GET)
	public ModelAndView restaurantUdate(HttpServletRequest request,HttpServletResponse response) {
		return new ModelAndView("restaurant/Restaurant_Update");
	}
	
	@RequestMapping(value="/restaurant/introduction.do", method = RequestMethod.GET)
	public ModelAndView restaurantIntroduction(HttpServletRequest request,HttpServletResponse response) {
		return new ModelAndView("restaurant/Restaurant_Introduction");
	}

}
