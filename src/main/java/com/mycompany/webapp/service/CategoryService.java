package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CategoryDao;
import com.mycompany.webapp.dto.Category;

@Service
public class CategoryService {
	private static final Logger logger = LoggerFactory.getLogger(CategoryService.class);

	@Resource
	private CategoryDao categoryDao;

	public List<Category> getCategoryMedium(Category forMedium) {
		return categoryDao.selectCategoryMedium(forMedium);
	}
	
	public List<Category> getCategorySmall(Category forSmall) {
		return categoryDao.selectCategorySmall(forSmall);
	}
}
