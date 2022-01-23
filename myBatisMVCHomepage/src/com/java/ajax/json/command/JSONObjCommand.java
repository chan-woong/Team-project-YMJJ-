package com.java.ajax.json.command;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import com.java.command.Command;

public class JSONObjCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int bunho=1;
		String irum="홍길동";
		float average=88.8f;
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("bunho", bunho);
		map.put("irum", irum);
		map.put("average", average);
		
		String jsonText=JSONValue.toJSONString(map);
		//MyLogger.logger.info(MyLogger.logMsg+jsonText);
		if(jsonText != null) {
			response.setContentType("application/x-json;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print(jsonText);
		}
		return null;
	}

}
