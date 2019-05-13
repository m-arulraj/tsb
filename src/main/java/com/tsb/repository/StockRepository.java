package com.tsb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.tsb.domain.Stock;

@Repository
public interface StockRepository extends JpaRepository<Stock, Long> {

	public String ALL_STOCK = "SELECT " + "STOCKID," + "CATEGORYID," + "CREATEDBY," + "CREATEDON," + "DELETEFLAG,"
			+ "DISCOUNTABLE," + "GST," + "MANUFACTURERID," + "MODIFIEDBY," + "MODIFIEDON," + "MRPPERITME," + "QUANTITY,"
			+ "STOCKQUANTITY," + "PRODUCTID " + " FROM TSB_STOCK  " + " WHERE 1=1 ";

	@Query(value = ALL_STOCK + " AND DELETEFLAG='N'", nativeQuery = true)
	public List<Stock> getAllActiveStocks();

	@Query(value = ALL_STOCK + " AND DELETEFLAG='Y'", nativeQuery = true)
	public List<Stock> getAllInactiveStocks();

	@Query(value = ALL_STOCK + " AND DELETEFLAG='N'  AND STOCKID = :stockId", nativeQuery = true)
	public Stock getActiveStock(Long stockId);

	@Query(value = ALL_STOCK + " AND DELETEFLAG='Y' AND STOCK = :stockId", nativeQuery = true)
	public Stock getInactiveStock(Long stockId);

	@Query(value = "select st from Stock st where st.product.productName like %:query% or st.category.categoryName like %:query% or st.manufacturer.manufacturerName like %:query%")
	public List<Stock> getAutoCompleteStocks(String query);

}
