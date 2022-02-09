package com.java.member.dto;

public class BookmarkDto {
	private int Bnumber;
	private String Mid;
	private String RTnumber;
	private String RTname;
	private String RTIname;

	public int getBnumber() {
		return Bnumber;
	}

	public void setBnumber(int bnumber) {
		Bnumber = bnumber;
	}

	public String getMid() {
		return Mid;
	}

	public void setMid(String mid) {
		Mid = mid;
	}

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

	public String getRTIname() {
		return RTIname;
	}

	public void setRTIname(String rTIname) {
		RTIname = rTIname;
	}

	@Override
	public String toString() {
		return "BookmarkDto [Bnumber=" + Bnumber + ", Mid=" + Mid + ", RTnumber=" + RTnumber + ", RTname=" + RTname
				+ ", RTIname=" + RTIname + "]";
	}
}
