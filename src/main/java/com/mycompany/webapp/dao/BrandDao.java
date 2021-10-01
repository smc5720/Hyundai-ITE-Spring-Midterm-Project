package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Brand;

@Mapper
public interface BrandDao {
	public List<Brand> selectAllBrands();
}
