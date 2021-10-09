package com.mycompany.webapp.dto;

import java.util.List;

import lombok.Data;

@Data
public class ShoppingBag {
	private int sbno;
	private String sbproductcolor;
	private String sbproductsize;
	private int sbproductamount;
	private int mno;
	private String pcode;
	private List<ProductColor> colors;
	private List<ProductSize> sizes;
	private int coloridx;
	private String pname;
	private String bname;
	private int pprice;
	private String scode;
}
