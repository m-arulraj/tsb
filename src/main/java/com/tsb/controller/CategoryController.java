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
import org.springframework.web.servlet.ModelAndView;

import com.tsb.domain.Category;
import com.tsb.service.CategoryService;

@Controller
public class CategoryController {

	@Autowired
	CategoryService service;

	@RequestMapping(path = "/category", method = RequestMethod.GET)
	public ModelAndView getAllCategory() {
		List<Category> catLst = service.getAllCategory();

		ModelAndView mav = new ModelAndView("category");
		mav.addObject("category", new Category());
		mav.addObject("catLst", catLst);
		return mav;
	}

	@RequestMapping(path = "/category", method = RequestMethod.POST)
	public ModelAndView saveCategory(@ModelAttribute("category") @Validated Category cat, BindingResult results,
			Principal principal) {
		ModelAndView mav = new ModelAndView("category");
		List<Category> catLst = null;

		mav.addObject("category", new Category());

		if (results.hasErrors()) {
			catLst = service.getAllCategory();
			mav.addObject("catLst", catLst);
			mav.addObject("errorMessage", "One or More error(s) are there kindly correct those and re-submit!!!");
			return mav;
		}

		cat.setCreatedOn(new Date());
		cat.setCreatedBy(principal.getName());
		cat.setModifiedBy(principal.getName());
		cat.setModifiedOn(new Date());
		cat.setDeleteFlag("N");
		service.saveCategory(cat);

		catLst = service.getAllCategory();
		mav.addObject("catLst", catLst);
		mav.addObject("sucessMessage", "Added Sucessfully");
		return mav;
	}

	@RequestMapping(path = "/category/{categoryId}", method = RequestMethod.POST, params = "Update")
	public ModelAndView getCategory(@PathVariable Long categoryId) {
		List<Category> catLst = service.getAllCategory();

		ModelAndView mav = new ModelAndView("category");
		mav.addObject("category", service.getCategory(categoryId));
		mav.addObject("catLst", catLst);
		return mav;
	}

	@RequestMapping(path = "/category/{categoryId}", method = RequestMethod.POST, params = "Delete")
	public ModelAndView deleteCategory(@PathVariable Long categoryId) {
		service.deleteCategory(categoryId);
		List<Category> catLst = service.getAllCategory();

		ModelAndView mav = new ModelAndView("category");
		mav.addObject("category", new Category());
		mav.addObject("catLst", catLst);
		return mav;
	}

}
