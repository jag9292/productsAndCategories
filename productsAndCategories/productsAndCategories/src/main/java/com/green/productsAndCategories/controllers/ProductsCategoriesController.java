package com.green.productsAndCategories.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.productsAndCategories.models.Category;
import com.green.productsAndCategories.models.Product;
import com.green.productsAndCategories.services.ProductCategoryService;

@Controller
public class ProductsCategoriesController {
	
private final ProductCategoryService productCategoryService;
	
	public ProductsCategoriesController(ProductCategoryService productCategoryService) {
		this.productCategoryService = productCategoryService;
	}

	@GetMapping("/products/new")
	public String index(Model model, @ModelAttribute("product") Product product) {
		List<Product> allProducts = this.productCategoryService.findAllProducts();
		model.addAttribute("allProducts", allProducts);
		return "index.jsp";
		
	}
	
	@PostMapping("/createProduct")
	public String create(Model model, @Valid @ModelAttribute("product") Product product, BindingResult result) {
		if(result.hasErrors()) {
			List<Product> allProducts = this.productCategoryService.findAllProducts();
			model.addAttribute("allProducts", allProducts);
			return "index.jsp";
		}
		else {
			Product newProduct = productCategoryService.createProduct(product);
			return "redirect:/products/" + newProduct.getId();
		}
	}
	
	@GetMapping("/products/{id}")
	public String productShow(@PathVariable("id") Long id, Model model) {
		Product product = this.productCategoryService.getOneProduct(id);
		model.addAttribute("product", product);
		
		List<Category> allCategories = this.productCategoryService.findAllCategories();
		model.addAttribute("allCategories", allCategories);
		return "newProduct.jsp";
	}
	
	@PostMapping("/addCategory/{id}")
	public String addCategory(@PathVariable("id")Long productId, @RequestParam("selected_category") Long CategoryId) {
		this.productCategoryService.join(productId, CategoryId);
		return "redirect:/products/{id}";
	}
	
	//////
	
	@GetMapping("/categories/new")
	public String category(Model model, @ModelAttribute("category") Category category) {
		List<Category> allCategories = this.productCategoryService.findAllCategories();
		model.addAttribute("allCategories", allCategories);
		return "createCategory.jsp";
		
	}
	
	@PostMapping("/createCategory")
	public String createCategory(Model model, @Valid @ModelAttribute("category") Category category, BindingResult result) {
		if(result.hasErrors()) {
			List<Category> allCategories = this.productCategoryService.findAllCategories();
			model.addAttribute("allCategories", allCategories);
			return "index.jsp";
		}
		else {
			Category newCategory = productCategoryService.createCategory(category);
			return "redirect:/Categories/" + newCategory.getId();
		}
	}
	
	@GetMapping("/Categories/{id}")
	public String categoryShow(@PathVariable("id") Long id, Model model) {
		Category category = this.productCategoryService.getOneCategory(id);
		model.addAttribute("category", category);
		
		List<Product> allProducts = this.productCategoryService.findAllProducts();
		model.addAttribute("allProducts", allProducts);
		return "newCategory.jsp";
	}
}
