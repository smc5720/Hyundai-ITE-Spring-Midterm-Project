package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BrandDao;
import com.mycompany.webapp.dto.Brand;

@Service
public class BrandService {
	private static final Logger logger = LoggerFactory.getLogger(BrandService.class);

	@Resource
	private BrandDao brandDao;

	public List<Brand> getBrandList() {
		return brandDao.selectAllBrands();
	}
}
