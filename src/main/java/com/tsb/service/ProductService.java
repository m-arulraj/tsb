package com.tsb.service;

import java.util.List;

import com.tsb.domain.Product;

public interface ProductService {

	public List<Product> getAllActiveProducts();

	public Product saveProduct(Product prod);

	public void deleteProduct(Long productId);

	public List<Product> getAllInactiveProducts();

	public Product getActiveProduct(Long productId);

	public Product getInactiveProduct(Long productId);

	public List<Product> getAllActiveProductsByCategory(Long categoryId);

}
