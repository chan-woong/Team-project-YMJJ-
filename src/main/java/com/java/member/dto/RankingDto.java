package com.java.member.dto;

public class RankingDto {
	private String RTnumber;
	private float Avg;
	private String RTname;
	private String RTintroduce;
	private String RTIname;

	public String getRTnumber() {
		return RTnumber;
	}

	public void setRTnumber(String rTnumber) {
		RTnumber = rTnumber;
	}

	public float getAvg() {
		return Avg;
	}

	public void setAvg(float avg) {
		Avg = avg;
	}

	public String getRTname() {
		return RTname;
	}

	public void setRTname(String rTname) {
		RTname = rTname;
	}

	public String getRTintroduce() {
		return RTintroduce;
	}

	public void setRTintroduce(String rTintroduce) {
		RTintroduce = rTintroduce;
	}

	public String getRTIname() {
		return RTIname;
	}

	public void setRTIname(String rTIname) {
		RTIname = rTIname;
	}

	@Override
	public String toString() {
		return "RankingDto [RTnumber=" + RTnumber + ", Avg=" + Avg + ", RTname=" + RTname + ", RTintroduce="
				+ RTintroduce + ", RTIname=" + RTIname + "]";
	}
}
