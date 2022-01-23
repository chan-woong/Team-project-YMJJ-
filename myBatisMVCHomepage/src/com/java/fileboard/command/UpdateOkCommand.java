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
import com.java.command.Command;

public class UpdateOkCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List<FileItem> list = upload.parseRequest(request);
		Iterator<FileItem> iter=list.iterator();
		
		BoardDto boardDto = new BoardDto();
		HashMap<String, String> dataMap = new HashMap<String, String>();
		
		while (iter.hasNext()) {
			FileItem fileItem=iter.next();
			
			if(fileItem.isFormField()) {
				String name=fileItem.getFieldName();
				String value=fileItem.getString("utf-8");
				dataMap.put(name, value);
			}else {
				if(fileItem.getFieldName().equals("file")){
					String fileName=fileItem.getName();
					if(fileName==null||fileName.equals("")) continue;
					String timeName=Long.toString(System.currentTimeMillis())+"_"+fileName;
					
					upload.setSizeMax(1024*1024*10);;
					long fileSize=fileItem.getSize();
					
					String path="C:\\Users\\cksdn\\OneDrive\\바탕 화면\\JAVA\\JSP\\workspace\\myBatisMVCHomepage\\WebContent\\pds";
					File file=new File(path,timeName);
					fileItem.write(file);
					
					boardDto.setFileName(timeName);
					boardDto.setPath(path);
					boardDto.setFileSize(fileSize);
					
					BoardDto readBoard=BoardDao.getInstanec().update(Integer.parseInt(dataMap.get("boardNumber")));
					if(readBoard.getFileName()!=null) {
						File checkFile = new File(readBoard.getPath());
						if(checkFile.exists() && checkFile.isFile()) checkFile.delete();
					}
				}
			}
			
		}
		boardDto.setDataMap(dataMap);
		
		//MyLogger.logger.info(MyLogger.logMsg+boardDto.toString()+pageNumber);
		
		int check = BoardDao.getInstanec().update(boardDto);
		
		//MyLogger.logger.info(MyLogger.logMsg+check);
		request.setAttribute("check", check);
		request.setAttribute("pageNumber", Integer.parseInt(dataMap.get("pageNumber")));
		return "/WEB-INF/veiws/fileboard/updateOk.jsp";
	}

}
