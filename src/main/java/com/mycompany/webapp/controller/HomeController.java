package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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
import com.mycompany.webapp.service.BrandService;
import com.mycompany.webapp.service.CategoryService;

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