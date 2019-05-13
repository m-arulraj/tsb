package com.tsb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.tsb.domain.Product;




@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

	public String ALL_PRODUCT = "SELECT "
			+ "PROD.PRODUCTID,"
			+ "PROD.CATEGORYID,"
			+ "PROD.PRODUCTNAME,"
			+ "PROD.PRODUCTDESC,"
			+ "PROD.CREATEDON,"
			+ "PROD.CREATEDBY,"
			+ "PROD.MODIFIEDON,"
			+ "PROD.MODIFIEDBY,"
			+ "PROD.DELETEFLAG"
			+ " "
			+ "FROM TSB_PRODUCT PROD "
			+ " WHERE 1=1 ";


	@Query(value = ALL_PRODUCT + " AND PROD.DELETEFLAG='N'", nativeQuery = true)
	public List<Product> getAllActiveProducts();

	@Query(value = ALL_PRODUCT + " AND PROD.DELETEFLAG='Y'", nativeQuery = true)
	public List<Product> getAllInactiveProducts();

	@Query(value = ALL_PRODUCT + " AND PROD.DELETEFLAG='N'  AND PROD.PRODUCTID = :productId", nativeQuery = true)
	public Product getActiveProduct(Long productId);

	@Query(value = ALL_PRODUCT + " AND PROD.DELETEFLAG='Y' AND PROD.PRODUCTID = :productId", nativeQuery = true)
	public Product getInactiveProduct(Long productId);

	@Query(value = ALL_PRODUCT + " AND PROD.DELETEFLAG='N'  AND PROD.CATEGORYID = :categoryId", nativeQuery = true)
	public List<Product> getAllActiveProductsByCategory(Long categoryId);
	 
}
