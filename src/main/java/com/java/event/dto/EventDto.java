package com.java.event.dto;

import java.util.Date;
import java.util.HashMap;

public class EventDto {
	private int enumber;	//고유번호
	private String etitle;		//제목
	private String econtent;	//내용
	
	private Date edate;		// 작성일
	private int groupnumber;			// 그룹번호
	private int sequencenumber;		// 글순서
	private int sequencelevel;			// 글레벨
	
	private String efilename;	//파일명
	private String epath;		//파일경로
	private long efilesize;		//파일크기
	
	private HashMap<String, String> dataMap;
	
	
	public int getEnumber() {
		return enumber;
	}
	public void setEnumber(int enumber) {
		this.enumber = enumber;
	}
	public String getEtitle() {
		return etitle;
	}
	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}
	public String getEcontent() {
		return econtent;
	}
	public void setEcontent(String econtent) {
		this.econtent = econtent;
	}
	public Date getEdate() {
		return edate;
	}
	public void setEdate(Date edate) {
		this.edate = edate;
	}
	public int getGroupnumber() {
		return groupnumber;
	}
	public void setGroupnumber(int groupnumber) {
		this.groupnumber = groupnumber;
	}
	public int getSequencenumber() {
		return sequencenumber;
	}
	public void setSequencenumber(int sequencenumber) {
		this.sequencenumber = sequencenumber;
	}
	public int getSequencelevel() {
		return sequencelevel;
	}
	public void setSequencelevel(int sequencelevel) {
		this.sequencelevel = sequencelevel;
	}
	public String getEfilename() {
		return efilename;
	}
	public void setEfilename(String efilename) {
		this.efilename = efilename;
	}
	public String getEpath() {
		return epath;
	}
	public void setEpath(String epath) {
		this.epath = epath;
	}
	public long getEfilesize() {
		return efilesize;
	}
	public void setEfilesize(long efilesize) {
		this.efilesize = efilesize;
	}
	public HashMap<String, String> getDataMap() {
		return dataMap;
	}

	public void setDataMap(HashMap<String, String> dataMap) {
		this.dataMap = dataMap;
		this.enumber=Integer.parseInt((String) this.dataMap.get("enumber"));
		
		 if(this.dataMap.get("groupNumber") !=null) {
			this.groupnumber=Integer.parseInt((String) this.dataMap.get("groupnumber"));
			this.sequencenumber=Integer.parseInt((String) this.dataMap.get("sequencenumber"));
			this.sequencelevel=Integer.parseInt((String) this.dataMap.get("sequencelevel"));
		 }
		
		this.etitle=(String) this.dataMap.get("etitle");
		this.econtent=(String) this.dataMap.get("econtent");
	}
	@Override
	public String toString() {
		return "EventDto [enumber=" + enumber + ", etitle=" + etitle + ", econtent=" + econtent + ", edate=" + edate
				+ ", groupnumber=" + groupnumber + ", sequencenumber=" + sequencenumber + ", sequencelevel="
				+ sequencelevel + ", efilename=" + efilename + ", epath=" + epath + ", efilesize=" + efilesize
				+ ", dataMap=" + dataMap + "]";
	}
	
	
}
