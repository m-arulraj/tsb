package com.tsb.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.tsb.domain.Bill;

public interface BillService {

	public Bill getBill(Long billId);

	public List<Bill> getAllBills();

	public Long saveBill(HttpServletRequest request,String userName);

	public void deleteBill(Long billId);

}
