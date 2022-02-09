package com.java.member.dto;

public class MemberDto {
	private String Mid = "Admin";
	private String Mpassword;
	private String Mname;
	private String Mpostalcode;
	private String Maddress;
	private String Mresidentnumber1;
	private String Mresidentnumber2;
	private String Mcallnumber1;
	private String Mcallnumber2;
	private String Mcallnumber3;
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

	public String getMresidentnumber1() {
		return Mresidentnumber1;
	}

	public void setMresidentnumber1(String mresidentnumber1) {
		Mresidentnumber1 = mresidentnumber1;
	}

	public String getMresidentnumber2() {
		return Mresidentnumber2;
	}

	public void setMresidentnumber2(String mresidentnumber2) {
		Mresidentnumber2 = mresidentnumber2;
	}

	public String getMcallnumber1() {
		return Mcallnumber1;
	}

	public void setMcallnumber1(String mcallnumber1) {
		Mcallnumber1 = mcallnumber1;
	}

	public String getMcallnumber2() {
		return Mcallnumber2;
	}

	public void setMcallnumber2(String mcallnumber2) {
		Mcallnumber2 = mcallnumber2;
	}

	public String getMcallnumber3() {
		return Mcallnumber3;
	}

	public void setMcallnumber3(String mcallnumber3) {
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
