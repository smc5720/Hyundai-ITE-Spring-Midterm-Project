package com.mycompany.webapp.dto;

public class Category {
	private String cLarge;
	private String cMedium;
	private String cSmall;
	
	public Category() {
		
	}
	
	public Category(String cLarge, String cMedium, String cSmall) {
		this.cLarge = cLarge;
		this.cMedium = cMedium;
		this.cSmall = cSmall;
	}

	public String getcLarge() {
		return cLarge;
	}

	public void setcLarge(String cLarge) {
		this.cLarge = cLarge;
	}

	public String getcMedium() {
		return cMedium;
	}

	public void setcMedium(String cMedium) {
		this.cMedium = cMedium;
	}

	public String getcSmall() {
		return cSmall;
	}

	public void setcSmall(String cSmall) {
		this.cSmall = cSmall;
	}
}