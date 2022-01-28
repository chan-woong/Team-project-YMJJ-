package com.java.restaurant.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.LogAspect;
import com.java.restaurant.dao.RestaurantDao;
import com.java.restaurant.dto.RestaurnatDto;

@Component
public class RestaurantServiceImp implements RestaurantService {
	
	@Autowired
	private RestaurantDao restaurantDao;

	@Override
	public void restaurnatWrite(ModelAndView mav) {
		String RTnumber="0";							// 글번호 : ROOT 항상 boardNumber 0, 답글인 경우 부모의 boardNumber							// 글레벨
		
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		if(request.getParameter("RTnumber") !=null) {   
			RTnumber=(request.getParameter("RTnumber"));
		}  
		
		//Integer.parseInt
		mav.addObject("RTnumber", RTnumber);
		
		mav.setViewName("restaurant/Restaurant_Add");
	}
	
	@Override
	public void restaurnatWriteOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		RestaurnatDto restaurnatDto=(RestaurnatDto) map.get("restaurnatDto");
		
		//writeNumber(restaurnatDto);
		LogAspect.logger.info(LogAspect.LogMsg + restaurnatDto.toString());
		
		// DB
		int check=restaurantDao.restaurantWriteOk(restaurnatDto);
		LogAspect.logger.info(LogAspect.LogMsg + check);
		
		mav.addObject("check", check);
		mav.setViewName("restaurant/writeOk");
	}
	
}
