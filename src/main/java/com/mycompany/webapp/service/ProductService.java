package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ProductDao;
import com.mycompany.webapp.dto.Category;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.ProductColor;

@Service
public class ProductService {
	private static final Logger logger = LoggerFactory.getLogger(ProductService.class);

	@Resource
	private ProductDao productDao;

	public List<Product> getProducts(String cLarge, String cMedium, String cSmall) {
		Category category = new Category();
		category.setCLarge(cLarge);
		category.setCMedium(cMedium);
		category.setCSmall(cSmall);
		return productDao.selectProducts(category);
	}
	
	public List<ProductColor> getProductColor(Product pcode) {
		return productDao.selectProductColor(pcode);
	}
}