package com.java.fileboard.command;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.java.fileboard.dao.BoardDao;
import com.java.fileboard.dto.BoardDto;
import com.java.logger.MyLogger;
import com.java.command.Command;


public class WriteOkCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		
		//보관클래스
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//업로드할 클래스
		ServletFileUpload upload = new ServletFileUpload(factory);
		//업로드에 request
		List<FileItem> list = upload.parseRequest(request);
		Iterator<FileItem> iter=list.iterator();
		BoardDto boardDto = new BoardDto();
		HashMap<String, String> dataMap=new HashMap<String,String>();
		while (iter.hasNext()) {
			FileItem fileitem = iter.next();
			
			if(fileitem.isFormField()) {	//txt
				
				String name = fileitem.getFieldName();
				String value=fileitem.getString("utf-8");
				MyLogger.logger.info(MyLogger.logMsg+name+"  "+value);
				dataMap.put(name, value);
				
				
			}else {							//binary
				if(fileitem.getFieldName().equals("file")) {
					//파일명, 파일사이즈, 파일경로(상대경로,절대경로)
					String filename = fileitem.getName();		// 파일명
					if(filename==null||filename.equals("")) continue;
					String timeFileName=Long.toString(System.currentTimeMillis())+"_"+filename;
					
					upload.setFileSizeMax(1024*1024*10); 		// 1024*10 10M
					long size = fileitem.getSize();				// 파일 사이즈
					
					String dir="C:\\Users\\cksdn\\OneDrive\\바탕 화면\\JAVA\\JSP\\workspace\\mvcHomepage\\WebContent\\pds";		//절대경로
					//MyLogger.logger.info(MyLogger.logMsg+filename+"  "+size+"  "+dir);
					
					File file = new File(dir,timeFileName);
					
					if(!file.exists()) {
						fileitem.write(file);
					}
					
					boardDto.setFileName(timeFileName);
					boardDto.setPath(file.getAbsolutePath());
					boardDto.setFileSize(size);
				}
			}
		}
		boardDto.setDataMap(dataMap);
		boardDto.setReadCount(0);
		MyLogger.logger.info(MyLogger.logMsg+boardDto.toString());
		
		int check=BoardDao.getInstanec().insert(boardDto);
		
		request.setAttribute("check", check);
		return "/WEB-INF/veiws/fileboard/writeOk.jsp";
	}

}
