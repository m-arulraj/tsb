package com.tsb.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tsb_stock")
public class Stock extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "stockid")
	private Long stockId;

	@Column(name = "categoryid", nullable = false)
	private Long categoryId;

	@Column(name = "productid", nullable = false)
	private Long productId;

	@Column(name = "manufacturerid", nullable = false)
	private Long manufacturerId;

	@Column(name = "stockquantity", nullable = false)
	private Long stockQuantity;

	@Column(name = "quantity", nullable = false)
	private Long quantity;

	@Column(name = "mrpperitme", nullable = false)
	private double mrpPerItem;

	@Column(name = "gst", nullable = false)
	private double gst;

	@Column(name = "discountable", nullable = false)
	private boolean discountAllowed;

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

	@Column(name = "threshold", nullable = false)
	private Long threshold;

	@OneToOne(fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "CATEGORYID", nullable = false, insertable = false, updatable = false)
	private Category category;

	@OneToOne(fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "PRODUCTID", nullable = false, insertable = false, updatable = false)
	private Product product;

	@OneToOne(fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "manufacturerid", nullable = false, insertable = false, updatable = false)
	private Manufacturer manufacturer;

	public Long getStockId() {
		return stockId;
	}

	public void setStockId(Long stockId) {
		this.stockId = stockId;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public Long getManufacturerId() {
		return manufacturerId;
	}

	public void setManufacturerId(Long manufacturerId) {
		this.manufacturerId = manufacturerId;
	}

	public Long getStockQuantity() {
		return stockQuantity;
	}

	public void setStockQuantity(Long stockQuantity) {
		this.stockQuantity = stockQuantity;
	}

	public Long getQuantity() {
		return quantity;
	}

	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}

	public double getMrpPerItem() {
		return mrpPerItem;
	}

	public void setMrpPerItem(double mrpPerItem) {
		this.mrpPerItem = mrpPerItem;
	}

	public double getGst() {
		return gst;
	}

	public void setGst(double gst) {
		this.gst = gst;
	}

	public boolean isDiscountAllowed() {
		return discountAllowed;
	}

	public void setDiscountAllowed(boolean discountAllowed) {
		this.discountAllowed = discountAllowed;
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

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Manufacturer getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(Manufacturer manufacturer) {
		this.manufacturer = manufacturer;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Long getThreshold() {
		return threshold;
	}

	public void setThreshold(Long threshold) {
		this.threshold = threshold;
	}

}
