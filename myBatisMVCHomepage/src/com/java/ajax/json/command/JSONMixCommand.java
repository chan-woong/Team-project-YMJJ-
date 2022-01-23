package com.java.ajax.json.command;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONValue;

import com.java.command.Command;
import com.java.logger.MyLogger;

public class JSONMixCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//response.setCharacterEncoding("utf-8");
		int bunho=1;
		String irum="팽수";
		float ki=210.0f;
		
		ArrayList<Data> dataList = new ArrayList<Data>();
		dataList.add(new Data("홍길동", "010-1234-12345","서울시 강남구"));
		dataList.add(new Data("펭수", "010-5678-98765","인천광역시 동춘동"));
		dataList.add(new Data("뽀로로", "010-1478-52369","부산광역시 해운대로"));
		
		JSONArray jsonArray=new JSONArray();
		for (int i = 0; i < dataList.size(); i++) {
			Data data=dataList.get(i);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("name", data.getName());
			map.put("phone", data.getPhone());
			map.put("addreass", data.getAddr());
			jsonArray.add(map);
		}
		HashMap<String, Object> jsonmap = new HashMap<String, Object>();
		jsonmap.put("bunho", bunho);
		jsonmap.put("irum", irum);
		jsonmap.put("ki", ki);
		jsonmap.put("data", jsonArray);
		
		String jsonText=JSONValue.toJSONString(jsonmap);
		MyLogger.logger.info(MyLogger.logMsg+jsonText);
		
		if (jsonText !=null) {
			response.setContentType("application/x-json;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(jsonText);
		}
		return null;
	}

}
