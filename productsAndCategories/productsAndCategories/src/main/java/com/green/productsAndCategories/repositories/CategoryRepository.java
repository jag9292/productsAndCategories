package com.green.productsAndCategories.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.green.productsAndCategories.models.Category;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Long> {
	
}
