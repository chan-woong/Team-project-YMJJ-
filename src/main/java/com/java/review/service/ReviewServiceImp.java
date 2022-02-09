package com.java.review.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.taglibs.standard.extra.spath.AbsolutePath;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.LogAspect;
import com.java.img.dto.ImgDto;
import com.java.restaurant.dto.RestaurnatDto;
import com.java.review.dao.ReviewDao;
import com.java.review.dto.ReviewDto;

@Component
public class ReviewServiceImp implements ReviewService {
	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public void reviewList(ModelAndView mav) {
		Map<String, Object> map=mav.getModel();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);
		LogAspect.logger.info(LogAspect.LogMsg+"currentPage:"+currentPage);
		
		int boardSize=4;
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=reviewDao.getCount();
		LogAspect.logger.info(LogAspect.LogMsg+"count:"+count);
		
		List<ReviewDto> reviewList=null;
		if(count > 0) {
			reviewList=reviewDao.reviewList(startRow, endRow);
			LogAspect.logger.info(LogAspect.LogMsg+reviewList.size());	
		}
		
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage",currentPage);
		mav.addObject("ReviewList", reviewList);
		mav.addObject("count", count);
		
		mav.setViewName("community/ReviewList.tiles");
	}
	
//	@Override
//	public void reviewWrite(ModelAndView mav) {
//		Map<String, Object> map=mav.getModelMap();
//		HttpServletRequest request=(HttpServletRequest) map.get("request");
//		
//		mav.addObject("request", request);
//		
//		mav.setViewName("community/ReviewWrite");
//	}
	
	@Override
	public void reviewWrite(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String RVnumber=null;
		
		if(request.getParameter("RVnumber")!=null) {
			RVnumber=request.getParameter("RVnumber");
		}
		
				
		mav.addObject("RVnumber", RVnumber);
		
		mav.setViewName("community/ReviewWrite.tiles");	
	}
	
	@Override
	public void reviewWriteOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		ReviewDto reviewDto=(ReviewDto) map.get("reviewDto");
		MultipartHttpServletRequest request=(MultipartHttpServletRequest) map.get("request");
		String root=request.getParameter("root");
		
		MultipartFile upFile=request.getFile("file");
		LogAspect.logger.info(LogAspect.LogMsg + upFile);
		if(upFile.getSize() !=0) {
			String fileName=Long.toString(System.currentTimeMillis()) + "_" + upFile.getOriginalFilename();
			long fileSize=upFile.getSize();
			LogAspect.logger.info(LogAspect.LogMsg + fileName + ","  + fileSize);
			
			File path=new File("C:\\Users\\cksdn\\OneDrive\\바탕 화면\\Git\\pro\\src\\main\\webapp\\resources\\img");
			path.mkdir();
			LogAspect.logger.info(LogAspect.LogMsg + path);
			LogAspect.logger.info(LogAspect.LogMsg + fileName);
			LogAspect.logger.info(LogAspect.LogMsg + path.exists() +","+path.isDirectory());
			
			if(path.exists() && path.isDirectory()) {
				File file=new File(path, fileName);
				
				try {
					upFile.transferTo(file);
					
					reviewDto.setRVimgname(fileName);
					reviewDto.setRVimgpath(file.getAbsolutePath());
					reviewDto.setRVimgsize(fileSize);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}	
		}

		LogAspect.logger.info(LogAspect.LogMsg + reviewDto.toString());
		int check=reviewDao.reviewWriteNumber(reviewDto);
		
		mav.addObject("check", check);
	
		mav.setViewName("community/ReviewWriteOk.tiles");
		
	}

	@Override
	public void reviewRead(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String RVnumber=request.getParameter("RVnumber");
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		
		LogAspect.logger.info(LogAspect.LogMsg + RVnumber + "," + pageNumber);
		
		ReviewDto reviewDto=reviewDao.read(RVnumber);
		LogAspect.logger.info(LogAspect.LogMsg + reviewDto.toString());
		
//		if(reviewDto.getRVimgsize() !=0) {
//			int index=reviewDto.getRVimgname().indexOf("_")+1;
//			reviewDto.setRVimgname(reviewDto.getRVimgname().substring(index));
//		}
		
		mav.addObject("reviewDto", reviewDto);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("community/ReviewRead.tiles");
		
	}
	
	@Override
	public void reviewDeleteOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int check=0;
		String RVnumber=request.getParameter("RVnumber");
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		String password=request.getParameter("password");
		String Mid=request.getParameter("Mid");
		String imgpath=request.getParameter("imgPath");
		File path=new File(imgpath);
		LogAspect.logger.info(LogAspect.LogMsg+RVnumber+","+pageNumber+","+password+","+Mid+","+path);
		
		int passCheck=reviewDao.passCheck(password, Mid);
		
		if(passCheck > 0) {
			check=reviewDao.reviewDeleteCheck(RVnumber);
			LogAspect.logger.info(LogAspect.LogMsg+"check="+check);
		}
		
		if(path.exists()) {
			LogAspect.logger.info(LogAspect.LogMsg+"삭제됨");
			path.delete();
		}
		
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("community/ReviewDeleteOk.tiles");
		
	}
	
	@Override
	public void reviewUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String RVnumber=request.getParameter("RVnumber");
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		LogAspect.logger.info(LogAspect.LogMsg+RVnumber+","+pageNumber);
		
		ReviewDto reviewDto=reviewDao.reviewUpdateSelect(RVnumber);
		LogAspect.logger.info(LogAspect.LogMsg+reviewDto.toString());
		
		mav.addObject("reviewDto", reviewDto);
		mav.addObject("pageNumber", pageNumber);
		
		mav.setViewName("community/ReviewUpdate.tiles");
		
	}
	
	@Override
	public void reviewUpdateOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		ReviewDto reviewDto=(ReviewDto) map.get("reviewDto");
		LogAspect.logger.info(LogAspect.LogMsg+reviewDto.toString());
		
		int check=reviewDao.reviewUpdateOk(reviewDto);
		LogAspect.logger.info(LogAspect.LogMsg+check);
		
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("community/ReviewUpdateOk.tiles");
		
	}
	
	@Override
	public void RTsearch(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		List<RestaurnatDto> RTlist=null;
		
		String RTname=request.getParameter("RTname");
		LogAspect.logger.info(LogAspect.LogMsg+"rtName"+RTname);
		
		RTlist=reviewDao.RTsearch(RTname);
		LogAspect.logger.info(LogAspect.LogMsg+"size"+RTlist.size());
		
		mav.addObject("RTlist",RTlist);
		
		mav.setViewName("community/RestaurantSearch.empty");
	}
}
