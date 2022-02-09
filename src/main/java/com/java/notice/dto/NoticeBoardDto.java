package com.java.notice.dto;

public class NoticeBoardDto {
	private int cnumber; // 고유번호

	private String ccategory; // 카테고리
	private String ctitle; // 제목
	private String ccontent; // 내용

	public int getCnumber() {
		return cnumber;
	}

	public void setCnumber(int cnumber) {
		this.cnumber = cnumber;
	}

	public String getccategory() {
		return ccategory;
	}

	public void setccategory(String ccategory) {
		this.ccategory = ccategory;
	}

	public String getctitle() {
		return ctitle;
	}

	public void setctitle(String ctitle) {
		this.ctitle = ctitle;
	}

	public String getccontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	@Override
	public String toString() {
		return "NoticeBoardDto [cnumber=" + cnumber + ", ccategory=" + ccategory + ", ctitle=" + ctitle + ", ccontent="
				+ ccontent + "]";
	}

}
