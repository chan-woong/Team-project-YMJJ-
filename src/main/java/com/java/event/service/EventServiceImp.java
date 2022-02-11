package com.java.event.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.LogAspect;
import com.java.event.dao.EventDao;
import com.java.event.dto.EventDto;

@Component
public class EventServiceImp implements EventService {
	@Autowired
	private EventDao eventDao;

	@Override
	public void eventList(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String pageNumber = request.getParameter("pageNumber");
		if (pageNumber == null)
			pageNumber = "1";
		int currentPage = Integer.parseInt(pageNumber);
		int eventSize = 8;
		int startRow = (currentPage - 1) * eventSize + 1;
		int endRow = currentPage * eventSize;
		int count = eventDao.getCount();
		List<EventDto> eventList = null;
		if (count > 0) {
			eventList = eventDao.eventList(startRow, endRow);
		}
		mav.addObject("eventSize", eventSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("eventList", eventList); // 게시물 리스트
		mav.addObject("count", count);
		mav.setViewName("community/EventList.tiles");
	}

	@Override
	public void eventWrite(ModelAndView mav) {
		int enumber = 0;
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		if (request.getParameter("enumber") != null) {
			enumber = Integer.parseInt(request.getParameter("enumber"));
		}
		mav.addObject("enumber", enumber);
		mav.setViewName("community/EventWrite.tiles");
	}

	@Override
	public void eventWriteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		EventDto eventDto = (EventDto) map.get("eventDto");
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		eventWriterNumber(eventDto);
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
					eventDto.setEfilename(fileName);
					eventDto.setEpath(file.getAbsolutePath());
					eventDto.setEfilesize(fileSize);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		int check = eventDao.eventWriteNumber(eventDto);
		LogAspect.logger.info(LogAspect.LogMsg + check);
		mav.addObject("check", check);
		mav.setViewName("community/EventWriteOk.tiles");
	}

	public void eventWriterNumber(EventDto eventDto) {
		int enumber = eventDto.getEnumber();
		int groupnumber = eventDto.getGroupnumber();
		int sequencenumber = eventDto.getSequencenumber();
		int sequencelevel = eventDto.getSequencelevel();
		if (enumber == 0) { // ROOT(부모글) : 그룹번호 작업
			int max = eventDao.EventGroupNumberMax();
			if (max != 0) {
				max = max + 1;
				eventDto.setGroupnumber(max);
			}
		} else { // 자식글 : 글순서, 글레벨 작업
			HashMap<String, Integer> hMap = new HashMap<String, Integer>();
			hMap.put("groupnumber", groupnumber);
			hMap.put("sequencenumber", sequencenumber);
			int check = eventDao.eventWriteNumber(hMap);
			LogAspect.logger.info(LogAspect.LogMsg + check);
			sequencenumber = sequencenumber + 1;
			sequencelevel = sequencelevel + 1;
			eventDto.setSequencenumber(sequencenumber);
			eventDto.setSequencelevel(sequencelevel);
		}
	}

	@Override
	public void eventRead(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		int pagenumber = Integer.parseInt(request.getParameter("pageNumber"));
		EventDto eventDto = eventDao.read(enumber);
		mav.addObject("eventDto", eventDto);
		mav.addObject("pageNumber", pagenumber);
		mav.setViewName("community/EventRead.tiles");
	}

	@Override
	public void eventDownload(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		EventDto eventDto = eventDao.eventSelect(enumber);
		BufferedInputStream fis = null;
		BufferedOutputStream fos = null;
		try {
			int index = eventDto.getEfilename().indexOf("_") + 1;
			String dbName = eventDto.getEfilename().substring(index);
			String fileName = new String(dbName.getBytes("UTF-8"), "ISO-8859-1");
			response.setHeader("Content-Disposition", "attachment;filename=" + fileName); // 대화창
			response.setHeader("Content-Transfer-Encoding", "binary"); // 인코딩 설정
			response.setContentType("" + "/octet-stream");
			fis = new BufferedInputStream(new FileInputStream(eventDto.getEpath()));
			fos = new BufferedOutputStream(response.getOutputStream());
			while (true) {
				int data = fis.read();
				if (data == -1)
					break;
				fos.write(data);
			}
			fos.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fis != null)
					fis.close();
				if (fos != null)
					fos.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void eventUpdate(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		int pagenumber = Integer.parseInt(request.getParameter("pageNumber"));
		EventDto eventDto = eventDao.read(enumber);
		if (eventDto.getEfilesize() != 0) {
			int index = eventDto.getEfilename().indexOf("_") + 1;
			eventDto.setEfilename(eventDto.getEfilename().substring(index));
		}
		mav.addObject("eventDto", eventDto);
		mav.addObject("pageNumber", pagenumber);
		mav.setViewName("community/EventUpdate.tiles");
	}

	@Override
	public void eventDeleteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int check = 0;
		int enumber = Integer.parseInt(request.getParameter("enumber"));
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		String epath = request.getParameter("epath");
		File path = new File(epath);
		check = eventDao.eventDeleteOk(enumber);
		if (path.exists()) {
			path.delete();
		}
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("community/EventDeleteOk.tiles");
	}

	@Override
	public void eventUpdateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		EventDto eventDto = (EventDto) map.get("eventDto");
		int check = eventDao.eventUpdateOk(eventDto);
		LogAspect.logger.info(LogAspect.LogMsg + check);
		mav.addObject("check", check);
		mav.setViewName("community/EventUpdateOk.tiles");
	}
}
