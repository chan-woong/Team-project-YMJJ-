package com.java.member.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.LogAspect;
import com.java.member.dao.MemberDao;
import com.java.member.dto.MemberDto;
@Component
public class MemberServiceImp implements MemberService{
	@Autowired
	private MemberDao memberDao;

	@Override
	public void memberRegisterOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		MemberDto memberDto = (MemberDto) map.get("memberDto");
		
		memberDto.setMemberLevel("BA");
		LogAspect.logger.info(LogAspect.LogMsg+memberDto.toString());
		int check = memberDao.insert(memberDto);
		LogAspect.logger.info(LogAspect.LogMsg+check);
		
		mav.addObject("check", check);
		mav.setViewName("member/registerOk");
		
	}
	@Override
	public void memberIdCheck(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String id=request.getParameter("id");
		LogAspect.logger.info(LogAspect.LogMsg + id);
		
		// 해당 id 있으면 1, 해당 id 없으면 0
		int check=memberDao.idCheck(id);
		LogAspect.logger.info(LogAspect.LogMsg + check);
		
		mav.addObject("id", id);
		mav.addObject("check", check);
		mav.setViewName("member/idCheck");
	}
	@Override
	public void memberLoginOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		LogAspect.logger.info(LogAspect.LogMsg + id + "," + password);
		
		String memberLevel=memberDao.loginCheck(id, password);
		LogAspect.logger.info(LogAspect.LogMsg + memberLevel);
		
		mav.addObject("memberLevel", memberLevel);
		mav.addObject("id", id);
		
		mav.setViewName("member/loginOk");
	}
	@Override
	public void memberUpdate(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		LogAspect.logger.info(LogAspect.LogMsg + id);
		
		MemberDto memberDto=memberDao.updateId(id);
		LogAspect.logger.info(LogAspect.LogMsg + memberDto.toString());
		
		mav.addObject("memberDto", memberDto);
		
		mav.setViewName("member/update");
	}
	@Override
	public void memberUpdateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		MemberDto memberDto = (MemberDto) map.get("memberDto");
		
		LogAspect.logger.info(LogAspect.LogMsg + memberDto.toString());
		int check=memberDao.update(memberDto);
		mav.addObject("check", check);
		
		mav.setViewName("/member/updateOk");
	}
	@Override
	public void memberDeleteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		String password=request.getParameter("password");
		LogAspect.logger.info(LogAspect.LogMsg + id + "," + password);
			
		int check=memberDao.delete(id, password);
		LogAspect.logger.info(LogAspect.LogMsg + check);
		
		mav.addObject("check", check);
		
		mav.setViewName("/member/deleteOk");
		
	}
}
