package com.mycompany.webapp.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Category;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.ProductColor;
import com.mycompany.webapp.dto.ProductSize;
import com.mycompany.webapp.dto.Stock;

@Mapper
public interface ProductDao {
	public Product selectProduct(String pcode);
	public List<Product> selectProducts(HashMap<String, Object> categoryPager);
	public List<Product> selectProductsNoMedium(HashMap<String, Object> categoryPager);
	public List<Product> selectProductsNoSmall(HashMap<String, Object> categoryPager);
	public List<ProductColor> selectProductColor(Product pcode);
	public List<ProductSize> selectProductSize(Product pcode);
	public Stock selectProductStock(String scode);
	public int count(Category category);
	public int countNoMedium(Category category);
	public int countNoSmall(Category category);
}
