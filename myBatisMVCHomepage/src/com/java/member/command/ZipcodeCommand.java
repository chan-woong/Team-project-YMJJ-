package com.java.member.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.command.Command;
import com.java.logger.MyLogger;
import com.java.member.dao.MemberDao;
import com.java.member.dto.ZipcodeDto;

public class ZipcodeCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		String checkDong = request.getParameter("dong");
		
		if(checkDong != null) {
			//DB
			
			List<ZipcodeDto> zipcodeList = MemberDao.getInstanec().zipcodeRead(checkDong);

			MyLogger.logger.info(MyLogger.logMsg + zipcodeList.size());
			
			request.setAttribute("zipcodeList", zipcodeList);
			
		}
		
		return "/WEB-INF/veiws/member/zipcode.jsp";
	}

}
