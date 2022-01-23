package com.java.board.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.board.dao.BoardDao;
import com.java.board.dto.BoardDto;
import com.java.command.Command;

public class ListCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber = "1";
		
		int currentPage = Integer.parseInt(pageNumber);
		
		//MyLogger.logger.info(MyLogger.logMsg+currentPage);
		
		int boardSize = 5;											// 한 page당 게시물
		int startRow = (currentPage - 1)*boardSize+1;				// 1 page : (1-1)=0*10=0+1=1  / 2 page : (2-1)=1*10=10+1=11 / 3 page : (3-1)=2*10=20+1=21
		int endRow = currentPage * boardSize;						// 1*10=10 / 2*10=20
		
		int count = BoardDao.getInstance().getCount();
		List<BoardDto> boardList = null;
		if(count > 0) {
			boardList = BoardDao.getInstance().boardList(startRow, endRow);
		}
		
		//MyLogger.logger.info(MyLogger.logMsg+count);
		
		request.setAttribute("boardList", boardList);				// 게시물 리스트

		request.setAttribute("count", count);						// 총 게시물수
		request.setAttribute("boardSize", boardSize);				// 한페이지당 게시물수
		request.setAttribute("currentPage", currentPage);			// 요청 페이지
		
		return "/WEB-INF/veiws/board/list.jsp";
	}

}
