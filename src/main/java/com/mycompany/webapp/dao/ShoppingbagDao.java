package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.ShoppingBag;

@Mapper
public interface ShoppingbagDao {
	public int insertProduct(ShoppingBag shoppingBag);
}
