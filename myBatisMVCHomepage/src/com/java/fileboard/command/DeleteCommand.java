package com.java.fileboard.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.command.Command;

public class DeleteCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		
		//MyLogger.logger.info(MyLogger.logMsg+boardNumber+pageNumber);

		request.setAttribute("boardNumber", boardNumber);
		request.setAttribute("pageNumber", pageNumber);
		return "/WEB-INF/veiws/fileboard/delete.jsp";
	}

}
