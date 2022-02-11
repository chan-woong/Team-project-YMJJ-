package com.java.restaurant.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.comments.dto.CommentsDto;
import com.java.restaurant.dao.RestaurantDao;
import com.java.restaurant.dto.RestaurnatDto;

@Component
public class RestaurantServiceImp implements RestaurantService {
	@Autowired
	private RestaurantDao restaurantDao;

	@Override
	public void restaurnatWrite(ModelAndView mav) {
		String RTnumber = "0"; // 글번호 : ROOT 항상 boardNumber 0, 답글인 경우 부모의 boardNumber // 글레벨//
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		if (request.getParameter("RTnumber") != null) {
			RTnumber = (request.getParameter("RTnumber"));
		}
		mav.addObject("RTnumber", RTnumber);
		mav.setViewName("restaurant/Restaurant_Add.tiles");
	}

	@Override
	public void restaurnatWriteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		RestaurnatDto restaurnatDto = (RestaurnatDto) map.get("restaurnatDto");
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
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
					restaurnatDto.setRTIpath(file.getAbsolutePath());
					restaurnatDto.setRTIname(fileName);
					restaurnatDto.setRTIsize(fileSize);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		int check = restaurantDao.restaurantWriteOk(restaurnatDto);
		mav.addObject("check", check);
		mav.setViewName("restaurant/writeOk.tiles");
	}

	@Override
	public void restaurantList(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String pageNumber = request.getParameter("pageNumber");
		String RTtype = request.getParameter("RTtype");
		if (pageNumber == null)
			pageNumber = "1";
		int currengPage = Integer.parseInt(pageNumber);
		int boardSize = 10;
		int startRow = (currengPage - 1) * boardSize + 1;
		int endRow = currengPage * boardSize;
		List<RestaurnatDto> restaurantList = null;
		int count = 0;
		if (RTtype.equals("all")) {
			count = restaurantDao.getCount();
			System.out.println("asdasds");
			if (count > 0) {
				restaurantList = restaurantDao.restaurantList(startRow, endRow);
			}
		}
		else {
			count = restaurantDao.getCount(RTtype);
			System.out.println(RTtype);
			System.out.println(RTtype + "인 수 : " +count);
			if (count != 0) {
				System.out.println(startRow);
				System.out.println(endRow);
				System.out.println(RTtype);
				restaurantList = restaurantDao.restaurantLists(startRow, endRow, RTtype);
				System.out.println(restaurantList.size());
			}
		}
		mav.addObject("boardSize", boardSize);
		mav.addObject("currengPage", currengPage);
		mav.addObject("restaurantList", restaurantList);
		mav.addObject("count", count);
		mav.addObject("RTtype", RTtype);
		mav.setViewName("restaurant/Restaurant_Main_Admin.tiles");
	}

	@Override
	public void restaurantRead(ModelAndView mav) {
		int CMnumber = 0;
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String RTnumber = request.getParameter("RTnumber");
		String pageNumber = request.getParameter("pageNumber");
		String Mid = request.getParameter("Mid");
		int check = 0;
		if (Mid != null) {
			check = restaurantDao.bookMarkSelect(Mid, RTnumber);
			if (check > 0)
				check = 2;
			if (check == 0)
				check = 1;
		}
		RestaurnatDto restaurnatDto = restaurantDao.restaurantRead(RTnumber);
		if (request.getParameter("CMnumber") != null) {
			CMnumber = Integer.parseInt(request.getParameter("CMnumber"));
		}
		int currentPage = Integer.parseInt(pageNumber);
		int boardSize = 5;
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		int count = restaurantDao.commentsGetCount();
		List<CommentsDto> commentsDtoList = null;
		if (count > 0) {
			commentsDtoList = restaurantDao.commentList(startRow, endRow, RTnumber);
		}
		mav.addObject("commentsList", commentsDtoList);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("restaurantDto", restaurnatDto);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("CMnumber", CMnumber);
		mav.addObject("RTnumber", RTnumber);
		mav.addObject("check", check);
		mav.setViewName("restaurant/Restaurant_Introduction.tiles");
	}

	@Override
	public void bookmarkDeleteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String RTnumber = request.getParameter("RTnumber");
		String Mid = request.getParameter("Mid");
		String pageNumber = request.getParameter("pageNumber");
		int check = restaurantDao.bookMarkDeleteOk(Mid, RTnumber);
		mav.addObject("check", check);
		mav.addObject("RTnumber", RTnumber);
		mav.addObject("Mid", Mid);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("bookmark/bookmarkdeleteOk.tiles");
	}

	@Override
	public void bookmarkOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String RTnumber = request.getParameter("RTnumber");
		String Mid = request.getParameter("Mid");
		String pageNumber = request.getParameter("pageNumber");
		int check = restaurantDao.bookMarkCheck(RTnumber, Mid);
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("RTnumber", RTnumber);
		mav.setViewName("bookmark/writeOk.tiles");
	}

	@Override
	public void commentsWriteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		CommentsDto commentsDto = (CommentsDto) map.get("commentsDto");
		int check = restaurantDao.commentsWriteOk(commentsDto);
		mav.addObject("check", check);
		mav.addObject("Mid", request.getParameter("Mid"));
		mav.addObject("pageNumber", request.getParameter("pageNumber"));
		mav.addObject("RTnumber", request.getParameter("RTnumber"));
		mav.setViewName("comments/writeOk.tiles");
	}

	@Override
	public void restaurantUpdate(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String RTnumber = request.getParameter("RTnumber");
		String pageNumber = request.getParameter("pageNumber");
		RestaurnatDto restaurnatDto = restaurantDao.restaurantUpdateSelect(RTnumber);
		if (restaurnatDto.getRTIname() != null) {
			int index = restaurnatDto.getRTIname().indexOf("_") + 1;
			restaurnatDto.setRTIname(restaurnatDto.getRTIname().substring(index));
		}
		mav.addObject("restaurnatDto", restaurnatDto);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("restaurant/Restaurant_Update.tiles");
	}

	@Override
	public void restaurantUpdateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		RestaurnatDto restaurnatDto = (RestaurnatDto) map.get("restaurnatDto");
		String pageNumber = request.getParameter("pageNumber");
		String RTnumber = request.getParameter("RTnumber");
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
					restaurnatDto.setRTIpath(file.getAbsolutePath());
					restaurnatDto.setRTIname(fileName);
					restaurnatDto.setRTIsize(fileSize);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		int check = 0;
		if (upFile.getSize() != 0) {
			check = restaurantDao.update(restaurnatDto);
		} else if (upFile.getSize() == 0) {
			check = restaurantDao.Update2(restaurnatDto);
		}
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("RTnumber", RTnumber);
		mav.setViewName("restaurant/updateOk.tiles");
	}

	@Override
	public void restaurantDelete(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		mav.addObject("RTnumber", request.getParameter("RTnumber"));
		mav.addObject("pageNumber", request.getParameter("pageNumber"));
		mav.setViewName("restaurant/Restaurantdelete.tiles");
	}

	@Override
	public void restaurantDeleteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		RestaurnatDto readBoard = restaurantDao.selectrestaurant(request.getParameter("RTnumber"));
		int check = restaurantDao.restaurantDeleteOk(request.getParameter("RTnumber"));
		if (check > 0 && readBoard.getRTIpath() != null) {
			File file = new File(readBoard.getRTIpath());
			if (file.exists() && file.isFile())
				file.delete();
		}
		mav.addObject("check", check);
		mav.addObject("pageNumber", request.getParameter("pageNumber"));
		mav.setViewName("restaurant/RestaurantdeleteOk.tiles");
	}
}
