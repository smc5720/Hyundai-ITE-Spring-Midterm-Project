package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class Product {
	private String pcode;
	private String pname;
	private int pprice;
	private String pdetail;
	private String precommanditem;
	private String bname;
	private String clarge;
	private String cmedium;
	private String csmall;
}
