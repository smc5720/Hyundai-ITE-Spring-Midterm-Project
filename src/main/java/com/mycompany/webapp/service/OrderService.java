package com.mycompany.webapp.service;

import java.util.HashMap;
import java.util.StringTokenizer;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.webapp.dao.OrderDao;
import com.mycompany.webapp.dto.Address;
import com.mycompany.webapp.dto.ProductOrder;
import com.mycompany.webapp.dto.ProductOrderItem;
import com.mycompany.webapp.dto.ShoppingBag;

@Service
public class OrderService {
	private static final Logger logger = LoggerFactory.getLogger(OrderService.class);

	@Resource
	OrderDao orderDao;

	@Resource
	AddressService addressService;

	@Resource
	ShoppingbagService shoppingbagService;

	// 주문 내역을 추가한다.
	public int insertOrder(ProductOrder productOrder, int ano) {
		if (ano == 0) {
			return orderDao.insertOrderNewAddress(productOrder);
		} else {
			return orderDao.insertOrderOldAddress(productOrder);
		}
	}

	public int insertItemToProductOrderItem(ProductOrderItem productOrderItem) {
		return orderDao.insertItemToProductOrderItem(productOrderItem);
	}

	public int decreaseStockAmount(String scode, int amount) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("scode", scode);
		map.put("amount", amount);

		return orderDao.decreaseStockAmount(map);
	}

	// 결제하기 버튼을 누르고 일어나는 트랜잭션
	@Transactional
	public void paymentOrder(ProductOrder productOrder, Address address, String checkedItems, int itemsLength) {
		try {
			if (address.getAno() == 0) {
				// 현재 배송지를 테이블에 추가한다. (배송지 번호 부여)
				addressService.insertAddress(address);
			}

			// 주문 내역을 테이블에 추가한다. (주문 번호 부여)
			insertOrder(productOrder, address.getAno());

			StringTokenizer st = new StringTokenizer(checkedItems, ",");

			// 주문 아이템들을 테이블에 추가한다.
			for (int i = 0; i < itemsLength; i++) {
				int sbno = Integer.parseInt(st.nextToken());
				ShoppingBag sb = shoppingbagService.getShoppingProduct(sbno);
				ProductOrderItem poi = new ProductOrderItem();
				String scode = sb.getPcode() + "_" + sb.getSbproductcolor() + "_" + sb.getSbproductsize();
				poi.setScode(scode);
				poi.setOamount(sb.getSbproductamount());
				insertItemToProductOrderItem(poi);

				// 주문된 상품의 재고를 감소시킨다.
				decreaseStockAmount(scode, poi.getOamount());

				// 주문된 상품을 쇼핑백에서 제거한다.
				shoppingbagService.deleteShoppingbag(sbno);
			}
		} catch (Exception e) {
			logger.info("우린 절대 '결제하기'를 실패하지 않는다.");
		}
	}
}