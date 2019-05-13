package com.tsb.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tsb_bill")
public class Bill {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "billid")
	private Long billId;

	@Column(name = "items", nullable = false)
	private Long noOfItems;

	@Column(name = "taxamount", nullable = false)
	private Double totalTaxAmount;

	@Column(name = "baseamount", nullable = false)
	private Double totalBaseAmout;

	@Column(name = "discountamount", nullable = false)
	private Double totalDiscountAmount;

	@Column(name = "amount", nullable = false)
	private Double totalAmount;

	@Column(name = "createdon", nullable = false)
	private Date createdOn;

	@Column(name = "createdby", nullable = false)
	private String createdBy;

	@Column(name = "modifiedon", nullable = false)
	private Date modifiedOn;

	@Column(name = "modifiedby", nullable = false)
	private String modifiedBy;

	@Column(name = "deleteflag", nullable = false)
	private String deleteFlag;

	@OneToMany(mappedBy = "bill", fetch = FetchType.EAGER)
	private List<BillItem> items;

	public Long getBillId() {
		return billId;
	}

	public void setBillId(Long billId) {
		this.billId = billId;
	}

	public Long getNoOfItems() {
		return noOfItems;
	}

	public void setNoOfItems(Long noOfItems) {
		this.noOfItems = noOfItems;
	}

	public Double getTotalTaxAmount() {
		return totalTaxAmount;
	}

	public void setTotalTaxAmount(Double totalTaxAmount) {
		this.totalTaxAmount = totalTaxAmount;
	}

	public Double getTotalBaseAmout() {
		return totalBaseAmout;
	}

	public void setTotalBaseAmout(Double totalBaseAmout) {
		this.totalBaseAmout = totalBaseAmout;
	}

	public Double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getModifiedOn() {
		return modifiedOn;
	}

	public void setModifiedOn(Date modifiedOn) {
		this.modifiedOn = modifiedOn;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public String getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public List<BillItem> getItems() {
		return items;
	}

	public void setItems(List<BillItem> items) {
		this.items = items;
	}

	public Double getTotalDiscountAmount() {
		return totalDiscountAmount;
	}

	public void setTotalDiscountAmount(Double totalDiscountAmount) {
		this.totalDiscountAmount = totalDiscountAmount;
	}

}
