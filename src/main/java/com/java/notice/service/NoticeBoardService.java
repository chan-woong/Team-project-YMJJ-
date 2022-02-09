package com.java.notice.service;

import org.springframework.web.servlet.ModelAndView;

public interface NoticeBoardService {

	public void noticeBoardWrite(ModelAndView mav);

	public void noticeBoardWriteOk(ModelAndView mav);

	public void noticeBoardlist(ModelAndView mav);

	public void noticeBoardDeleteOk(ModelAndView mav);

	public void noticeBoardUpdate(ModelAndView mav);

	public void noticeBoardUpdateOk(ModelAndView mav);

}
