package com.green.productsAndCategories.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.green.productsAndCategories.models.Category;
import com.green.productsAndCategories.models.Product;
import com.green.productsAndCategories.repositories.CategoryRepository;
import com.green.productsAndCategories.repositories.ProductRepository;

@Service
public class ProductCategoryService {
	private final ProductRepository productRepository;
	private final CategoryRepository categoryRepository;
	
	public ProductCategoryService(ProductRepository productRepository, CategoryRepository categoryRepository) {
		this.productRepository = productRepository;
		this.categoryRepository = categoryRepository;
}

	public List<Product> findAllProducts() {
		return (List<Product>) productRepository.findAll();	
	}
	
	public Product createProduct(Product product) {
		return productRepository.save(product);
	}
	
	public Product getOneProduct(Long id) {
		return this.productRepository.findById(id).orElse(null);
	}
	
	////
	
	public List<Category> findAllCategories() {
		return (List<Category>) categoryRepository.findAll();	
	}
	
	public Category createCategory(Category category) {
		return categoryRepository.save(category);
	}
	
	public Category getOneCategory(Long id) {
		return this.categoryRepository.findById(id).orElse(null);
	}
	
	////
	
	public void join(Long productId, Long categoryId) {
		Product product = this.productRepository.findById(productId).orElse(null);
		Category category = this.categoryRepository.findById(categoryId).orElse(null);
		
		product.getCategories().add(category);
		
		this.productRepository.save(product);
	}
}
