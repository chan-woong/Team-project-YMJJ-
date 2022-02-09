package com.java.member.dto;

import java.util.Date;

public class SimpleReviewDto {
	private String RVnumber;
	private String Mid;
	private String RTnumber;
	private String RVtitle; // 글제목
	private String RVcontent; // 글내용
	private int RVcount; // 조회수
	private Date RVdate; // 작성일
	private String RTname;

	public String getRVnumber() {
		return RVnumber;
	}

	public void setRVnumber(String rVnumber) {
		RVnumber = rVnumber;
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

	public String getRVtitle() {
		return RVtitle;
	}

	public void setRVtitle(String rVtitle) {
		RVtitle = rVtitle;
	}

	public String getRVcontent() {
		return RVcontent;
	}

	public void setRVcontent(String rVcontent) {
		RVcontent = rVcontent;
	}

	public int getRVcount() {
		return RVcount;
	}

	public void setRVcount(int rVcount) {
		RVcount = rVcount;
	}

	public Date getRVdate() {
		return RVdate;
	}

	public void setRVdate(Date rVdate) {
		RVdate = rVdate;
	}

	public String getRTname() {
		return RTname;
	}

	public void setRTname(String rTname) {
		RTname = rTname;
	}

	@Override
	public String toString() {
		return "SimpleReviewDto [RVnumber=" + RVnumber + ", Mid=" + Mid + ", RTnumber=" + RTnumber + ", RVtitle="
				+ RVtitle + ", RVcontent=" + RVcontent + ", RVcount=" + RVcount + ", RVdate=" + RVdate + ", RTname="
				+ RTname + "]";
	}

}
