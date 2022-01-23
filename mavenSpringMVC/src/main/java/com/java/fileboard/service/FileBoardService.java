package com.java.fileboard.service;

import org.springframework.web.servlet.ModelAndView;

public interface FileBoardService {

	void fileBoardWrite(ModelAndView mav);

	void fileBoardWriteOk(ModelAndView mav);

	void fileBoardList(ModelAndView mav);

	void fileBoardRead(ModelAndView mav);

	void fileDownLoad(ModelAndView mav);

}
