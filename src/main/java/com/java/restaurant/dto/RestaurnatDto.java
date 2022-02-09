package com.java.restaurant.dto;

public class RestaurnatDto {

	private String RTnumber;
	private String RTname;
	private String RTtype;
	private String RTaddress;
	private String RTpostalcode;

	private String RTcallnumber1;
	private String RTcallnumber2;
	private String RTcallnumber3;
	private String RTlatitude;
	private String RTlongitude;
	private String RTintroduce;
	private int RTcount;

	private String RTIname; // 이미지 이름
	private long RTIsize; // 이미지 사이즈
	private String RTIpath; // 이미지 주소

	public String getRTnumber() {
		return RTnumber;
	}

	public void setRTnumber(String rTnumber) {
		RTnumber = rTnumber;
	}

	public String getRTname() {
		return RTname;
	}

	public void setRTname(String rTname) {
		RTname = rTname;
	}

	public String getRTtype() {
		return RTtype;
	}

	public void setRTtype(String rTtype) {
		RTtype = rTtype;
	}

	public String getRTaddress() {
		return RTaddress;
	}

	public void setRTaddress(String rTaddress) {
		RTaddress = rTaddress;
	}

	public String getRTpostalcode() {
		return RTpostalcode;
	}

	public void setRTpostalcode(String rTpostalcode) {
		RTpostalcode = rTpostalcode;
	}

	public String getRTcallnumber1() {
		return RTcallnumber1;
	}

	public void setRTcallnumber1(String rTcallnumber1) {
		RTcallnumber1 = rTcallnumber1;
	}

	public String getRTcallnumber2() {
		return RTcallnumber2;
	}

	public void setRTcallnumber2(String rTcallnumber2) {
		RTcallnumber2 = rTcallnumber2;
	}

	public String getRTcallnumber3() {
		return RTcallnumber3;
	}

	public void setRTcallnumber3(String rTcallnumber3) {
		RTcallnumber3 = rTcallnumber3;
	}

	public String getRTlatitude() {
		return RTlatitude;
	}

	public void setRTlatitude(String rTlatitude) {
		RTlatitude = rTlatitude;
	}

	public String getRTlongitude() {
		return RTlongitude;
	}

	public void setRTlongitude(String rTlongitude) {
		RTlongitude = rTlongitude;
	}

	public String getRTintroduce() {
		return RTintroduce;
	}

	public void setRTintroduce(String rTintroduce) {
		RTintroduce = rTintroduce;
	}

	public int getRTcount() {
		return RTcount;
	}

	public void setRTcount(int rTcount) {
		RTcount = rTcount;
	}

	public String getRTIname() {
		return RTIname;
	}

	public void setRTIname(String rTIname) {
		RTIname = rTIname;
	}

	public long getRTIsize() {
		return RTIsize;
	}

	public void setRTIsize(long rTIsize) {
		RTIsize = rTIsize;
	}

	public String getRTIpath() {
		return RTIpath;
	}

	public void setRTIpath(String rTIpath) {
		RTIpath = rTIpath;
	}

	@Override
	public String toString() {
		return "RestaurnatDto [RTnumber=" + RTnumber + ", RTname=" + RTname + ", RTtype=" + RTtype + ", RTaddress="
				+ RTaddress + ", RTpostalcode=" + RTpostalcode + ", RTcallnumber1=" + RTcallnumber1 + ", RTcallnumber2="
				+ RTcallnumber2 + ", RTcallnumber3=" + RTcallnumber3 + ", RTlatitude=" + RTlatitude + ", RTlongitude="
				+ RTlongitude + ", RTintroduce=" + RTintroduce + ", RTcount=" + RTcount + ", RTIname=" + RTIname
				+ ", RTIsize=" + RTIsize + ", RTIpath=" + RTIpath + "]";
	}

}
