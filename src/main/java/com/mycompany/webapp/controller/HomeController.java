package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.Brand;
import com.mycompany.webapp.dto.Category;
import com.mycompany.webapp.dto.Pager;
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
	public String getBrandList(HttpSession session) {
		logger.info("실행");

		JSONObject jsonObject = new JSONObject();

		if (session.getAttribute("brands") == null) {
			List<Brand> brands = brandService.getBrandList();
			session.setAttribute("brands", brands);
		}

		jsonObject.put("brands", session.getAttribute("brands"));
		jsonObject.put("result", "success");
		String json = jsonObject.toString();

		return json;
	}

	@Resource
	CategoryService categoryService;

	@GetMapping(value = "/getCategoryList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getCategoryList(String cLarge, HttpSession session) {
		JSONObject jsonObject = new JSONObject();

		if (session.getAttribute(cLarge) == null) {
			Category tmp = new Category();
			tmp.setcLarge(cLarge);
			List<Category> categoryMedium = categoryService.getCategoryMedium(tmp);
			jsonObject.put("result", "success");

			JSONArray jsonArray = new JSONArray();

			for (Category m : categoryMedium) {
				m.setcLarge(tmp.getcLarge());
				JSONObject tmpObject = new JSONObject();
				List<Category> categorySmall = categoryService.getCategorySmall(m);

				JSONArray tmpArray = new JSONArray();
				int idx = 0;

				for (Category s : categorySmall) {
					tmpArray.put(idx, s.getcSmall());
					idx += 1;
				}

				tmpObject.put(m.getcMedium(), tmpArray);
				jsonArray.put(tmpObject);
			}
			session.setAttribute(cLarge, jsonArray);
		}

		jsonObject.put(cLarge, session.getAttribute(cLarge));
		String json = jsonObject.toString();

		return json;
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
	
	@Resource
	ProductService productService;

	@GetMapping("/productlist")
	public String productList(@RequestParam(defaultValue = "1") int pageNo, String cLarge, String cMedium,
			String cSmall, Model model, HttpSession session) {
		logger.info("실행");

		Category category = new Category(cLarge, cMedium, cSmall);
		model.addAttribute("category", category);

		int totalRows = productService.getTotalProductNum(category);
		session.setAttribute("totalRows", totalRows);
		
		Pager pager = new Pager(12, 5, totalRows, pageNo);
		model.addAttribute("pager", pager);

		return "product/productlist";
	}

	@GetMapping(value = "/getProductList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getProductList(@RequestParam(defaultValue = "1") int pageNo, String cLarge, String cMedium,
			String cSmall, Model model, HttpSession session) {
		Category category = new Category(cLarge, cMedium, cSmall);
		model.addAttribute("category", category);

		int totalRows = Integer.parseInt(session.getAttribute("totalRows").toString());
		Pager pager = new Pager(12, 5, totalRows, pageNo);
		model.addAttribute("pager", pager);

		List<Product> products = productService.getProducts(category, pager);

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
			tmpObject.put("state", 0);
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