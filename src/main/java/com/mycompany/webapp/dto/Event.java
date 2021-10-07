package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class Event {
	private int eno;
	private String ename;
	private String estartdate;
	private String eenddate;
	private String econtent;
	private String eimage;
	private int ecouponamount;
	private char estate;
	private int ecouponremain;
}
