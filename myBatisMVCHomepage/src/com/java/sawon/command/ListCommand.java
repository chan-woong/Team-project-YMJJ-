package com.java.sawon.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.command.Command;
import com.java.sawon.dao.SawonDao;

public class ListCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		List<String> deptList=SawonDao.getInstance().deptList();
		//MyLogger.logger.info(MyLogger.logMsg+deptList.size());
		request.setAttribute("deptList", deptList);
		return "/WEB-INF/veiws/ajax/sawon/list.jsp";
	}

}
