package com.mycompany.webapp.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ProductDao;
import com.mycompany.webapp.dto.Category;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.ProductColor;

@Service
public class ProductService {
	private static final Logger logger = LoggerFactory.getLogger(ProductService.class);

	@Resource
	private ProductDao productDao;

	public List<Product> getProducts(Category category, Pager pager) {
		HashMap<String, Object> categoryPager = new HashMap<String, Object>(); 
		categoryPager.put("category", category);
		categoryPager.put("pager", pager);
		return productDao.selectProducts(categoryPager);
	}
	
	public List<ProductColor> getProductColor(Product pcode) {
		return productDao.selectProductColor(pcode);
	}
	
	// 전체 상품 개수를 반환한다.
	public int getTotalProductNum(Category category) {
		return productDao.count(category);
	}
}