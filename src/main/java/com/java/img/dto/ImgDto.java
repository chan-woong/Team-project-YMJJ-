package com.java.img.dto;


public class ImgDto {
	private int Inumber;			//이미지 고유번호
	private String Icategory;		//카테고리 각각 고유번호
	private String Iname;			//이미지 이름
	private long Isize;				//이미지 사이즈
	private String Ipath;			//이미지 주소
	public int getInumber() {
		return Inumber;
	}
	public void setInumber(int inumber) {
		Inumber = inumber;
	}
	public String getIcategory() {
		return Icategory;
	}
	public void setIcategory(String icategory) {
		Icategory = icategory;
	}
	public String getIname() {
		return Iname;
	}
	public void setIname(String iname) {
		Iname = iname;
	}
	public long getIsize() {
		return Isize;
	}
	public void setIsize(long isize) {
		Isize = isize;
	}
	public String getIpath() {
		return Ipath;
	}
	public void setIpath(String ipath) {
		Ipath = ipath;
	}
	@Override
	public String toString() {
		return "ImgDto [Inumber=" + Inumber + ", Icategory=" + Icategory + ", Iname=" + Iname + ", Isize=" + Isize
				+ ", Ipath=" + Ipath + "]";
	}
	
	
	
}
