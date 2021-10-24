package com.ass.java5.mappers;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ass.java5.dto.ProductDTO;
import com.ass.java5.entity.Product;

@Service
public class ProductMapper {
	@Autowired
	private ModelMapper mapper;
	
	public Product convertToEntity(ProductDTO productDTO) {
		Product product = mapper.map(productDTO, Product.class);
		
		return product;
	}
	
	public ProductDTO convertToDTO(Product entity) {
		ProductDTO productDTO = mapper.map(entity, ProductDTO.class);

		return productDTO;
	}
	
}
