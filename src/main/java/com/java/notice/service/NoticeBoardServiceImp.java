package com.java.notice.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.notice.dao.NoticeBoardDao;
import com.java.notice.dto.NoticeBoardDto;

@Component
public class NoticeBoardServiceImp implements NoticeBoardService {
	@Autowired
	private NoticeBoardDao noticeBoardDao;

	@Override
	public void noticeBoardWrite(ModelAndView mav) {
		int cnumber = 0; // 글번호
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		if (request.getParameter("cnumber") != null) {
			cnumber = Integer.parseInt(request.getParameter("cnumber"));
		}
		mav.addObject("cnumber", cnumber);
		mav.setViewName("community/NoticeWrite.tiles");
	}

	@Override
	public void noticeBoardWriteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		NoticeBoardDto noticeBoardDto = (NoticeBoardDto) map.get("noticeBoardDto");
		int check = noticeBoardDao.noticeBoardWriteOk(noticeBoardDto);
		mav.addObject("check", check);
		mav.setViewName("community/NoticeWriteOk.tiles");
	}

	@Override
	public void noticeBoardlist(ModelAndView mav) {
		int count = noticeBoardDao.getCount();
		int startRow = 1;
		int endRow = 20;
		List<NoticeBoardDto> noticeBoardList = null;
		if (count > 0) {
			noticeBoardList = noticeBoardDao.noticeBoardList(startRow, endRow);
		}
		mav.addObject("noticeBoardList", noticeBoardList); // 게시물 리스트
		mav.addObject("count", count);
		mav.setViewName("community/Notice3.tiles");
	}

	@Override
	public void noticeBoardDeleteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int cnumber = Integer.parseInt(request.getParameter("cnumber"));
		int check = noticeBoardDao.noticeBoardDeleteOk(cnumber);
		mav.addObject("check", check);
		mav.setViewName("community/NoticeDeleteOk.tiles");
	}

	@Override
	public void noticeBoardUpdate(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int cnumber = Integer.parseInt(request.getParameter("cnumber"));
		NoticeBoardDto noticeBoardDto = noticeBoardDao.noticeBoardUpdateSelect(cnumber);
		mav.addObject("noticeBoardDto", noticeBoardDto);
		mav.setViewName("community/NoticeUpdate.tiles");
	}

	@Override
	public void noticeBoardUpdateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		NoticeBoardDto noticeBoardDto = (NoticeBoardDto) map.get("noticeBoardDto");
		int check = noticeBoardDao.boardUpdateOk(noticeBoardDto);
		mav.addObject("check", check);
		mav.setViewName("community/NoticeUpdateOk.tiles");
	}

}
