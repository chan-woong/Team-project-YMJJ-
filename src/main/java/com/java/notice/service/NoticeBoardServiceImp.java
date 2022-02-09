package com.java.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.LogAspect;
import com.java.notice.dao.NoticeBoardDao;
import com.java.notice.dto.NoticeBoardDto;



@Component
public class NoticeBoardServiceImp implements NoticeBoardService {
	@Autowired
	private NoticeBoardDao noticeBoardDao;
	
	@Override
	public void noticeBoardWrite(ModelAndView mav) {
		int cnumber=0;				// 글번호
		
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request =(HttpServletRequest)map.get("request");
		
		if(request.getParameter("cnumber")!=null) {
			cnumber=Integer.parseInt(request.getParameter("cnumber"));
		}
		
		mav.addObject("cnumber",cnumber);
		
		mav.setViewName("community/NoticeWrite.tiles");
	}
	
	@Override
	public void noticeBoardWriteOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		NoticeBoardDto noticeBoardDto = (NoticeBoardDto)map.get("noticeBoardDto");
		
		LogAspect.logger.info(LogAspect.LogMsg+noticeBoardDto.toString());
		
		//DB
		int check=noticeBoardDao.noticeBoardWriteOk(noticeBoardDto);
		LogAspect.logger.info(LogAspect.LogMsg+check);
		
		mav.addObject("check", check);
		mav.setViewName("community/NoticeWriteOk.tiles");
	}
	

	
	
	@Override
	public void noticeBoardlist(ModelAndView mav) {
		LogAspect.logger.info(LogAspect.LogMsg);
		
		int count=noticeBoardDao.getCount();
		LogAspect.logger.info(LogAspect.LogMsg+count);
		
		// 한페이지당 게시물 1page 10개 / start 1, end 10
		int startRow=1;
		int endRow=20;
		
		List<NoticeBoardDto> noticeBoardList=null;
		if(count > 0) {
			noticeBoardList=noticeBoardDao.noticeBoardList(startRow, endRow);
			LogAspect.logger.info(LogAspect.LogMsg + noticeBoardList.size());
		}
		
		mav.addObject("noticeBoardList", noticeBoardList);     			// 게시물 리스트
		mav.addObject("count",count);
		mav.setViewName("community/Notice3.tiles");		
		
	}
	
	@Override
	public void noticeBoardDeleteOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		LogAspect.logger.info(LogAspect.LogMsg+ request);
		
		
		int cnumber=Integer.parseInt(request.getParameter("cnumber"));
		LogAspect.logger.info(LogAspect.LogMsg + cnumber);
		
		int check=noticeBoardDao.noticeBoardDeleteOk(cnumber);
		LogAspect.logger.info(LogAspect.LogMsg + check);
		
		mav.addObject("check", check);
		mav.setViewName("community/NoticeDeleteOk.tiles");
	}
	
	@Override
	public void noticeBoardUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int cnumber=Integer.parseInt(request.getParameter("cnumber"));
		LogAspect.logger.info(LogAspect.LogMsg + cnumber);
		
		NoticeBoardDto noticeBoardDto=noticeBoardDao.noticeBoardUpdateSelect(cnumber);
		LogAspect.logger.info(LogAspect.LogMsg + noticeBoardDto.toString());
		
		mav.addObject("noticeBoardDto",noticeBoardDto);
		mav.setViewName("community/NoticeUpdate.tiles");
		
	}
	
	@Override
	public void noticeBoardUpdateOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
	
		NoticeBoardDto noticeBoardDto=(NoticeBoardDto) map.get("noticeBoardDto");
		LogAspect.logger.info(LogAspect.LogMsg + noticeBoardDto.toString());
		
		// boardupdateok만들기 dao
		int check=noticeBoardDao.boardUpdateOk(noticeBoardDto);
		LogAspect.logger.info(LogAspect.LogMsg + check);
		
		mav.addObject("check", check);
		mav.setViewName("community/NoticeUpdateOk.tiles");
		
	}
	
	
}













