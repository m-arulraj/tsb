package com.tsb.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tsb_bill_items")
public class BillItem {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "itemid", nullable = false)
	private Long itemId;

	@Column(name = "billid", nullable = false)
	private Long billId;

	@Column(name = "stockid", nullable = false)
	private Long stockId;

	@Column(name = "quantity", nullable = false)
	private Long quantity;

	@Column(name = "mrp", nullable = false)
	private Double mrp;

	@Column(name = "tax", nullable = false)
	private Double tax;

	@Column(name = "taxamount", nullable = false)
	private Double taxAmount;

	@Column(name = "baseamount", nullable = false)
	private Double baseAmout;

	@Column(name = "discount", nullable = false)
	private Double discount;

	@Column(name = "amount", nullable = false)
	private Double amount;

	@ManyToOne(fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "billid", nullable = false, insertable = false, updatable = false)
	private Bill bill;

	@OneToOne(fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "STOCKID", nullable = false, insertable = false, updatable = false)
	private Stock stock;

	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	public Long getBillId() {
		return billId;
	}

	public void setBillId(Long billId) {
		this.billId = billId;
	}

	public Long getStockId() {
		return stockId;
	}

	public void setStockId(Long stockId) {
		this.stockId = stockId;
	}

	public Long getQuantity() {
		return quantity;
	}

	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}

	public Double getMrp() {
		return mrp;
	}

	public void setMrp(Double mrp) {
		this.mrp = mrp;
	}

	public Double getTax() {
		return tax;
	}

	public void setTax(Double tax) {
		this.tax = tax;
	}

	public Double getTaxAmount() {
		return taxAmount;
	}

	public void setTaxAmount(Double taxAmount) {
		this.taxAmount = taxAmount;
	}

	public Double getBaseAmout() {
		return baseAmout;
	}

	public void setBaseAmout(Double baseAmout) {
		this.baseAmout = baseAmout;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public Bill getBill() {
		return bill;
	}

	public void setBill(Bill bill) {
		this.bill = bill;
	}

	public Stock getStock() {
		return stock;
	}

	public void setStock(Stock stock) {
		this.stock = stock;
	}

}
