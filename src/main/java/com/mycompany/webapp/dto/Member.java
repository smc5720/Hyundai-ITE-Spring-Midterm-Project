package com.mycompany.webapp.dto;

import java.util.Date;
import lombok.Data;

@Data
public class Member {
	private int mno;
	private String mid;
	private String mname;
	private char mgender;
	private String mbirth;
	private char msnscheck;
	private String memail;
	private char memailcheck;
	private String mtel;
	private int mmileage;
	private int mtotalpay;
	private Date mdate;
}
