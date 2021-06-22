package com.green.productsAndCategories.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.green.productsAndCategories.models.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long> {

}
