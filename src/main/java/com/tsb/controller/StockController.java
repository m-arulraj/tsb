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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tsb.domain.Stock;
import com.tsb.service.CategoryService;
import com.tsb.service.ManufacturerService;
import com.tsb.service.ProductService;
import com.tsb.service.StockService;

@Controller
public class StockController {

	@Autowired
	ManufacturerService manuService;

	@Autowired
	CategoryService catService;

	@Autowired
	ProductService prodService;

	@Autowired
	StockService service;

	@RequestMapping(path = "/stock", method = RequestMethod.GET)
	public ModelAndView getAllStock() {
		ModelAndView mav = new ModelAndView("stock");
		mav.addObject("stock", new Stock());
		mav.addObject("manuLst", manuService.getAllManufacturer());
		mav.addObject("catLst", catService.getAllCategory());
		mav.addObject("prodLst", prodService.getAllActiveProducts());
		mav.addObject("stockLst", service.getAllActiveStocks());
		return mav;
	}

	@RequestMapping(path = "/stock", method = RequestMethod.POST)
	public ModelAndView saveStock(@ModelAttribute("stock") @Validated Stock prod, BindingResult results,
			Principal principal) {
		ModelAndView mav = new ModelAndView("stock");

		mav.addObject("stock", new Stock());
		mav.addObject("manuLst", manuService.getAllManufacturer());
		mav.addObject("catLst", catService.getAllCategory());
		mav.addObject("prodLst", prodService.getAllActiveProducts());

		if (results.hasErrors()) {
			mav.addObject("stockLst", service.getAllActiveStocks());
			mav.addObject("errorMessage", "One or More error(s) are there kindly correct those and re-submit!!!");
			return mav;
		}

		prod.setCreatedOn(new Date());
		prod.setCreatedBy(principal.getName());
		prod.setModifiedBy(principal.getName());
		prod.setModifiedOn(new Date());
		prod.setDeleteFlag("N");
		service.saveStock(prod);

		mav.addObject("stockLst", service.getAllActiveStocks());

		mav.addObject("sucessMessage", "Added Sucessfully");
		return mav;
	}

	@RequestMapping(path = "/stock/{stockId}", method = RequestMethod.POST, params = "Update")
	public ModelAndView getStock(@PathVariable Long stockId) {

		ModelAndView mav = new ModelAndView("stock");
		mav.addObject("stock", service.getActiveStock(stockId));
		mav.addObject("manuLst", manuService.getAllManufacturer());
		mav.addObject("catLst", catService.getAllCategory());
		mav.addObject("prodLst", prodService.getAllActiveProducts());
		mav.addObject("stockLst", service.getAllActiveStocks());
		return mav;
	}

	@RequestMapping(path = "/stock/{stockId}", method = RequestMethod.POST, params = "Delete")
	public ModelAndView deleteStock(@PathVariable Long stockId) {
		service.deleteStock(stockId);

		ModelAndView mav = new ModelAndView("stock");
		mav.addObject("stock", new Stock());
		mav.addObject("manuLst", manuService.getAllManufacturer());
		mav.addObject("catLst", catService.getAllCategory());
		mav.addObject("prodLst", prodService.getAllActiveProducts());
		mav.addObject("stockLst", service.getAllActiveStocks());
		return mav;
	}

	@RequestMapping(path = "/stock/products", method = RequestMethod.GET)
	public @ResponseBody List<Stock> getStockAutoComplet(@RequestParam("term") String query) {
		return service.getAutoCompleteStocks(query);
	}
	
	@RequestMapping(path = "/newlogin", method = RequestMethod.GET)
	public String newlogin() {
		return "newlogin";
	}
	
	@RequestMapping(path = "/newhome", method = RequestMethod.GET)
	public String newhome() {
		return "newhome";
	}

}
