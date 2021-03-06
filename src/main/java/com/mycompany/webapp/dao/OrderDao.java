package com.mycompany.webapp.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.ProductOrder;
import com.mycompany.webapp.dto.ProductOrderItem;

@Mapper
public interface OrderDao {
	public int insertOrderNewAddress(ProductOrder productOrder);
	public int insertOrderOldAddress(ProductOrder productOrder);
	public int insertItemToProductOrderItem(ProductOrderItem productOrderItem);
	public int decreaseStockAmount(HashMap<String, Object> map);
}