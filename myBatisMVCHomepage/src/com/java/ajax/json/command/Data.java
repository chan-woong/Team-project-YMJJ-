package com.java.ajax.json.command;

public class Data {
	private String name;
	private String phone;
	private String addr;
	
	public Data() {}
	public Data(String name, String phone, String addr) {
		super();
		this.name = name;
		this.phone = phone;
		this.addr = addr;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	@Override
	public String toString() {
		return "Data [name=" + name + ", phone=" + phone + ", addr=" + addr + "]";
	}
	
	
}
