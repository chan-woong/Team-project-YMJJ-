package com.java.comments.dto;

public class CommentsDto {
	
	private int CMnumber;
	private String Mid;
	private String RTnumber;
	private int CMliked;
	private String CMcontent;
	private String RTname;
	public int getCMnumber() {
		return CMnumber;
	}
	public void setCMnumber(int cMnumber) {
		CMnumber = cMnumber;
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
	public int getCMliked() {
		return CMliked;
	}
	public void setCMliked(int cMliked) {
		CMliked = cMliked;
	}
	public String getCMcontent() {
		return CMcontent;
	}
	public void setCMcontent(String cMcontent) {
		CMcontent = cMcontent;
	}
	public String getRTname() {
		return RTname;
	}
	public void setRTname(String rTname) {
		RTname = rTname;
	}
	@Override
	public String toString() {
		return "CommentsDto [CMnumber=" + CMnumber + ", Mid=" + Mid + ", RTnumber=" + RTnumber + ", CMliked=" + CMliked
				+ ", CMcontent=" + CMcontent + ", RTname=" + RTname + "]";
	}
	
}
