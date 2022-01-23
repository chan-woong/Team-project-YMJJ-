package com.java.reply.command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.command.Command;
import com.java.logger.MyLogger;
import com.java.reply.dao.ReplyDao;

public class ReplyDeleteCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int bunho = Integer.parseInt(request.getParameter("bunho"));
		//MyLogger.logger.info(MyLogger.logMsg+bunho);
		int check=ReplyDao.getInstance().delete(bunho);
		//MyLogger.logger.info(MyLogger.logMsg+check);
		if (check != 0) {
			response.setContentType("application/txt;charset=utf-8");
			PrintWriter out =response.getWriter();
			out.print(bunho);
		}
		return null;
	}

}
