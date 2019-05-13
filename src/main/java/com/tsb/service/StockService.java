package com.tsb.service;

import java.util.List;

import com.tsb.domain.Stock;

public interface StockService {

	public List<Stock> getAllActiveStocks();

	public Stock saveStock(Stock prod);

	public void deleteStock(Long productId);

	public List<Stock> getAllInactiveStocks();

	public Stock getActiveStock(Long productId);

	public Stock getInactiveStock(Long productId);

	public List<Stock> getAutoCompleteStocks(String query);

}
