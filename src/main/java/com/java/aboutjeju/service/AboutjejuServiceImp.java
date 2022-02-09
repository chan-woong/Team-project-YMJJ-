package com.java.aboutjeju.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.aboutjeju.dao.AboutjejuDao;
import com.java.aboutjeju.dto.AboutjejuDto;
import com.java.aop.LogAspect;

@Component
public class AboutjejuServiceImp implements AboutjejuService {
	@Autowired
	private AboutjejuDao aboutjejuDao;

	@Override
	public void writeOK(ModelAndView mav) {
		Map<String, Object> map=mav.getModel();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		
		AboutjejuDto aboutjejuDto = (AboutjejuDto) map.get("aboutjejuDto");
		
		LogAspect.logger.info(LogAspect.LogMsg+aboutjejuDto.toString());
		String root = request.getParameter("root");
		
		/*String LMnumber =aboutjejuDao.LMinsert(aboutjejuDto, imgDto);//number를 제외한 모든것이 잘 출력된다. DB에는 안들어*/
		//aboutjejuDao.LMinsert(aboutjejuDto, imgDto);
		MultipartFile upFile =request.getFile("file");
		
		//for 문에서 입력 input을 하나당 null인지 확인하고 null아니면 1하나가 실행을 하고 2 n 확인ull 하고 실행
		//if 문 2개를 실행 시킴 현재 이미지가 2개 들어가는 코딩
		int num=0;
		if(upFile.getSize() !=0) {
			num++;
			String Iname=upFile.getOriginalFilename()+num;
			long Isize=upFile.getSize();	
			//String Icategory = "0";
			LogAspect.logger.info(LogAspect.LogMsg+Iname+","+Isize); //출력됨
			//File path = new File("C:\\pds\\");
			File path = new File(request.getSession().getServletContext().getRealPath("/").concat("resources/img"));
		    path.mkdir();
			//String safeFile = path+System.currentTimeMillis()+Iname;
			if(path.exists()&&path.isDirectory()) {
				File file = new File(path,Iname);
				try {
					upFile.transferTo(file);
					aboutjejuDto.setIpath(file.getAbsolutePath());
					LogAspect.logger.info(LogAspect.LogMsg+aboutjejuDto.toString());
					aboutjejuDto.setIname(Iname);
					//LogAspect.logger.info(LogAspect.LogMsg+aboutjejuDto.toString());
					aboutjejuDto.setIsize(Isize);
					LogAspect.logger.info(LogAspect.LogMsg+aboutjejuDto.toString());
					//imgDto.setIcategory(Icategory);
					//LogAspect.logger.info(LogAspect.LogMsg+imgDto.toString());
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		int check= aboutjejuDao.LMinsert(aboutjejuDto);
		//LogAspect.logger.info(LogAspect.LogMsg+imgDto.toString());
		
		LogAspect.logger.info(LogAspect.LogMsg+aboutjejuDto.toString());
		LogAspect.logger.info(LogAspect.LogMsg+check);
		mav.setViewName("aboutjeju/writeOK");
		}
	}

	@Override
	public void Iread(ModelAndView mav) {
		//카테고리로 분류된 전체 list 출력
		List<AboutjejuDto>Ilist = aboutjejuDao.IRead("introduction");

		
		LogAspect.logger.info(LogAspect.LogMsg+Ilist.size());
		LogAspect.logger.info(LogAspect.LogMsg+Ilist.toString());
		mav.addObject("Ilist",Ilist);
		mav.setViewName("aboutjeju/introduction.tiles");
	}

	@Override
	public void Lread(ModelAndView mav) {
		
		List<AboutjejuDto>Ilist = aboutjejuDao.Lread("location");
		LogAspect.logger.info(LogAspect.LogMsg+Ilist.size());
		LogAspect.logger.info(LogAspect.LogMsg+Ilist.toString());
		mav.addObject("Ilist",Ilist);
		mav.setViewName("aboutjeju/location.tiles");
	}

	@Override
	public void Sread(ModelAndView mav) {
		List<AboutjejuDto>Ilist = aboutjejuDao.Sread("speciality");

		
		LogAspect.logger.info(LogAspect.LogMsg+Ilist.size());
		LogAspect.logger.info(LogAspect.LogMsg+Ilist.toString());
		mav.addObject("Ilist",Ilist);
		
		mav.setViewName("aboutjeju/speciality.tiles");
	}

	@Override
	public void Aread(ModelAndView mav) {
		List<AboutjejuDto>Ilist = aboutjejuDao.Aread("activites");

		
		LogAspect.logger.info(LogAspect.LogMsg+Ilist.size());
		LogAspect.logger.info(LogAspect.LogMsg+Ilist.toString());
		mav.addObject("Ilist",Ilist);	
		
		mav.setViewName("aboutjeju/activities.tiles");
	}
}
