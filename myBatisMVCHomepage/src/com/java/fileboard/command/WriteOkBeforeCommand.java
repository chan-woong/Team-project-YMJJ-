package com.java.fileboard.command;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.java.fileboard.dto.BoardDto;
import com.java.logger.MyLogger;
import com.java.command.Command;


public class WriteOkBeforeCommand implements Command {

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
		while (iter.hasNext()) {
			FileItem fileitem = iter.next();
			
			if(fileitem.isFormField()) {	//txt
				if(fileitem.getFieldName().equals("boardNumber")) {
					boardDto.setBoardNumber(Integer.parseInt(fileitem.getString()));
				}
				if(fileitem.getFieldName().equals("groupNumber")) {
					boardDto.setGroupNumber(Integer.parseInt(fileitem.getString()));
				}
				if(fileitem.getFieldName().equals("sequenceNumber")) {
					boardDto.setSequenceNumber(Integer.parseInt(fileitem.getString()));
				}
				if(fileitem.getFieldName().equals("sequenceLevel")) {
					boardDto.setSequenceLevel(Integer.parseInt(fileitem.getString()));
				}
				if(fileitem.getFieldName().equals("writer")) {
					boardDto.setWriter(fileitem.getString("utf-8"));
				}
				if(fileitem.getFieldName().equals("subject")) {
					boardDto.setSubject(fileitem.getString("utf-8"));
				}
				if(fileitem.getFieldName().equals("email")) {
					boardDto.setEmail(fileitem.getString("utf-8"));
				}
				if(fileitem.getFieldName().equals("content")) {
					boardDto.setContent(fileitem.getString("utf-8"));
				}
				if(fileitem.getFieldName().equals("password")) {
					boardDto.setPassword(fileitem.getString("utf-8"));
				}
				if(fileitem.getFieldName().equals("file")) {
					boardDto.setWriter(fileitem.getString("utf-8"));
				}
				
			}else {							//binary
				if(fileitem.getFieldName().equals("file")) {
					//파일명, 파일사이즈, 파일경로(상대경로,절대경로)
					String filename = fileitem.getName();		// 파일명
					if(filename==null||filename.equals("")) continue;
					String timeFileName=Long.toString(System.currentTimeMillis())+"-"+filename;
					
					upload.setFileSizeMax(1024*1024*10); 		// 1024*10 10M
					long size = fileitem.getSize();				// 파일 사이즈
					String dir="C:\\Users\\cksdn\\OneDrive\\바탕 화면\\JAVA\\JSP\\workspace\\myBatisMVCHomepage\\WebContent\\pds";		//절대경로
					MyLogger.logger.info(MyLogger.logMsg+filename+"  "+size+"  "+dir);
					
					File file = new File(dir,timeFileName);
					BufferedInputStream fis = null;
					BufferedOutputStream fos = null;
					try {
						fis=new BufferedInputStream(fileitem.getInputStream());
						fos=new BufferedOutputStream(new FileOutputStream(file));
						while (true) {
							int data=fis.read();
							if(data == -1) break;
							fos.write(data);
						}
						fos.flush();
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						if(fis !=null) fis.close();
						if(fos !=null) fos.close();
					}
					boardDto.setFileName(timeFileName);
					boardDto.setPath(file.getAbsolutePath());
					boardDto.setFileSize(size);
				}
			}
			
		}
		MyLogger.logger.info(MyLogger.logMsg+boardDto.toString());
		//return "/WEB-INF/veiws/fileboard/writeOk.jsp";
		return null;
	}

}
