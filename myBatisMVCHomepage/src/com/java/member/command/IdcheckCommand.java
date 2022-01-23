package com.java.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.command.Command;
import com.java.member.dao.MemberDao;

public class IdcheckCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
		//MyLogger.logger.info(MyLogger.logMsg+id);
		
		//해당 아이디가 있으면 1 아이디가 없으면 0
		int check = MemberDao.getInstanec().idCheck(id);
		//MyLogger.logger.info(MyLogger.logMsg+check);
		
		request.setAttribute("id", id);
		request.setAttribute("check", check);
		
		return "/WEB-INF/veiws/member/idCheck.jsp";
	}

}
