package com.tsb.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tsb.service.BillService;

@Controller
public class BillController {

	@Autowired
	BillService service;

	@RequestMapping(path = "/billing", method = RequestMethod.GET)
	public ModelAndView getBillingPage() {
		ModelAndView mav = new ModelAndView("billing");
		return mav;
	}

	@RequestMapping(path = "/billing/{billId}", method = RequestMethod.GET)
	public ModelAndView getBillDetail(@PathVariable(name = "billId") Long billId) {
		ModelAndView mav = new ModelAndView("billing");
		mav.addObject("bill", service.getBill(billId));
		return mav;
	}

	@RequestMapping(path = "/bills", method = RequestMethod.GET)
	public ModelAndView getAllBills() {
		ModelAndView mav = new ModelAndView("bills");
		mav.addObject("bills", service.getAllBills());
		return mav;
	}

	@RequestMapping(path = "/bill/{billId}", method = RequestMethod.GET, params = "view")
	public ModelAndView getBillToView(@PathVariable(name = "billId") Long billId) {
		ModelAndView mav = new ModelAndView("bill");
		mav.addObject("bill", service.getBill(billId));
		return mav;
	}

	@RequestMapping(path = "/bill/{billId}", method = RequestMethod.GET, params = "edit")
	public ModelAndView getBillToEdit(@PathVariable(name = "billId") Long billId) {
		ModelAndView mav = new ModelAndView("billing");
		mav.addObject("bill", service.getBill(billId));
		return mav;
	}

	@RequestMapping(path = "/bill/{billId}", method = RequestMethod.GET, params = "print")
	public ModelAndView printBill(@PathVariable(name = "billId") Long billId) {
		ModelAndView mav = new ModelAndView("bill");
		mav.addObject("bill", service.getBill(billId));
		mav.addObject("message", billId + "Printed sucessfuly!!!");
		return mav;
	}

	@RequestMapping(path = "/billing", method = RequestMethod.POST, params = "Save")
	public ModelAndView saveBill(HttpServletRequest request, Principal principal) {
		String loggedIn = principal.getName();
		String billId = request.getParameter("billId");
		String view = "billing";
		if (!StringUtils.isEmpty(billId)) {
			view = "redirect:/bills";
		}
		ModelAndView mav = new ModelAndView(view);
		mav.addObject("billId", service.saveBill(request, loggedIn));
		return mav;
	}

	@RequestMapping(path = "/billing", method = RequestMethod.POST, params = "Save_Print")
	public ModelAndView saveAndPrintBill(HttpServletRequest request, Principal principal) {
		String loggedIn = principal.getName();

		String billId = request.getParameter("billId");
		String view = "billing";
		if (!StringUtils.isEmpty(billId)) {
			view = "bills";
		}
		ModelAndView mav = new ModelAndView(view);
		mav.addObject("billId", service.saveBill(request, loggedIn));
		return mav;
	}

	@RequestMapping(path = "/billing/{billId}", method = RequestMethod.POST, params = "Delete")
	public ModelAndView deleteBill(@PathVariable Long billId) {
		ModelAndView mav = new ModelAndView("billing");
		return mav;
	}

}
