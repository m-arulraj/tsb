package com.tsb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tsb.domain.Product;
import com.tsb.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductRepository repo;

	@Override
	public List<Product> getAllActiveProducts() {
		return repo.getAllActiveProducts();
	}

	@Override
	public List<Product> getAllInactiveProducts() {
		return repo.getAllActiveProducts();
	}

	@Override
	public Product getActiveProduct(Long productId) {
		return repo.getActiveProduct(productId);
	}

	@Override
	public Product getInactiveProduct(Long productId) {
		return repo.getInactiveProduct(productId);
	}

	@Override
	public Product saveProduct(Product prod) {
		return repo.save(prod);
	}

	@Override
	public void deleteProduct(Long productId) {
		repo.delete(repo.findById(productId).get());

	}

	@Override
	public List<Product> getAllActiveProductsByCategory(Long categoryId) {
		return repo.getAllActiveProductsByCategory(categoryId);
	}

}
