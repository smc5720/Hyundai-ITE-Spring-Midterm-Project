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
import com.mycompany.webapp.dto.ProductSize;
import com.mycompany.webapp.dto.Stock;

@Service
public class ProductService {
	private static final Logger logger = LoggerFactory.getLogger(ProductService.class);

	@Resource
	private ProductDao productDao;
	
	public Product getProduct(String pcode) {
		return productDao.selectProduct(pcode);
	}

	public List<Product> getProducts(Category category, Pager pager) {
		HashMap<String, Object> categoryPager = new HashMap<String, Object>();
		categoryPager.put("category", category);
		categoryPager.put("pager", pager);
		if (category.getcMedium().equals("none")) {
			// 대분류
			return productDao.selectProductsNoMedium(categoryPager);
		} else if (category.getcSmall().equals("none")) {
			// 대분류 + 중분류
			return productDao.selectProductsNoSmall(categoryPager);
		}
		// 대분류 + 중분류 + 소분류
		return productDao.selectProducts(categoryPager);
	}

	public List<ProductColor> getProductColor(Product pcode) {
		return productDao.selectProductColor(pcode);
	}
	
	public List<ProductSize> getProductSize(Product pcode) {
		return productDao.selectProductSize(pcode);
	}

	// 전체 상품 개수를 반환한다.
	public int getTotalProductNum(Category category) {
		if (category.getcMedium().equals("none")) {
			return productDao.countNoMedium(category);
		} else if (category.getcSmall().equals("none")) {
			return productDao.countNoSmall(category);
		}
		return productDao.count(category);
	}
	
	public Stock getProductStock(String scode) {
		return productDao.selectProductStock(scode);
	}
}