package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.Brand;
import com.mycompany.webapp.service.BrandService;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("/")
	public String content() {
		logger.info("실행");
		return "home";
	}

	@RequestMapping("/home")
	public String home() {
		logger.info("실행");
		return "home";
	}
	
	@Resource
	BrandService brandService;
	
	@GetMapping(value = "/getBrandList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getBrandList() {
		logger.info("실행");
		
		List<Brand> brands = brandService.getBrandList();
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");	
		jsonObject.put("brands", brands);
		String json = jsonObject.toString();
		
		logger.info(json);
		
		return json;
	}

	@RequestMapping("/event")
	public String event() {
		logger.info("실행");
		return "common/event";
	}

	@RequestMapping("/loginForm")
	public String login() {
		logger.info("실행");
		return "redirect:/member/loginForm";
	}

	@RequestMapping("/myorders")
	public String myOrders() {
		logger.info("실행");
		return "member/myorders";
	}

	@RequestMapping("/shoppingbag")
	public String shoppingBag() {
		logger.info("실행");
		return "member/shoppingbag";
	}

	@RequestMapping("/productlist")
	public String productList() {
		logger.info("실행");
		return "product/productlist";
	}

	@RequestMapping("/productdetail")
	public String productDetail() {
		logger.info("실행");
		return "product/productdetail";
	}

	@RequestMapping("/order")
	public String order() {
		logger.info("실행");
		return "order/order";
	}

	@RequestMapping("/ordercomplete")
	public String orderComplete() {
		logger.info("실행");
		return "order/ordercomplete";
	}

	@RequestMapping("/error/403")
	public String error403() {
		logger.info("실행");
		return "error/403";
	}
}