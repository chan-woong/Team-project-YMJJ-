package com.java.reply.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.command.Command;
import com.java.reply.dao.ReplyDao;
import com.java.reply.dto.ReplyDto;

public class ReplyListCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//DB List
		List<ReplyDto> replyList=ReplyDao.getInstance().getList();
		//MyLogger.logger.info(MyLogger.logMsg+replyList.size());
		if (replyList.size()!=0) {
			request.setAttribute("replyList", replyList);
		}
		
		return "/WEB-INF/veiws/ajax/reply/relpylist.jsp";
	}

}
