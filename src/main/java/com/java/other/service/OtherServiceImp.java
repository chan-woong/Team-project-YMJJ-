package com.java.other.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.member.dto.RankingDto;
import com.java.other.dao.OtherDao;
import com.java.restaurant.dto.RestaurnatDto;

@Component
public class OtherServiceImp implements OtherService {
	@Autowired
	private OtherDao otherDao;

	@Override
	public void getRestaurnat(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		List<RestaurnatDto> RestaurnatList = null;
		RestaurnatList = otherDao.getRestaurnatList(request.getParameter("RTtype"));
		mav.addObject("RestaurnatList", RestaurnatList);
		mav.addObject("Count", RestaurnatList.size());
		mav.addObject("RTtype", request.getParameter("RTtype"));
		mav.setViewName("/other/map.tiles");
	}

	@Override
	public void selectRestaurnat(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		List<RestaurnatDto> RestaurnatList = null;
		RestaurnatList = otherDao.selectRestaurnatList(request.getParameter("RTname"));
		mav.addObject("RestaurnatList", RestaurnatList);
		mav.addObject("Count", RestaurnatList.size());
		mav.setViewName("/other/map.tiles");
	}

	@Override
	public void OtherToday(ModelAndView mav) {
		List<RankingDto> rankingList = null;
		rankingList = otherDao.selectRankingList();
		mav.addObject("rankingList", rankingList);
		mav.setViewName("/other/today.tiles");
	}

}
