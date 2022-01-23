package com.java.reply.command;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import com.java.command.Command;
import com.java.reply.dao.ReplyDao;
import com.java.reply.dto.ReplyDto;

public class ReplyWriteCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String writReply=request.getParameter("writReply");
		//MyLogger.logger.info(MyLogger.logMsg+writReply);
		
		ReplyDto replyDto = new ReplyDto();
		replyDto.setLine_reply(writReply);
		int check=ReplyDao.getInstance().insert(replyDto);
		//MyLogger.logger.info(MyLogger.logMsg+check);
		
		if (check > 0) {
			int bunho=ReplyDao.getInstance().getBunho();
			//MyLogger.logger.info(MyLogger.logMsg+bunho);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bunho", bunho);
			map.put("reply", writReply);
			String jsontext=JSONValue.toJSONString(map);
			//MyLogger.logger.info(MyLogger.logMsg+jsontext);
			if (jsontext !=null) {
				//MyLogger.logger.info(MyLogger.logMsg+jsontext);
				response.setContentType("application/x-json;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(jsontext);
			}
		}
		return null;
	}

}
