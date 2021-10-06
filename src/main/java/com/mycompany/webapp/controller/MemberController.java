package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.ProductColor;
import com.mycompany.webapp.dto.ProductSize;
import com.mycompany.webapp.dto.ShoppingBag;
import com.mycompany.webapp.dto.Stock;
import com.mycompany.webapp.service.ProductService;
import com.mycompany.webapp.service.ShoppingbagService;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping("/loginForm")
	public String loginForm() {
		logger.info("실행");
		return "member/loginForm";
	}

	@RequestMapping("/myorders")
	public String myOrders() {
		logger.info("실행");
		return "member/myorders";
	}

	@Resource
	ShoppingbagService shoppingbagService;

	@Resource
	ProductService productService;

	@RequestMapping("/shoppingbag")
	public String shoppingBag(HttpSession session, Model model) {
		logger.info("실행");

		if (session.getAttribute("mno") == null) {
			return "redirect:/member/loginForm";
		}

		int mno = Integer.parseInt(session.getAttribute("mno").toString());
		List<ShoppingBag> shoppingBags = shoppingbagService.getShoppingProducts(mno);

		for (ShoppingBag sb : shoppingBags) {
			Product p = productService.getProduct(sb.getPcode());

			sb.setPname(p.getPname());
			sb.setBname(p.getBname());
			sb.setPprice(p.getPprice());

			List<ProductColor> colors = productService.getProductColor(p);
			sb.setColors(colors);

			for (int i = 0; i < colors.size(); i++) {
				if (sb.getSbproductcolor().equals(colors.get(i).getCproductcolor())) {
					sb.setColoridx(i);
					break;
				}
			}

			sb.setSizes(productService.getProductSize(p));
		}

		model.addAttribute("shoppingBags", shoppingBags);

		return "member/shoppingbag";
	}

	@PostMapping("/changeProductOption")
	public String changeProductOption(int sbnoSelected, String pcodeSelected, String colorSelected, String sizeSelected,
			int amountSelected, HttpSession session) {
		logger.info("실행");

		ShoppingBag sbObject = new ShoppingBag();
		sbObject.setSbno(sbnoSelected);
		sbObject.setSbproductcolor(colorSelected);
		sbObject.setSbproductsize(sizeSelected);
		sbObject.setPcode(pcodeSelected);
		sbObject.setMno(Integer.parseInt(session.getAttribute("mno").toString()));

		// 변경하려는 값이 이미 존재하는지 확인한다.
		int sbno = shoppingbagService.selectSbno(sbObject);

		if (sbno == -1) {
			// 쇼핑백에 이미 같은 종류의 상품이 담겨있으면 값을 갱신한다.
			shoppingbagService.updateShoppingbag(sbObject);
		} else {
			// 이미 존재한다면 변경하려는 행을 삭제하고, 이전에 존재하는 행을 갱신한다.
			shoppingbagService.deleteShoppingbag(sbnoSelected);
			sbObject.setSbno(sbno);
			shoppingbagService.updateShoppingbag(sbObject);
		}

		String scode = pcodeSelected + "_" + colorSelected + "_" + sizeSelected;
		int remainStock = productService.getProductStock(scode).getSproductamount();

		sbObject.setSbproductamount(Math.min(amountSelected, remainStock));
		shoppingbagService.updateShoppingbag(sbObject);

		session.setAttribute("remainStock", remainStock);
		session.setAttribute("remainSbno", sbnoSelected);

		return "redirect:/member/shoppingbag";
	}

	@RequestMapping("/deleteshoppingbag")
	public String deleteShoppingbag(int sbnoSelected) {
		logger.info("실행");
		shoppingbagService.deleteShoppingbag(sbnoSelected);

		return "redirect:/member/shoppingbag";
	}
}