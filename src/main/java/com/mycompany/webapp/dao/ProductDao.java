package com.mycompany.webapp.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Category;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.ProductColor;

@Mapper
public interface ProductDao {
	public List<Product> selectProducts(HashMap<String, Object> categoryPager);
	public List<ProductColor> selectProductColor(Product pcode);
	public int count(Category category);
}
