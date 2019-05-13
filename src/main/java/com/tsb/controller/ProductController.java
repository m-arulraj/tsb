package com.tsb.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tsb.domain.Product;
import com.tsb.service.CategoryService;
import com.tsb.service.ManufacturerService;
import com.tsb.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	ManufacturerService manuService;

	@Autowired
	CategoryService catService;

	@Autowired
	ProductService service;

	@RequestMapping(path = "/product", method = RequestMethod.GET)
	public ModelAndView getAllProduct() {
		ModelAndView mav = new ModelAndView("product");
		mav.addObject("product", new Product());
		mav.addObject("catLst", catService.getAllCategory());
		mav.addObject("prodLst", service.getAllActiveProducts());
		return mav;
	}

	@RequestMapping(path = "/product", method = RequestMethod.POST)
	public ModelAndView saveProduct(@ModelAttribute("product") @Validated Product prod, BindingResult results,
			Principal principal) {
		ModelAndView mav = new ModelAndView("product");
		List<Product> prodLst = null;

		mav.addObject("product", new Product());
		mav.addObject("catLst", catService.getAllCategory());

		if (results.hasErrors()) {
			prodLst = service.getAllActiveProducts();
			mav.addObject("prodLst", prodLst);
			mav.addObject("errorMessage", "One or More error(s) are there kindly correct those and re-submit!!!");
			return mav;
		}

		prod.setCreatedOn(new Date());
		prod.setCreatedBy(principal.getName());
		prod.setModifiedBy(principal.getName());
		prod.setModifiedOn(new Date());
		prod.setDeleteFlag("N");
		service.saveProduct(prod);

		prodLst = service.getAllActiveProducts();
		mav.addObject("prodLst", prodLst);

		mav.addObject("sucessMessage", "Added Sucessfully");
		return mav;
	}

	@RequestMapping(path = "/product/{productId}", method = RequestMethod.POST, params = "Update")
	public ModelAndView getProduct(@PathVariable Long productId) {

		ModelAndView mav = new ModelAndView("product");
		mav.addObject("catLst", catService.getAllCategory());
		mav.addObject("product", service.getActiveProduct(productId));
		mav.addObject("prodLst", service.getAllActiveProducts());
		return mav;
	}

	@RequestMapping(path = "/product/{productId}", method = RequestMethod.POST, params = "Delete")
	public ModelAndView deleteProduct(@PathVariable Long productId) {
		service.deleteProduct(productId);

		ModelAndView mav = new ModelAndView("product");
		mav.addObject("product", new Product());
		mav.addObject("catLst", catService.getAllCategory());
		mav.addObject("prodLst", service.getAllActiveProducts());
		return mav;
	}
	
	@RequestMapping(path = "/product/{categoryId}", method = RequestMethod.GET)
	public @ResponseBody List<Product> getProductsByCategory(@PathVariable Long categoryId) {
		return service.getAllActiveProductsByCategory(categoryId);
	}

}
