package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.ShoppingBag;

@Mapper
public interface ShoppingbagDao {
	public int insertProduct(ShoppingBag shoppingBag);
	public int updateProduct(ShoppingBag shoppingBag);
	public int deleteProduct(int sbno);
	public int selectProductNo(ShoppingBag shoppingBag);
	public List<ShoppingBag> selectShoppingProducts(int mno);
	public ShoppingBag selectShoppingProduct(int sbno);
}