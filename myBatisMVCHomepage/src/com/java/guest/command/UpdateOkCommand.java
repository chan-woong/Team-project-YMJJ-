package com.java.guest.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.command.Command;
import com.java.guest.dao.GuestDao;
import com.java.guest.dto.GuestDto;

public class UpdateOkCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		GuestDto guestDto = new GuestDto();
		guestDto.setNum(Integer.parseInt(request.getParameter("num")));
		guestDto.setMessage(request.getParameter("message").replace("\r\n","<br/>"));
		//MyLogger.logger.info(MyLogger.logMsg+guestDto.toString());
		int check = GuestDao.getInstanec().update(guestDto);
		//MyLogger.logger.info(MyLogger.logMsg+ckeck);
		request.setAttribute("check", check);
		return "/WEB-INF/veiws/guest/updateOk.jsp";
	}

}
