package com.java.review.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.restaurant.dto.RestaurnatDto;
import com.java.review.dao.ReviewDao;
import com.java.review.dto.ReviewDto;

@Component
public class ReviewServiceImp implements ReviewService {
	@Autowired
	private ReviewDao reviewDao;

	@Override
	public void reviewList(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String pageNumber = request.getParameter("pageNumber");
		if (pageNumber == null)
			pageNumber = "1";
		int currentPage = Integer.parseInt(pageNumber);
		int boardSize = 4;
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		int count = reviewDao.getCount();
		List<ReviewDto> reviewList = null;
		if (count > 0) {
			reviewList = reviewDao.reviewList(startRow, endRow);
		}
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("ReviewList", reviewList);
		mav.addObject("count", count);
		mav.setViewName("community/ReviewList.tiles");
	}

	@Override
	public void reviewWrite(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String RVnumber = null;
		if (request.getParameter("RVnumber") != null) {
			RVnumber = request.getParameter("RVnumber");
		}
		mav.addObject("RVnumber", RVnumber);
		mav.setViewName("community/ReviewWrite.tiles");
	}

	@Override
	public void reviewWriteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		ReviewDto reviewDto = (ReviewDto) map.get("reviewDto");
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		MultipartFile upFile = request.getFile("file");
		System.out.println(reviewDto.toString());
		
		if (upFile.getSize() != 0) {
			String fileName = Long.toString(System.currentTimeMillis()) + "_" + upFile.getOriginalFilename();
			long fileSize = upFile.getSize();
			File path = new File("C:\\Users\\User\\Desktop\\git\\pro\\src\\main\\webapp\\resources\\img");
			path.mkdir();
			if (path.exists() && path.isDirectory()) {
				File file = new File(path, fileName);
				try {
					upFile.transferTo(file);
					reviewDto.setRVimgname(fileName);
					reviewDto.setRVimgpath(file.getAbsolutePath());
					reviewDto.setRVimgsize(fileSize);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		int check = reviewDao.reviewWriteNumber(reviewDto);
		mav.addObject("check", check);
		mav.setViewName("community/ReviewWriteOk.tiles");
	}

	@Override
	public void reviewRead(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String RVnumber = request.getParameter("RVnumber");
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		ReviewDto reviewDto = reviewDao.read(RVnumber);
		mav.addObject("reviewDto", reviewDto);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("community/ReviewRead.tiles");
	}

	@Override
	public void reviewDeleteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int check = 0;
		String RVnumber = request.getParameter("RVnumber");
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		String password = request.getParameter("password");
		String Mid = request.getParameter("Mid");
		String imgpath = request.getParameter("imgPath");
		File path = new File(imgpath);
		int passCheck = reviewDao.passCheck(password, Mid);
		if (passCheck > 0) {
			check = reviewDao.reviewDeleteCheck(RVnumber);
		}
		if (path.exists()) {
			path.delete();
		}
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("community/ReviewDeleteOk.tiles");
	}

	@Override
	public void reviewUpdate(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String RVnumber = request.getParameter("RVnumber");
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		ReviewDto reviewDto = reviewDao.reviewUpdateSelect(RVnumber);
		mav.addObject("reviewDto", reviewDto);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("community/ReviewUpdate.tiles");
	}

	@Override
	public void reviewUpdateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		ReviewDto reviewDto = (ReviewDto) map.get("reviewDto");
		int check = 0;
		MultipartFile upFile = request.getFile("file");
		if (upFile.getSize() != 0) {
			String fileName = Long.toString(System.currentTimeMillis()) + "_" + upFile.getOriginalFilename();
			long fileSize = upFile.getSize();
			File path = new File("C:\\Users\\User\\Desktop\\git\\pro\\src\\main\\webapp\\resources\\img");
			path.mkdir();
			if (path.exists() && path.isDirectory()) {
				File file = new File(path, fileName);
				try {
					upFile.transferTo(file);
					reviewDto.setRVimgname(fileName);
					reviewDto.setRVimgpath(file.getAbsolutePath());
					reviewDto.setRVimgsize(fileSize);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		if (upFile.getSize() != 0) {
			check = reviewDao.reviewFileUpdateOk(reviewDto);
		} else if (upFile.getSize() == 0) {
			check = reviewDao.reviewUpdateOk(reviewDto);
		}
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("community/ReviewUpdateOk.tiles");
	}

	@Override
	public void RTsearch(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		List<RestaurnatDto> RTlist = null;
		String RTname = request.getParameter("RTname");
		RTlist = reviewDao.RTsearch(RTname);
		mav.addObject("RTlist", RTlist);
		mav.setViewName("community/RestaurantSearch.empty");
	}
}
