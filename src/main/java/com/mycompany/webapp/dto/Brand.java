package com.mycompany.webapp.dto;

public class Brand {
	private int bno;
	private String bName;

	public Brand() {

	}

	public Brand(String bName) {
		this.bName = bName;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getBname() {
		return bName;
	}

	public void setBname(String bname) {
		this.bName = bname;
	}
}