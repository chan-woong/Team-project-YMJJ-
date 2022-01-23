package com.java.ajax.json.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.command.Command;

public class JSONCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String msg=request.getParameter("msg");
		//MyLogger.logger.info(MyLogger.logMsg+msg);
		
		if (msg.equals("obj")) {
			return "/WEB-INF/veiws/ajax/json/jsonObj.jsp";
		}else if (msg.equals("arr")) {
			return "/WEB-INF/veiws/ajax/json/jsonArr.jsp";
		}else if (msg.equals("mix")) {
			return "/WEB-INF/veiws/ajax/json/jsonMix.jsp";
		}
		
		return null;
	}

}
