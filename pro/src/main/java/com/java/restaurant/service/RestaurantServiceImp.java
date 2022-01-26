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
		int RTnumber=0;							// 글번호 : ROOT 항상 boardNumber 0, 답글인 경우 부모의 boardNumber
		int groupNumber=1;							// 그룹번호
		int sequenceNumber=0;						// 글순서
		int sequenceLevel=0;							// 글레벨
		
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		if(request.getParameter("RTnumber") !=null) {   
			RTnumber=Integer.parseInt(request.getParameter("RTnumber"));
			groupNumber=Integer.parseInt(request.getParameter("group_Number"));
			sequenceNumber=Integer.parseInt(request.getParameter("sequence_Number"));
			sequenceLevel=Integer.parseInt(request.getParameter("sequence_Level"));
		}  
		
		mav.addObject("RTnumber", RTnumber);
		mav.addObject("group_Number", groupNumber);
		mav.addObject("sequence_Number", sequenceNumber);
		mav.addObject("sequence_Level", sequenceLevel);
		
		mav.setViewName("restaurant/Restaurant_Add");
	}
	
	@Override
	public void restaurnatWriteOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		RestaurnatDto restaurnatDto=(RestaurnatDto) map.get("restaurnatDto");
		
		writeNumber(restaurnatDto);
		LogAspect.logger.info(LogAspect.LogMsg + restaurnatDto.toString());
		
		// DB
		int check=restaurantDao.restaurantWriteOk(restaurnatDto);
		LogAspect.logger.info(LogAspect.LogMsg + check);
		
		mav.addObject("check", check);
		mav.setViewName("restaurant/writeOk");
	}
	
	public void writeNumber(RestaurnatDto restaurnatDto) {
		int RTnumber=restaurnatDto.getRTnumber();
		int groupNumber=restaurnatDto.getGroup_Number();
		int sequenceNumber=restaurnatDto.getSequence_Number();
		int sequenceLevel=restaurnatDto.getSequence_Level();
			
		if(RTnumber==0) {  // ROOT(부모글) : 그룹번호 작업
			int max=restaurantDao.boardGroupNumberMax();
			
			if(max !=0) {
				max=max+1;
				restaurnatDto.setGroup_Number(max);
			}
		}else {  							// 자식글 : 글순서, 글레벨 작업
			HashMap<String, Integer> hMap=new HashMap<String, Integer>();
			hMap.put("group_Number", groupNumber);
			hMap.put("sequence_Number", sequenceNumber);
			
			int check=restaurantDao.boardWriteNumber(hMap);
			LogAspect.logger.info(LogAspect.LogMsg + check);
			
			sequenceNumber=sequenceNumber+1;
			sequenceLevel=sequenceLevel+1;
			
			restaurnatDto.setSequence_Number(sequenceNumber);
			restaurnatDto.setSequence_Level(sequenceLevel);
		}
	}

}
