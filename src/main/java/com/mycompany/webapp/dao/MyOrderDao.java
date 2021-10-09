package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.ProductOrder;

@Mapper
public interface MyOrderDao {
	public List<ProductOrder> selectProductOrders(int mno);
}
