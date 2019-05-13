package com.tsb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tsb.domain.Stock;
import com.tsb.repository.StockRepository;

@Service
public class StockServiceImpl implements StockService {

	@Autowired
	StockRepository repo;

	@Override
	public List<Stock> getAllActiveStocks() {
		return repo.getAllActiveStocks();
	}

	@Override
	public List<Stock> getAllInactiveStocks() {
		return repo.getAllActiveStocks();
	}

	@Override
	public Stock getActiveStock(Long stockId) {
		return repo.getActiveStock(stockId);
	}

	@Override
	public Stock getInactiveStock(Long stockId) {
		return repo.getInactiveStock(stockId);
	}

	@Override
	public Stock saveStock(Stock prod) {
		return repo.save(prod);
	}

	@Override
	public void deleteStock(Long stockId) {
		repo.delete(repo.findById(stockId).get());

	}

	@Override
	public List<Stock> getAutoCompleteStocks(String query) {
		
		return repo.getAutoCompleteStocks(query);
	}

}
