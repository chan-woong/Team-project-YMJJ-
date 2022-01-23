package com.java.sawon.dto;

public class DeptDto {
	private int DEPARTMENT_ID;
	private String DEPARTMENT_NAME;
	private long MANAGER_ID;
	private int LOCATION_ID;
	
	public int getDEPARTMENT_ID() {
		return DEPARTMENT_ID;
	}
	public void setDEPARTMENT_ID(int dEPARTMENT_ID) {
		DEPARTMENT_ID = dEPARTMENT_ID;
	}
	public String getDEPARTMENT_NAME() {
		return DEPARTMENT_NAME;
	}
	public void setDEPARTMENT_NAME(String dEPARTMENT_NAME) {
		DEPARTMENT_NAME = dEPARTMENT_NAME;
	}
	public long getMANAGER_ID() {
		return MANAGER_ID;
	}
	public void setMANAGER_ID(long mANAGER_ID) {
		MANAGER_ID = mANAGER_ID;
	}
	public int getLOCATION_ID() {
		return LOCATION_ID;
	}
	public void setLOCATION_ID(int lOCATION_ID) {
		LOCATION_ID = lOCATION_ID;
	}
	@Override
	public String toString() {
		return "DeptDto [DEPARTMENT_ID=" + DEPARTMENT_ID + ", DEPARTMENT_NAME=" + DEPARTMENT_NAME + ", MANAGER_ID="
				+ MANAGER_ID + ", LOCATION_ID=" + LOCATION_ID + "]";
	}
	
}
