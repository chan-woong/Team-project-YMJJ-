package com.java.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.command.Command;
import com.java.member.dao.MemberDao;

public class LoginOkCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		//MyLogger.logger.info(MyLogger.logMsg+id+"  ,  "+password);
		
		String memberLevel=MemberDao.getInstanec().loginCheck(id,password);

		//MyLogger.logger.info(MyLogger.logMsg+memberLevel);
		
		request.setAttribute("memberLevel", memberLevel);
		request.setAttribute("id", id);
		
		return "/WEB-INF/veiws/member/loginOk.jsp";
	}

}
