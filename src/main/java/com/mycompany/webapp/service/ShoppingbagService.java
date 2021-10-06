package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ShoppingbagDao;
import com.mycompany.webapp.dto.ShoppingBag;

@Service
public class ShoppingbagService {
	private static final Logger logger = LoggerFactory.getLogger(ShoppingbagService.class);

	@Resource
	private ShoppingbagDao shoppingbagDao;

	public int insertShoppingbag(ShoppingBag shoppingBag) {
		return shoppingbagDao.insertProduct(shoppingBag);
	}

	public int updateShoppingbag(ShoppingBag shoppingBag) {
		return shoppingbagDao.updateProduct(shoppingBag);
	}

	public int selectSbno(ShoppingBag shoppingBag) {
		return shoppingbagDao.selectProductNo(shoppingBag);
	}

	public int deleteShoppingbag(int sbno) {
		return shoppingbagDao.deleteProduct(sbno);
	}

	public List<ShoppingBag> getShoppingProducts(int mno) {
		return shoppingbagDao.selectShoppingProducts(mno);
	}
}