package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProductOrder {
	private int ono;
	private Date odate;
	private int ostate;
	private int pmonth;
	private String ptype;
	private String oreceivername;
	private String oreceivertel1;
	private String oreceivertel2; // nullable
	private String ocomment; // nullable
	private int mno;
	private int ano;
	private int oamount;
	private String pcode;
	private String pcolor;
	private String psize;
	private String pname;
	private String bname;
	private int pprice;
	private String cimageproduct1;
	
	//검색 필터
	private String type;
	private String keyword;
}


