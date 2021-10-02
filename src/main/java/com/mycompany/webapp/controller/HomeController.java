package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.Brand;
import com.mycompany.webapp.dto.Category;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.ProductColor;
import com.mycompany.webapp.service.BrandService;
import com.mycompany.webapp.service.CategoryService;
import com.mycompany.webapp.service.ProductService;

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

		return json;
	}

	@Resource
	CategoryService categoryService;

	@GetMapping(value = "/getCategoryList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getCategoryList(String cLarge) {
		logger.info("실행");

		Category tmp = new Category();
		tmp.setCLarge(cLarge);
		List<Category> categoryMedium = categoryService.getCategoryMedium(tmp);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");

		JSONArray jsonArray = new JSONArray();

		for (Category m : categoryMedium) {
			m.setCLarge(tmp.getCLarge());
			JSONObject tmpObject = new JSONObject();
			List<Category> categorySmall = categoryService.getCategorySmall(m);
			tmpObject.put(m.getCMedium(), categorySmall);
			jsonArray.put(tmpObject);
		}

		jsonObject.put(tmp.getCLarge(), jsonArray);
		String json = jsonObject.toString();

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

	@GetMapping("/productlist")
	public String productList(String cLarge, String cMedium, String cSmall) {
		logger.info("실행");
		return "product/productlist";
	}
	
	@Resource
	ProductService productService;

	@GetMapping(value = "/getProductList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getProductList(String cLarge, String cMedium, String cSmall) {
		logger.info("실행");
		
		List<Product> products = productService.getProducts(cLarge, cMedium, cSmall);		
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		
		JSONArray jsonArray = new JSONArray();

		for (Product p : products) {
			JSONObject tmpObject = new JSONObject();
			
			JSONObject pObject = new JSONObject();
			pObject.put("pcode", p.getPcode());
			pObject.put("pname", p.getPname());
			pObject.put("pprice", p.getPprice());
			pObject.put("bname", p.getBname());
			
			tmpObject.put("product", pObject);
			List<ProductColor> colors = productService.getProductColor(p);
			tmpObject.put("colors", colors);
			jsonArray.put(tmpObject);
		}

		jsonObject.put("products", jsonArray);
		String json = jsonObject.toString();

		return json;
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