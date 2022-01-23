package com.java.sawon.dto;

import java.util.Date;

public class EmpDto {
	private int EMPLOYEE_ID;
	private String FIRST_NAME;
	private String LAST_NAME;
	private String EMAIL;
	private String PHONE_NUMBER;
	private Date HIRE_DATE;
	private String JOB_ID;
	private float SALARY;
	private float COMMISSION_PCT;
	private int MANAGER_ID;
	private int DEPARTMENT_ID;
	private DeptDto deptDto;
	
	public int getEMPLOYEE_ID() {
		return EMPLOYEE_ID;
	}
	public void setEMPLOYEE_ID(int eMPLOYEE_ID) {
		EMPLOYEE_ID = eMPLOYEE_ID;
	}
	public String getFIRST_NAME() {
		return FIRST_NAME;
	}
	public void setFIRST_NAME(String fIRST_NAME) {
		FIRST_NAME = fIRST_NAME;
	}
	public String getLAST_NAME() {
		return LAST_NAME;
	}
	public void setLAST_NAME(String lAST_NAME) {
		LAST_NAME = lAST_NAME;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getPHONE_NUMBER() {
		return PHONE_NUMBER;
	}
	public void setPHONE_NUMBER(String pHONE_NUMBER) {
		PHONE_NUMBER = pHONE_NUMBER;
	}
	public Date getHIRE_DATE() {
		return HIRE_DATE;
	}
	public void setHIRE_DATE(Date hIRE_DATE) {
		HIRE_DATE = hIRE_DATE;
	}
	public String getJOB_ID() {
		return JOB_ID;
	}
	public void setJOB_ID(String jOB_ID) {
		JOB_ID = jOB_ID;
	}
	public float getSALARY() {
		return SALARY;
	}
	public void setSALARY(float sALARY) {
		SALARY = sALARY;
	}
	public float getCOMMISSION_PCT() {
		return COMMISSION_PCT;
	}
	public void setCOMMISSION_PCT(float cOMMISSION_PCT) {
		COMMISSION_PCT = cOMMISSION_PCT;
	}
	public int getMANAGER_ID() {
		return MANAGER_ID;
	}
	public void setMANAGER_ID(int mANAGER_ID) {
		MANAGER_ID = mANAGER_ID;
	}
	public int getDEPARTMENT_ID() {
		return DEPARTMENT_ID;
	}
	public void setDEPARTMENT_ID(int dEPARTMENT_ID) {
		DEPARTMENT_ID = dEPARTMENT_ID;
	}
	public DeptDto getDeptDto() {
		return deptDto;
	}
	public void setDeptDto(DeptDto deptDto) {
		this.deptDto = deptDto;
	}
	@Override
	public String toString() {
		return "EmpDto [EMPLOYEE_ID=" + EMPLOYEE_ID + ", FIRST_NAME=" + FIRST_NAME + ", LAST_NAME=" + LAST_NAME
				+ ", EMAIL=" + EMAIL + ", PHONE_NUMBER=" + PHONE_NUMBER + ", HIRE_DATE=" + HIRE_DATE + ", JOB_ID="
				+ JOB_ID + ", SALARY=" + SALARY + ", COMMISSION_PCT=" + COMMISSION_PCT + ", MANAGER_ID=" + MANAGER_ID
				+ ", DEPARTMENT_ID=" + DEPARTMENT_ID + ", deptDto=" + deptDto + "]";
	}
	
	
}
