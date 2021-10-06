package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.ProductColor;
import com.mycompany.webapp.dto.ProductSize;
import com.mycompany.webapp.dto.ShoppingBag;
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
}