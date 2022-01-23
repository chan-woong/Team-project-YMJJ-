package com.java.fileboard.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.fileboard.dao.BoardDao;
import com.java.fileboard.dto.BoardDto;
import com.java.command.Command;

public class ReadCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		//MyLogger.logger.info(MyLogger.logMsg+boardNumber+pageNumber);
		
		BoardDto boardDto = BoardDao.getInstanec().read(boardNumber);

		//MyLogger.logger.info(MyLogger.logMsg+boardDto.toString());
		request.setCharacterEncoding("utf-8");
		if(boardDto.getFileName() != null) {
			int index=boardDto.getFileName().indexOf("_")+1;
			boardDto.setFileName(boardDto.getFileName().substring(index));
		}
		
		request.setAttribute("pageNumber", pageNumber);
		request.setAttribute("boardDto", boardDto);
		
		return "/WEB-INF/veiws/fileboard/read.jsp";
	}

}
