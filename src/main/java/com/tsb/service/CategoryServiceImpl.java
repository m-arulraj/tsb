package com.tsb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tsb.domain.Category;
import com.tsb.repository.CategoryRepository;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryRepository repo;

	public List<Category> getAllCategory() {
		return repo.findAll();
	}

	@Override
	public Category saveCategory(Category cat) {
		return repo.save(cat);
	}

	@Override
	public Category getCategory(Long categoryId) {
		return repo.findById(categoryId).get();
	}

	@Override
	public void deleteCategory(Long categoryId) {
		repo.delete(repo.findById(categoryId).get());

	}

}
