package com.mycompany.webapp.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.MyOrderDao;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.ProductOrder;

@Service
public class MyOrderService {
	private static final Logger logger = LoggerFactory.getLogger(MyOrderService.class);
	
	@Resource
	private MyOrderDao myOrderDao;
	
	public List<ProductOrder> getProductOrder(int mno, Pager page, String type, String keyword) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("mno", mno);
		hm.put("pager", page);
		hm.put("type", type);
		hm.put("keyword", keyword);
		return myOrderDao.selectProductOrders(hm);
	}
	public int getProductOrderCount(int mno, String type, String keyword) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("mno", mno);
		map.put("type", type);
		map.put("keyword", keyword);
		return myOrderDao.selectProductOrderCount(map);
	}
}
