package com.java.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.board.dao.BoardDao;
import com.java.command.Command;

public class DeleteOkCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		String password = request.getParameter("password");
		
		//MyLogger.logger.info(MyLogger.logMsg+boardNumber+pageNumber + password);

		int check = BoardDao.getInstance().delete(boardNumber,password);
		
		//MyLogger.logger.info(MyLogger.logMsg+check);
		
		request.setAttribute("pageNumber", pageNumber);
		request.setAttribute("check", check);
		request.setAttribute("boardNumber", boardNumber);
		
		return "/WEB-INF/veiws/board/deleteOk.jsp";
	}

}
