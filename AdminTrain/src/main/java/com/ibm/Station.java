package com.ibm;

public class Station {
	private String code;
	private String name;
	private String state;
	public Station(String code, String name, String state) {
		this.code = code;
		this.name = name;
		this.state = state;
	}
	
	public Station()
	{
		
	}
	
	public String getCode() {
		return code;
	}
	public String getName() {
		return name;
	}
	public String getState() {
		return state;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
}
