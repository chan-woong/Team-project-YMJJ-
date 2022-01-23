package com.java.reply.command;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import com.java.command.Command;
import com.java.reply.dao.ReplyDao;
import com.java.reply.dto.ReplyDto;

public class ReplySelectCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int bunho = Integer.parseInt(request.getParameter("bunho"));
		//MyLogger.logger.info(MyLogger.logMsg+bunho);
		ReplyDto replyDto = ReplyDao.getInstance().select(bunho);
		//MyLogger.logger.info(MyLogger.logMsg+replyDto.toString());
		if (replyDto != null) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bunho", replyDto.getBunho());
			map.put("reply", replyDto.getLine_reply());
			
			String jsonText=JSONValue.toJSONString(map);
			
			if (jsonText != null) {
				response.setContentType("application/x-json;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(jsonText);
			}
		}
		return null;
	}

}
