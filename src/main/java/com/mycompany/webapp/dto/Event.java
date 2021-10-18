package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Event {
	private int eno;
	private String ename;
	private Date estartdate;
	private Date eenddate;
	private String econtent;
	private String eimage;
	private int ecouponamount;
	private char estate;
	private int ecouponremain;
}
