package com.java.guest.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.command.Command;
import com.java.guest.dao.GuestDao;
import com.java.guest.dto.GuestDto;

public class UpdateCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));

		GuestDto guestDto = GuestDao.getInstanec().upSelect(num);
		
		//MyLogger.logger.info(MyLogger.logMsg+guestDto.toString());
		request.setAttribute("guestDto", guestDto);
		
		return "/WEB-INF/veiws/guest/update.jsp";
	}

}
