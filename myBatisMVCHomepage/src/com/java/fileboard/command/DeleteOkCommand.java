package com.java.fileboard.command;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.fileboard.dao.BoardDao;
import com.java.fileboard.dto.BoardDto;
import com.java.command.Command;

public class DeleteOkCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		String password = request.getParameter("password");
		
		//MyLogger.logger.info(MyLogger.logMsg+boardNumber+pageNumber + password);

		BoardDto readBoard=BoardDao.getInstanec().update(boardNumber);
		int check = BoardDao.getInstanec().delete(boardNumber,password);
		
		//MyLogger.logger.info(MyLogger.logMsg+check);
		if(check > 0 && readBoard.getPath() != null) {
			File file = new File(readBoard.getPath());
			if(file.exists() && file.isFile()) file.delete();
		}
		
		request.setAttribute("pageNumber", pageNumber);
		request.setAttribute("check", check);
		request.setAttribute("boardNumber", boardNumber);
		
		return "/WEB-INF/veiws/fileboard/deleteOk.jsp";
	}

}
