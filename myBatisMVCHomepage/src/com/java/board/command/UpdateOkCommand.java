package com.java.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.board.dao.BoardDao;
import com.java.board.dto.BoardDto;
import com.java.command.Command;

public class UpdateOkCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		
		BoardDto boardDto = new BoardDto();
		boardDto.setBoardNumber( Integer.parseInt(request.getParameter("boardNumber")));
		boardDto.setSubject(request.getParameter("subject"));
		boardDto.setEmail(request.getParameter("email"));
		boardDto.setContent(request.getParameter("content"));
		boardDto.setPassword(request.getParameter("password"));
		
		//MyLogger.logger.info(MyLogger.logMsg+boardDto.toString()+pageNumber);
		
		int check = BoardDao.getInstance().update(boardDto);
		
		//MyLogger.logger.info(MyLogger.logMsg+check);
		request.setAttribute("check", check);
		request.setAttribute("pageNumber", pageNumber);
		request.setAttribute("boardNumber", boardNumber);
		return "/WEB-INF/veiws/board/updateOk.jsp";
	}

}
