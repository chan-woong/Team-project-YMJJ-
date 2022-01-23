package com.java.guest.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.command.Command;
import com.java.guest.dao.GuestDao;
import com.java.guest.dto.GuestDto;

public class WriteCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		ArrayList<GuestDto> guestList = GuestDao.getInstanec().guestList();
		
		//MyLogger.logger.info(MyLogger.logMsg+guestList.size());
		
		request.setAttribute("guestList", guestList);
		
		return "/WEB-INF/veiws/guest/write.jsp";
		*/

		//1. 한 page당 게시물 수 : 10(시작 번호 1 , 끝 번호 10) / 3 (시작 번호 1 , 끝 번호 3)
		String pageNumber = request.getParameter("pageNumber");		//현제 페이지 번호
		if(pageNumber==null) pageNumber="1";
		
		int currentPage = Integer.parseInt(pageNumber);			 	// 현제 페이지 번호
		
		int boardSize = 3;											// 한 page당 게시물
		int startRow = (currentPage - 1)*boardSize+1;				// 1 page : (1-1)=0*10=0+1=1  / 2 page : (2-1)=1*10=10+1=11 / 3 page : (3-1)=2*10=20+1=21
		int endRow = currentPage * boardSize;						// 1*10=10 / 2*10=20
		
		int count = GuestDao.getInstanec().getCount();				// 전체 레코드 수
		//MyLogger.logger.info(MyLogger.logMsg+count);

		List<GuestDto> guestList = null;
		if(count > 0) {
			guestList = GuestDao.getInstanec().guestList(startRow,endRow);
			//MyLogger.logger.info(MyLogger.logMsg+guestList.size());
		}
		request.setAttribute("guestList", guestList);

		request.setAttribute("count", count);
		request.setAttribute("boardSize", boardSize);
		request.setAttribute("currentPage", currentPage);
		
		return "/WEB-INF/veiws/guest/write.jsp";
	}

}
