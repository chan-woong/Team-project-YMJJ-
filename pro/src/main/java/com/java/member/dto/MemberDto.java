package com.java.member.dto;


public class MemberDto {
	private String Mid;
	private String Mpassword;
	private String Mname;
	private String Mpostalcode;
	private String Maddress;
	private int Mresidentnumber1;
	private int Mresidentnumber2;
	private int Mcallnumber1;
	private int Mcallnumber2;
	private int Mcallnumber3;
	private String Memail;
	
	public String getMid() {
		return Mid;
	}
	public void setMid(String mid) {
		Mid = mid;
	}
	public String getMpassword() {
		return Mpassword;
	}
	public void setMpassword(String mpassword) {
		Mpassword = mpassword;
	}
	public String getMname() {
		return Mname;
	}
	public void setMname(String mname) {
		Mname = mname;
	}
	public String getMpostalcode() {
		return Mpostalcode;
	}
	public void setMpostalcode(String mpostalcode) {
		Mpostalcode = mpostalcode;
	}
	public String getMaddress() {
		return Maddress;
	}
	public void setMaddress(String maddress) {
		Maddress = maddress;
	}
	public int getMresidentnumber1() {
		return Mresidentnumber1;
	}
	public void setMresidentnumber1(int mresidentnumber1) {
		Mresidentnumber1 = mresidentnumber1;
	}
	public int getMresidentnumber2() {
		return Mresidentnumber2;
	}
	public void setMresidentnumber2(int mresidentnumber2) {
		Mresidentnumber2 = mresidentnumber2;
	}
	public int getMcallnumber1() {
		return Mcallnumber1;
	}
	public void setMcallnumber1(int mcallnumber1) {
		Mcallnumber1 = mcallnumber1;
	}
	public int getMcallnumber2() {
		return Mcallnumber2;
	}
	public void setMcallnumber2(int mcallnumber2) {
		Mcallnumber2 = mcallnumber2;
	}
	public int getMcallnumber3() {
		return Mcallnumber3;
	}
	public void setMcallnumber3(int mcallnumber3) {
		Mcallnumber3 = mcallnumber3;
	}
	public String getMemail() {
		return Memail;
	}
	public void setMemail(String memail) {
		Memail = memail;
	}
	@Override
	public String toString() {
		return "MemberDto [Mid=" + Mid + ", Mpassword=" + Mpassword + ", Mname=" + Mname + ", Mpostalcode="
				+ Mpostalcode + ", Maddress=" + Maddress + ", Mresidentnumber1=" + Mresidentnumber1
				+ ", Mresidentnumber2=" + Mresidentnumber2 + ", Mcallnumber1=" + Mcallnumber1 + ", Mcallnumber2="
				+ Mcallnumber2 + ", Mcallnumber3=" + Mcallnumber3 + ", Memail=" + Memail + "]";
	}
	
}
