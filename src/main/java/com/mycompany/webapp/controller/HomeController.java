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
		return "redirect:/home";
	}

	@RequestMapping("/home")
	public String home() {
		return "home";
	}

	@Resource
	BrandService brandService;

	@GetMapping(value = "/getBrandList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getBrandList(HttpSession session) {
		JSONObject jsonObject = new JSONObject();

		// 처음 접속(세션에 아무런 값이 없을 때)했을 때
		if (session.getAttribute("brands") == null) {
			// Brand 테이블에 접근해서 DB에 저장된 모든 브랜드 리스트를 가져온다.
			List<Brand> brands = brandService.getBrandList();
			// 가져온 브랜드 리스트를 세션에 저장한다.
			// 브라우저를 끄기 전까지 더 이상 브랜드 테이블에 접근하지 않아도 된다.
			// 왜냐하면 세션에서 꺼내쓰면 되기 때문이다.
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

		// 대분류 값 cLarge만 가지고 있는 상태
		// 처음 접속(세션에 아무런 값이 없을 때)했을 때
		if (session.getAttribute(cLarge) == null) {
			Category tmp = new Category();
			// tmp는 대분류 값만 가지고 있는 상태
			tmp.setcLarge(cLarge);
			
			// tmp를 이용해서 중분류 리스트를 가져온다.
			List<Category> categoryMedium = categoryService.getCategoryMedium(tmp);

			JSONArray jsonArray = new JSONArray();

			for (Category m : categoryMedium) {
				// m은 대분류와 중분류 값을 가지고 있는 상태
				m.setcLarge(tmp.getcLarge());
				
				JSONObject tmpObject = new JSONObject();
				
				// m을 이용해서 소분류 리스트를 가져온다.
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
			
			jsonObject.put("result", "success");
			// DB에서 값을 받아온 뒤 세션에 넣어준다.
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