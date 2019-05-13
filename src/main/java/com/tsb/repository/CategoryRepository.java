package com.tsb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tsb.domain.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {

}
