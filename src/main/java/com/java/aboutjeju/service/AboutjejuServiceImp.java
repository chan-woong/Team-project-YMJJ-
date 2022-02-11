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
	public void write(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");

		AboutjejuDto aboutjejuDto = (AboutjejuDto) map.get("aboutjejuDto");

		LogAspect.logger.info(LogAspect.LogMsg + aboutjejuDto.toString());
		/*
		 * String LMnumber =aboutjejuDao.LMinsert(aboutjejuDto, imgDto);//number를 제외한
		 * 모든것이 잘 출력된다. DB에는 안들어
		 */

		MultipartFile upFile = request.getFile("file");

		if (upFile.getSize() != 0) {

			String Iname = Long.toString(System.currentTimeMillis()) + "_" + upFile.getOriginalFilename();;
			long Isize = upFile.getSize();
			LogAspect.logger.info(LogAspect.LogMsg + Iname + "," + Isize); // 출력됨
			File path = new File("C:\\Users\\User\\Desktop\\git\\pro\\src\\main\\webapp\\resources\\img");
			// File path = new
			// File(request.getSession().getServletContext().getRealPath("/").concat("resources/img"));
			path.mkdir();

			if (path.exists() && path.isDirectory()) {
				File file = new File(path, Iname);
				try {
					upFile.transferTo(file);
					aboutjejuDto.setIpath(file.getAbsolutePath());
					LogAspect.logger.info(LogAspect.LogMsg + aboutjejuDto.toString());
					aboutjejuDto.setIname(Iname);
					// LogAspect.logger.info(LogAspect.LogMsg+aboutjejuDto.toString());
					aboutjejuDto.setIsize(Isize);
					LogAspect.logger.info(LogAspect.LogMsg + aboutjejuDto.toString());
					// imgDto.setIcategory(Icategory);
					// LogAspect.logger.info(LogAspect.LogMsg+imgDto.toString());

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			int check = aboutjejuDao.LMinsert(aboutjejuDto);
			// LogAspect.logger.info(LogAspect.LogMsg+imgDto.toString());

			LogAspect.logger.info(LogAspect.LogMsg + aboutjejuDto.toString());
			LogAspect.logger.info(LogAspect.LogMsg + check);
			mav.addObject("check", check);
			mav.setViewName("aboutjeju/introduction.tiles");
		}
	}

	@Override
	public void Iread(ModelAndView mav) {
		// 카테고리로 분류된 전체 list 출력
		List<AboutjejuDto> Ilist = aboutjejuDao.IRead("introduction");

		LogAspect.logger.info(LogAspect.LogMsg + Ilist.size());
		LogAspect.logger.info(LogAspect.LogMsg + Ilist.toString());
		mav.addObject("Ilist", Ilist);
		mav.setViewName("aboutjeju/introduction.tiles");
	}

	@Override
	public void Lread(ModelAndView mav) {

		List<AboutjejuDto> Ilist = aboutjejuDao.Lread("location");
		LogAspect.logger.info(LogAspect.LogMsg + Ilist.size());
		LogAspect.logger.info(LogAspect.LogMsg + Ilist.toString());
		mav.addObject("Ilist", Ilist);
		mav.setViewName("aboutjeju/location.tiles");
	}

	@Override
	public void Sread(ModelAndView mav) {
		List<AboutjejuDto> Ilist = aboutjejuDao.Sread("speciality");

		LogAspect.logger.info(LogAspect.LogMsg + Ilist.size());
		LogAspect.logger.info(LogAspect.LogMsg + Ilist.toString());
		mav.addObject("Ilist", Ilist);

		mav.setViewName("aboutjeju/speciality.tiles");
	}

	@Override
	public void Aread(ModelAndView mav) {
		List<AboutjejuDto> Ilist = aboutjejuDao.Aread("activites");

		LogAspect.logger.info(LogAspect.LogMsg + Ilist.size());
		LogAspect.logger.info(LogAspect.LogMsg + Ilist.toString());
		mav.addObject("Ilist", Ilist);

		mav.setViewName("aboutjeju/activities.tiles");
	}

	@Override
	public void Ok(ModelAndView mav) {
		// TODO Auto-generated method stub

	}
}
