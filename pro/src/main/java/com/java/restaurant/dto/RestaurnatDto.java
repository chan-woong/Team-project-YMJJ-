package com.java.restaurant.dto;


public class RestaurnatDto {
	
	private int RTnumber;
	
	private String RTname;
	private	String RTtype;
	private String RTaddress;
	private String RTpostalcode;
	
	private String RTcallnumber1;
	private String RTcallnumber2;
	private String RTcallnumber3;
	private String RTlatitude = "null";
	private String RTlongitude = "null";
	private String RTintroduce;
	private int RTcount;
	
	private int group_Number;			// 그룹번호
	private int sequence_Number;		// 글순서
	private int sequence_Level;
	public int getRTnumber() {
		return RTnumber;
	}
	public void setRTnumber(int rTnumber) {
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
	public int getGroup_Number() {
		return group_Number;
	}
	public void setGroup_Number(int group_Number) {
		this.group_Number = group_Number;
	}
	public int getSequence_Number() {
		return sequence_Number;
	}
	public void setSequence_Number(int sequence_Number) {
		this.sequence_Number = sequence_Number;
	}
	public int getSequence_Level() {
		return sequence_Level;
	}
	public void setSequence_Level(int sequence_Level) {
		this.sequence_Level = sequence_Level;
	}
	@Override
	public String toString() {
		return "RestaurnatDto [RTnumber=" + RTnumber + ", RTname=" + RTname + ", RTtype=" + RTtype + ", RTaddress="
				+ RTaddress + ", RTpostalcode=" + RTpostalcode + ", RTcallnumber1=" + RTcallnumber1 + ", RTcallnumber2="
				+ RTcallnumber2 + ", RTcallnumber3=" + RTcallnumber3 + ", RTlatitude=" + RTlatitude + ", RTlongitude="
				+ RTlongitude + ", RTintroduce=" + RTintroduce + ", RTcount=" + RTcount + ", group_Number="
				+ group_Number + ", sequence_Number=" + sequence_Number + ", sequence_Level=" + sequence_Level + "]";
	}
	

	
	
	
	
}
