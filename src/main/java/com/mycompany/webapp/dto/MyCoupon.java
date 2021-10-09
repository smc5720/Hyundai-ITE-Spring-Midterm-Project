package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MyCoupon {
	private int eno;
	private int cno;
	private String cstate;
	private Date cdate;
}
