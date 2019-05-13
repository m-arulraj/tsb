package com.tsb.service;

import java.util.List;

import com.tsb.domain.Category;

public interface CategoryService {

	public List<Category> getAllCategory();

	public Category saveCategory(Category cat);

	public Category getCategory(Long categoryId);

	public void deleteCategory(Long categoryId);

}
