package com.tsb.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.tsb.domain.Bill;
import com.tsb.domain.BillItem;
import com.tsb.repository.BillItemRepository;
import com.tsb.repository.BillRepository;

@Service
public class BillServiceImpl implements BillService {

	@Autowired
	BillRepository repo;

	@Autowired
	BillItemRepository itemRepo;

	@Override
	public Long saveBill(HttpServletRequest request, String userName) {
		String billId = request.getParameter("billId");

		String[] stockIds = request.getParameterValues("stockId");
		String[] qtys = request.getParameterValues("qty");
		String[] price = request.getParameterValues("price");
		String[] tax = request.getParameterValues("tax");
		String[] baseprice = request.getParameterValues("baseprice");
		String[] taxprice = request.getParameterValues("taxprice");
		String[] discountprice = request.getParameterValues("discountprice");
		String[] total = request.getParameterValues("total");
		String sub_total = request.getParameter("sub_total");
		String tax_amount = request.getParameter("tax_amount");
		String discount_amount = request.getParameter("discount_amount");
		String total_amount = request.getParameter("total_amount");
		int totalItems = stockIds.length;
		Bill bill = new Bill();
		if (!StringUtils.isEmpty(billId)) {
			bill.setBillId(Long.valueOf(billId));
		}

		bill.setNoOfItems(Long.valueOf(totalItems));
		bill.setTotalAmount(Double.valueOf(total_amount));
		bill.setTotalTaxAmount(Double.valueOf(tax_amount));
		bill.setTotalDiscountAmount(Double.valueOf(discount_amount));
		bill.setTotalBaseAmout(Double.valueOf(sub_total));
		bill.setCreatedBy(userName);
		bill.setModifiedBy(userName);
		bill.setCreatedOn(new Date());
		bill.setModifiedOn(new Date());
		bill.setDeleteFlag("N");

		repo.save(bill);

		List<BillItem> items = new ArrayList<BillItem>(totalItems);

		BillItem item = null;

		for (int i = 0; i < totalItems; i++) {
			item = new BillItem();
			item.setStockId(Long.valueOf(stockIds[i]));
			item.setQuantity(Long.valueOf(qtys[i]));

			item.setMrp(Double.valueOf(price[i]));
			item.setTax(Double.valueOf(tax[i]));
			item.setBaseAmout(Double.valueOf(baseprice[i]));
			item.setTaxAmount(Double.valueOf(taxprice[i]));
			item.setDiscount(Double.valueOf(discountprice[i]));
			item.setAmount(Double.valueOf(total[i]));
			item.setBillId(bill.getBillId());
			item.setBill(bill);
			itemRepo.save(item);
		}

		return bill.getBillId();
	}

	@Override
	public void deleteBill(Long billId) {
		repo.delete(repo.findById(billId).get());
	}

	@Override
	public Bill getBill(Long billId) {
		return repo.findById(billId).get();
	}

	@Override
	public List<Bill> getAllBills() {
		return repo.findAll();
	}

}
