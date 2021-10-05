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

import com.mycompany.webapp.dto.Category;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.ProductColor;
import com.mycompany.webapp.dto.ProductSize;
import com.mycompany.webapp.dto.Stock;
import com.mycompany.webapp.service.ProductService;

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
	public String productDetail(String pcode, String cproductcolor, Model model) {
		logger.info("실행");

		Product product = productService.getProduct(pcode);
		List<ProductColor> colors = productService.getProductColor(product);
		List<ProductSize> sizes = productService.getProductSize(product);
		
		for(int i=0; i<colors.size(); i++) {
			if(cproductcolor.equals(colors.get(i).getCproductcolor())) {
				model.addAttribute("productimage1", colors.get(i).getCimageproduct1());
				model.addAttribute("productimage2", colors.get(i).getCimageproduct2());
				model.addAttribute("productimage3", colors.get(i).getCimageproduct3());
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
	
	@RequestMapping(value="/getProductStock", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getProductStock(String pcode, String color, String size) {
		String scode = pcode + "_" + color + "_" + size;
		Stock stock = productService.getProductStock(scode);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("amount", stock.getSproductamount());
		String json = jsonObject.toString();

		return json;
	}
}
