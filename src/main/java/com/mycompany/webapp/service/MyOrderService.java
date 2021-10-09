package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.MyOrderDao;
import com.mycompany.webapp.dto.ProductOrder;

@Service
public class MyOrderService {
	private static final Logger logger = LoggerFactory.getLogger(MyOrderService.class);
	
	@Resource
	private MyOrderDao myOrderDao;
	
	public List<ProductOrder> getProductOrder(int mno) {
		logger.info("run");
		return myOrderDao.selectProductOrders(mno);
	}

}