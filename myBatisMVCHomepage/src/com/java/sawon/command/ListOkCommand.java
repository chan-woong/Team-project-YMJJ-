package com.java.sawon.command;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONValue;

import com.java.command.Command;
import com.java.sawon.dao.SawonDao;
import com.java.sawon.dto.DeptDto;
import com.java.sawon.dto.EmpDto;

public class ListOkCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String departmentName=request.getParameter("departmentName");
		//MyLogger.logger.info(MyLogger.logMsg+departmentName);
		List<EmpDto> sawonList=SawonDao.getInstance().select(departmentName);
		//MyLogger.logger.info(MyLogger.logMsg+sawonList.size());
		JSONArray jsonArray = new JSONArray();
		if(sawonList != null) {
			for (int i = 0; i < sawonList.size(); i++) {
				EmpDto empDto=sawonList.get(i);
				DeptDto deptDto=empDto.getDeptDto();
				
				HashMap<String, Object> map=new HashMap<String, Object>();
				map.put("emp_id", empDto.getEMPLOYEE_ID());
				map.put("name", empDto.getFIRST_NAME());
				SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-DD");
				map.put("HIRE_DATE", sdf.format(empDto.getHIRE_DATE()));
				map.put("JOB_ID", empDto.getJOB_ID());
				map.put("SALARY", empDto.getSALARY());

				map.put("dept_id", deptDto.getDEPARTMENT_ID());
				map.put("dept_name", deptDto.getDEPARTMENT_NAME());
				
				jsonArray.add(map);
			}
			HashMap<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("sawon", jsonArray);
			
			String jsonText=JSONValue.toJSONString(jsonMap);
			//MyLogger.logger.info(MyLogger.logMsg+jsonText);
			
			response.setContentType("application/x-json;charset=utf8");
			PrintWriter out = response.getWriter();
			out.print(jsonText);
		}
		return null;
	}

}
