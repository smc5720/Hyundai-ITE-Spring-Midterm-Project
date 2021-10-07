package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.Category;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.ProductColor;
import com.mycompany.webapp.dto.ProductSize;
import com.mycompany.webapp.dto.ShoppingBag;
import com.mycompany.webapp.dto.Stock;
import com.mycompany.webapp.service.MemberService;
import com.mycompany.webapp.service.ProductService;
import com.mycompany.webapp.service.ShoppingbagService;

@Controller
@RequestMapping("/product")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Resource
	ProductService productService;

	@GetMapping("/productlist")
	public String productList(@RequestParam(defaultValue = "1") int pageNo, String cLarge, String cMedium,
			String cSmall, Model model, HttpSession session) {
		logger.info("실행");

		// 상품 리스트 상단 카테고리 정보 보여주기 위해 저장
		Category category = new Category(cLarge, cMedium, cSmall);
		// pager에서 사용하기 위해 저장
		model.addAttribute("category", category);

		// DB에 접근해서 해당 카테고리에 상품의 총 개수를 가져온다.
		// Pager에 사용하고, 전체 상품 개수를 보여주기 위함
		int totalRows = productService.getTotalProductNum(category);
		session.setAttribute("totalRows", totalRows);

		// 한 페이지에 12개 상품,
		// 페이지 목록 5 페이지,
		// totalRows: 전체 상품 개수 / pageNo: 현재 페이지
		Pager pager = new Pager(12, 5, totalRows, pageNo);
		// pager도 request 범위에 저장하는데, 그 이유는 jsp에서 사용하기 위해서
		model.addAttribute("pager", pager);

		return "product/productlist";
	}

	@GetMapping(value = "/getProductList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getProductList(@RequestParam(defaultValue = "1") int pageNo, String cLarge, String cMedium,
			String cSmall, Model model, HttpSession session) {
		// Pager에 사용하기 위해 선언
		Category category = new Category(cLarge, cMedium, cSmall);
		model.addAttribute("category", category);

		// 세션에서 totalRows 가져오기
		int totalRows = Integer.parseInt(session.getAttribute("totalRows").toString());
		
		Pager pager = new Pager(12, 5, totalRows, pageNo);
		model.addAttribute("pager", pager);

		// 12개의 상품 리스트를 가져와야 하는데, 이 때 필요한 정보가 (카테고리, 페이저)이다.
		List<Product> products = productService.getProducts(category, pager);

		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();

		for (Product p : products) {
			JSONObject tmpObject = new JSONObject();

			JSONObject pObject = new JSONObject();
			pObject.put("pcode", p.getPcode());
			pObject.put("pname", p.getPname());
			pObject.put("pprice", p.getPprice());
			pObject.put("bname", p.getBname());

			tmpObject.put("product", pObject);
			
			// p의 정보를 이용해서 pcode가 가진 컬러 리스트를 DB에서 가져온다.
			List<ProductColor> colors = productService.getProductColor(p);
			tmpObject.put("colors", colors);
			tmpObject.put("state", 0);
			jsonArray.put(tmpObject);
		}

		jsonObject.put("products", jsonArray);
		jsonObject.put("result", "success");
		String json = jsonObject.toString();

		return json;
	}

	@RequestMapping("/productdetail")
	public String productDetail(String pcode, String cproductcolor, Model model) {
		logger.info("실행");

		// pcode를 이용해서 product 객체 1개를 DB에서 가져온다.
		Product product = productService.getProduct(pcode);
		// product를 이용해서 해당 상품이 가지고 있는 color와 size를 가져온다.
		List<ProductColor> colors = productService.getProductColor(product);
		List<ProductSize> sizes = productService.getProductSize(product);

		for (int i = 0; i < colors.size(); i++) {
			if (cproductcolor.equals(colors.get(i).getCproductcolor())) {
				model.addAttribute("productimage1", colors.get(i).getCimageproduct1());
				model.addAttribute("productimage2", colors.get(i).getCimageproduct2());
				model.addAttribute("productimage3", colors.get(i).getCimageproduct3());
				break;
			}
		}

		model.addAttribute("product", product);
		model.addAttribute("colors", colors);
		model.addAttribute("sizes", sizes);

		int mileage = (int) (product.getPprice() * 0.05);
		int hpoint = (int) (product.getPprice() * 0.001);

		model.addAttribute("mileage", mileage);
		model.addAttribute("hpoint", hpoint);

		return "product/productdetail";
	}

	@RequestMapping(value = "/getProductStock", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getProductStock(String pcode, String color, String size, Model model) {
		String scode = pcode + "_" + color + "_" + size;
		// scode를 이용해서 재고 테이블에서 Stock DTO를 가져온다.
		Stock stock = productService.getProductStock(scode);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("amount", stock.getSproductamount());
		String json = jsonObject.toString();

		return json;
	}

	@Resource
	ShoppingbagService shoppingbagService;

	@RequestMapping("/insertToShoppingbag")
	public String insertToShoppingbag(ShoppingBag shoppingBag, HttpSession session) {

		// 만약 세션에 로그인된 유저가 없으면
		if (session.getAttribute("mno") == null) {
			// 로그인 폼으로 보내주는데, 이 부분은 추후에 시큐리티 기능을 이용하는 것으로 바꿀 예정
			return "redirect:/member/loginForm";
		}

		shoppingBag.setMno(Integer.parseInt(session.getAttribute("mno").toString()));

		// 이미 같은 내용의 상품을 넣은 적이 있는지를 확인하기 위해 사용한다.
		// 이미 있는 내용이라면 해당 sbno 값을 반환하고, 없는 내용이라면 -1을 반환한다.
		int sbno = shoppingbagService.selectSbno(shoppingBag);

		if (sbno == -1) {
			// 쇼핑백에 같은 종류의 상품이 담겨있지 않으면 값을 삽입한다.
			shoppingbagService.insertShoppingbag(shoppingBag);
		} else {
			shoppingBag.setSbno(sbno);
			// 쇼핑백에 이미 같은 종류의 상품이 담겨있으면 값을 갱신한다.
			shoppingbagService.updateShoppingbag(shoppingBag);
		}

		return "redirect:/member/shoppingbag";
	}
}
