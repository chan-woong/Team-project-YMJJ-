package com.java.ajax.parsingXML;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.command.Command;

public class ParsingCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		return "/WEB-INF/veiws/ajax/proxy/weather.jsp";
	}

}
