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

import com.tsb.domain.Manufacturer;
import com.tsb.service.ManufacturerService;

@Controller
public class ManufacturerController {

	@Autowired
	ManufacturerService service;

	@RequestMapping(path = "/manufacturer", method = RequestMethod.GET)
	public ModelAndView getAllManufacturer() {
		List<Manufacturer> manuLst = service.getAllManufacturer();

		ModelAndView mav = new ModelAndView("manufacturer");
		mav.addObject("manufacturer", new Manufacturer());
		mav.addObject("manuLst", manuLst);
		return mav;
	}

	@RequestMapping(path = "/manufacturer", method = RequestMethod.POST)
	public ModelAndView saveManufacturer(@ModelAttribute("manufacturer") @Validated Manufacturer manu, BindingResult results,
			Principal principal) {
		ModelAndView mav = new ModelAndView("manufacturer");
		List<Manufacturer> manuLst = null;

		mav.addObject("manufacturer", new Manufacturer());

		if (results.hasErrors()) {
			manuLst = service.getAllManufacturer();
			mav.addObject("manuLst", manuLst);
			mav.addObject("errorMessage", "One or More error(s) are there kindly correct those and re-submit!!!");
			return mav;
		}

		manu.setCreatedOn(new Date());
		manu.setCreatedBy(principal.getName());
		manu.setModifiedBy(principal.getName());
		manu.setModifiedOn(new Date());
		manu.setDeleteFlag("N");
		service.saveManufacturer(manu);

		manuLst = service.getAllManufacturer();
		mav.addObject("manuLst", manuLst);
		mav.addObject("sucessMessage", "Added Sucessfully");
		return mav;
	}

	@RequestMapping(path = "/manufacturer/{manufacturerId}", method = RequestMethod.POST, params = "Update")
	public ModelAndView getManufacturer(@PathVariable Long manufacturerId) {
		List<Manufacturer> manuLst = service.getAllManufacturer();

		ModelAndView mav = new ModelAndView("manufacturer");
		mav.addObject("manufacturer", service.getManufacturer(manufacturerId));
		mav.addObject("manuLst", manuLst);
		return mav;
	}

	@RequestMapping(path = "/manufacturer/{manufacturerId}", method = RequestMethod.POST, params = "Delete")
	public ModelAndView deleteManufacturer(@PathVariable Long manufacturerId) {
		service.deleteManufacturer(manufacturerId);
		List<Manufacturer> manuLst = service.getAllManufacturer();

		ModelAndView mav = new ModelAndView("manufacturer");
		mav.addObject("manufacturer", new Manufacturer());
		mav.addObject("manuLst", manuLst);
		return mav;
	}

}
