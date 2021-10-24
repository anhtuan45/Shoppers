package com.ass.java5.mappers;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ass.java5.dto.CategoryDTO;
import com.ass.java5.entity.Category;
/*
    Chiến lược map chuẩn: MatchingStrategies.STANDARD
	Chiến lược map lỏng lẻo: MatchingStrategies.LOOSE
	Chiến lược map chặt chẽ: MatchingStrategies.STRICT
 */
@Service
public class CategoryMapper {
	@Autowired
	private ModelMapper mapper;

	public Category convertToEntity(CategoryDTO categoryDTO) {
		Category entity = mapper.map(categoryDTO, Category.class);

		return entity;
	}

	public CategoryDTO convertToDTO(Category entity) {
		CategoryDTO categoryDTO = mapper.map(entity, CategoryDTO.class);
		return categoryDTO;
	}
}
