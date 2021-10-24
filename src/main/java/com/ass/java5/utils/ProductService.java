package com.ass.java5.utils;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ass.java5.entity.Product;
import com.ass.java5.repository.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	public Product findById(Integer id) {
		Optional<Product> optional = productRepository.findById(id);
		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
}
