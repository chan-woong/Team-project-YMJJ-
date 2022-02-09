package com.java.restaurant.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.LogAspect;
import com.java.comments.dto.CommentsDto;
import com.java.restaurant.dao.RestaurantDao;
import com.java.restaurant.dto.RestaurnatDto;

@Component
public class RestaurantServiceImp implements RestaurantService {
	
	//private ImgDto imgDto;
	
	
	@Autowired
	private RestaurantDao restaurantDao;

	@Override
	public void restaurnatWrite(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		
//		int Inumber = 0;
		String RTnumber="0"; // 글번호 : ROOT 항상 boardNumber 0, 답글인 경우 부모의 boardNumber							// 글레벨
//		String Icategory = "0";
//		
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		if(request.getParameter("RTnumber") !=null) {   
			RTnumber=(request.getParameter("RTnumber"));
		}
//		
//		if(request.getParameter("insert") !=null) {   
//			Inumber=Integer.parseInt(request.getParameter("Inumber"));
//			Icategory=request.getParameter("Icategory");
//			
//		}
//		
//		//Integer.parseInt
		mav.addObject("RTnumber", RTnumber);
//		
//		mav.addObject("Inumber", Inumber);
//		mav.addObject("Icategory", Icategory);
		
		mav.setViewName("restaurant/Restaurant_Add.tiles");
		
		
		
	}

	@Autowired private ResourceLoader resourceLoader;
	
	@Override
	public void restaurnatWriteOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map=mav.getModelMap();
		RestaurnatDto restaurnatDto=(RestaurnatDto) map.get("restaurnatDto");
		MultipartHttpServletRequest request=(MultipartHttpServletRequest) map.get("request");
		
		String root = request.getParameter("root");
		
		String root2 = root+"/img/";
		
		String latitude = request.getParameter("RTlatitude");
		String longitude = request.getParameter("RTlongitude");
		
		System.out.println("정보"+latitude+longitude+root);
		
		
		
		System.out.println(request.getSession().getServletContext().getRealPath("/").concat("resources"));
	
		//servletContext.getRealPath("/resources/img")
		
		MultipartFile upFile=request.getFile("file");
		LogAspect.logger.info(LogAspect.LogMsg + upFile);
		if(upFile.getSize() !=0) {
			String fileName=Long.toString(System.currentTimeMillis()) + "_" + upFile.getOriginalFilename();
			long fileSize=upFile.getSize();
			LogAspect.logger.info(LogAspect.LogMsg + fileName + ","  + fileSize);
			
			File path=new File(request.getSession().getServletContext().getRealPath("/").concat("resources/img"));
			//C:\\pds\\
			path.mkdir();
			
			if(path.exists() && path.isDirectory()) {
				File file=new File(path, fileName);
				//LogAspect.logger.info(LogAspect.LogMsg + imgDto.toString());
				try {
					upFile.transferTo(file);
					
					restaurnatDto.setRTIpath(file.getAbsolutePath());
					restaurnatDto.setRTIname(fileName);
					restaurnatDto.setRTIsize(fileSize);
				
				}catch(Exception e) {
					e.printStackTrace();
				}
			}	
		}
		
		LogAspect.logger.info(LogAspect.LogMsg + restaurnatDto.toString());
//		 DB
		
		int check=restaurantDao.restaurantWriteOk(restaurnatDto);
		LogAspect.logger.info(LogAspect.LogMsg + check);
		mav.addObject("check", check);
	
		//imgWrite(mav);
		mav.setViewName("restaurant/writeOk.tiles");
		
		
	}
	
	@Override
    public void restaurantList(ModelAndView mav) {
        // TODO Auto-generated method stub
		
	

        Map<String, Object> map=mav.getModel();
        HttpServletRequest request=(HttpServletRequest) map.get("request");

        String pageNumber=request.getParameter("pageNumber");
        if(pageNumber == null) pageNumber="1";

        int currengPage=Integer.parseInt(pageNumber);
        LogAspect.logger.info(LogAspect.LogMsg + currengPage);

        int boardSize=10;
        int startRow=(currengPage-1) * boardSize +1;
        int endRow=currengPage*boardSize; 

        int count=restaurantDao.getCount();
        LogAspect.logger.info(LogAspect.LogMsg + count);

        List<RestaurnatDto> restaurantList=null;
        if(count > 0) {
            restaurantList=restaurantDao.restaurantList(startRow, endRow);
            LogAspect.logger.info(LogAspect.LogMsg + restaurantList.size());
        }
        
        //System.out.println(restaurantList);
        
        mav.addObject("boardSize", boardSize);
        mav.addObject("currengPage", currengPage);
        mav.addObject("restaurantList", restaurantList);
        mav.addObject("count", count);

        mav.setViewName("restaurant/Restaurant_Main_Admin.tiles");
    }

	@Override
	public void restaurantRead(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		int CMnumber = 0;
		
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String RTnumber=request.getParameter("RTnumber");
		String pageNumber=request.getParameter("pageNumber");
		
		System.out.println("레스토랑"+RTnumber + "," + pageNumber);
		LogAspect.logger.info(LogAspect.LogMsg + RTnumber + "," + pageNumber);
		
		RestaurnatDto restaurnatDto = restaurantDao.restaurantRead(RTnumber);
		LogAspect.logger.info(LogAspect.LogMsg + restaurnatDto.toString());
		
		
		if(restaurnatDto.getRTIsize() !=0) {
			
			int index=restaurnatDto.getRTIname().indexOf("_") +1;
			restaurnatDto.setRTIname(restaurnatDto.getRTIname().substring(index));
			
		}
		
		if(request.getParameter("CMnumber") !=null) {   
			CMnumber=Integer.parseInt(request.getParameter("CMnumber"));
			
		}
		
		
		
		mav.addObject("restaurantDto", restaurnatDto);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("CMnumber", CMnumber);
		mav.addObject("RTnumber", RTnumber);
		

		commentsViewList(mav, RTnumber);
	}
	@Override
	public void commentsViewList(ModelAndView mav, String RTnumber) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);
        LogAspect.logger.info(LogAspect.LogMsg + currentPage);
        
        int boardSize=5;
		int startRow=(currentPage-1)*boardSize+1;			
		int endRow=currentPage*boardSize;
		
		int count = restaurantDao.commentsGetCount();
		LogAspect.logger.info(LogAspect.LogMsg + count);
		List<CommentsDto> commentsDtoList=null;
		if(count > 0) {
			commentsDtoList=restaurantDao.commentList(startRow, endRow, RTnumber);
		}
		
		mav.addObject("commentsList", commentsDtoList);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		
		mav.setViewName("restaurant/Restaurant_Introduction.tiles");
	
	} 
	
	@Override
	  public void restaurantUpdate(ModelAndView mav) {
	    Map<String, Object> map = mav.getModelMap();
	    HttpServletRequest request = (HttpServletRequest) map.get("request");

	    String RTnumber=request.getParameter("RTnumber");
	    String pageNumber=request.getParameter("pageNumber");
	    LogAspect.logger.info(LogAspect.LogMsg + RTnumber + "," + pageNumber);

	    RestaurnatDto restaurnatDto = restaurantDao.restaurantUpdateSelect(RTnumber);

	    if (restaurnatDto.getRTIname() != null) {
	      int index = restaurnatDto.getRTIname().indexOf("_") + 1;
	      restaurnatDto.setRTIname(restaurnatDto.getRTIname().substring(index));
	    }

	    LogAspect.logger.info(LogAspect.LogMsg + restaurnatDto.toString());

	    mav.addObject("restaurnatDto", restaurnatDto);
	    mav.addObject("pageNumber", pageNumber);

	    mav.setViewName("restaurant/Restaurant_Update.tiles");

	  }

	  @Override
	  public void restaurantUpdateOk(ModelAndView mav) {
	    Map<String, Object> map = mav.getModelMap();
	    MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
	    RestaurnatDto restaurnatDto = (RestaurnatDto) map.get("restaurnatDto");

	    String pageNumber=request.getParameter("pageNumber");

	    MultipartFile upFile = request.getFile("file");
	    if (upFile.getSize() != 0) {
	      String fileName = Long.toString(System.currentTimeMillis()) + "_" + upFile.getOriginalFilename();
	      long fileSize = upFile.getSize();
	      LogAspect.logger.info(LogAspect.LogMsg + fileName + "," + fileSize);

	      File path = new File("D:\\pds\\");
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

	        RestaurnatDto readBoard = restaurantDao.restaurantUpdateSelect(restaurnatDto.getRTnumber());
	        if (readBoard.getRTIname() != null) {
	          File checkFile = new File(readBoard.getRTIpath());
	          if (checkFile.exists() && checkFile.isFile())
	            checkFile.delete();
	        }
	      }
	    }

	    int check = restaurantDao.update(restaurnatDto);
	    LogAspect.logger.info(LogAspect.LogMsg + check);

	    mav.addObject("check", check);
	    mav.addObject("pageNumber", pageNumber);
	    mav.setViewName("restaurant/updateOk.tiles");
	  }
	  
		@Override
		public void restaurantDelete(ModelAndView mav) {
			Map<String, Object> map = mav.getModelMap();
		    HttpServletRequest request = (HttpServletRequest) map.get("request");
		    System.out.println("정보" + request.getParameter("RTnumber"));
		    
		    mav.addObject("RTnumber", request.getParameter("RTnumber"));
		    mav.addObject("pageNumber", request.getParameter("pageNumber"));
		    
		    mav.setViewName("restaurant/Restaurantdelete.tiles");
		}

	  @Override
	  public void restaurantDeleteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
	    HttpServletRequest request = (HttpServletRequest) map.get("request");
	    System.out.println("정보" + request.getParameter("RTnumber"));
	    System.out.println("정보" + request.getParameter("pageNumber"));
	    
	    RestaurnatDto readBoard = restaurantDao.selectrestaurant(request.getParameter("RTnumber"));
	    int check = restaurantDao.restaurantDeleteOk(request.getParameter("RTnumber"));
	    LogAspect.logger.info(LogAspect.LogMsg + check);

	    if (check > 0 && readBoard.getRTIpath() != null) {
	    	LogAspect.logger.info(LogAspect.LogMsg + check);
	      File file = new File(readBoard.getRTIpath());
	      if (file.exists() && file.isFile())
	        file.delete();
	    }

	    mav.addObject("check", check);
	    mav.addObject("pageNumber", request.getParameter("pageNumber"));
	    mav.setViewName("restaurant/RestaurantdeleteOk.tiles");
	  }
	
	@Override
	public void commentsWriteOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = mav.getModelMap();
		CommentsDto commentsDto = (CommentsDto) map.get("commentsDto");
		LogAspect.logger.info(LogAspect.LogMsg + commentsDto.toString());

		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String RTnumber=request.getParameter("RTnumber");
		String pageNumber=request.getParameter("pageNumber");
		
		int check = restaurantDao.commentsWriteOk(commentsDto);
		LogAspect.logger.info(LogAspect.LogMsg + check);

		LogAspect.logger.info(LogAspect.LogMsg + commentsDto.toString());
		mav.addObject("check", check);
		restaurantRead(mav);
	
		mav.setViewName("comments/writeOk.tiles");
		
	}

	
// imgDto 사용할때 이코드
//	@Override
//	public void restaurnatWrite(ModelAndView mav) {
//							
//		int Inumber = 0;
//		String RTnumber="0"; // 글번호 : ROOT 항상 boardNumber 0, 답글인 경우 부모의 boardNumber							// 글레벨
//		String Icategory = "0";
//		
//		Map<String, Object> map=mav.getModelMap();
//		HttpServletRequest request=(HttpServletRequest) map.get("request");
//		
//		if(request.getParameter("RTnumber") !=null) {   
//			RTnumber=(request.getParameter("RTnumber"));
//		}
//		
//		if(request.getParameter("insert") !=null) {   
//			Inumber=Integer.parseInt(request.getParameter("Inumber"));
//			Icategory=request.getParameter("Icategory");
//			
//		}
//		
//		//Integer.parseInt
//		mav.addObject("RTnumber", RTnumber);
//		
//		mav.addObject("Inumber", Inumber);
//		mav.addObject("Icategory", Icategory);
//		
//		mav.setViewName("restaurant/Restaurant_Add");
//	}
//	
//	@Override
//	public void restaurnatWriteOk(ModelAndView mav) {
//		
//		Map<String, Object> map=mav.getModelMap();
//		RestaurnatDto restaurnatDto=(RestaurnatDto) map.get("restaurnatDto");
//		
//		System.out.println(restaurnatDto.getRTnumber());
//		
//		int check=restaurantDao.restaurantWriteOk(restaurnatDto);
//		LogAspect.logger.info(LogAspect.LogMsg + check);
//		mav.addObject("check", check);
//
//		//Map<String, Object> map=mav.getModelMap();
//		//writeNumber(restaurnatDto);
//		ImgDto imgDto = (ImgDto) map.get("imgDto");
//		MultipartHttpServletRequest request=(MultipartHttpServletRequest) map.get("request");
//		
//		MultipartFile upFile=request.getFile("file");
//		LogAspect.logger.info(LogAspect.LogMsg + upFile);
//		if(upFile.getSize() !=0) {
//			String fileName=Long.toString(System.currentTimeMillis()) + "_" + upFile.getOriginalFilename();
//			String Icategory = "0";
//			long fileSize=upFile.getSize();
//			LogAspect.logger.info(LogAspect.LogMsg + fileName + ","  + fileSize);
//			
//			File path=new File("C:\\pds\\");
//			path.mkdir();
//			
//			if(path.exists() && path.isDirectory()) {
//				File file=new File(path, fileName);
//				
//				//LogAspect.logger.info(LogAspect.LogMsg + imgDto.toString());
//				try {
//					upFile.transferTo(file);
//					
//					imgDto.setIpath(file.getAbsolutePath());
//					imgDto.setIname(fileName);
//					imgDto.setIsize(fileSize);
//					imgDto.setIcategory(Icategory);
//				}catch(Exception e) {
//					e.printStackTrace();
//				}
//			}	
//		}
//		
//		//LogAspect.logger.info(LogAspect.LogMsg + restaurnatDto.toString());
////		 DB
//		
//		LogAspect.logger.info(LogAspect.LogMsg + imgDto.toString());
//		int check2=restaurantDao.imgWriteOk(imgDto);
//		LogAspect.logger.info(LogAspect.LogMsg + check2);
//		
//		mav.addObject("check", check2);
//	
//		//imgWrite(mav);
//		mav.setViewName("restaurant/writeOk");
//	}
	
	
}
