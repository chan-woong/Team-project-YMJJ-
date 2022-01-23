package com.java.fileboard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.java.fileboard.dto.FileBoardDto;
import com.java.fileboard.service.FileBoardService;
@Controller
public class FileBoardController{
	@Autowired
	private FileBoardService fileBoardService;
	@RequestMapping(value = "/fileboard/write.do",method = RequestMethod.GET)
	public ModelAndView fileBoardWrite(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		fileBoardService.fileBoardWrite(mav);
		return mav;
	}
	@RequestMapping(value = "/fileboard/writeOk.do",method = RequestMethod.POST)
	public ModelAndView fileBoardWriteOk(HttpServletRequest request, HttpServletResponse response, FileBoardDto fileBoardDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("fileBoardDto", fileBoardDto);
		fileBoardService.fileBoardWriteOk(mav);
		return mav;
	}
	@RequestMapping(value = "/fileboard/list.do",method = RequestMethod.GET)
	public ModelAndView fileboardList(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		fileBoardService.fileBoardList(mav);
		return mav;
	}
	@RequestMapping(value = "/fileboard/read.do",method = RequestMethod.GET)
	public ModelAndView fileboardRead(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		fileBoardService.fileBoardRead(mav);
		return mav;
	}
	@RequestMapping(value = "/fileboard/downLoad.do",method = RequestMethod.GET)
	public ModelAndView fileDownLoad(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		fileBoardService.fileDownLoad(mav);
		return null;
	}
}
