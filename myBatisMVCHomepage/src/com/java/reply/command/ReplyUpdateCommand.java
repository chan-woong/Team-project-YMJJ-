package com.java.reply.command;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import com.java.command.Command;
import com.java.reply.dao.ReplyDao;

public class ReplyUpdateCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		int bunho = Integer.parseInt(request.getParameter("bunho"));
		String line_reply =request.getParameter("lineReply");
		int check=ReplyDao.getInstance().update(bunho,line_reply);
		if (check > 0) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bunho", bunho);
			map.put("reply", line_reply);
			
			String jsonText=JSONValue.toJSONString(map);
			if (jsonText != null) {
				response.setContentType("application/x-json;charset=utf-8");
				PrintWriter out=response.getWriter();
				out.print(jsonText);
			}
		}
		
		return null;
	}

}
