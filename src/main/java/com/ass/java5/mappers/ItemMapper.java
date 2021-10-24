package com.ass.java5.mappers;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ass.java5.dto.ItemDTO;
import com.ass.java5.entity.Product;

@Service
public class ItemMapper {
	@Autowired
	private ModelMapper mapper;
	
	public Product convertToEntity(ItemDTO itemDTO) {
		Product product = mapper.map(itemDTO, Product.class);
		
		return product;
	}
	
	public ItemDTO convertToDTO(Product entity) {
		ItemDTO itemDTO = mapper.map(entity, ItemDTO.class);

		return itemDTO;
	}
}
