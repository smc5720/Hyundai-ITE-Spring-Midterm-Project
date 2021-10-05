package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Category;

@Mapper
public interface CategoryDao {
	public List<Category> selectCategoryMedium(Category forMedium);
	public List<Category> selectCategorySmall(Category forSmall);
}