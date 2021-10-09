package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.Address;
import com.mycompany.webapp.dto.Brand;
import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.ProductColor;
import com.mycompany.webapp.dto.ProductOrder;
import com.mycompany.webapp.dto.ShoppingBag;
import com.mycompany.webapp.service.AddressService;
import com.mycompany.webapp.service.MemberService;
import com.mycompany.webapp.service.OrderService;
import com.mycompany.webapp.service.ProductService;
import com.mycompany.webapp.service.ShoppingbagService;

@Controller
@RequestMapping("/order")
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	@Resource
	private ShoppingbagService shoppingbagService;

	@Resource
	private ProductService productService;

	@Resource
	private MemberService memberService;

	@Resource
	private OrderService orderService;

	@Resource
	private AddressService addressService;

	@RequestMapping("/ordering")
	public String order(HttpSession session, HttpServletRequest request) {
		logger.info("실행");

		// 결제 총액을 저장한다.
		int total = 0;
		// 배송비를 저장한다.
		int post = 2500;

		int itemsLength = Integer.parseInt(session.getAttribute("itemsLength").toString());
		String checkedItems = session.getAttribute("checkedItems").toString();

		List<ShoppingBag> shoppingBags = new ArrayList<ShoppingBag>();

		StringTokenizer st = new StringTokenizer(checkedItems, ",");

		for (int i = 0; i < itemsLength; i++) {
			int sbno = Integer.parseInt(st.nextToken());

			ShoppingBag sb = shoppingbagService.getShoppingProduct(sbno);
			Product p = productService.getProduct(sb.getPcode());

			List<ProductColor> colors = productService.getProductColor(p);
			sb.setColors(colors);

			for (int j = 0; j < colors.size(); j++) {
				if (sb.getSbproductcolor().equals(colors.get(j).getCproductcolor())) {
					sb.setColoridx(j);
					break;
				}
			}

			sb.setBname(p.getBname());
			sb.setPname(p.getPname());
			sb.setPprice(p.getPprice());
			total += p.getPprice() * sb.getSbproductamount();
			shoppingBags.add(sb);
		}

		if (total > 30000) {
			post = 0;
		}

		request.setAttribute("shoppingBags", shoppingBags);
		request.setAttribute("total", total);
		request.setAttribute("post", post);

		Member member = memberService.getMember(Integer.parseInt(session.getAttribute("mno").toString()));
		String tel = member.getMtel();
		tel = tel.substring(0, 3) + "-" + tel.substring(3, 7) + "-" + tel.substring(7);
		member.setMtel(tel);
		request.setAttribute("member", member);

		return "order/order";
	}

	@RequestMapping("/orderpayment")
	public String orderPayment(String ptype, String apostcode, String aaddress1, String aaddress2, String oreceivername,
			String oreceivertel1, String oreceivertel2, String ocomment, int ano, HttpSession session) {
		logger.info("실행");

		int mno = Integer.parseInt(session.getAttribute("mno").toString());

		ProductOrder productOrder = new ProductOrder();
		productOrder.setPtype(ptype);
		productOrder.setOreceivername(oreceivername);
		productOrder.setOreceivertel1(oreceivertel1);
		productOrder.setOreceivertel2(oreceivertel2);
		productOrder.setOcomment(ocomment);
		productOrder.setMno(mno);
		productOrder.setOdate(new Date());
		productOrder.setOstate(0);
		productOrder.setPmonth(0);
		productOrder.setAno(ano);

		Address address = new Address();
		address.setApostcode(apostcode);
		address.setAaddress1(aaddress1);
		address.setAaddress2(aaddress2);
		address.setMno(mno);
		address.setAno(ano);

		String checkedItems = session.getAttribute("checkedItems").toString();
		int itemsLength = Integer.parseInt(session.getAttribute("itemsLength").toString());

		orderService.paymentOrder(productOrder, address, checkedItems, itemsLength);

		session.removeAttribute("checkedItems");
		session.removeAttribute("itemsLength");

		return "redirect:/order/ordercomplete";
	}

	@RequestMapping("/ordercomplete")
	public String orderComplete() {
		logger.info("실행");
		return "order/ordercomplete";
	}

	@RequestMapping(value = "/getBaseAddress", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getBaseAddress(int mno) {
		JSONObject jsonObject = new JSONObject();
		Address address = addressService.getBaseAddress(mno);

		jsonObject.put("ano", address.getAno());
		jsonObject.put("postcode", address.getApostcode());
		jsonObject.put("address1", address.getAaddress1());
		jsonObject.put("address2", address.getAaddress2());
		String json = jsonObject.toString();

		return json;
	}

	@RequestMapping(value = "/getAddresses", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getAddresses(int mno) {
		List<Address> addresses = addressService.getAddresses(mno);
		JSONArray jsonArray = new JSONArray();

		for (Address ad : addresses) {
			JSONObject tmpObject = new JSONObject();
			tmpObject.put("ano", ad.getAno());
			tmpObject.put("postcode", ad.getApostcode());
			tmpObject.put("address1", ad.getAaddress1());
			tmpObject.put("address2", ad.getAaddress2());
			jsonArray.put(tmpObject);
		}

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("addresses", jsonArray);
		String json = jsonObject.toString();

		return json;
	}
}