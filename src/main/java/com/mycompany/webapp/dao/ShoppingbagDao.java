package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.ShoppingBag;

@Mapper
public interface ShoppingbagDao {
	public int insertProduct(ShoppingBag shoppingBag);
	public List<ShoppingBag> selectShoppingProducts(int mno);
}