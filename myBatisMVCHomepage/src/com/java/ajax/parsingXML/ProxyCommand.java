package com.java.ajax.parsingXML;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;

import com.java.command.Command;

public class ProxyCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 기상청 홈페이지에 접속
		// 시스템에 방화벽을 가지고 있는 경우 외부서버와 통신을 하기위해 많들어 놓은 서버 프록시 서버
		// 기상청 서버 <--- (기상청)프록시 서버 <--- My 서버
		
		String url = "https://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108";
		GetMethod method = new GetMethod(url);
		
		HttpClient client = new HttpClient();
		int  statusCode = client.executeMethod(method);				// 200, 400
		
		if(statusCode==HttpStatus.SC_OK) {
			String result=method.getResponseBodyAsString();
			//System.out.print(result);
			
			response.setContentType("application/xml;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print(result);
		}
		return null;
	}

}
